{
  open ProtoType
  type t =
    | PONG
    | TASServer
        (* protocolVersion *)
        of word
        (* springVersion *)
        *  word
        (* udpPort *)
        *  word
        (* serverMode *)
        *  word
    | REGISTRATIONDENIED
        (* {reason} *)
        of sentence
    | REGISTRATIONACCEPTED
    | ACCEPTED
        (* userName *)
        of word
    | DENIED
        (* {reason} *)
        of sentence
    | LOGININFOEND
    | AGREEMENT
        (* {agreement} *)
        of sentence
    | AGREEMENTEND
    | MOTD
        (* {message} *)
        of sentence
    | OFFERFILE
        (* options *)
        of word
        (* {fileName} *)
        *  sentence
        (* {url} *)
        *  sentence
        (* {description} *)
        *  sentence
    | UDPSOURCEPORT
        (* port *)
        of word
    | CLIENTIPPORT
        (* userName *)
        of word
        (* ip *)
        *  word
        (* port *)
        *  word
    | HOSTPORT
        (* port *)
        of word
    | SERVERMSG
        (* {message} *)
        of sentence
    | SERVERMSGBOX
        (* {message} *)
        of sentence
        (* [{url}] *)
        *  sentence option
    | ADDUSER
        (* userName *)
        of word
        (* country *)
        *  word
        (* cpu *)
        *  word
        (* [accountID] *)
        *  word option
    | REMOVEUSER
        (* userName *)
        of word
    | JOIN
        (* chanName *)
        of word
    | JOINFAILED
        (* chanName *)
        of word
        (* {reason} *)
        *  sentence
    | CHANNEL
        (* chanName *)
        of word
        (* userCount *)
        *  word
        (* [{topic}] *)
        *  sentence option
    | ENDOFCHANNELS
    | MUTELISTBEGIN
        (* chanName *)
        of word
    | MUTELIST
        (* {mute description} *)
        of sentence
    | MUTELISTEND
    | CHANNELTOPIC
        (* chanName *)
        of word
        (* author *)
        *  word
        (* changedTime *)
        *  word
        (* {topic} *)
        *  sentence
    | CLIENTS
        (* chanName *)
        of word
        (* {clients} *)
        *  sentence
    | JOINED
        (* chanName *)
        of word
        (* userName *)
        *  word
    | LEFT
        (* chanName *)
        of word
        (* userName *)
        *  word
        (* [{reason}] *)
        *  sentence option
    | FORCELEAVECHANNEL
        (* chanName *)
        of word
        (* userName *)
        *  word
        (* [{reason}] *)
        *  sentence option
    | CHANNELMESSAGE
        (* chanName *)
        of word
        (* message *)
        *  word
    | SAID
        (* chanName *)
        of word
        (* userName *)
        *  word
        (* {message} *)
        *  sentence
    | SAIDEX
        (* chanName *)
        of word
        (* userName *)
        *  word
        (* {message} *)
        *  sentence
    | SAYPRIVATE
        (* userName *)
        of word
        (* {message} *)
        *  sentence
    | SAIDPRIVATE
        (* userName *)
        of word
        (* {message} *)
        *  sentence
    | OPENBATTLE
        (* battleID *)
        of word
    | BATTLEOPENED
        (* battleID *)
        of word
        (* type *)
        *  word
        (* natType *)
        *  word
        (* founder *)
        *  word
        (* ip *)
        *  word
        (* port *)
        *  word
        (* maxPlayers *)
        *  word
        (* passworded *)
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
    | BATTLEOPENEDEX
        (* battleID *)
        of word
        (* type *)
        *  word
        (* natType *)
        *  word
        (* founder *)
        *  word
        (* ip *)
        *  word
        (* port *)
        *  word
        (* maxPlayers *)
        *  word
        (* passworded *)
        *  word
        (* rank *)
        *  word
        (* mapHash *)
        *  word
        (* engineName *)
        *  word
        (* engineVersion *)
        *  word
        (* {map} *)
        *  sentence
        (* {title} *)
        *  sentence
        (* {modName} *)
        *  sentence
    | BATTLECLOSED
        (* battleID *)
        of word
    | JOINBATTLE
        (* battleID *)
        of word
        (* hashCode *)
        *  word
    | JOINBATTLEREQUEST
        (* userName *)
        of word
        (* ip *)
        *  word
    | JOINEDBATTLE
        (* battleID *)
        of word
        (* userName *)
        *  word
        (* [scriptPassword] *)
        *  word option
    | LEFTBATTLE
        (* battleID *)
        of word
        (* userName *)
        *  word
    | JOINBATTLEFAILED
        (* {reason} *)
        of sentence
    | OPENBATTLEFAILED
        (* {reason} *)
        of sentence
    | UPDATEBATTLEINFO
        (* battleID *)
        of word
        (* spectatorCount *)
        *  word
        (* locked *)
        *  word
        (* mapHash *)
        *  word
        (* {mapName} *)
        *  sentence
    | SAIDBATTLE
        (* userName *)
        of word
        (* {message} *)
        *  sentence
    | SAIDBATTLEEX
        (* userName *)
        of word
        (* {message} *)
        *  sentence
    | CLIENTSTATUS
        (* userName *)
        of word
        (* status *)
        *  word
    | CLIENTBATTLESTATUS
        (* userName *)
        of word
        (* battleStatus *)
        *  word
        (* teamColor *)
        *  word
    | REQUESTBATTLESTATUS
    | FORCEQUITBATTLE
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
    | REDIRECT
        (* ip *)
        of word
    | BROADCAST
        (* {message} *)
        of sentence
    | ADDBOT
        (* battleID *)
        of word
        (* name *)
        *  word
        (* owner *)
        *  word
        (* battleStatus *)
        *  word
        (* teamColor *)
        *  word
        (* {ai dll} *)
        *  sentence
    | REMOVEBOT
        (* battleID *)
        of word
        (* name *)
        *  word
    | UPDATEBOT
        (* battleID *)
        of word
        (* name *)
        *  word
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
    | TESTLOGINACCEPT
    | TESTLOGINDENY
    | ACQUIREUSERID
    | FORCEJOINBATTLE
        (* destinationBattleID *)
        of word
        (* [destinationBattlePassword] *)
        *  word option
    | FORCEJOINBATTLEFAILED
        (* userName *)
        of word
        (* [{reason}] *)
        *  sentence option
    | COMPFLAGS
        (* [compFlags...] *)
        of word list
    | CONNECTUSER
        (* ipAndPort *)
        of word
        (* [scriptPassword] *)
        *  word option
    | CONNECTUSERFAILED
        (* userName *)
        of word
        (* [{reason}] *)
        *  sentence option
    | SAIDDATA
        (* chanName *)
        of word
        (* userName *)
        *  word
        (* {message} *)
        *  sentence
    | SAYDATAPRIVATE
        (* userName *)
        of word
        (* {message} *)
        *  sentence
    | SAIDDATAPRIVATE
        (* userName *)
        of word
        (* {message} *)
        *  sentence
    | SAIDDATABATTLE
        (* userName *)
        of word
        (* {message} *)
        *  sentence
    deriving (Show)
}

