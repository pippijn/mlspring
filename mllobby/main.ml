open Lwt


(* XXX: 2.3 doesn't have this *)
let async = ignore


let loop io =
  let unitsync = UnitSync.create "/home/pippijn/.spring" in

  let spring = UnitSync.sync "91.0" unitsync in
  let fh = open_out "/home/pippijn/code/git/games/mllobby/current-unitsync.ml" in
  output_string fh (Show.show<UnitSync.spring> spring);
  close_out fh;

  let env = ref Env.empty in
  let lock = Lwt_mutex.create () in

  async (fun () -> ConsoleHandler.loop io lock env);
  NetworkHandler.loop io lock env
