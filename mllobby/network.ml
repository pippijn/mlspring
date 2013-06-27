open Lwt


let logger = Lwt_log.file
  ~mode:`Truncate
  ~file_name:"/home/pippijn/code/git/games/mllobby/traffic.log"
  ()


let recv io =
  lwt logger = logger in

  lwt line = Lwt_io.read_line (fst io) in
  let cmd = ServerProto.of_string line in

  Lwt_log.notice_f ~logger "<< %s" (String.escaped line) >>

  return cmd


let send io cmds =
  lwt logger = logger in

  Lwt.join (List.map (fun cmd ->
    let line = ClientProto.emit cmd in
    Lwt_io.write_line (snd io) line >>

    Lwt_log.notice_f ~logger ">> %s" (String.escaped line)
  ) cmds)


let close ?(reason=Env.S.quit_message) io =
  send io [ClientProto.EXIT (Some reason)]
