module type SettingsType = sig
  val username : string
  val password : string

  val channels : string list
  val quit_message : string
end

module S : SettingsType = Settings


type country =
  | Invalid of string
  | Unknown
  | AR
  | AT
  | AU
  | BE
  | BG
  | BH
  | BR
  | BY
  | CA
  | CH
  | CL
  | CN
  | CR
  | CZ
  | DE
  | DK
  | DO
  | DZ
  | EE
  | ES
  | EU
  | FI
  | FR
  | GB
  | GR
  | HR
  | HU
  | ID
  | IE
  | IL
  | IT
  | JO
  | JP
  | KR
  | KW
  | LT
  | MK
  | MY
  | NL
  | NO
  | NZ
  | PE
  | PH
  | PL
  | PR
  | PT
  | RO
  | RS
  | RU
  | SE
  | SG
  | SI
  | SK
  | TH
  | TN
  | TW
  | UA
  | US
  | VN
  | ZA
  deriving (Show)


let country_of_string = function
  | "??" -> Unknown
  | "AR" -> AR
  | "AT" -> AT
  | "AU" -> AU
  | "BE" -> BE
  | "BG" -> BG
  | "BH" -> BH
  | "BR" -> BR
  | "BY" -> BY
  | "CA" -> CA
  | "CH" -> CH
  | "CL" -> CL
  | "CN" -> CN
  | "CR" -> CR
  | "CZ" -> CZ
  | "DE" -> DE
  | "DK" -> DK
  | "DO" -> DO
  | "DZ" -> DZ
  | "EE" -> EE
  | "ES" -> ES
  | "EU" -> EU
  | "FI" -> FI
  | "FR" -> FR
  | "GB" -> GB
  | "GR" -> GR
  | "HR" -> HR
  | "HU" -> HU
  | "ID" -> ID
  | "IE" -> IE
  | "IL" -> IL
  | "IT" -> IT
  | "JO" -> JO
  | "JP" -> JP
  | "KR" -> KR
  | "KW" -> KW
  | "LT" -> LT
  | "MK" -> MK
  | "MY" -> MY
  | "NL" -> NL
  | "NO" -> NO
  | "NZ" -> NZ
  | "PE" -> PE
  | "PH" -> PH
  | "PL" -> PL
  | "PR" -> PR
  | "PT" -> PT
  | "RO" -> RO
  | "RS" -> RS
  | "RU" -> RU
  | "SE" -> SE
  | "SG" -> SG
  | "SI" -> SI
  | "SK" -> SK
  | "TH" -> TH
  | "TN" -> TN
  | "TW" -> TW
  | "UA" -> UA
  | "US" -> US
  | "VN" -> VN
  | "ZA" -> ZA
  | s ->
      print_endline ("Unknown country code: " ^ s);
      Invalid s


type client = {
  c_country : country;
  c_cpu : int;
  c_account : string option;
  c_battle : int option;
  c_status : int;
} deriving (Show)


type topic = {
  top_author : string;
  top_changed : int;
  top_text : string;
} deriving (Show)


type channel = {
  ch_user_count : int;
  ch_clients : StringSet.t;
  ch_topic : topic;
} deriving (Show)


type battle_type =
  | BattleNormal
  | BattleReplay
  deriving (Show)

type nat_type =
  | NatNone
  | NatHolePunching
  | NatFixedSourcePorts
  deriving (Show)

type battle = {
  b_type : battle_type;
  b_nat  : nat_type;
  b_founder : string;
  b_ip : string;
  b_port : int;
  b_max_players : int;
  b_spectators : int;
  b_passworded : bool;
  b_locked : bool;
  b_rank : int;
  b_map_hash : int;
  b_engine_name : string;
  b_engine_version : string;
  b_map : string;
  b_title : string;
  b_mod_name : string;
} deriving (Show)


type console = {
  target : string;
} deriving (Show)


type t = {
  motd : string list;
  joined : StringSet.t;
  channels : channel StringMap.t;
  clients : client StringMap.t;
  battles : battle IntMap.t;

  con : console;
} deriving (Show)


let empty_topic = {
  top_author = "";
  top_changed = 0;
  top_text = "";
}


let empty_channel = {
  ch_user_count = 0;
  ch_clients = StringSet.empty;
  ch_topic = empty_topic;
}


let empty_client = {
  c_country = Unknown;
  c_cpu = 0;
  c_account = None;
  c_battle = None;
  c_status = 0;
}


let empty_battle = {
  b_type = BattleNormal;
  b_nat  = NatNone;
  b_founder = "";
  b_ip = "*";
  b_port = 0;
  b_max_players = 0;
  b_spectators = 0;
  b_passworded = false;
  b_locked = false;
  b_rank = 0;
  b_map_hash = 0;
  b_engine_name = "";
  b_engine_version = "";
  b_map = "";
  b_title = "";
  b_mod_name = "";
}


let empty_console = {
  target = "";
}


let empty = {
  motd = [];
  joined = StringSet.empty;
  channels = StringMap.empty;
  clients = StringMap.empty;
  battles = IntMap.empty;

  con = empty_console;
}
