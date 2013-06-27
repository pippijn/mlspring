let (--) = BatPervasives.(--)
let (|>) = BatPervasives.(|>)


module Show_lazy_t(S : Deriving_Show.Show) = struct

  let format fmt value =
    if Lazy.lazy_is_val value then
      S.format fmt (Lazy.force value)
    else
      Show.format<string> fmt "<lazy>"

end


type info_value =
  | InfoString of string
  | InfoInteger of int
  | InfoFloat of float
  | InfoBool of bool
  deriving (Show)

type info = {
  info_key : string;
  info_desc : string;
  info_val : info_value;
} deriving (Show)

type bool_option = {
  bo_default : int;
} deriving (Show)

type list_item = {
  li_key : string;
  li_name : string;
  li_desc : string;
} deriving (Show)

type list_option = {
  lo_default : string;
  lo_items : list_item list;
} deriving (Show)

type number_option = {
  no_default : float;
  no_min : float;
  no_max : float;
  no_step : float;
} deriving (Show)

type string_option = {
  so_default : string;
  so_max_len : int;
} deriving (Show)

type option_type =
  | BoolOption of bool_option
  | ListOption of list_option
  | NumberOption of number_option
  | StringOption of string_option
  | Section
  deriving (Show)

type game_option = {
  o_key : string;
  o_scope : string;
  o_name : string;
  o_section : string;
  o_style : string;
  o_desc : string;
  o_option : option_type;
} deriving (Show)

type side = {
  side_name : string;
  side_start_unit : string;
} deriving (Show)

type game_unit = {
  unit_name : string;
  unit_fullname : string;
} deriving (Show)

type modification = {
  mod_checksum : int;
  mod_info : info list;
  mod_archives : string list;
  mod_sides : side list;
  mod_units : game_unit list;
  mod_options : game_option list;
} deriving (Show)

type skirmish_ai = {
  ai_info : info list;
  ai_options : game_option list;
} deriving (Show)

type position = {
  pos_x : float;
  pos_z : float;
} deriving (Show)

type resource = {
  res_name : string;
  res_max : float;
  res_radius : int;
} deriving (Show)

type map = {
  map_name : string;
  map_checksum : int;
  map_archives : string list;
  map_file : string;
  map_desc : string lazy_t;
  map_author : string lazy_t;
  map_width : int lazy_t;
  map_height : int lazy_t;
  map_tidal : int lazy_t;
  map_wind_min : int lazy_t;
  map_wind_max : int lazy_t;
  map_gravity : int lazy_t;
  map_resources : resource list lazy_t;
  map_positions : position list lazy_t;
  map_height_min : float lazy_t;
  map_height_max : float lazy_t;
  map_options : game_option list lazy_t;
} deriving (Show)

type spring = {
  spring_version : string;
  spring_patchset : string;
  is_release : bool;

  datadir : string;
  datadirs : string list;

  maps : map list;
  ais : skirmish_ai list;
  mods : modification list;
} deriving (Show)




type t = {
  apis : API.t StringMap.t;
}


let create path =
  let engine_path = path ^ "/engines" in
  let engines = Sys.readdir engine_path in

  let apis =
    Array.fold_left (fun apis engine ->
      let dll = engine_path ^ "/" ^ engine ^ "/libunitsync.so" in
      StringMap.add engine (API.load dll false) apis
    ) StringMap.empty engines
  in

  { apis }


let find_engine engine unitsync =
  StringMap.find engine unitsync.apis


let map_count count f =
  BatEnum.map f (0 -- (count - 1))
  |> BatList.of_enum


let sync_info api count =
  map_count count (fun i ->
    {
      info_key = API.getInfoKey api i;
      info_desc = API.getInfoDescription api i;
      info_val =
        match API.getInfoType api i with
        | "string" ->
            InfoString (API.getInfoValueString api i)
        | "integer" ->
            InfoInteger (API.getInfoValueInteger api i)
        | "float" ->
            InfoFloat (API.getInfoValueFloat api i)
        | "bool" ->
            InfoBool (API.getInfoValueBool api i)

        | s -> failwith s
    }
  )


