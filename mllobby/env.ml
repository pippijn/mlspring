include EnvTypes


let my_battle env =
  let client = StringMap.find S.username env.clients in
  IntMap.find (BatOption.get client.c_battle) env.battles


let join_battle env battleID userName =
  let clients =
    StringMap.update userName env.clients (fun client ->
      match client.c_battle with
      | None -> { client with c_battle = Some battleID }
      | Some battle -> failwith "client already in a battle"
    )
  in

  { env with clients }


let user_battle env userName =
  let client = StringMap.find userName env.clients in
  match client.c_battle with
  | None -> failwith "no battle"
  | Some battleID -> battleID


let find_channel env chanName =
  try
    StringMap.find chanName env.channels
  with Not_found ->
    empty_channel


let add_remove_user env action chanName userName =
  let channels =
    StringMap.update chanName env.channels (fun channel ->
      let ch_clients = action userName channel.ch_clients in
      { channel with ch_clients }
    )
  in

  { env with channels }


let update_target env target =
  { env with con = { env.con with target } }


let dump_fh env fh =
  let env_text = Show.show<t> env in
  output_string fh env_text;
  output_string fh "\n";
;;


let dump env file =
  let fh = open_out file in
  dump_fh env fh;
  close_out fh;
;;
