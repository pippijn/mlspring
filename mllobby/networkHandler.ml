open Env
open ExtPervasives
open Lwt


(* XXX: 2.3 doesn't have this *)
let async = ignore


let is_springie userName =
  BatString.starts_with userName "Springiee"


let bool_of_string01 string =
  match int_of_string string with
  | 0 -> false
  | 1 -> true
  | _ -> failwith ("invalid boolean value: " ^ string)


let handle_springie io env message =
  if BatString.exists message "game is about to start" then
    let battle = Env.my_battle env in
    let fh = open_out "/home/pippijn/.spring/start_script_ml.txt" in
    Printf.fprintf fh "\
[GAME]
{
  HostIP=%s;
  HostPort=%d;
  IsHost=0;
  MyPasswd=3188469321;
  MyPlayerName=%s;
}
" battle.b_ip battle.b_port Env.S.username;
    close_out fh;
    async (fun () -> Lwt_unix.system "\
      /home/pippijn/.spring/engines/91.0/spring \
      --config /home/pippijn/.springrc \
      /home/pippijn/.spring/start_script_ml.txt \
      > /home/pippijn/.spring/infolog.txt 2>&1"
    );

    return ()
  else if BatString.exists message "BATTLE DETAILS AND REPLAY" then
    Network.send io [ClientProto.SAYBATTLE "!forcestart"]
  else
    return ()


let handle io env = let open ServerProto in function
  | TASServer (protocolVersion, springVersion, udpPort, serverMode) ->
      Network.send io [ClientProto.LOGIN (
        Env.S.username,
        Env.S.password,
        "8484",
        "*",
        "Spring Ocaml Lobby 0.1",
        Some "0",
        Some "eb"
      )] >>

      return env


  | ACCEPTED (userName) ->
      (*
      let ping_event =
        Lwt_engine.on_timer 120.0 true (fun event ->
          async (fun () -> Network.send io [ClientProto.PING])
        )
      in
      *)

      return env (* { env with ping_event } *)


  | PONG ->
      return env


  | MOTD (message) ->
      return { env with motd = message :: env.motd }


  | CHANNEL (chanName, userCount, topic) ->
      let userCount = int_of_string userCount in
      let topic = BatOption.default "" topic in

      let channel =
        try
          let channel = StringMap.find chanName env.channels in
          if channel.ch_user_count <> userCount then
            failwith (Printf.sprintf
              "inconsistent user count in CHANNEL message: %d vs %d"
              userCount channel.ch_user_count
            );
          if channel.ch_topic.top_text <> topic then
            failwith "inconsistent topic in CHANNEL message";
          channel
        with Not_found ->
          { Env.empty_channel with
            ch_user_count = userCount;
            ch_topic = { Env.empty_topic with
              top_text = topic;
            }
          }
      in

      let channels = StringMap.add chanName channel env.channels in

      return { env with channels }


  | ENDOFCHANNELS ->
      return env


  | LOGININFOEND ->
      let initial =
        ClientProto.SAYPRIVATE (
          "Springiee",
          "!spawn mod=Zero-K v1.1.3.6,title=pippijn's game,password=aoei"
        )
        :: ClientProto.CHANNELS
        :: List.map (fun channel ->
            ClientProto.JOIN (
              channel,
              None
            )
          ) Env.S.channels
      in

      Network.send io initial >>

      return { env with motd = List.rev env.motd }


  | BATTLEOPENEDEX
      ( battleID
      , battleType
      , natType
      , founder
      , ip
      , port
      , maxPlayers
      , passworded
      , rank
      , mapHash
      , engineName
      , engineVersion
      , map
      , title
      , modName
      ) ->
      let battleID = int_of_string battleID in

      let battles =
        IntMap.add battleID {
          Env.empty_battle with

          b_type = (
            match int_of_string battleType with
            | 0 -> BattleNormal
            | 1 -> BattleReplay
            | _ -> failwith ("unknown battle type: " ^ battleType)
          );
          b_nat = (
            match int_of_string natType with
            | 0 -> NatNone
            | 1 -> NatHolePunching
            | 2 -> NatFixedSourcePorts
            | _ -> failwith ("unknown NAT type: " ^ natType)
          );
          b_founder = founder;
          b_ip = ip;
          b_port = int_of_string port;
          b_max_players = int_of_string maxPlayers;
          b_passworded = bool_of_string01 passworded;
          b_rank = int_of_string rank;
          b_map_hash = int_of_string mapHash;
          b_engine_name = engineName;
          b_engine_version = engineVersion;
          b_map = map;
          b_title = title;
          b_mod_name = modName;
        } env.battles
      in

      let env = Env.join_battle env battleID founder in

      return { env with battles }


  | UPDATEBATTLEINFO (battleID, spectatorCount, locked, mapHash, mapName) ->
      let battleID = int_of_string battleID in

      let battles =
        IntMap.update battleID env.battles (fun battle ->
          { battle with

            b_spectators = int_of_string spectatorCount;
            b_locked = bool_of_string01 locked;
            b_map_hash = int_of_string mapHash;
            b_map = mapName;
          }
        )
      in

      return { env with battles }


  | BATTLECLOSED (battleID) ->
      let battleID = int_of_string battleID in

      let clients =
        StringMap.fold (fun userName client clients ->
          match client.c_battle with
          | Some battle when battle = battleID ->
              StringMap.add userName
                { client with c_battle = None }
                clients
          | _ ->
              clients
        ) env.clients env.clients
      in

      let battles = IntMap.remove battleID env.battles in

      return { env with battles; clients }


  | ADDUSER (userName, country, cpu, accountId) ->
      assert (not (StringMap.mem userName env.clients));

      let clients =
        StringMap.add userName {
          Env.empty_client with
          c_country = country_of_string country;
          c_cpu = int_of_string cpu;
          c_account = accountId;
        } env.clients
      in

      return { env with clients }


  | REMOVEUSER (userName) ->
      let clients = StringMap.remove userName env.clients in

      return { env with clients }


  | JOINEDBATTLE (battleID, userName, scriptPassword) ->
      let battleID = int_of_string battleID in

      return (Env.join_battle env battleID userName)


  | JOINBATTLE (battleID, hashCode) ->
      let battleID = int_of_string battleID in
      let hashCode = int_of_string hashCode in

      return env


  | LEFTBATTLE (battleID, userName) ->
      let battleID = int_of_string battleID in

      let clients =
        StringMap.update userName env.clients (fun client ->
          match client.c_battle with
          | None ->
              failwith "client not in a battle"
          | Some battle when battle <> battleID ->
              failwith "client not in this battle"
          | Some battle ->
              { client with c_battle = None }
        )
      in

      return { env with clients }


  | REQUESTBATTLESTATUS ->
      Network.send io [
        ClientProto.MYBATTLESTATUS (
          "4195330", "255"
        );
        (*ClientProto.ADDBOT ("I", "4", "65280", "CAI");*)
        (*ClientProto.ADDBOT ("II", "8", "65280", "CAI");*)
        (*ClientProto.ADDBOT ("III", "12", "65280", "CAI");*)
        (*ClientProto.ADDBOT ("III", "12", "65280", "CAI");*)
        (*ClientProto.ADDBOT ("IV", "80", "65280", "CAI");*)
      ] >>
      return env


  | CLIENTBATTLESTATUS (userName, battleStatus, teamColor) ->
      return env


  | SETSCRIPTTAGS (pairs) ->
      return env


  | ADDBOT (battleID, name, owner, battleStatus, teamColor, ai_dll) ->
      return env


  | CHANNELTOPIC (chanName, author, changedTime, topic) ->
      let channels =
        StringMap.update chanName env.channels (fun channel ->
          { channel with
            ch_topic = {
              top_author = author;
              top_changed = int_of_string changedTime;
              top_text = topic;
            }
          }
        )
      in

      return { env with channels }


  | CLIENTS (chanName, clients) ->
      let ch_clients =
        List.fold_left
          (flip StringSet.add)
          Env.empty_channel.ch_clients
          (BatString.nsplit clients " ")
      in

      let channels =
        StringMap.add chanName {
          Env.find_channel env chanName with
          ch_user_count = StringSet.cardinal ch_clients;
          ch_clients;
        } env.channels
      in

      return { env with channels }


  | CLIENTSTATUS (userName, status) ->
      let c_status = int_of_string status in

      let clients =
        StringMap.update userName env.clients (fun client ->
          { client with c_status }
        )
      in

      return { env with clients }


  | JOIN chanName ->
      let env = update_target env chanName in
      let joined = StringSet.add chanName env.joined in

      return { env with joined }


  | JOINED (chanName, userName) ->
      return (add_remove_user env StringSet.add chanName userName)


  | LEFT (chanName, userName, quitMessage) ->
      return (add_remove_user env StringSet.remove chanName userName)


  | SAYPRIVATE (userName, message) ->
      Lwt_log.notice_f " -> <%s> %s" userName message >>

      return env


  | SAIDPRIVATE (userName, message) ->
      begin if
        is_springie userName
        && BatString.exists message "Join me!"
      then

        let battleID = Env.user_battle env userName in
        Network.send io [
          ClientProto.JOINBATTLE (
            string_of_int battleID, Some "aoei", Some "3188469321"
          );
          ClientProto.SAYPRIVATE (
            userName, "!setengine 91.0"
          );
          ClientProto.SAYPRIVATE (
            userName, "!map DarkSide Remake"
          );
        ]
      else
        return ()
      end >>

      Lwt_log.notice_f " <- <%s> %s" userName message >>

      return env


  | SAID (chanName, userName, message) ->
      Lwt_log.notice_f " <- <%s@%s> %s" userName chanName message >>

      return env


  | SAIDEX (chanName, userName, message) ->
      Lwt_log.notice_f " <- * %s@%s %s" userName chanName message >>

      return env


  | SAIDBATTLE (userName, message) ->
      Lwt_log.notice_f " <- <%s@#> %s" userName message >>

      return env


  | SAIDBATTLEEX (userName, message) ->
      begin if is_springie userName then
        handle_springie io env message
      else
        return ()
      end >>

      Lwt_log.notice_f " <- * %s@# %s" userName message >>

      return env


  | ADDSTARTRECT (allyNo, left, top, right, bottom) ->
      return env


  | cmd ->
      Lwt_log.warning_f "unhandled %s" (Show.show<ServerProto.t> cmd) >>

      return env


let rec loop io lock env =
  try_lwt
    lwt cmd = Network.recv io in

    Lwt_mutex.with_lock lock (fun () ->
      lwt env' = handle io !env cmd in
      env := env';
      return ()
    ) >>

    loop io lock env
  with
  | End_of_file ->
      return ()
  | exn ->
      let file =
        "/home/pippijn/code/git/games/mllobby/current-err."
        ^ string_of_int (int_of_float (Unix.time ()))
        ^ ".ml"
      in
      Lwt_log.error_f ~exn "[1;31mexception caught; dumping env[0m" >>

      let fh = open_out file in
      Printf.fprintf fh "Exception: %s\n%s\n"
        (Printexc.to_string exn)
        (Printexc.get_backtrace ());
      Env.dump_fh !env fh;
      close_out fh;

      (* continue with old env *)
      loop io lock env