let wa = [^' ']*
let sa = [^'\t']*

rule token = parse
| "PONG"
       { PONG }
| "TASServer"
     (' '(wa as protocolVersion))
     (' '(wa as springVersion))
     (' '(wa as udpPort))
     (' '(wa as serverMode))
       { TASServer (protocolVersion, springVersion, udpPort, serverMode) }
| "REGISTRATIONDENIED"
     (' '(sa as reason))
       { REGISTRATIONDENIED (reason) }
| "REGISTRATIONACCEPTED"
       { REGISTRATIONACCEPTED }
| "ACCEPTED"
     (' '(wa as userName))
       { ACCEPTED (userName) }
| "DENIED"
     (' '(sa as reason))
       { DENIED (reason) }
| "LOGININFOEND"
       { LOGININFOEND }
| "AGREEMENT"
     (' '(sa as agreement))
       { AGREEMENT (agreement) }
| "AGREEMENTEND"
       { AGREEMENTEND }
| "MOTD"
     (' '(sa as message))
       { MOTD (message) }
| "OFFERFILE"
     (' '(wa as options))
     (' '(sa as fileName))
     ('\t'(sa as url))
     ('\t'(sa as description))
       { OFFERFILE (options, fileName, url, description) }
| "UDPSOURCEPORT"
     (' '(wa as port))
       { UDPSOURCEPORT (port) }
