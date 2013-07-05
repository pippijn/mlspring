install Library ".DEFAULT" [
  (* Target *)
  Name		"unitsync";
  Description	"OCaml interface to Spring unitsync";
  Version	"0.1";

  (* Sources *)
  Modules [
    "API";
    "UnitSync";
  ];

  Sources [
    "unitsync.c";
    "unitsync_api.c";
  ];

  (* Library dependencies *)
  OCamlRequires [
    "batteries";
    "common";
    "deriving-ocsigen.syntax";
  ];

  (* Camlp4 *)
  Flags [
    "unitSync.ml",	"-syntax camlp4o";
  ];
]
