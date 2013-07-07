(* Generate OCaml sources for client and server protocol messages *)
open ProtoType

let (|>) x f = f x


(********************************************)

let wrap_if cond pre post text =
  if cond then
    pre ^ text ^ post
  else
    text


let emit_arg ?tyc ?(pre="of") fh { name; optional; sentence } =
  let comment =
    name
    |> wrap_if sentence "{" "}"
    |> wrap_if optional "[" "]"
    |> wrap_if true "(* " " *)"
  in

  let tyc =
    match tyc with
    | Some tyc -> " " ^ tyc
    | None when optional -> " option"
    | None -> ""
  in

  let ty =
    if sentence then
      "sentence"
    else
      "word"
  in

  Printf.fprintf fh "        %s\n        %s %s%s\n" comment pre ty tyc;
;;


let emit_args fh = function
  | [] -> ()

  | [{ list = true } as arg0] ->
      emit_arg ~tyc:"list" fh { arg0 with name = arg0.name ^ "..." }

  | arg0 :: args ->
      emit_arg fh arg0;
      List.iter (fun arg ->
        emit_arg ~pre:"* " fh arg;
      ) args;
;;


let emit_cmd fh { cmd; args } =
  output_string fh "    | ";
  output_string fh cmd;
  output_string fh "\n";
  emit_args fh args;
;;


let emit_cmds fh todo cmds =
  output_string fh "  open ProtoType\n";
  output_string fh "  type t =\n";

  List.iter (emit_cmd fh)
    (List.filter (fun { kind } -> kind = todo) cmds);
  output_string fh "    deriving (Show, Json)\n";
;;


(********************************************)

let keywords = [
  "type";
]


let mlname name =
  let name =
    BatString.map (function
      | ' ' -> '_'
      | c -> c
    ) name
  in

  name.[0] <- Char.lowercase name.[0];

  if List.mem name keywords then
    name ^ "_"
  else
    name


let emit_parse_arg fh bind name optional sep kind =
  Printf.fprintf fh "('%s'" (Char.escaped sep);

  if bind then (
    Printf.fprintf fh "(%s as %s)" kind name;
  ) else (
    output_string fh kind;
  );

  output_string fh ")";

  if optional then
    output_string fh "?";
;;


let rec emit_parse_sentence_args ?(bind=true) l fh args =
  if bind then
    output_string fh "\n     ";
  match args with
  | { name; optional } :: args ->
      let name = mlname name in
      emit_parse_arg fh bind name optional '\t' "sa";
      emit_parse_sentence_args ~bind (name :: l) fh args

  | [] -> l


let rec emit_parse_args ?(bind=true) l fh args =
  if bind then
    output_string fh "\n     ";
  match args with
  | { name; optional; sentence = true } :: args ->
      let name = mlname name in
      emit_parse_arg fh bind name optional ' ' "sa";
      emit_parse_sentence_args ~bind (name :: l) fh args

  | { name; optional } :: args ->
      let name = mlname name in
      emit_parse_arg fh bind name optional ' ' "wa";
      emit_parse_args ~bind (name :: l) fh args

  | [] -> l


let emit_construct fh cmd args =
  output_string fh cmd;
  match args with
  | [] -> ()
  | args ->
      Printf.fprintf fh " (%s)"
        (String.concat ", " args)


let emit_parse_cmd fh { cmd; args } =
  Printf.fprintf fh "| \"%s\"" cmd;

  let args =
    match args with
    | [{ list = true } as arg0] ->
        output_string fh "\n     (";
        ignore (emit_parse_args ~bind:false [] fh [arg0]);
        Printf.fprintf fh "+ as %s)\n     " arg0.name;
        if arg0.sentence then
          ["BatString.nsplit " ^ arg0.name ^ " \"\\t\""]
        else
          ["BatString.nsplit " ^ arg0.name ^ " \" \""]
    | args ->
        emit_parse_args [] fh args
  in

  let args = List.rev args in
  
  output_string fh "  { ";
  emit_construct fh cmd args;
  output_string fh " }\n";
