module type ShowOrderedType = sig
  include Map.OrderedType
  include Deriving_Show.Show with type a = t
end

module Make(Ord : ShowOrderedType) = struct

  include Map.Make(Ord)

  module Show_key = Ord

  module Show_t(S : Deriving_Show.Show) = struct

    type value = S.a
    module Show_value = S

    let format fmt map =
      let list = bindings map in
      Show.format<(key * value) list> fmt list

  end

  let update key map modify =
    let value = modify (find key map) in
    add key value map

end
