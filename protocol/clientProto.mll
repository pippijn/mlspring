{
  open ProtoType
  type t =
    | PING
    | REQUESTUPDATEFILE
        (* {name and version} *)
        of sentence
    | REGISTER
        (* userName *)
        of word
        (* password *)
        *  word
        (* [email] *)
        *  word option
    | RENAMEACCOUNT
        (* newUsername *)
        of word
    | CHANGEPASSWORD
        (* oldPassword *)
        of word
        (* newPassword *)
        *  word
    | CHANGEEMAIL
        (* newEmail *)
        of word
        (* [userName] *)
        *  word option
    | LOGIN
        (* userName *)
        of word
        (* password *)
        *  word
        (* cpu *)
        *  word
        (* localIP *)
        *  word
        (* {lobby name and version} *)
        *  sentence
        (* [{userID}] *)
        *  sentence option
        (* [{compFlags}] *)
        *  sentence option
    | EXIT
        (* [{reason}] *)
        of sentence option
    | CONFIRMAGREEMENT
    | JOIN
        (* chanName *)
        of word
        (* [key] *)
        *  word option
    | CHANNELS
    | MUTELIST
        (* chanName *)
        of word
    | CHANNELTOPIC
        (* chanName *)
        of word
        (* {topic} *)
        *  sentence
    | LEAVE
        (* chanName *)
        of word
    | FORCELEAVECHANNEL
        (* chanName *)
        of word
        (* userName *)
        *  word
        (* [{reason}] *)
        *  sentence option
    | SAY
        (* chanName *)
        of word
        (* {message} *)
        *  sentence
    | SAYEX
        (* chanName *)
        of word
        (* {message} *)
        *  sentence
    | SAYPRIVATE
        (* userName *)
        of word
        (* {message} *)
        *  sentence
    | OPENBATTLE
        (* type *)
        of word
        (* natType *)
        *  word
        (* password *)
        *  word
        (* port *)
        *  word
        (* maxPlayers *)
        *  word
        (* hashCode *)
        *  word
        (* rank *)
        *  word
        (* mapHash *)
        *  word
        (* {map} *)
        *  sentence
        (* {title} *)
        *  sentence
        (* {modName} *)
        *  sentence
    | OPENBATTLEEX
        (* type *)
        of word
        (* natType *)
        *  word
        (* password *)
        *  word
        (* port *)
        *  word
        (* maxPlayers *)
        *  word
        (* hashCode *)
        *  word
        (* rank *)
        *  word
        (* mapHash *)
        *  word
        (* {engineName} *)
        *  sentence
        (* {engineVersion} *)
        *  sentence
        (* {map} *)
        *  sentence
        (* {title} *)
        *  sentence
        (* {modName} *)
        *  sentence
    | JOINBATTLE
        (* battleID *)
        of word
        (* [password] *)
        *  word option
        (* [scriptPassword] *)
        *  word option
    | JOINBATTLEACCEPT
        (* userName *)
        of word
    | JOINBATTLEDENY
        (* userName *)
        of word
        (* [{reason}] *)
        *  sentence option
    | LEAVEBATTLE
    | UPDATEBATTLEINFO
        (* spectatorCount *)
        of word
        (* locked *)
        *  word
        (* mapHash *)
        *  word
        (* {mapName} *)
        *  sentence
    | SAYBATTLE
        (* {message} *)
        of sentence
    | SAYBATTLEEX
        (* {message} *)
        of sentence
    | MYSTATUS
        (* status *)
        of word
    | MYBATTLESTATUS
        (* battleStatus *)
        of word
        (* myTeamColor *)
        *  word
    | HANDICAP
        (* userName *)
        of word
        (* value *)
        *  word
    | KICKFROMBATTLE
        (* userName *)
        of word
    | FORCETEAMNO
        (* userName *)
        of word
        (* teamNo *)
        *  word
    | FORCEALLYNO
        (* userName *)
        of word
        (* teamNo *)
        *  word
    | FORCETEAMCOLOR
        (* userName *)
        of word
        (* color *)
        *  word
    | FORCESPECTATORMODE
        (* userName *)
        of word
    | DISABLEUNITS
        (* unitNames... *)
        of word list
    | ENABLEUNITS
        (* unitNames... *)
        of word list
    | ENABLEALLUNITS
    | RING
        (* userName *)
        of word
    | ADDBOT
        (* name *)
        of word
        (* battleStatus *)
        *  word
        (* teamColor *)
        *  word
        (* {ai dll} *)
        *  sentence
    | REMOVEBOT
        (* name *)
        of word
    | UPDATEBOT
        (* name *)
        of word
        (* battleStatus *)
        *  word
        (* teamColor *)
        *  word
    | ADDSTARTRECT
        (* allyNo *)
        of word
        (* left *)
        *  word
        (* top *)
        *  word
        (* right *)
        *  word
        (* bottom *)
        *  word
    | REMOVESTARTRECT
        (* allyNo *)
        of word
    | SCRIPTSTART
    | SCRIPT
        (* {line} *)
        of sentence
    | SCRIPTEND
    | SETSCRIPTTAGS
        (* {pairs...} *)
        of sentence list
    | REMOVESCRIPTTAGS
        (* keys... *)
        of word list
    | TESTLOGIN
        (* userName *)
        of word
        (* password *)
        *  word
    | USERID
        (* userID *)
        of word
    | GETINGAMETIME
    | FORCEJOINBATTLE
        (* userName *)
        of word
        (* destinationBattleID *)
        *  word
        (* [destinationBattlePassword] *)
        *  word option
    | LISTCOMPFLAGS
    | CONNECTUSER
        (* userName *)
        of word
        (* ipAndPort *)
        *  word
        (* [scriptPassword] *)
        *  word option
    | SAYDATA
        (* chanName *)
        of word
        (* {message} *)
        *  sentence
    | SAYDATAPRIVATE
        (* userName *)
        of word
        (* {message} *)
        *  sentence
    | SAYDATABATTLE
        (* {message} *)
        of sentence
    | RECOVERACCOUNT
        (* email *)
        of word
        (* [userName] *)
        *  word option
    deriving (Show)
}