;;


let emit_parse fh todo cmds =
  output_string fh "\
let wa = [^' ']*
let sa = [^'\\t']*

rule token = parse
";

  List.iter (emit_parse_cmd fh)
    (List.filter (fun { kind } -> kind = todo) cmds);
;;


(********************************************)


let emit_emit_params fh = function
  | [] -> ()
  | args ->
      output_string fh " (";
      output_string fh (String.concat ", "
        (List.map (fun { name } -> mlname name) args)
      );
      output_string fh ")";
;;


let sub1 s =
  String.sub s 0 (String.length s - 1)


let emit_add_arg what fh { name; optional; list } =
  if list then (
    Printf.fprintf fh "        List.iter (Proto.add_%s buf) %s\n"
      what
      (mlname name);
  ) else (
    output_string fh "        ";
    if optional then (
      output_string fh "BatOption.may ";
    );
    Printf.fprintf fh "(Proto.add_%s buf) %s;\n"
      what
      (mlname name);
  )
;;


let emit_add_args fh args =
  List.fold_left (fun what arg ->
    emit_add_arg what fh arg;

    if arg.sentence = true then
      "sentence"
    else
      what
  ) "word" args |> ignore
;;


let emit_emit_args fh = function
  | [] ->
      output_string fh " -> ()"

  | args ->
      output_string fh " ->\n";
      emit_add_args fh args
;;


let emit_emit_cmd_empty fh { cmd } =
  output_string fh ("\n    | " ^ cmd);
;;


let emit_emit_cmd_nonempty fh { cmd; args } =
  output_string fh ("\n    | " ^ cmd);
  emit_emit_params fh args;
  emit_emit_args fh args;
;;


let emit_name_of_cmd fh { cmd } =
  Printf.fprintf fh "    | %s _ -> \"%s\"\n"
    cmd cmd
;;


let emit_name_of fh todo cmds =
  output_string fh "  let name_of_command = function\n";

  List.iter (emit_name_of_cmd fh)
    (List.filter (fun { kind } -> kind = todo) cmds);
;;


let emit_string_of_args fh todo cmds =
  output_string fh "  let add_arguments buf = function";

  let cmds = List.filter (fun { kind } -> kind = todo) cmds in

  let empty_cmds    = List.filter (fun { args } -> args == []) cmds in
  let nonempty_cmds = List.filter (fun { args } -> args <> []) cmds in

  begin match empty_cmds with
  | [] -> ()
  | cmds ->
      List.iter (emit_emit_cmd_empty fh) cmds;
      output_string fh " -> ()\n";
  end;

  List.iter (emit_emit_cmd_nonempty fh) nonempty_cmds;

  output_string fh "  ;;\n";
;;


let emit_emit fh todo cmds =
  output_string fh "\
  let emit cmd =
    let buf = Buffer.create 128 in
    Buffer.add_string buf (name_of_command cmd);
    add_arguments buf cmd;
    Buffer.contents buf


  let of_string line =
    let lexbuf = Lexing.from_string line in
    token lexbuf
";
;;


(********************************************)


let emit fh cmds =
  let kind = 
    match Sys.argv with
    | [|_; "client"|] -> Client
    | [|_; "server"|] -> Server
    | _ -> failwith "client or server?"
  in

  output_string fh "{\n";
  emit_cmds fh kind cmds;
  output_string fh "}\n\n";

  emit_parse fh kind cmds;

  output_string fh "\n\n{\n";
  emit_name_of fh kind cmds;

  output_string fh "\n\n";
  emit_string_of_args fh kind cmds;

  output_string fh "\n\n";
  emit_emit fh kind cmds;

  output_string fh "}\n";
;;


let () =
  emit stdout Protocol.cmds
;;
