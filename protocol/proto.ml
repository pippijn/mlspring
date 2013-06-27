let add_sentence buf sentence =
  Buffer.add_char buf '\t';
  Buffer.add_string buf sentence

let add_word buf word =
  Buffer.add_char buf ' ';
  Buffer.add_string buf word
