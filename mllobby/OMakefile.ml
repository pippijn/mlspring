install Program ".DEFAULT" [
  (* Target *)
  Name		"mllobby";

  (* Sources *)
  Modules [
    "ConsoleHandler";
    "Env";
    "EnvTypes";
    (*"Gui";*)
    "Lobby";
    "Main";
    "Network";
    "NetworkHandler";
    "Settings";
  ];

  (* Library dependencies *)
  OCamlRequires [
    "unitsync";
    "springlobby";
    "lwt.text";
    "lwt.syntax";
    "deriving-ocsigen.syntax";
  ];

  (* Camlp4 *)
  Flags [
    "envTypes.ml",		"-syntax camlp4o";
    "networkHandler.ml",	"-syntax camlp4o";
    "network.ml",		"-syntax camlp4o";
    "lobby.ml",			"-syntax camlp4o";
    "main.ml",			"-syntax camlp4o";
    "env.ml",			"-syntax camlp4o";
    "consoleHandler.ml",	"-syntax camlp4o";
  ];
]