| "CLIENTIPPORT"
     (' '(wa as userName))
     (' '(wa as ip))
     (' '(wa as port))
       { CLIENTIPPORT (userName, ip, port) }
| "HOSTPORT"
     (' '(wa as port))
       { HOSTPORT (port) }
| "SERVERMSG"
     (' '(sa as message))
       { SERVERMSG (message) }
| "SERVERMSGBOX"
     (' '(sa as message))
     ('\t'(sa as url))?
       { SERVERMSGBOX (message, url) }
| "ADDUSER"
     (' '(wa as userName))
     (' '(wa as country))
     (' '(wa as cpu))
     (' '(wa as accountID))?
       { ADDUSER (userName, country, cpu, accountID) }
| "REMOVEUSER"
     (' '(wa as userName))
       { REMOVEUSER (userName) }
| "JOIN"
     (' '(wa as chanName))
       { JOIN (chanName) }
| "JOINFAILED"
     (' '(wa as chanName))
     (' '(sa as reason))
       { JOINFAILED (chanName, reason) }
| "CHANNEL"
     (' '(wa as chanName))
     (' '(wa as userCount))
     (' '(sa as topic))?
       { CHANNEL (chanName, userCount, topic) }
| "ENDOFCHANNELS"
       { ENDOFCHANNELS }
| "MUTELISTBEGIN"
     (' '(wa as chanName))
       { MUTELISTBEGIN (chanName) }
| "MUTELIST"
     (' '(sa as mute_description))
       { MUTELIST (mute_description) }
| "MUTELISTEND"
       { MUTELISTEND }
| "CHANNELTOPIC"
     (' '(wa as chanName))
     (' '(wa as author))
     (' '(wa as changedTime))
     (' '(sa as topic))
       { CHANNELTOPIC (chanName, author, changedTime, topic) }
| "CLIENTS"
     (' '(wa as chanName))
     (' '(sa as clients))
       { CLIENTS (chanName, clients) }
| "JOINED"
     (' '(wa as chanName))
     (' '(wa as userName))
       { JOINED (chanName, userName) }
| "LEFT"
     (' '(wa as chanName))
     (' '(wa as userName))
     (' '(sa as reason))?
       { LEFT (chanName, userName, reason) }
| "FORCELEAVECHANNEL"
     (' '(wa as chanName))
     (' '(wa as userName))
     (' '(sa as reason))?
       { FORCELEAVECHANNEL (chanName, userName, reason) }
| "CHANNELMESSAGE"
     (' '(wa as chanName))
     (' '(wa as message))
       { CHANNELMESSAGE (chanName, message) }
| "SAID"
     (' '(wa as chanName))
     (' '(wa as userName))
     (' '(sa as message))
       { SAID (chanName, userName, message) }
| "SAIDEX"
     (' '(wa as chanName))
     (' '(wa as userName))
     (' '(sa as message))
       { SAIDEX (chanName, userName, message) }
| "SAYPRIVATE"
     (' '(wa as userName))
     (' '(sa as message))
       { SAYPRIVATE (userName, message) }
| "SAIDPRIVATE"
     (' '(wa as userName))
     (' '(sa as message))
       { SAIDPRIVATE (userName, message) }
| "OPENBATTLE"
     (' '(wa as battleID))
       { OPENBATTLE (battleID) }
| "BATTLEOPENED"
     (' '(wa as battleID))
     (' '(wa as type_))
     (' '(wa as natType))
     (' '(wa as founder))
     (' '(wa as ip))
     (' '(wa as port))
     (' '(wa as maxPlayers))
     (' '(wa as passworded))
     (' '(wa as rank))
     (' '(wa as mapHash))
     (' '(sa as map))
     ('\t'(sa as title))
     ('\t'(sa as modName))
       { BATTLEOPENED (battleID, type_, natType, founder, ip, port, maxPlayers, passworded, rank, mapHash, map, title, modName) }