let wa = [^' ']*
let sa = [^'\t']*

rule token = parse
| "PING"
       { PING }
| "REQUESTUPDATEFILE"
     (' '(sa as name_and_version))
       { REQUESTUPDATEFILE (name_and_version) }
| "REGISTER"
     (' '(wa as userName))
     (' '(wa as password))
     (' '(wa as email))?
       { REGISTER (userName, password, email) }
| "RENAMEACCOUNT"
     (' '(wa as newUsername))
       { RENAMEACCOUNT (newUsername) }
| "CHANGEPASSWORD"
     (' '(wa as oldPassword))
     (' '(wa as newPassword))
       { CHANGEPASSWORD (oldPassword, newPassword) }
| "CHANGEEMAIL"
     (' '(wa as newEmail))
     (' '(wa as userName))?
       { CHANGEEMAIL (newEmail, userName) }
| "LOGIN"
     (' '(wa as userName))
     (' '(wa as password))
     (' '(wa as cpu))
     (' '(wa as localIP))
     (' '(sa as lobby_name_and_version))
     ('\t'(sa as userID))?
     ('\t'(sa as compFlags))?
       { LOGIN (userName, password, cpu, localIP, lobby_name_and_version, userID, compFlags) }
| "EXIT"
     (' '(sa as reason))?
       { EXIT (reason) }
| "CONFIRMAGREEMENT"
       { CONFIRMAGREEMENT }
| "JOIN"
     (' '(wa as chanName))
     (' '(wa as key))?
       { JOIN (chanName, key) }
| "CHANNELS"
       { CHANNELS }
| "MUTELIST"
     (' '(wa as chanName))
       { MUTELIST (chanName) }
| "CHANNELTOPIC"
     (' '(wa as chanName))
     (' '(sa as topic))
       { CHANNELTOPIC (chanName, topic) }
