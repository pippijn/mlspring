module Make(Ord : ExtMap.ShowOrderedType) = struct

  include Set.Make(Ord)

  module Show_elt = Ord

  module Show_t = struct

    let format fmt set =
      let list = elements set in
      Show.format<elt list> fmt list

  end


end
