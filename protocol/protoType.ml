type direction =
  | Client
  | Server

type argument = {
  name     : string;
  optional : bool;
  sentence : bool;
  list     : bool;
}

type command = {
  cmd  : string;
  args : argument list;
  kind : direction;
}


type word = string deriving (Show)
type sentence = string deriving (Show)
