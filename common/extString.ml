include String

include Deriving_Show.Defaults(struct
  type a = t

  let format fmt value =
    Show.format<string> fmt value
end)
