let cmds = ProtoType.([
  { cmd = "PING"; kind = Client; args = []; };
  { cmd = "PONG"; kind = Server; args = []; };
  { cmd = "TASServer"; kind = Server; args = [
      { name = "protocolVersion"; optional = false; sentence = false; list = false; };
      { name = "springVersion"; optional = false; sentence = false; list = false; };
      { name = "udpPort"; optional = false; sentence = false; list = false; };
      { name = "serverMode"; optional = false; sentence = false; list = false; };
    ];
  };
  { cmd = "REQUESTUPDATEFILE"; kind = Client; args = [
      { name = "name and version"; optional = false; sentence = true; list = false; };
    ];
  };
  { cmd = "REGISTER"; kind = Client; args = [
      { name = "userName"; optional = false; sentence = false; list = false; };
      { name = "password"; optional = false; sentence = false; list = false; };
      { name = "email"; optional = true; sentence = false; list = false; };
    ];
  };
  { cmd = "REGISTRATIONDENIED"; kind = Server; args = [
      { name = "reason"; optional = false; sentence = true; list = false; };
    ];
  };
  { cmd = "REGISTRATIONACCEPTED"; kind = Server; args = []; };
  { cmd = "RENAMEACCOUNT"; kind = Client; args = [
      { name = "newUsername"; optional = false; sentence = false; list = false; };
    ];
  };
  { cmd = "CHANGEPASSWORD"; kind = Client; args = [
      { name = "oldPassword"; optional = false; sentence = false; list = false; };
      { name = "newPassword"; optional = false; sentence = false; list = false; };
    ];
  };
  { cmd = "CHANGEEMAIL"; kind = Client; args = [
      { name = "newEmail"; optional = false; sentence = false; list = false; };
      { name = "userName"; optional = true; sentence = false; list = false; };
    ];
  };
  { cmd = "LOGIN"; kind = Client; args = [
      { name = "userName"; optional = false; sentence = false; list = false; };
      { name = "password"; optional = false; sentence = false; list = false; };
      { name = "cpu"; optional = false; sentence = false; list = false; };
      { name = "localIP"; optional = false; sentence = false; list = false; };
      { name = "lobby name and version"; optional = false; sentence = true; list = false; };
      { name = "userID"; optional = true; sentence = true; list = false; };
      { name = "compFlags"; optional = true; sentence = true; list = false; };
    ];
  };
  { cmd = "ACCEPTED"; kind = Server; args = [
      { name = "userName"; optional = false; sentence = false; list = false; };
    ];
  };
  { cmd = "DENIED"; kind = Server; args = [
      { name = "reason"; optional = false; sentence = true; list = false; };
    ];
  };
  { cmd = "EXIT"; kind = Client; args = [
      { name = "reason"; optional = true; sentence = true; list = false; };
    ];
  };
  { cmd = "LOGININFOEND"; kind = Server; args = []; };
  { cmd = "AGREEMENT"; kind = Server; args = [
      { name = "agreement"; optional = false; sentence = true; list = false; };
    ];
  };
  { cmd = "AGREEMENTEND"; kind = Server; args = []; };
  { cmd = "CONFIRMAGREEMENT"; kind = Client; args = []; };
  { cmd = "MOTD"; kind = Server; args = [
      { name = "message"; optional = false; sentence = true; list = false; };
    ];
  };
  { cmd = "OFFERFILE"; kind = Server; args = [
      { name = "options"; optional = false; sentence = false; list = false; };
      { name = "fileName"; optional = false; sentence = true; list = false; };
      { name = "url"; optional = false; sentence = true; list = false; };
      { name = "description"; optional = false; sentence = true; list = false; };
    ];
  };
  { cmd = "UDPSOURCEPORT"; kind = Server; args = [
      { name = "port"; optional = false; sentence = false; list = false; };
    ];
  };
  { cmd = "CLIENTIPPORT"; kind = Server; args = [
      { name = "userName"; optional = false; sentence = false; list = false; };
      { name = "ip"; optional = false; sentence = false; list = false; };
      { name = "port"; optional = false; sentence = false; list = false; };
    ];
  };
  { cmd = "HOSTPORT"; kind = Server; args = [
      { name = "port"; optional = false; sentence = false; list = false; };
    ];
  };
  { cmd = "SERVERMSG"; kind = Server; args = [
      { name = "message"; optional = false; sentence = true; list = false; };
    ];
  };
  { cmd = "SERVERMSGBOX"; kind = Server; args = [
      { name = "message"; optional = false; sentence = true; list = false; };
      { name = "url"; optional = true; sentence = true; list = false; };
    ];
  };
  { cmd = "ADDUSER"; kind = Server; args = [
      { name = "userName"; optional = false; sentence = false; list = false; };
      { name = "country"; optional = false; sentence = false; list = false; };
      { name = "cpu"; optional = false; sentence = false; list = false; };
      { name = "accountID"; optional = true; sentence = false; list = false; };
    ];
  };
  { cmd = "REMOVEUSER"; kind = Server; args = [
      { name = "userName"; optional = false; sentence = false; list = false; };
    ];
  };
  { cmd = "JOIN"; kind = Client; args = [
      { name = "chanName"; optional = false; sentence = false; list = false; };
      { name = "key"; optional = true; sentence = false; list = false; };
    ];
  };
  { cmd = "JOIN"; kind = Server; args = [
      { name = "chanName"; optional = false; sentence = false; list = false; };
    ];
  };
  { cmd = "JOINFAILED"; kind = Server; args = [
      { name = "chanName"; optional = false; sentence = false; list = false; };
      { name = "reason"; optional = false; sentence = true; list = false; };
    ];
  };
  { cmd = "CHANNELS"; kind = Client; args = []; };
  { cmd = "CHANNEL"; kind = Server; args = [
      { name = "chanName"; optional = false; sentence = false; list = false; };
      { name = "userCount"; optional = false; sentence = false; list = false; };
      { name = "topic"; optional = true; sentence = true; list = false; };
    ];
  };
  { cmd = "ENDOFCHANNELS"; kind = Server; args = []; };
  { cmd = "MUTELIST"; kind = Client; args = [
      { name = "chanName"; optional = false; sentence = false; list = false; };
    ];
  };
  { cmd = "MUTELISTBEGIN"; kind = Server; args = [
      { name = "chanName"; optional = false; sentence = false; list = false; };
    ];
  };
  { cmd = "MUTELIST"; kind = Server; args = [
      { name = "mute description"; optional = false; sentence = true; list = false; };
    ];
  };
  { cmd = "MUTELISTEND"; kind = Server; args = []; };
  { cmd = "CHANNELTOPIC"; kind = Server; args = [
      { name = "chanName"; optional = false; sentence = false; list = false; };
      { name = "author"; optional = false; sentence = false; list = false; };
      { name = "changedTime"; optional = false; sentence = false; list = false; };
      { name = "topic"; optional = false; sentence = true; list = false; };
    ];
  };
  { cmd = "CHANNELTOPIC"; kind = Client; args = [
      { name = "chanName"; optional = false; sentence = false; list = false; };
      { name = "topic"; optional = false; sentence = true; list = false; };
    ];
  };
  { cmd = "CLIENTS"; kind = Server; args = [
      { name = "chanName"; optional = false; sentence = false; list = false; };
      { name = "clients"; optional = false; sentence = true; list = false; };
    ];
  };
  { cmd = "JOINED"; kind = Server; args = [
      { name = "chanName"; optional = false; sentence = false; list = false; };
      { name = "userName"; optional = false; sentence = false; list = false; };
    ];
  };
  { cmd = "LEAVE"; kind = Client; args = [
      { name = "chanName"; optional = false; sentence = false; list = false; };
    ];
  };
  { cmd = "LEFT"; kind = Server; args = [
      { name = "chanName"; optional = false; sentence = false; list = false; };
      { name = "userName"; optional = false; sentence = false; list = false; };
      { name = "reason"; optional = true; sentence = true; list = false; };
    ];
  };
  { cmd = "FORCELEAVECHANNEL"; kind = Client; args = [
      { name = "chanName"; optional = false; sentence = false; list = false; };
      { name = "userName"; optional = false; sentence = false; list = false; };
      { name = "reason"; optional = true; sentence = true; list = false; };
    ];
  };
  { cmd = "FORCELEAVECHANNEL"; kind = Server; args = [
      { name = "chanName"; optional = false; sentence = false; list = false; };
      { name = "userName"; optional = false; sentence = false; list = false; };
      { name = "reason"; optional = true; sentence = true; list = false; };
    ];
  };
  { cmd = "CHANNELMESSAGE"; kind = Server; args = [
      { name = "chanName"; optional = false; sentence = false; list = false; };
      { name = "message"; optional = false; sentence = false; list = false; };
    ];
  };
  { cmd = "SAY"; kind = Client; args = [
      { name = "chanName"; optional = false; sentence = false; list = false; };
      { name = "message"; optional = false; sentence = true; list = false; };
    ];
  };
  { cmd = "SAID"; kind = Server; args = [
      { name = "chanName"; optional = false; sentence = false; list = false; };
      { name = "userName"; optional = false; sentence = false; list = false; };
      { name = "message"; optional = false; sentence = true; list = false; };
    ];
  };
  { cmd = "SAYEX"; kind = Client; args = [
      { name = "chanName"; optional = false; sentence = false; list = false; };
      { name = "message"; optional = false; sentence = true; list = false; };
    ];
  };
  { cmd = "SAIDEX"; kind = Server; args = [
      { name = "chanName"; optional = false; sentence = false; list = false; };
      { name = "userName"; optional = false; sentence = false; list = false; };
      { name = "message"; optional = false; sentence = true; list = false; };
    ];
  };
  { cmd = "SAYPRIVATE"; kind = Client; args = [
      { name = "userName"; optional = false; sentence = false; list = false; };
      { name = "message"; optional = false; sentence = true; list = false; };
    ];
  };
  { cmd = "SAYPRIVATE"; kind = Server; args = [
      { name = "userName"; optional = false; sentence = false; list = false; };
      { name = "message"; optional = false; sentence = true; list = false; };
    ];
  };
  { cmd = "SAIDPRIVATE"; kind = Server; args = [
      { name = "userName"; optional = false; sentence = false; list = false; };
      { name = "message"; optional = false; sentence = true; list = false; };
    ];
  };
  { cmd = "OPENBATTLE"; kind = Client; args = [
      { name = "type"; optional = false; sentence = false; list = false; };
      { name = "natType"; optional = false; sentence = false; list = false; };
      { name = "password"; optional = false; sentence = false; list = false; };
      { name = "port"; optional = false; sentence = false; list = false; };
      { name = "maxPlayers"; optional = false; sentence = false; list = false; };
      { name = "hashCode"; optional = false; sentence = false; list = false; };
      { name = "rank"; optional = false; sentence = false; list = false; };
      { name = "mapHash"; optional = false; sentence = false; list = false; };
      { name = "map"; optional = false; sentence = true; list = false; };
      { name = "title"; optional = false; sentence = true; list = false; };
      { name = "modName"; optional = false; sentence = true; list = false; };
    ];
  };
  { cmd = "OPENBATTLEEX"; kind = Client; args = [
      { name = "type"; optional = false; sentence = false; list = false; };
      { name = "natType"; optional = false; sentence = false; list = false; };
      { name = "password"; optional = false; sentence = false; list = false; };
      { name = "port"; optional = false; sentence = false; list = false; };
      { name = "maxPlayers"; optional = false; sentence = false; list = false; };
      { name = "hashCode"; optional = false; sentence = false; list = false; };
      { name = "rank"; optional = false; sentence = false; list = false; };
      { name = "mapHash"; optional = false; sentence = false; list = false; };
      { name = "engineName"; optional = false; sentence = true; list = false; };
      { name = "engineVersion"; optional = false; sentence = true; list = false; };
      { name = "map"; optional = false; sentence = true; list = false; };
      { name = "title"; optional = false; sentence = true; list = false; };
      { name = "modName"; optional = false; sentence = true; list = false; };
    ];
  };
  { cmd = "OPENBATTLE"; kind = Server; args = [
      { name = "battleID"; optional = false; sentence = false; list = false; };
    ];
  };
  { cmd = "BATTLEOPENED"; kind = Server; args = [
      { name = "battleID"; optional = false; sentence = false; list = false; };
      { name = "type"; optional = false; sentence = false; list = false; };
      { name = "natType"; optional = false; sentence = false; list = false; };
      { name = "founder"; optional = false; sentence = false; list = false; };
      { name = "ip"; optional = false; sentence = false; list = false; };
      { name = "port"; optional = false; sentence = false; list = false; };
      { name = "maxPlayers"; optional = false; sentence = false; list = false; };
      { name = "passworded"; optional = false; sentence = false; list = false; };
      { name = "rank"; optional = false; sentence = false; list = false; };
      { name = "mapHash"; optional = false; sentence = false; list = false; };
      { name = "map"; optional = false; sentence = true; list = false; };
      { name = "title"; optional = false; sentence = true; list = false; };
      { name = "modName"; optional = false; sentence = true; list = false; };
    ];
  };
  { cmd = "BATTLEOPENEDEX"; kind = Server; args = [
      { name = "battleID"; optional = false; sentence = false; list = false; };
      { name = "type"; optional = false; sentence = false; list = false; };
      { name = "natType"; optional = false; sentence = false; list = false; };
      { name = "founder"; optional = false; sentence = false; list = false; };
      { name = "ip"; optional = false; sentence = false; list = false; };
      { name = "port"; optional = false; sentence = false; list = false; };
      { name = "maxPlayers"; optional = false; sentence = false; list = false; };
      { name = "passworded"; optional = false; sentence = false; list = false; };
      { name = "rank"; optional = false; sentence = false; list = false; };
      { name = "mapHash"; optional = false; sentence = false; list = false; };
      { name = "engineName"; optional = false; sentence = false; list = false; };
      { name = "engineVersion"; optional = false; sentence = false; list = false; };
      { name = "map"; optional = false; sentence = true; list = false; };
      { name = "title"; optional = false; sentence = true; list = false; };
      { name = "modName"; optional = false; sentence = true; list = false; };
    ];
  };
  { cmd = "BATTLECLOSED"; kind = Server; args = [
      { name = "battleID"; optional = false; sentence = false; list = false; };
    ];
  };
  { cmd = "JOINBATTLE"; kind = Client; args = [
      { name = "battleID"; optional = false; sentence = false; list = false; };
      { name = "password"; optional = true; sentence = false; list = false; };
      { name = "scriptPassword"; optional = true; sentence = false; list = false; };
    ];
  };
  { cmd = "JOINBATTLE"; kind = Server; args = [
      { name = "battleID"; optional = false; sentence = false; list = false; };
      { name = "hashCode"; optional = false; sentence = false; list = false; };
    ];
  };
  { cmd = "JOINBATTLEREQUEST"; kind = Server; args = [
      { name = "userName"; optional = false; sentence = false; list = false; };
      { name = "ip"; optional = false; sentence = false; list = false; };
    ];
  };
  { cmd = "JOINBATTLEACCEPT"; kind = Client; args = [
      { name = "userName"; optional = false; sentence = false; list = false; };
    ];
  };
  { cmd = "JOINBATTLEDENY"; kind = Client; args = [
      { name = "userName"; optional = false; sentence = false; list = false; };
      { name = "reason"; optional = true; sentence = true; list = false; };
    ];
  };
  { cmd = "JOINEDBATTLE"; kind = Server; args = [
      { name = "battleID"; optional = false; sentence = false; list = false; };
      { name = "userName"; optional = false; sentence = false; list = false; };
      { name = "scriptPassword"; optional = true; sentence = false; list = false; };
    ];
  };
  { cmd = "LEFTBATTLE"; kind = Server; args = [
      { name = "battleID"; optional = false; sentence = false; list = false; };
      { name = "userName"; optional = false; sentence = false; list = false; };
    ];
  };
  { cmd = "LEAVEBATTLE"; kind = Client; args = []; };
  { cmd = "JOINBATTLEFAILED"; kind = Server; args = [
      { name = "reason"; optional = false; sentence = true; list = false; };
    ];
  };
  { cmd = "OPENBATTLEFAILED"; kind = Server; args = [
      { name = "reason"; optional = false; sentence = true; list = false; };
    ];
  };
  { cmd = "UPDATEBATTLEINFO"; kind = Server; args = [
      { name = "battleID"; optional = false; sentence = false; list = false; };
      { name = "spectatorCount"; optional = false; sentence = false; list = false; };
      { name = "locked"; optional = false; sentence = false; list = false; };
      { name = "mapHash"; optional = false; sentence = false; list = false; };
      { name = "mapName"; optional = false; sentence = true; list = false; };
    ];
  };
  { cmd = "UPDATEBATTLEINFO"; kind = Client; args = [
      { name = "spectatorCount"; optional = false; sentence = false; list = false; };
      { name = "locked"; optional = false; sentence = false; list = false; };
      { name = "mapHash"; optional = false; sentence = false; list = false; };
      { name = "mapName"; optional = false; sentence = true; list = false; };
    ];
  };
  { cmd = "SAYBATTLE"; kind = Client; args = [
      { name = "message"; optional = false; sentence = true; list = false; };
    ];
  };
  { cmd = "SAIDBATTLE"; kind = Server; args = [
      { name = "userName"; optional = false; sentence = false; list = false; };
      { name = "message"; optional = false; sentence = true; list = false; };
    ];
  };
  { cmd = "SAYBATTLEEX"; kind = Client; args = [
      { name = "message"; optional = false; sentence = true; list = false; };
    ];
  };
  { cmd = "SAIDBATTLEEX"; kind = Server; args = [
      { name = "userName"; optional = false; sentence = false; list = false; };
      { name = "message"; optional = false; sentence = true; list = false; };
    ];
  };
  { cmd = "MYSTATUS"; kind = Client; args = [
      { name = "status"; optional = false; sentence = false; list = false; };
    ];
  };
  { cmd = "CLIENTSTATUS"; kind = Server; args = [
      { name = "userName"; optional = false; sentence = false; list = false; };
      { name = "status"; optional = false; sentence = false; list = false; };
    ];
  };
  { cmd = "MYBATTLESTATUS"; kind = Client; args = [
      { name = "battleStatus"; optional = false; sentence = false; list = false; };
      { name = "myTeamColor"; optional = false; sentence = false; list = false; };
    ];
  };
  { cmd = "CLIENTBATTLESTATUS"; kind = Server; args = [
      { name = "userName"; optional = false; sentence = false; list = false; };
      { name = "battleStatus"; optional = false; sentence = false; list = false; };
      { name = "teamColor"; optional = false; sentence = false; list = false; };
    ];
  };
  { cmd = "REQUESTBATTLESTATUS"; kind = Server; args = []; };
  { cmd = "HANDICAP"; kind = Client; args = [
      { name = "userName"; optional = false; sentence = false; list = false; };
      { name = "value"; optional = false; sentence = false; list = false; };
    ];
  };
  { cmd = "KICKFROMBATTLE"; kind = Client; args = [
      { name = "userName"; optional = false; sentence = false; list = false; };
    ];
  };
  { cmd = "FORCEQUITBATTLE"; kind = Server; args = []; };
  { cmd = "FORCETEAMNO"; kind = Client; args = [
      { name = "userName"; optional = false; sentence = false; list = false; };
      { name = "teamNo"; optional = false; sentence = false; list = false; };
    ];
  };
  { cmd = "FORCEALLYNO"; kind = Client; args = [
      { name = "userName"; optional = false; sentence = false; list = false; };
      { name = "teamNo"; optional = false; sentence = false; list = false; };
    ];
  };
  { cmd = "FORCETEAMCOLOR"; kind = Client; args = [
      { name = "userName"; optional = false; sentence = false; list = false; };
      { name = "color"; optional = false; sentence = false; list = false; };
    ];
  };
  { cmd = "FORCESPECTATORMODE"; kind = Client; args = [
      { name = "userName"; optional = false; sentence = false; list = false; };
    ];
  };
  { cmd = "DISABLEUNITS"; kind = Client; args = [
      { name = "unitNames"; optional = false; sentence = false; list = true; };
    ];
  };
  { cmd = "DISABLEUNITS"; kind = Server; args = [
      { name = "unitNames"; optional = false; sentence = false; list = true; };
    ];
  };
  { cmd = "ENABLEUNITS"; kind = Client; args = [
      { name = "unitNames"; optional = false; sentence = false; list = true; };
    ];
  };
  { cmd = "ENABLEUNITS"; kind = Server; args = [
      { name = "unitNames"; optional = false; sentence = false; list = true; };
    ];
  };
  { cmd = "ENABLEALLUNITS"; kind = Client; args = []; };
  { cmd = "ENABLEALLUNITS"; kind = Server; args = []; };
  { cmd = "RING"; kind = Client; args = [
      { name = "userName"; optional = false; sentence = false; list = false; };
    ];
  };
  { cmd = "RING"; kind = Server; args = [
      { name = "userName"; optional = false; sentence = false; list = false; };
    ];
  };
  { cmd = "REDIRECT"; kind = Server; args = [
      { name = "ip"; optional = false; sentence = false; list = false; };
    ];
  };
  { cmd = "BROADCAST"; kind = Server; args = [
      { name = "message"; optional = false; sentence = true; list = false; };
    ];
  };
  { cmd = "ADDBOT"; kind = Client; args = [
      { name = "name"; optional = false; sentence = false; list = false; };
      { name = "battleStatus"; optional = false; sentence = false; list = false; };
      { name = "teamColor"; optional = false; sentence = false; list = false; };
      { name = "ai dll"; optional = false; sentence = true; list = false; };
    ];
  };
  { cmd = "ADDBOT"; kind = Server; args = [
      { name = "battleID"; optional = false; sentence = false; list = false; };
      { name = "name"; optional = false; sentence = false; list = false; };
      { name = "owner"; optional = false; sentence = false; list = false; };
      { name = "battleStatus"; optional = false; sentence = false; list = false; };
      { name = "teamColor"; optional = false; sentence = false; list = false; };
      { name = "ai dll"; optional = false; sentence = true; list = false; };
    ];
  };
  { cmd = "REMOVEBOT"; kind = Client; args = [
      { name = "name"; optional = false; sentence = false; list = false; };
    ];
  };
  { cmd = "REMOVEBOT"; kind = Server; args = [
      { name = "battleID"; optional = false; sentence = false; list = false; };
      { name = "name"; optional = false; sentence = false; list = false; };
    ];
  };
  { cmd = "UPDATEBOT"; kind = Client; args = [
      { name = "name"; optional = false; sentence = false; list = false; };
      { name = "battleStatus"; optional = false; sentence = false; list = false; };
      { name = "teamColor"; optional = false; sentence = false; list = false; };
    ];
  };
  { cmd = "UPDATEBOT"; kind = Server; args = [
      { name = "battleID"; optional = false; sentence = false; list = false; };
      { name = "name"; optional = false; sentence = false; list = false; };
      { name = "battleStatus"; optional = false; sentence = false; list = false; };
      { name = "teamColor"; optional = false; sentence = false; list = false; };
    ];
  };
  { cmd = "ADDSTARTRECT"; kind = Client; args = [
      { name = "allyNo"; optional = false; sentence = false; list = false; };
      { name = "left"; optional = false; sentence = false; list = false; };
      { name = "top"; optional = false; sentence = false; list = false; };
      { name = "right"; optional = false; sentence = false; list = false; };
      { name = "bottom"; optional = false; sentence = false; list = false; };
    ];
  };
  { cmd = "ADDSTARTRECT"; kind = Server; args = [
      { name = "allyNo"; optional = false; sentence = false; list = false; };
      { name = "left"; optional = false; sentence = false; list = false; };
      { name = "top"; optional = false; sentence = false; list = false; };
      { name = "right"; optional = false; sentence = false; list = false; };
      { name = "bottom"; optional = false; sentence = false; list = false; };
    ];
  };
  { cmd = "REMOVESTARTRECT"; kind = Client; args = [
      { name = "allyNo"; optional = false; sentence = false; list = false; };
    ];
  };
  { cmd = "REMOVESTARTRECT"; kind = Server; args = [
      { name = "allyNo"; optional = false; sentence = false; list = false; };
    ];
  };
  { cmd = "SCRIPTSTART"; kind = Client; args = []; };
  { cmd = "SCRIPTSTART"; kind = Server; args = []; };
  { cmd = "SCRIPT"; kind = Client; args = [
      { name = "line"; optional = false; sentence = true; list = false; };
    ];
  };
  { cmd = "SCRIPT"; kind = Server; args = [
      { name = "line"; optional = false; sentence = true; list = false; };
    ];
  };
  { cmd = "SCRIPTEND"; kind = Client; args = []; };
  { cmd = "SCRIPTEND"; kind = Server; args = []; };
  { cmd = "SETSCRIPTTAGS"; kind = Client; args = [
      { name = "pairs"; optional = false; sentence = true; list = true; };
    ];
  };
  { cmd = "SETSCRIPTTAGS"; kind = Server; args = [
      { name = "pairs"; optional = false; sentence = true; list = true; };
    ];
  };
  { cmd = "REMOVESCRIPTTAGS"; kind = Client; args = [
      { name = "keys"; optional = false; sentence = false; list = true; };
    ];
  };
  { cmd = "REMOVESCRIPTTAGS"; kind = Server; args = [
      { name = "keys"; optional = false; sentence = false; list = true; };
    ];
  };
  { cmd = "TESTLOGIN"; kind = Client; args = [
      { name = "userName"; optional = false; sentence = false; list = false; };
      { name = "password"; optional = false; sentence = false; list = false; };
    ];
  };
  { cmd = "TESTLOGINACCEPT"; kind = Server; args = []; };
  { cmd = "TESTLOGINDENY"; kind = Server; args = []; };
  { cmd = "ACQUIREUSERID"; kind = Server; args = []; };
  { cmd = "USERID"; kind = Client; args = [
      { name = "userID"; optional = false; sentence = false; list = false; };
    ];
  };
  { cmd = "GETINGAMETIME"; kind = Client; args = []; };
  { cmd = "FORCEJOINBATTLE"; kind = Client; args = [
      { name = "userName"; optional = false; sentence = false; list = false; };
      { name = "destinationBattleID"; optional = false; sentence = false; list = false; };
      { name = "destinationBattlePassword"; optional = true; sentence = false; list = false; };
    ];
  };
  { cmd = "FORCEJOINBATTLE"; kind = Server; args = [
      { name = "destinationBattleID"; optional = false; sentence = false; list = false; };
      { name = "destinationBattlePassword"; optional = true; sentence = false; list = false; };
    ];
  };
  { cmd = "FORCEJOINBATTLEFAILED"; kind = Server; args = [
      { name = "userName"; optional = false; sentence = false; list = false; };
      { name = "reason"; optional = true; sentence = true; list = false; };
    ];
  };
  { cmd = "LISTCOMPFLAGS"; kind = Client; args = []; };
  { cmd = "COMPFLAGS"; kind = Server; args = [
      { name = "compFlags"; optional = true; sentence = false; list = true; };
    ];
  };
  { cmd = "CONNECTUSER"; kind = Client; args = [
      { name = "userName"; optional = false; sentence = false; list = false; };
      { name = "ipAndPort"; optional = false; sentence = false; list = false; };
      { name = "scriptPassword"; optional = true; sentence = false; list = false; };
    ];
  };
  { cmd = "CONNECTUSER"; kind = Server; args = [
      { name = "ipAndPort"; optional = false; sentence = false; list = false; };
      { name = "scriptPassword"; optional = true; sentence = false; list = false; };
    ];
  };
  { cmd = "CONNECTUSERFAILED"; kind = Server; args = [
      { name = "userName"; optional = false; sentence = false; list = false; };
      { name = "reason"; optional = true; sentence = true; list = false; };
    ];
  };
  { cmd = "SAYDATA"; kind = Client; args = [
      { name = "chanName"; optional = false; sentence = false; list = false; };
      { name = "message"; optional = false; sentence = true; list = false; };
    ];
  };
  { cmd = "SAIDDATA"; kind = Server; args = [
      { name = "chanName"; optional = false; sentence = false; list = false; };
      { name = "userName"; optional = false; sentence = false; list = false; };
      { name = "message"; optional = false; sentence = true; list = false; };
    ];
  };
  { cmd = "SAYDATAPRIVATE"; kind = Client; args = [
      { name = "userName"; optional = false; sentence = false; list = false; };
      { name = "message"; optional = false; sentence = true; list = false; };
    ];
  };
  { cmd = "SAYDATAPRIVATE"; kind = Server; args = [
      { name = "userName"; optional = false; sentence = false; list = false; };
      { name = "message"; optional = false; sentence = true; list = false; };
    ];
  };
  { cmd = "SAIDDATAPRIVATE"; kind = Server; args = [
      { name = "userName"; optional = false; sentence = false; list = false; };
      { name = "message"; optional = false; sentence = true; list = false; };
    ];
  };
  { cmd = "SAYDATABATTLE"; kind = Client; args = [
      { name = "message"; optional = false; sentence = true; list = false; };
    ];
  };
  { cmd = "SAIDDATABATTLE"; kind = Server; args = [
      { name = "userName"; optional = false; sentence = false; list = false; };
      { name = "message"; optional = false; sentence = true; list = false; };
    ];
  };
  { cmd = "RECOVERACCOUNT"; kind = Client; args = [
      { name = "email"; optional = false; sentence = false; list = false; };
      { name = "userName"; optional = true; sentence = false; list = false; };
    ];
  };
])