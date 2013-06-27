open Lwt


let add_stuff box spring =
  let open UnitSync in

  let names = List.map (fun map -> map.map_name) spring.maps in

  GEdit.combo
    ~popdown_strings:names
    ~value_in_list:true
    ~packing:box#add
    ();
  GEdit.combo
    ~popdown_strings:names
    ~value_in_list:true
    ~packing:box#add
    ();

  ()


let loop io =
  ignore (GMain.init ());
  Lwt_glib.install ();

  let waiter, wakener = Lwt.wait () in

  let window = GWindow.window () in
  let box = GPack.vbox ~packing:window#add () in
  add_stuff box spring;
  ignore (window#connect#destroy (Lwt.wakeup wakener));
  window#show ();

  waiter
