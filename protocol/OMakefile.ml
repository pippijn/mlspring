install Library ".DEFAULT" [
  (* Target *)
  Name		"springlobby";
  Description	"Spring lobby protocol implementation";
  Version	"0.1";

  (* Sources *)
  Modules [
    "ClientProto";
    "Proto";
    "ProtoType";
    "Protocol";
    "ServerProto";
  ];

  (* Library dependencies *)
  OCamlRequires [
    "batteries";
    "common";
    "deriving-ocsigen.syntax";
  ];

  (* Camlp4 *)
  Flags [
    "clientProto.ml",	"-syntax camlp4o";
    "protoType.ml",	"-syntax camlp4o";
    "serverProto.ml",	"-syntax camlp4o";
  ];
]