| "BATTLEOPENEDEX"
     (' '(wa as battleID))
     (' '(wa as type_))
     (' '(wa as natType))
     (' '(wa as founder))
     (' '(wa as ip))
     (' '(wa as port))
     (' '(wa as maxPlayers))
     (' '(wa as passworded))
     (' '(wa as rank))
     (' '(wa as mapHash))
     (' '(wa as engineName))
     (' '(wa as engineVersion))
     (' '(sa as map))
     ('\t'(sa as title))
     ('\t'(sa as modName))
       { BATTLEOPENEDEX (battleID, type_, natType, founder, ip, port, maxPlayers, passworded, rank, mapHash, engineName, engineVersion, map, title, modName) }
| "BATTLECLOSED"
     (' '(wa as battleID))
       { BATTLECLOSED (battleID) }
| "JOINBATTLE"
     (' '(wa as battleID))
     (' '(wa as hashCode))
       { JOINBATTLE (battleID, hashCode) }
| "JOINBATTLEREQUEST"
     (' '(wa as userName))
     (' '(wa as ip))
       { JOINBATTLEREQUEST (userName, ip) }
| "JOINEDBATTLE"
     (' '(wa as battleID))
     (' '(wa as userName))
     (' '(wa as scriptPassword))?
       { JOINEDBATTLE (battleID, userName, scriptPassword) }
| "LEFTBATTLE"
     (' '(wa as battleID))
     (' '(wa as userName))
       { LEFTBATTLE (battleID, userName) }
| "JOINBATTLEFAILED"
     (' '(sa as reason))
       { JOINBATTLEFAILED (reason) }
| "OPENBATTLEFAILED"
     (' '(sa as reason))
       { OPENBATTLEFAILED (reason) }
| "UPDATEBATTLEINFO"
     (' '(wa as battleID))
     (' '(wa as spectatorCount))
     (' '(wa as locked))
     (' '(wa as mapHash))
     (' '(sa as mapName))
       { UPDATEBATTLEINFO (battleID, spectatorCount, locked, mapHash, mapName) }
| "SAIDBATTLE"
     (' '(wa as userName))
     (' '(sa as message))
       { SAIDBATTLE (userName, message) }
| "SAIDBATTLEEX"
     (' '(wa as userName))
     (' '(sa as message))
       { SAIDBATTLEEX (userName, message) }
| "CLIENTSTATUS"
     (' '(wa as userName))
     (' '(wa as status))
       { CLIENTSTATUS (userName, status) }
| "CLIENTBATTLESTATUS"
     (' '(wa as userName))
     (' '(wa as battleStatus))
     (' '(wa as teamColor))
       { CLIENTBATTLESTATUS (userName, battleStatus, teamColor) }
| "REQUESTBATTLESTATUS"
       { REQUESTBATTLESTATUS }
| "FORCEQUITBATTLE"
       { FORCEQUITBATTLE }
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
| "REDIRECT"
     (' '(wa as ip))
       { REDIRECT (ip) }
| "BROADCAST"
     (' '(sa as message))
       { BROADCAST (message) }
| "ADDBOT"
     (' '(wa as battleID))
     (' '(wa as name))
     (' '(wa as owner))
     (' '(wa as battleStatus))
     (' '(wa as teamColor))
     (' '(sa as ai_dll))
       { ADDBOT (battleID, name, owner, battleStatus, teamColor, ai_dll) }
| "REMOVEBOT"
     (' '(wa as battleID))
     (' '(wa as name))
       { REMOVEBOT (battleID, name) }
| "UPDATEBOT"
     (' '(wa as battleID))
     (' '(wa as name))
     (' '(wa as battleStatus))
     (' '(wa as teamColor))
       { UPDATEBOT (battleID, name, battleStatus, teamColor) }
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
| "TESTLOGINACCEPT"
       { TESTLOGINACCEPT }
| "TESTLOGINDENY"
       { TESTLOGINDENY }
| "ACQUIREUSERID"
       { ACQUIREUSERID }
| "FORCEJOINBATTLE"
     (' '(wa as destinationBattleID))
     (' '(wa as destinationBattlePassword))?
       { FORCEJOINBATTLE (destinationBattleID, destinationBattlePassword) }
