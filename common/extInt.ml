include BatInt

include Deriving_Show.Defaults(struct
  type a = t

  let format fmt value =
    Show.format<int> fmt value
end)