| "LEAVE"
     (' '(wa as chanName))
       { LEAVE (chanName) }
| "FORCELEAVECHANNEL"
     (' '(wa as chanName))
     (' '(wa as userName))
     (' '(sa as reason))?
       { FORCELEAVECHANNEL (chanName, userName, reason) }
| "SAY"
     (' '(wa as chanName))
     (' '(sa as message))
       { SAY (chanName, message) }
| "SAYEX"
     (' '(wa as chanName))
     (' '(sa as message))
       { SAYEX (chanName, message) }
| "SAYPRIVATE"
     (' '(wa as userName))
     (' '(sa as message))
       { SAYPRIVATE (userName, message) }
| "OPENBATTLE"
     (' '(wa as type_))
     (' '(wa as natType))
     (' '(wa as password))
     (' '(wa as port))
     (' '(wa as maxPlayers))
     (' '(wa as hashCode))
     (' '(wa as rank))
     (' '(wa as mapHash))
     (' '(sa as map))
     ('\t'(sa as title))
     ('\t'(sa as modName))
       { OPENBATTLE (type_, natType, password, port, maxPlayers, hashCode, rank, mapHash, map, title, modName) }
| "OPENBATTLEEX"
     (' '(wa as type_))
     (' '(wa as natType))
     (' '(wa as password))
     (' '(wa as port))
     (' '(wa as maxPlayers))
     (' '(wa as hashCode))
     (' '(wa as rank))
     (' '(wa as mapHash))
     (' '(sa as engineName))
     ('\t'(sa as engineVersion))
     ('\t'(sa as map))
     ('\t'(sa as title))
     ('\t'(sa as modName))
       { OPENBATTLEEX (type_, natType, password, port, maxPlayers, hashCode, rank, mapHash, engineName, engineVersion, map, title, modName) }
| "JOINBATTLE"
     (' '(wa as battleID))
     (' '(wa as password))?
     (' '(wa as scriptPassword))?
       { JOINBATTLE (battleID, password, scriptPassword) }
| "JOINBATTLEACCEPT"
     (' '(wa as userName))
       { JOINBATTLEACCEPT (userName) }
| "JOINBATTLEDENY"
     (' '(wa as userName))
     (' '(sa as reason))?
       { JOINBATTLEDENY (userName, reason) }
| "LEAVEBATTLE"
       { LEAVEBATTLE }
| "UPDATEBATTLEINFO"
     (' '(wa as spectatorCount))
     (' '(wa as locked))
     (' '(wa as mapHash))
     (' '(sa as mapName))
       { UPDATEBATTLEINFO (spectatorCount, locked, mapHash, mapName) }
| "SAYBATTLE"
     (' '(sa as message))
       { SAYBATTLE (message) }
| "SAYBATTLEEX"
     (' '(sa as message))
       { SAYBATTLEEX (message) }
| "MYSTATUS"
     (' '(wa as status))
       { MYSTATUS (status) }
| "MYBATTLESTATUS"
     (' '(wa as battleStatus))
     (' '(wa as myTeamColor))
       { MYBATTLESTATUS (battleStatus, myTeamColor) }
| "HANDICAP"
     (' '(wa as userName))
     (' '(wa as value))
       { HANDICAP (userName, value) }
| "KICKFROMBATTLE"
     (' '(wa as userName))
       { KICKFROMBATTLE (userName) }
| "FORCETEAMNO"
     (' '(wa as userName))
     (' '(wa as teamNo))
       { FORCETEAMNO (userName, teamNo) }
| "FORCEALLYNO"
     (' '(wa as userName))
     (' '(wa as teamNo))
       { FORCEALLYNO (userName, teamNo) }
| "FORCETEAMCOLOR"
     (' '(wa as userName))
     (' '(wa as color))
       { FORCETEAMCOLOR (userName, color) }
| "FORCESPECTATORMODE"
     (' '(wa as userName))
       { FORCESPECTATORMODE (userName) }
