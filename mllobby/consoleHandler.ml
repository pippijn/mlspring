open Lwt


let handle_command io env = function
  | ["DUMP"] ->
      Env.dump env "/home/pippijn/code/git/games/mllobby/current-env.ml";
      return env

  | ["EXIT"] ->
      Network.send io [ClientProto.EXIT None] >>
      return env
  | "EXIT" :: reason ->
      Network.send io [ClientProto.EXIT (Some (String.concat " " reason))] >>
      return env

  | ["JOIN"; chanName] ->
      Network.send io [ClientProto.JOIN (chanName, None)] >>
      return env
  | ["JOIN"; chanName; key] ->
      Network.send io [ClientProto.JOIN (chanName, Some key)] >>
      return env

  | cmd :: args ->
      Lwt_log.error_f "no such command or invalid number of arguments: %s" cmd >>
      return env

  | [] -> assert false


let handle io env line =
  if line = "" then
    return env
  else if line.[0] = '/' then

    match BatString.nsplit (String.sub line 1 (String.length line - 1)) " " with
    | cmd :: args ->
        handle_command io env
          (BatString.map Char.uppercase cmd :: args)
    | [] -> assert false

  else

    Network.send io [ClientProto.SAYBATTLE line] >>
    return env


let rec loop io lock env =
  try_lwt
    lwt line = Lwt_read_line.read_line () in

    Lwt_mutex.with_lock lock (fun () ->
      lwt env' = handle io !env line in
      env := env';
      return ()
    ) >>

    loop io lock env
  with Lwt_read_line.Interrupt | End_of_file ->
    Network.close io