| "FORCEJOINBATTLEFAILED"
     (' '(wa as userName))
     (' '(sa as reason))?
       { FORCEJOINBATTLEFAILED (userName, reason) }
| "COMPFLAGS"
     ((' 'wa)?+ as compFlags)
       { COMPFLAGS (BatString.nsplit compFlags " ") }
| "CONNECTUSER"
     (' '(wa as ipAndPort))
     (' '(wa as scriptPassword))?
       { CONNECTUSER (ipAndPort, scriptPassword) }
| "CONNECTUSERFAILED"
     (' '(wa as userName))
     (' '(sa as reason))?
       { CONNECTUSERFAILED (userName, reason) }
| "SAIDDATA"
     (' '(wa as chanName))
     (' '(wa as userName))
     (' '(sa as message))
       { SAIDDATA (chanName, userName, message) }
| "SAYDATAPRIVATE"
     (' '(wa as userName))
     (' '(sa as message))
       { SAYDATAPRIVATE (userName, message) }
| "SAIDDATAPRIVATE"
     (' '(wa as userName))
     (' '(sa as message))
       { SAIDDATAPRIVATE (userName, message) }
| "SAIDDATABATTLE"
     (' '(wa as userName))
     (' '(sa as message))
       { SAIDDATABATTLE (userName, message) }


