install Library ".DEFAULT" [
  (* Target *)
  Name		"common";
  Description	"Common library for mlspring";
  Version	"0.1";

  (* Sources *)
  Modules [
    "ExtInt";
    "ExtMap";
    "ExtPervasives";
    "ExtSet";
    "ExtString";
    "IntMap";
    "IntSet";
    "StringMap";
    "StringSet";
  ];

  (* Library dependencies *)
  OCamlRequires [
    "batteries";
    "deriving-ocsigen";
    "deriving-ocsigen.syntax";
  ];

  (* Camlp4 *)
  Flags [
    "extInt.ml",	"-syntax camlp4o";
    "extMap.ml",	"-syntax camlp4o";
    "extSet.ml",	"-syntax camlp4o";
    "extString.ml",	"-syntax camlp4o";
  ];
]