| "DISABLEUNITS"
     ((' 'wa)+ as unitNames)
       { DISABLEUNITS (BatString.nsplit unitNames " ") }
| "ENABLEUNITS"
     ((' 'wa)+ as unitNames)
       { ENABLEUNITS (BatString.nsplit unitNames " ") }
| "ENABLEALLUNITS"
       { ENABLEALLUNITS }
| "RING"
     (' '(wa as userName))
       { RING (userName) }
| "ADDBOT"
     (' '(wa as name))
     (' '(wa as battleStatus))
     (' '(wa as teamColor))
     (' '(sa as ai_dll))
       { ADDBOT (name, battleStatus, teamColor, ai_dll) }
| "REMOVEBOT"
     (' '(wa as name))
       { REMOVEBOT (name) }
| "UPDATEBOT"
     (' '(wa as name))
     (' '(wa as battleStatus))
     (' '(wa as teamColor))
       { UPDATEBOT (name, battleStatus, teamColor) }
| "ADDSTARTRECT"
     (' '(wa as allyNo))
     (' '(wa as left))
     (' '(wa as top))
     (' '(wa as right))
     (' '(wa as bottom))
       { ADDSTARTRECT (allyNo, left, top, right, bottom) }
| "REMOVESTARTRECT"
     (' '(wa as allyNo))
       { REMOVESTARTRECT (allyNo) }
| "SCRIPTSTART"
       { SCRIPTSTART }
| "SCRIPT"
     (' '(sa as line))
       { SCRIPT (line) }
| "SCRIPTEND"
       { SCRIPTEND }
| "SETSCRIPTTAGS"
     ((' 'sa)+ as pairs)
       { SETSCRIPTTAGS (BatString.nsplit pairs "\t") }
| "REMOVESCRIPTTAGS"
     ((' 'wa)+ as keys)
       { REMOVESCRIPTTAGS (BatString.nsplit keys " ") }
| "TESTLOGIN"
     (' '(wa as userName))
     (' '(wa as password))
       { TESTLOGIN (userName, password) }
| "USERID"
     (' '(wa as userID))
       { USERID (userID) }
| "GETINGAMETIME"
       { GETINGAMETIME }
| "FORCEJOINBATTLE"
     (' '(wa as userName))
     (' '(wa as destinationBattleID))
     (' '(wa as destinationBattlePassword))?
       { FORCEJOINBATTLE (userName, destinationBattleID, destinationBattlePassword) }
| "LISTCOMPFLAGS"
       { LISTCOMPFLAGS }
| "CONNECTUSER"
     (' '(wa as userName))
     (' '(wa as ipAndPort))
     (' '(wa as scriptPassword))?
       { CONNECTUSER (userName, ipAndPort, scriptPassword) }
| "SAYDATA"
     (' '(wa as chanName))
     (' '(sa as message))
       { SAYDATA (chanName, message) }
| "SAYDATAPRIVATE"
     (' '(wa as userName))
     (' '(sa as message))
       { SAYDATAPRIVATE (userName, message) }
| "SAYDATABATTLE"
     (' '(sa as message))
       { SAYDATABATTLE (message) }
| "RECOVERACCOUNT"
     (' '(wa as email))
     (' '(wa as userName))?
       { RECOVERACCOUNT (email, userName) }


