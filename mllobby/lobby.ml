open Lwt


let connect host port =
  let open Lwt_unix in

  lwt host = gethostbyname host in
  let addr = ADDR_INET (host.h_addr_list.(0), port) in
  let sock = socket host.h_addrtype SOCK_STREAM 0 in

  connect sock addr >>

  return Lwt_io.(
    of_fd input sock,
    of_fd output sock
  )


let start host port =
  connect host port >>= Main.loop


let () =
  Printexc.record_backtrace true;
  Unix.handle_unix_error Lwt_main.run (start "springrts.com" 8200)