{
  let name_of_command = function
    | PONG _ -> "PONG"
    | TASServer _ -> "TASServer"
    | REGISTRATIONDENIED _ -> "REGISTRATIONDENIED"
    | REGISTRATIONACCEPTED _ -> "REGISTRATIONACCEPTED"
    | ACCEPTED _ -> "ACCEPTED"
    | DENIED _ -> "DENIED"
    | LOGININFOEND _ -> "LOGININFOEND"
    | AGREEMENT _ -> "AGREEMENT"
    | AGREEMENTEND _ -> "AGREEMENTEND"
    | MOTD _ -> "MOTD"
    | OFFERFILE _ -> "OFFERFILE"
    | UDPSOURCEPORT _ -> "UDPSOURCEPORT"
    | CLIENTIPPORT _ -> "CLIENTIPPORT"
    | HOSTPORT _ -> "HOSTPORT"
    | SERVERMSG _ -> "SERVERMSG"
    | SERVERMSGBOX _ -> "SERVERMSGBOX"
    | ADDUSER _ -> "ADDUSER"
    | REMOVEUSER _ -> "REMOVEUSER"
    | JOIN _ -> "JOIN"
    | JOINFAILED _ -> "JOINFAILED"
    | CHANNEL _ -> "CHANNEL"
    | ENDOFCHANNELS _ -> "ENDOFCHANNELS"
    | MUTELISTBEGIN _ -> "MUTELISTBEGIN"
    | MUTELIST _ -> "MUTELIST"
    | MUTELISTEND _ -> "MUTELISTEND"
    | CHANNELTOPIC _ -> "CHANNELTOPIC"
    | CLIENTS _ -> "CLIENTS"
    | JOINED _ -> "JOINED"
    | LEFT _ -> "LEFT"
    | FORCELEAVECHANNEL _ -> "FORCELEAVECHANNEL"
    | CHANNELMESSAGE _ -> "CHANNELMESSAGE"
    | SAID _ -> "SAID"
    | SAIDEX _ -> "SAIDEX"
    | SAYPRIVATE _ -> "SAYPRIVATE"
    | SAIDPRIVATE _ -> "SAIDPRIVATE"
    | OPENBATTLE _ -> "OPENBATTLE"
    | BATTLEOPENED _ -> "BATTLEOPENED"
    | BATTLEOPENEDEX _ -> "BATTLEOPENEDEX"
    | BATTLECLOSED _ -> "BATTLECLOSED"
    | JOINBATTLE _ -> "JOINBATTLE"
    | JOINBATTLEREQUEST _ -> "JOINBATTLEREQUEST"
    | JOINEDBATTLE _ -> "JOINEDBATTLE"
    | LEFTBATTLE _ -> "LEFTBATTLE"
    | JOINBATTLEFAILED _ -> "JOINBATTLEFAILED"
    | OPENBATTLEFAILED _ -> "OPENBATTLEFAILED"
    | UPDATEBATTLEINFO _ -> "UPDATEBATTLEINFO"
    | SAIDBATTLE _ -> "SAIDBATTLE"
    | SAIDBATTLEEX _ -> "SAIDBATTLEEX"
    | CLIENTSTATUS _ -> "CLIENTSTATUS"
    | CLIENTBATTLESTATUS _ -> "CLIENTBATTLESTATUS"
    | REQUESTBATTLESTATUS _ -> "REQUESTBATTLESTATUS"
    | FORCEQUITBATTLE _ -> "FORCEQUITBATTLE"
    | DISABLEUNITS _ -> "DISABLEUNITS"
    | ENABLEUNITS _ -> "ENABLEUNITS"
    | ENABLEALLUNITS _ -> "ENABLEALLUNITS"
    | RING _ -> "RING"
    | REDIRECT _ -> "REDIRECT"
    | BROADCAST _ -> "BROADCAST"
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
    | TESTLOGINACCEPT _ -> "TESTLOGINACCEPT"
    | TESTLOGINDENY _ -> "TESTLOGINDENY"
    | ACQUIREUSERID _ -> "ACQUIREUSERID"
    | FORCEJOINBATTLE _ -> "FORCEJOINBATTLE"
    | FORCEJOINBATTLEFAILED _ -> "FORCEJOINBATTLEFAILED"
    | COMPFLAGS _ -> "COMPFLAGS"
    | CONNECTUSER _ -> "CONNECTUSER"
    | CONNECTUSERFAILED _ -> "CONNECTUSERFAILED"
    | SAIDDATA _ -> "SAIDDATA"
    | SAYDATAPRIVATE _ -> "SAYDATAPRIVATE"
    | SAIDDATAPRIVATE _ -> "SAIDDATAPRIVATE"
    | SAIDDATABATTLE _ -> "SAIDDATABATTLE"


  let add_arguments buf = function
    | PONG
    | REGISTRATIONACCEPTED
    | LOGININFOEND
    | AGREEMENTEND
    | ENDOFCHANNELS
    | MUTELISTEND
    | REQUESTBATTLESTATUS
    | FORCEQUITBATTLE
    | ENABLEALLUNITS
    | SCRIPTSTART
    | SCRIPTEND
    | TESTLOGINACCEPT
    | TESTLOGINDENY
    | ACQUIREUSERID -> ()

    | TASServer (protocolVersion, springVersion, udpPort, serverMode) ->
        (Proto.add_word buf) protocolVersion;
        (Proto.add_word buf) springVersion;
        (Proto.add_word buf) udpPort;
        (Proto.add_word buf) serverMode;

    | REGISTRATIONDENIED (reason) ->
        (Proto.add_word buf) reason;

    | ACCEPTED (userName) ->
        (Proto.add_word buf) userName;

    | DENIED (reason) ->
        (Proto.add_word buf) reason;

    | AGREEMENT (agreement) ->
        (Proto.add_word buf) agreement;

    | MOTD (message) ->
        (Proto.add_word buf) message;

    | OFFERFILE (options, fileName, url, description) ->
        (Proto.add_word buf) options;
        (Proto.add_word buf) fileName;
        (Proto.add_sentence buf) url;
        (Proto.add_sentence buf) description;

    | UDPSOURCEPORT (port) ->
        (Proto.add_word buf) port;

    | CLIENTIPPORT (userName, ip, port) ->
        (Proto.add_word buf) userName;
        (Proto.add_word buf) ip;
        (Proto.add_word buf) port;

    | HOSTPORT (port) ->
        (Proto.add_word buf) port;

    | SERVERMSG (message) ->
        (Proto.add_word buf) message;

    | SERVERMSGBOX (message, url) ->
        (Proto.add_word buf) message;
        BatOption.may (Proto.add_sentence buf) url;

    | ADDUSER (userName, country, cpu, accountID) ->
        (Proto.add_word buf) userName;
        (Proto.add_word buf) country;
        (Proto.add_word buf) cpu;
        BatOption.may (Proto.add_word buf) accountID;

    | REMOVEUSER (userName) ->
        (Proto.add_word buf) userName;

    | JOIN (chanName) ->
        (Proto.add_word buf) chanName;

    | JOINFAILED (chanName, reason) ->
        (Proto.add_word buf) chanName;
        (Proto.add_word buf) reason;

    | CHANNEL (chanName, userCount, topic) ->
        (Proto.add_word buf) chanName;
        (Proto.add_word buf) userCount;
        BatOption.may (Proto.add_word buf) topic;

    | MUTELISTBEGIN (chanName) ->
        (Proto.add_word buf) chanName;

    | MUTELIST (mute_description) ->
        (Proto.add_word buf) mute_description;

    | CHANNELTOPIC (chanName, author, changedTime, topic) ->
        (Proto.add_word buf) chanName;
        (Proto.add_word buf) author;
        (Proto.add_word buf) changedTime;
        (Proto.add_word buf) topic;

    | CLIENTS (chanName, clients) ->
        (Proto.add_word buf) chanName;
        (Proto.add_word buf) clients;

    | JOINED (chanName, userName) ->
        (Proto.add_word buf) chanName;
        (Proto.add_word buf) userName;

    | LEFT (chanName, userName, reason) ->
        (Proto.add_word buf) chanName;
        (Proto.add_word buf) userName;
        BatOption.may (Proto.add_word buf) reason;

    | FORCELEAVECHANNEL (chanName, userName, reason) ->
        (Proto.add_word buf) chanName;
        (Proto.add_word buf) userName;
        BatOption.may (Proto.add_word buf) reason;

    | CHANNELMESSAGE (chanName, message) ->
        (Proto.add_word buf) chanName;
        (Proto.add_word buf) message;

    | SAID (chanName, userName, message) ->
        (Proto.add_word buf) chanName;
        (Proto.add_word buf) userName;
        (Proto.add_word buf) message;

    | SAIDEX (chanName, userName, message) ->
        (Proto.add_word buf) chanName;
        (Proto.add_word buf) userName;
        (Proto.add_word buf) message;

    | SAYPRIVATE (userName, message) ->
        (Proto.add_word buf) userName;
        (Proto.add_word buf) message;

    | SAIDPRIVATE (userName, message) ->
        (Proto.add_word buf) userName;
        (Proto.add_word buf) message;

    | OPENBATTLE (battleID) ->
        (Proto.add_word buf) battleID;

    | BATTLEOPENED (battleID, type_, natType, founder, ip, port, maxPlayers, passworded, rank, mapHash, map, title, modName) ->
        (Proto.add_word buf) battleID;
        (Proto.add_word buf) type_;
        (Proto.add_word buf) natType;
        (Proto.add_word buf) founder;
        (Proto.add_word buf) ip;
        (Proto.add_word buf) port;
        (Proto.add_word buf) maxPlayers;
        (Proto.add_word buf) passworded;
        (Proto.add_word buf) rank;
        (Proto.add_word buf) mapHash;
        (Proto.add_word buf) map;
        (Proto.add_sentence buf) title;
        (Proto.add_sentence buf) modName;

    | BATTLEOPENEDEX (battleID, type_, natType, founder, ip, port, maxPlayers, passworded, rank, mapHash, engineName, engineVersion, map, title, modName) ->
        (Proto.add_word buf) battleID;
        (Proto.add_word buf) type_;
        (Proto.add_word buf) natType;
        (Proto.add_word buf) founder;
        (Proto.add_word buf) ip;
        (Proto.add_word buf) port;
        (Proto.add_word buf) maxPlayers;
        (Proto.add_word buf) passworded;
        (Proto.add_word buf) rank;
        (Proto.add_word buf) mapHash;
        (Proto.add_word buf) engineName;
        (Proto.add_word buf) engineVersion;
        (Proto.add_word buf) map;
        (Proto.add_sentence buf) title;
        (Proto.add_sentence buf) modName;

    | BATTLECLOSED (battleID) ->
        (Proto.add_word buf) battleID;

    | JOINBATTLE (battleID, hashCode) ->
        (Proto.add_word buf) battleID;
        (Proto.add_word buf) hashCode;

    | JOINBATTLEREQUEST (userName, ip) ->
        (Proto.add_word buf) userName;
        (Proto.add_word buf) ip;

    | JOINEDBATTLE (battleID, userName, scriptPassword) ->
        (Proto.add_word buf) battleID;
        (Proto.add_word buf) userName;
        BatOption.may (Proto.add_word buf) scriptPassword;

    | LEFTBATTLE (battleID, userName) ->
        (Proto.add_word buf) battleID;
        (Proto.add_word buf) userName;

    | JOINBATTLEFAILED (reason) ->
        (Proto.add_word buf) reason;

    | OPENBATTLEFAILED (reason) ->
        (Proto.add_word buf) reason;

    | UPDATEBATTLEINFO (battleID, spectatorCount, locked, mapHash, mapName) ->
        (Proto.add_word buf) battleID;
        (Proto.add_word buf) spectatorCount;
        (Proto.add_word buf) locked;
        (Proto.add_word buf) mapHash;
        (Proto.add_word buf) mapName;

    | SAIDBATTLE (userName, message) ->
        (Proto.add_word buf) userName;
        (Proto.add_word buf) message;

    | SAIDBATTLEEX (userName, message) ->
        (Proto.add_word buf) userName;
        (Proto.add_word buf) message;

    | CLIENTSTATUS (userName, status) ->
        (Proto.add_word buf) userName;
        (Proto.add_word buf) status;

    | CLIENTBATTLESTATUS (userName, battleStatus, teamColor) ->
        (Proto.add_word buf) userName;
        (Proto.add_word buf) battleStatus;
        (Proto.add_word buf) teamColor;

    | DISABLEUNITS (unitNames) ->
        List.iter (Proto.add_word buf) unitNames

    | ENABLEUNITS (unitNames) ->
        List.iter (Proto.add_word buf) unitNames

    | RING (userName) ->
        (Proto.add_word buf) userName;

    | REDIRECT (ip) ->
        (Proto.add_word buf) ip;

    | BROADCAST (message) ->
        (Proto.add_word buf) message;

    | ADDBOT (battleID, name, owner, battleStatus, teamColor, ai_dll) ->
        (Proto.add_word buf) battleID;
        (Proto.add_word buf) name;
        (Proto.add_word buf) owner;
        (Proto.add_word buf) battleStatus;
        (Proto.add_word buf) teamColor;
        (Proto.add_word buf) ai_dll;

    | REMOVEBOT (battleID, name) ->
        (Proto.add_word buf) battleID;
        (Proto.add_word buf) name;

    | UPDATEBOT (battleID, name, battleStatus, teamColor) ->
        (Proto.add_word buf) battleID;
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

    | FORCEJOINBATTLE (destinationBattleID, destinationBattlePassword) ->
        (Proto.add_word buf) destinationBattleID;
        BatOption.may (Proto.add_word buf) destinationBattlePassword;

    | FORCEJOINBATTLEFAILED (userName, reason) ->
        (Proto.add_word buf) userName;
        BatOption.may (Proto.add_word buf) reason;

    | COMPFLAGS (compFlags) ->
        List.iter (Proto.add_word buf) compFlags

    | CONNECTUSER (ipAndPort, scriptPassword) ->
        (Proto.add_word buf) ipAndPort;
        BatOption.may (Proto.add_word buf) scriptPassword;

    | CONNECTUSERFAILED (userName, reason) ->
        (Proto.add_word buf) userName;
        BatOption.may (Proto.add_word buf) reason;

    | SAIDDATA (chanName, userName, message) ->
        (Proto.add_word buf) chanName;
        (Proto.add_word buf) userName;
        (Proto.add_word buf) message;

    | SAYDATAPRIVATE (userName, message) ->
        (Proto.add_word buf) userName;
        (Proto.add_word buf) message;

    | SAIDDATAPRIVATE (userName, message) ->
        (Proto.add_word buf) userName;
        (Proto.add_word buf) message;

    | SAIDDATABATTLE (userName, message) ->
        (Proto.add_word buf) userName;
        (Proto.add_word buf) message;
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
