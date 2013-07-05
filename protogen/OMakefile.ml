install Program ".DEFAULT" [
  (* Target *)
  Name		"protogen";

  (* Sources *)
  Modules [
    "Protogen";
  ];

  (* Library dependencies *)
  OCamlRequires [
    "springlobby";
  ];
]