{
  let name_of_command = function
    | PING _ -> "PING"
    | REQUESTUPDATEFILE _ -> "REQUESTUPDATEFILE"
    | REGISTER _ -> "REGISTER"
    | RENAMEACCOUNT _ -> "RENAMEACCOUNT"
    | CHANGEPASSWORD _ -> "CHANGEPASSWORD"
    | CHANGEEMAIL _ -> "CHANGEEMAIL"
    | LOGIN _ -> "LOGIN"
    | EXIT _ -> "EXIT"
    | CONFIRMAGREEMENT _ -> "CONFIRMAGREEMENT"
    | JOIN _ -> "JOIN"
    | CHANNELS _ -> "CHANNELS"
    | MUTELIST _ -> "MUTELIST"
    | CHANNELTOPIC _ -> "CHANNELTOPIC"
    | LEAVE _ -> "LEAVE"
    | FORCELEAVECHANNEL _ -> "FORCELEAVECHANNEL"
    | SAY _ -> "SAY"
    | SAYEX _ -> "SAYEX"
    | SAYPRIVATE _ -> "SAYPRIVATE"
    | OPENBATTLE _ -> "OPENBATTLE"
    | OPENBATTLEEX _ -> "OPENBATTLEEX"
    | JOINBATTLE _ -> "JOINBATTLE"
    | JOINBATTLEACCEPT _ -> "JOINBATTLEACCEPT"
    | JOINBATTLEDENY _ -> "JOINBATTLEDENY"
    | LEAVEBATTLE _ -> "LEAVEBATTLE"
    | UPDATEBATTLEINFO _ -> "UPDATEBATTLEINFO"
    | SAYBATTLE _ -> "SAYBATTLE"
    | SAYBATTLEEX _ -> "SAYBATTLEEX"
    | MYSTATUS _ -> "MYSTATUS"
    | MYBATTLESTATUS _ -> "MYBATTLESTATUS"
    | HANDICAP _ -> "HANDICAP"
    | KICKFROMBATTLE _ -> "KICKFROMBATTLE"
    | FORCETEAMNO _ -> "FORCETEAMNO"
    | FORCEALLYNO _ -> "FORCEALLYNO"
    | FORCETEAMCOLOR _ -> "FORCETEAMCOLOR"
    | FORCESPECTATORMODE _ -> "FORCESPECTATORMODE"
    | DISABLEUNITS _ -> "DISABLEUNITS"
    | ENABLEUNITS _ -> "ENABLEUNITS"
    | ENABLEALLUNITS _ -> "ENABLEALLUNITS"
    | RING _ -> "RING"
    | ADDBOT _ -> "ADDBOT"
    | REMOVEBOT _ -> "REMOVEBOT"
    | UPDATEBOT _ -> "UPDATEBOT"
    | ADDSTARTRECT _ -> "ADDSTARTRECT"
    | REMOVESTARTRECT _ -> "REMOVESTARTRECT"
    | SCRIPTSTART _ -> "SCRIPTSTART"
    | SCRIPT _ -> "SCRIPT"
    | SCRIPTEND _ -> "SCRIPTEND"
    | SETSCRIPTTAGS _ -> "SETSCRIPTTAGS"
    | REMOVESCRIPTTAGS _ -> "REMOVESCRIPTTAGS"
    | TESTLOGIN _ -> "TESTLOGIN"
    | USERID _ -> "USERID"
    | GETINGAMETIME _ -> "GETINGAMETIME"
    | FORCEJOINBATTLE _ -> "FORCEJOINBATTLE"
    | LISTCOMPFLAGS _ -> "LISTCOMPFLAGS"
    | CONNECTUSER _ -> "CONNECTUSER"
    | SAYDATA _ -> "SAYDATA"
    | SAYDATAPRIVATE _ -> "SAYDATAPRIVATE"
    | SAYDATABATTLE _ -> "SAYDATABATTLE"
    | RECOVERACCOUNT _ -> "RECOVERACCOUNT"


  let add_arguments buf = function
    | PING
    | CONFIRMAGREEMENT
    | CHANNELS
    | LEAVEBATTLE
    | ENABLEALLUNITS
    | SCRIPTSTART
    | SCRIPTEND
    | GETINGAMETIME
    | LISTCOMPFLAGS -> ()

    | REQUESTUPDATEFILE (name_and_version) ->
        (Proto.add_word buf) name_and_version;

    | REGISTER (userName, password, email) ->
        (Proto.add_word buf) userName;
        (Proto.add_word buf) password;
        BatOption.may (Proto.add_word buf) email;

    | RENAMEACCOUNT (newUsername) ->
        (Proto.add_word buf) newUsername;

    | CHANGEPASSWORD (oldPassword, newPassword) ->
        (Proto.add_word buf) oldPassword;
        (Proto.add_word buf) newPassword;

    | CHANGEEMAIL (newEmail, userName) ->
        (Proto.add_word buf) newEmail;
        BatOption.may (Proto.add_word buf) userName;

    | LOGIN (userName, password, cpu, localIP, lobby_name_and_version, userID, compFlags) ->
        (Proto.add_word buf) userName;
        (Proto.add_word buf) password;
        (Proto.add_word buf) cpu;
        (Proto.add_word buf) localIP;
        (Proto.add_word buf) lobby_name_and_version;
        BatOption.may (Proto.add_sentence buf) userID;
        BatOption.may (Proto.add_sentence buf) compFlags;

    | EXIT (reason) ->
        BatOption.may (Proto.add_word buf) reason;

    | JOIN (chanName, key) ->
        (Proto.add_word buf) chanName;
        BatOption.may (Proto.add_word buf) key;

    | MUTELIST (chanName) ->
        (Proto.add_word buf) chanName;

    | CHANNELTOPIC (chanName, topic) ->
        (Proto.add_word buf) chanName;
        (Proto.add_word buf) topic;

    | LEAVE (chanName) ->
        (Proto.add_word buf) chanName;

    | FORCELEAVECHANNEL (chanName, userName, reason) ->
        (Proto.add_word buf) chanName;
        (Proto.add_word buf) userName;
        BatOption.may (Proto.add_word buf) reason;

    | SAY (chanName, message) ->
        (Proto.add_word buf) chanName;
        (Proto.add_word buf) message;

    | SAYEX (chanName, message) ->
        (Proto.add_word buf) chanName;
        (Proto.add_word buf) message;

    | SAYPRIVATE (userName, message) ->
        (Proto.add_word buf) userName;
        (Proto.add_word buf) message;

    | OPENBATTLE (type_, natType, password, port, maxPlayers, hashCode, rank, mapHash, map, title, modName) ->
        (Proto.add_word buf) type_;
        (Proto.add_word buf) natType;
        (Proto.add_word buf) password;
        (Proto.add_word buf) port;
        (Proto.add_word buf) maxPlayers;
        (Proto.add_word buf) hashCode;
        (Proto.add_word buf) rank;
        (Proto.add_word buf) mapHash;
        (Proto.add_word buf) map;
        (Proto.add_sentence buf) title;
        (Proto.add_sentence buf) modName;

    | OPENBATTLEEX (type_, natType, password, port, maxPlayers, hashCode, rank, mapHash, engineName, engineVersion, map, title, modName) ->
        (Proto.add_word buf) type_;
        (Proto.add_word buf) natType;
        (Proto.add_word buf) password;
        (Proto.add_word buf) port;
        (Proto.add_word buf) maxPlayers;
        (Proto.add_word buf) hashCode;
        (Proto.add_word buf) rank;
        (Proto.add_word buf) mapHash;
        (Proto.add_word buf) engineName;
        (Proto.add_sentence buf) engineVersion;
        (Proto.add_sentence buf) map;
        (Proto.add_sentence buf) title;
        (Proto.add_sentence buf) modName;

    | JOINBATTLE (battleID, password, scriptPassword) ->
        (Proto.add_word buf) battleID;
        BatOption.may (Proto.add_word buf) password;
        BatOption.may (Proto.add_word buf) scriptPassword;

    | JOINBATTLEACCEPT (userName) ->
        (Proto.add_word buf) userName;

    | JOINBATTLEDENY (userName, reason) ->
        (Proto.add_word buf) userName;
        BatOption.may (Proto.add_word buf) reason;

    | UPDATEBATTLEINFO (spectatorCount, locked, mapHash, mapName) ->
        (Proto.add_word buf) spectatorCount;
        (Proto.add_word buf) locked;
        (Proto.add_word buf) mapHash;
        (Proto.add_word buf) mapName;

    | SAYBATTLE (message) ->
        (Proto.add_word buf) message;

    | SAYBATTLEEX (message) ->
        (Proto.add_word buf) message;

    | MYSTATUS (status) ->
        (Proto.add_word buf) status;

    | MYBATTLESTATUS (battleStatus, myTeamColor) ->
        (Proto.add_word buf) battleStatus;
        (Proto.add_word buf) myTeamColor;

    | HANDICAP (userName, value) ->
        (Proto.add_word buf) userName;
        (Proto.add_word buf) value;

    | KICKFROMBATTLE (userName) ->
        (Proto.add_word buf) userName;

    | FORCETEAMNO (userName, teamNo) ->
        (Proto.add_word buf) userName;
        (Proto.add_word buf) teamNo;

    | FORCEALLYNO (userName, teamNo) ->
        (Proto.add_word buf) userName;
        (Proto.add_word buf) teamNo;

    | FORCETEAMCOLOR (userName, color) ->
        (Proto.add_word buf) userName;
        (Proto.add_word buf) color;

    | FORCESPECTATORMODE (userName) ->
        (Proto.add_word buf) userName;

    | DISABLEUNITS (unitNames) ->
        List.iter (Proto.add_word buf) unitNames

    | ENABLEUNITS (unitNames) ->
        List.iter (Proto.add_word buf) unitNames

    | RING (userName) ->
        (Proto.add_word buf) userName;

    | ADDBOT (name, battleStatus, teamColor, ai_dll) ->
        (Proto.add_word buf) name;
        (Proto.add_word buf) battleStatus;
        (Proto.add_word buf) teamColor;
        (Proto.add_word buf) ai_dll;

    | REMOVEBOT (name) ->
        (Proto.add_word buf) name;

    | UPDATEBOT (name, battleStatus, teamColor) ->
        (Proto.add_word buf) name;
        (Proto.add_word buf) battleStatus;
        (Proto.add_word buf) teamColor;

    | ADDSTARTRECT (allyNo, left, top, right, bottom) ->
        (Proto.add_word buf) allyNo;
        (Proto.add_word buf) left;
        (Proto.add_word buf) top;
        (Proto.add_word buf) right;
        (Proto.add_word buf) bottom;

    | REMOVESTARTRECT (allyNo) ->
        (Proto.add_word buf) allyNo;

    | SCRIPT (line) ->
        (Proto.add_word buf) line;

    | SETSCRIPTTAGS (pairs) ->
        List.iter (Proto.add_word buf) pairs

    | REMOVESCRIPTTAGS (keys) ->
        List.iter (Proto.add_word buf) keys

    | TESTLOGIN (userName, password) ->
        (Proto.add_word buf) userName;
        (Proto.add_word buf) password;

    | USERID (userID) ->
        (Proto.add_word buf) userID;

    | FORCEJOINBATTLE (userName, destinationBattleID, destinationBattlePassword) ->
        (Proto.add_word buf) userName;
        (Proto.add_word buf) destinationBattleID;
        BatOption.may (Proto.add_word buf) destinationBattlePassword;

    | CONNECTUSER (userName, ipAndPort, scriptPassword) ->
        (Proto.add_word buf) userName;
        (Proto.add_word buf) ipAndPort;
        BatOption.may (Proto.add_word buf) scriptPassword;

    | SAYDATA (chanName, message) ->
        (Proto.add_word buf) chanName;
        (Proto.add_word buf) message;

    | SAYDATAPRIVATE (userName, message) ->
        (Proto.add_word buf) userName;
        (Proto.add_word buf) message;

    | SAYDATABATTLE (message) ->
        (Proto.add_word buf) message;

    | RECOVERACCOUNT (email, userName) ->
        (Proto.add_word buf) email;
        BatOption.may (Proto.add_word buf) userName;
  ;;


let emit cmd =
    let buf = Buffer.create 128 in
    Buffer.add_string buf (name_of_command cmd);
    add_arguments buf cmd;
    Buffer.contents buf


  let of_string line =
    let lexbuf = Lexing.from_string line in
    token lexbuf
}