let sync_options api count =
  map_count count (fun i ->
    {
      o_key = API.getOptionKey api i;
      o_scope = API.getOptionScope api i;
      o_name = API.getOptionName api i;
      o_section = API.getOptionSection api i;
      o_style = API.getOptionStyle api i;
      o_desc = API.getOptionDesc api i;

      o_option =
        match API.getOptionType api i with
        | 1 -> 
            BoolOption {
              bo_default = API.getOptionBoolDef api i;
            }
        | 2 -> 
            ListOption {
              lo_default = API.getOptionListDef api i;
              lo_items =
                map_count (API.getOptionListCount api i) (fun j ->
                  {
                    li_key  = API.getOptionListItemKey  api i j;
                    li_name = API.getOptionListItemName api i j;
                    li_desc = API.getOptionListItemDesc api i j;
                  }
                );
            }
        | 3 -> 
            NumberOption {
              no_default = API.getOptionNumberDef api i;
              no_min = API.getOptionNumberMin api i;
              no_max = API.getOptionNumberMax api i;
              no_step = API.getOptionNumberStep api i;
            }
        | 4 -> 
            StringOption {
              so_default = API.getOptionStringDef api i;
              so_max_len = API.getOptionStringMaxLen api i;
            }
        | 5 -> 
            Section
        | d -> failwith (string_of_int d)
    }
  )


let sync_maps api =
  map_count (API.getMapCount api) (fun i ->
    let map_name = API.getMapName api i in

    {
      map_name = map_name;
      map_checksum = API.getMapChecksum api i;

      map_archives =
        map_count (API.getMapArchiveCount api map_name) (fun j ->
          API.getMapArchiveName api j
        );

      map_file = API.getMapFileName api i;

      map_desc = lazy (API.getMapDescription api i);
      map_author = lazy (API.getMapAuthor api i);
      map_width = lazy (API.getMapWidth api i);
      map_height = lazy (API.getMapHeight api i);
      map_tidal = lazy (API.getMapTidalStrength api i);
      map_wind_min = lazy (API.getMapWindMin api i);
      map_wind_max = lazy (API.getMapWindMax api i);
      map_gravity = lazy (API.getMapGravity api i);

      map_resources =
        lazy (map_count (API.getMapResourceCount api i) (fun j ->
          {
            res_name = API.getMapResourceName api i j;
            res_max = API.getMapResourceMax api i j;
            res_radius = API.getMapResourceExtractorRadius api i j;
          }
        ));

      map_positions =
        lazy (map_count (API.getMapPosCount api i) (fun j ->
          {
            pos_x = API.getMapPosX api i j;
            pos_z = API.getMapPosZ api i j;
          }
        ));

      map_height_min = lazy (API.getMapMinHeight api map_name);
      map_height_max = lazy (API.getMapMaxHeight api map_name);

      map_options =
        lazy (sync_options api (API.getMapOptionCount api map_name));
    }
  )


let sync_ais api =
  map_count (API.getSkirmishAICount api) (fun i ->
    {
      ai_info = sync_info api (API.getSkirmishAIInfoCount api i);
      ai_options = sync_options api (API.getSkirmishAIOptionCount api i);
    }
  )


let sync_mods api =
  map_count (API.getPrimaryModCount api) (fun i ->
    let archive = API.getPrimaryModArchive api i in
    API.addAllArchives api archive;

    let rec process_units api =
      if API.processUnits api > 0 then
        process_units api
    in

    process_units api;

    let result = {
      mod_checksum = API.getPrimaryModChecksum api i;

      mod_info = sync_info api (API.getPrimaryModInfoCount api i);
      mod_archives =
        map_count (API.getPrimaryModArchiveCount api i) (fun i ->
          API.getPrimaryModArchiveList api i
        );

      mod_sides =
        map_count (API.getSideCount api) (fun i ->
          {
            side_name = API.getSideName api i;
            side_start_unit = API.getSideStartUnit api i;
          }
        );

      mod_units =
        map_count (API.getUnitCount api) (fun i ->
          {
            unit_name = API.getUnitName api i;
            unit_fullname = API.getFullUnitName api i;
          }
        );

      mod_options =
        sync_options api (API.getModOptionCount api);
    } in

    API.removeAllArchives api;

    result
  )


let sync engine unitsync =
  let api = find_engine engine unitsync in

  {
    spring_version = API.getSpringVersion api;
    spring_patchset = API.getSpringVersionPatchset api;
    is_release = API.isSpringReleaseVersion api;

    datadir = API.getWritableDataDirectory api;

    datadirs =
      map_count (API.getDataDirectoryCount api) (fun i ->
        API.getDataDirectory api i
      );

    mods = sync_mods api;
    ais = sync_ais api;
    maps = sync_maps api;
  }
