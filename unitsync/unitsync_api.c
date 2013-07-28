#include <stdbool.h>

struct unitsync {
  void *lib;
  const char* (*GetNextError)();
  const char* (*GetSpringVersion)();
  const char* (*GetSpringVersionPatchset)();
  bool (*IsSpringReleaseVersion)();
  int (*Init)(bool isServer, int id);
  void (*UnInit)();
  const char* (*GetWritableDataDirectory)();
  int (*GetDataDirectoryCount)();
  const char* (*GetDataDirectory)(int index);
  int (*ProcessUnits)();
  int (*ProcessUnitsNoChecksum)();
  int (*GetUnitCount)();
  const char* (*GetUnitName)(int unit);
  const char* (*GetFullUnitName)(int unit);
  void (*AddArchive)(const char* archiveName);
  void (*AddAllArchives)(const char* rootArchiveName);
  void (*RemoveAllArchives)();
  unsigned int (*GetArchiveChecksum)(const char* archiveName);
  const char* (*GetArchivePath)(const char* archiveName);
  int (*GetMapCount)();
  const char* (*GetMapName)(int index);
  const char* (*GetMapFileName)(int index);
  const char* (*GetMapDescription)(int index);
  const char* (*GetMapAuthor)(int index);
  int (*GetMapWidth)(int index);
  int (*GetMapHeight)(int index);
  int (*GetMapTidalStrength)(int index);
  int (*GetMapWindMin)(int index);
  int (*GetMapWindMax)(int index);
  int (*GetMapGravity)(int index);
  int (*GetMapResourceCount)(int index);
  const char* (*GetMapResourceName)(int index, int resourceIndex);
  float (*GetMapResourceMax)(int index, int resourceIndex);
  int (*GetMapResourceExtractorRadius)(int index, int resourceIndex);
  int (*GetMapPosCount)(int index);
  float (*GetMapPosX)(int index, int posIndex);
  float (*GetMapPosZ)(int index, int posIndex);
  float (*GetMapMinHeight)(const char* mapName);
  float (*GetMapMaxHeight)(const char* mapName);
  int (*GetMapArchiveCount)(const char* mapName);
  const char* (*GetMapArchiveName)(int index);
  unsigned int (*GetMapChecksum)(int index);
  unsigned int (*GetMapChecksumFromName)(const char* mapName);
  int (*GetInfoMapSize)(const char* mapName, const char* name, int* width, int* height);
  int (*GetInfoMap)(const char* mapName, const char* name, unsigned char* data, int typeHint);
  int (*GetSkirmishAICount)();
  int (*GetSkirmishAIInfoCount)(int index);
  const char* (*GetInfoKey)(int index);
  const char* (*GetInfoType)(int index);
  const char* (*GetInfoValue)(int index);
  const char* (*GetInfoValueString)(int index);
  int (*GetInfoValueInteger)(int index);
  float (*GetInfoValueFloat)(int index);
  bool (*GetInfoValueBool)(int index);
  const char* (*GetInfoDescription)(int index);
  int (*GetSkirmishAIOptionCount)(int index);
  int (*GetPrimaryModCount)();
  int (*GetPrimaryModInfoCount)(int index);
  const char* (*GetPrimaryModName)(int index);
  const char* (*GetPrimaryModShortName)(int index);
  const char* (*GetPrimaryModVersion)(int index);
  const char* (*GetPrimaryModMutator)(int index);
  const char* (*GetPrimaryModGame)(int index);
  const char* (*GetPrimaryModShortGame)(int index);
  const char* (*GetPrimaryModDescription)(int index);
  const char* (*GetPrimaryModArchive)(int index);
  int (*GetPrimaryModArchiveCount)(int index);
  const char* (*GetPrimaryModArchiveList)(int archive);
  int (*GetPrimaryModIndex)(const char* name);
  unsigned int (*GetPrimaryModChecksum)(int index);
  unsigned int (*GetPrimaryModChecksumFromName)(const char* name);
  int (*GetSideCount)();
  const char* (*GetSideName)(int side);
  const char* (*GetSideStartUnit)(int side);
  int (*GetMapOptionCount)(const char* mapName);
  int (*GetModOptionCount)();
  int (*GetCustomOptionCount)(const char* fileName);
  const char* (*GetOptionKey)(int optIndex);
  const char* (*GetOptionScope)(int optIndex);
  const char* (*GetOptionName)(int optIndex);
  const char* (*GetOptionSection)(int optIndex);
  const char* (*GetOptionStyle)(int optIndex);
  const char* (*GetOptionDesc)(int optIndex);
  int (*GetOptionType)(int optIndex);
  int (*GetOptionBoolDef)(int optIndex);
  float (*GetOptionNumberDef)(int optIndex);
  float (*GetOptionNumberMin)(int optIndex);
  float (*GetOptionNumberMax)(int optIndex);
  float (*GetOptionNumberStep)(int optIndex);
  const char* (*GetOptionStringDef)(int optIndex);
  int (*GetOptionStringMaxLen)(int optIndex);
  int (*GetOptionListCount)(int optIndex);
  const char* (*GetOptionListDef)(int optIndex);
  const char* (*GetOptionListItemKey)(int optIndex, int itemIndex);
  const char* (*GetOptionListItemName)(int optIndex, int itemIndex);
  const char* (*GetOptionListItemDesc)(int optIndex, int itemIndex);
  int (*GetModValidMapCount)();
  const char* (*GetModValidMap)(int index);
  int (*OpenFileVFS)(const char* name);
  void (*CloseFileVFS)(int file);
  int (*ReadFileVFS)(int file, unsigned char* buf, int numBytes);
  int (*FileSizeVFS)(int file);
  int (*InitFindVFS)(const char* pattern);
  int (*InitDirListVFS)(const char* path, const char* pattern, const char* modes);
  int (*InitSubDirsVFS)(const char* path, const char* pattern, const char* modes);
  int (*FindFilesVFS)(int file, char* nameBuf, int size);
  int (*OpenArchive)(const char* name);
  int (*OpenArchiveType)(const char* name, const char* type);
  void (*CloseArchive)(int archive);
  int (*FindFilesArchive)(int archive, int file, char* nameBuf, int* size);
  int (*OpenArchiveFile)(int archive, const char* name);
  int (*ReadArchiveFile)(int archive, int file, unsigned char* buffer, int numBytes);
  void (*CloseArchiveFile)(int archive, int file);
  int (*SizeArchiveFile)(int archive, int file);
  void (*SetSpringConfigFile)(const char* fileNameAsAbsolutePath);
  const char* (*GetSpringConfigFile)();
  const char* (*GetSpringConfigString)(const char* name, const char* defValue);
  int (*GetSpringConfigInt)(const char* name, const int defValue);
  float (*GetSpringConfigFloat)(const char* name, const float defValue);
  void (*SetSpringConfigString)(const char* name, const char* value);
  void (*SetSpringConfigInt)(const char* name, const int value);
  void (*SetSpringConfigFloat)(const char* name, const float value);
  void (*lpClose)();
  int (*lpOpenFile)(const char* fileName, const char* fileModes, const char* accessModes);
  int (*lpOpenSource)(const char* source, const char* accessModes);
  int (*lpExecute)();
  const char* (*lpErrorLog)();
  void (*lpAddTableInt)(int key, int override);
  void (*lpAddTableStr)(const char* key, int override);
  void (*lpEndTable)();
  void (*lpAddIntKeyIntVal)(int key, int value);
  void (*lpAddStrKeyIntVal)(const char* key, int value);
  void (*lpAddIntKeyBoolVal)(int key, int value);
  void (*lpAddStrKeyBoolVal)(const char* key, int value);
  void (*lpAddIntKeyFloatVal)(int key, float value);
  void (*lpAddStrKeyFloatVal)(const char* key, float value);
  void (*lpAddIntKeyStrVal)(int key, const char* value);
  void (*lpAddStrKeyStrVal)(const char* key, const char* value);
  int (*lpRootTable)();
  int (*lpRootTableExpr)(const char* expr);
  int (*lpSubTableInt)(int key);
  int (*lpSubTableStr)(const char* key);
  int (*lpSubTableExpr)(const char* expr);
  void (*lpPopTable)();
  int (*lpGetKeyExistsInt)(int key);
  int (*lpGetKeyExistsStr)(const char* key);
  int (*lpGetIntKeyType)(int key);
  int (*lpGetStrKeyType)(const char* key);
  int (*lpGetIntKeyListCount)();
  int (*lpGetIntKeyListEntry)(int index);
  int (*lpGetStrKeyListCount)();
  const char* (*lpGetStrKeyListEntry)(int index);
  int (*lpGetIntKeyIntVal)(int key, int defValue);
  int (*lpGetStrKeyIntVal)(const char* key, int defValue);
  int (*lpGetIntKeyBoolVal)(int key, int defValue);
  int (*lpGetStrKeyBoolVal)(const char* key, int defValue);
  float (*lpGetIntKeyFloatVal)(int key, float defValue);
  float (*lpGetStrKeyFloatVal)(const char* key, float defValue);
  const char* (*lpGetIntKeyStrVal)(int key, const char* defValue);
  const char* (*lpGetStrKeyStrVal)(const char* key, const char* defValue);
};

char const *load_unitsync (char const *dll, struct unitsync *api);
void unload_unitsync (struct unitsync *api);

#if !CLIENT
#include <dlfcn.h>

char const *
load_unitsync (char const *dll, struct unitsync *api)
{
  api->lib = dlopen (dll, RTLD_NOW);
  if (!api->lib)
    return dlerror ();

#define RESOLVE(api, func)             \
  api->func = dlsym (api->lib, #func); \
  if (!api->func)                      \
    return dlerror ()

  RESOLVE (api, GetNextError);
  RESOLVE (api, GetSpringVersion);
  RESOLVE (api, GetSpringVersionPatchset);
  RESOLVE (api, IsSpringReleaseVersion);
  RESOLVE (api, Init);
  RESOLVE (api, UnInit);
  RESOLVE (api, GetWritableDataDirectory);
  RESOLVE (api, GetDataDirectoryCount);
  RESOLVE (api, GetDataDirectory);
  RESOLVE (api, ProcessUnits);
  RESOLVE (api, ProcessUnitsNoChecksum);
  RESOLVE (api, GetUnitCount);
  RESOLVE (api, GetUnitName);
  RESOLVE (api, GetFullUnitName);
  RESOLVE (api, AddArchive);
  RESOLVE (api, AddAllArchives);
  RESOLVE (api, RemoveAllArchives);
  RESOLVE (api, GetArchiveChecksum);
  RESOLVE (api, GetArchivePath);
  RESOLVE (api, GetMapCount);
  RESOLVE (api, GetMapName);
  RESOLVE (api, GetMapFileName);
  RESOLVE (api, GetMapDescription);
  RESOLVE (api, GetMapAuthor);
  RESOLVE (api, GetMapWidth);
  RESOLVE (api, GetMapHeight);
  RESOLVE (api, GetMapTidalStrength);
  RESOLVE (api, GetMapWindMin);
  RESOLVE (api, GetMapWindMax);
  RESOLVE (api, GetMapGravity);
  RESOLVE (api, GetMapResourceCount);
  RESOLVE (api, GetMapResourceName);
  RESOLVE (api, GetMapResourceMax);
  RESOLVE (api, GetMapResourceExtractorRadius);
  RESOLVE (api, GetMapPosCount);
  RESOLVE (api, GetMapPosX);
  RESOLVE (api, GetMapPosZ);
  RESOLVE (api, GetMapMinHeight);
  RESOLVE (api, GetMapMaxHeight);
  RESOLVE (api, GetMapArchiveCount);
  RESOLVE (api, GetMapArchiveName);
  RESOLVE (api, GetMapChecksum);
  RESOLVE (api, GetMapChecksumFromName);
  RESOLVE (api, GetInfoMapSize);
  RESOLVE (api, GetInfoMap);
  RESOLVE (api, GetSkirmishAICount);
  RESOLVE (api, GetSkirmishAIInfoCount);
  RESOLVE (api, GetInfoKey);
  RESOLVE (api, GetInfoType);
  RESOLVE (api, GetInfoValue);
  RESOLVE (api, GetInfoValueString);
  RESOLVE (api, GetInfoValueInteger);
  RESOLVE (api, GetInfoValueFloat);
  RESOLVE (api, GetInfoValueBool);
  RESOLVE (api, GetInfoDescription);
  RESOLVE (api, GetSkirmishAIOptionCount);
  RESOLVE (api, GetPrimaryModCount);
  RESOLVE (api, GetPrimaryModInfoCount);
  RESOLVE (api, GetPrimaryModName);
  RESOLVE (api, GetPrimaryModShortName);
  RESOLVE (api, GetPrimaryModVersion);
  RESOLVE (api, GetPrimaryModMutator);
  RESOLVE (api, GetPrimaryModGame);
  RESOLVE (api, GetPrimaryModShortGame);
  RESOLVE (api, GetPrimaryModDescription);
  RESOLVE (api, GetPrimaryModArchive);
  RESOLVE (api, GetPrimaryModArchiveCount);
  RESOLVE (api, GetPrimaryModArchiveList);
  RESOLVE (api, GetPrimaryModIndex);
  RESOLVE (api, GetPrimaryModChecksum);
  RESOLVE (api, GetPrimaryModChecksumFromName);
  RESOLVE (api, GetSideCount);
  RESOLVE (api, GetSideName);
  RESOLVE (api, GetSideStartUnit);
  RESOLVE (api, GetMapOptionCount);
  RESOLVE (api, GetModOptionCount);
  RESOLVE (api, GetCustomOptionCount);
  RESOLVE (api, GetOptionKey);
  RESOLVE (api, GetOptionScope);
  RESOLVE (api, GetOptionName);
  RESOLVE (api, GetOptionSection);
  RESOLVE (api, GetOptionStyle);
  RESOLVE (api, GetOptionDesc);
  RESOLVE (api, GetOptionType);
  RESOLVE (api, GetOptionBoolDef);
  RESOLVE (api, GetOptionNumberDef);
  RESOLVE (api, GetOptionNumberMin);
  RESOLVE (api, GetOptionNumberMax);
  RESOLVE (api, GetOptionNumberStep);
  RESOLVE (api, GetOptionStringDef);
  RESOLVE (api, GetOptionStringMaxLen);
  RESOLVE (api, GetOptionListCount);
  RESOLVE (api, GetOptionListDef);
  RESOLVE (api, GetOptionListItemKey);
  RESOLVE (api, GetOptionListItemName);
  RESOLVE (api, GetOptionListItemDesc);
  RESOLVE (api, GetModValidMapCount);
  RESOLVE (api, GetModValidMap);
  RESOLVE (api, OpenFileVFS);
  RESOLVE (api, CloseFileVFS);
  RESOLVE (api, ReadFileVFS);
  RESOLVE (api, FileSizeVFS);
  RESOLVE (api, InitFindVFS);
  RESOLVE (api, InitDirListVFS);
  RESOLVE (api, InitSubDirsVFS);
  RESOLVE (api, FindFilesVFS);
  RESOLVE (api, OpenArchive);
  RESOLVE (api, OpenArchiveType);
  RESOLVE (api, CloseArchive);
  RESOLVE (api, FindFilesArchive);
  RESOLVE (api, OpenArchiveFile);
  RESOLVE (api, ReadArchiveFile);
  RESOLVE (api, CloseArchiveFile);
  RESOLVE (api, SizeArchiveFile);
  RESOLVE (api, SetSpringConfigFile);
  RESOLVE (api, GetSpringConfigFile);
  RESOLVE (api, GetSpringConfigString);
  RESOLVE (api, GetSpringConfigInt);
  RESOLVE (api, GetSpringConfigFloat);
  RESOLVE (api, SetSpringConfigString);
  RESOLVE (api, SetSpringConfigInt);
  RESOLVE (api, SetSpringConfigFloat);
  RESOLVE (api, lpClose);
  RESOLVE (api, lpOpenFile);
  RESOLVE (api, lpOpenSource);
  RESOLVE (api, lpExecute);
  RESOLVE (api, lpErrorLog);
  RESOLVE (api, lpAddTableInt);
  RESOLVE (api, lpAddTableStr);
  RESOLVE (api, lpEndTable);
  RESOLVE (api, lpAddIntKeyIntVal);
  RESOLVE (api, lpAddStrKeyIntVal);
  RESOLVE (api, lpAddIntKeyBoolVal);
  RESOLVE (api, lpAddStrKeyBoolVal);
  RESOLVE (api, lpAddIntKeyFloatVal);
  RESOLVE (api, lpAddStrKeyFloatVal);
  RESOLVE (api, lpAddIntKeyStrVal);
  RESOLVE (api, lpAddStrKeyStrVal);
  RESOLVE (api, lpRootTable);
  RESOLVE (api, lpRootTableExpr);
  RESOLVE (api, lpSubTableInt);
  RESOLVE (api, lpSubTableStr);
  RESOLVE (api, lpSubTableExpr);
  RESOLVE (api, lpPopTable);
  RESOLVE (api, lpGetKeyExistsInt);
  RESOLVE (api, lpGetKeyExistsStr);
  RESOLVE (api, lpGetIntKeyType);
  RESOLVE (api, lpGetStrKeyType);
  RESOLVE (api, lpGetIntKeyListCount);
  RESOLVE (api, lpGetIntKeyListEntry);
  RESOLVE (api, lpGetStrKeyListCount);
  RESOLVE (api, lpGetStrKeyListEntry);
  RESOLVE (api, lpGetIntKeyIntVal);
  RESOLVE (api, lpGetStrKeyIntVal);
  RESOLVE (api, lpGetIntKeyBoolVal);
  RESOLVE (api, lpGetStrKeyBoolVal);
  RESOLVE (api, lpGetIntKeyFloatVal);
  RESOLVE (api, lpGetStrKeyFloatVal);
  RESOLVE (api, lpGetIntKeyStrVal);
  RESOLVE (api, lpGetStrKeyStrVal);

  return 0;
}

void
unload_unitsync (struct unitsync *api)
{
  dlclose (api->lib);

  api->lib = 0;

  api->GetNextError = 0;
  api->GetSpringVersion = 0;
  api->GetSpringVersionPatchset = 0;
  api->IsSpringReleaseVersion = 0;
  api->Init = 0;
  api->UnInit = 0;
  api->GetWritableDataDirectory = 0;
  api->GetDataDirectoryCount = 0;
  api->GetDataDirectory = 0;
  api->ProcessUnits = 0;
  api->ProcessUnitsNoChecksum = 0;
  api->GetUnitCount = 0;
  api->GetUnitName = 0;
  api->GetFullUnitName = 0;
  api->AddArchive = 0;
  api->AddAllArchives = 0;
  api->RemoveAllArchives = 0;
  api->GetArchiveChecksum = 0;
  api->GetArchivePath = 0;
  api->GetMapCount = 0;
  api->GetMapName = 0;
  api->GetMapFileName = 0;
  api->GetMapDescription = 0;
  api->GetMapAuthor = 0;
  api->GetMapWidth = 0;
  api->GetMapHeight = 0;
  api->GetMapTidalStrength = 0;
  api->GetMapWindMin = 0;
  api->GetMapWindMax = 0;
  api->GetMapGravity = 0;
  api->GetMapResourceCount = 0;
  api->GetMapResourceName = 0;
  api->GetMapResourceMax = 0;
  api->GetMapResourceExtractorRadius = 0;
  api->GetMapPosCount = 0;
  api->GetMapPosX = 0;
  api->GetMapPosZ = 0;
  api->GetMapMinHeight = 0;
  api->GetMapMaxHeight = 0;
  api->GetMapArchiveCount = 0;
  api->GetMapArchiveName = 0;
  api->GetMapChecksum = 0;
  api->GetMapChecksumFromName = 0;
  api->GetInfoMapSize = 0;
  api->GetInfoMap = 0;
  api->GetSkirmishAICount = 0;
  api->GetSkirmishAIInfoCount = 0;
  api->GetInfoKey = 0;
  api->GetInfoType = 0;
  api->GetInfoValue = 0;
  api->GetInfoValueString = 0;
  api->GetInfoValueInteger = 0;
  api->GetInfoValueFloat = 0;
  api->GetInfoValueBool = 0;
  api->GetInfoDescription = 0;
  api->GetSkirmishAIOptionCount = 0;
  api->GetPrimaryModCount = 0;
  api->GetPrimaryModInfoCount = 0;
  api->GetPrimaryModName = 0;
  api->GetPrimaryModShortName = 0;
  api->GetPrimaryModVersion = 0;
  api->GetPrimaryModMutator = 0;
  api->GetPrimaryModGame = 0;
  api->GetPrimaryModShortGame = 0;
  api->GetPrimaryModDescription = 0;
  api->GetPrimaryModArchive = 0;
  api->GetPrimaryModArchiveCount = 0;
  api->GetPrimaryModArchiveList = 0;
  api->GetPrimaryModIndex = 0;
  api->GetPrimaryModChecksum = 0;
  api->GetPrimaryModChecksumFromName = 0;
  api->GetSideCount = 0;
  api->GetSideName = 0;
  api->GetSideStartUnit = 0;
  api->GetMapOptionCount = 0;
  api->GetModOptionCount = 0;
  api->GetCustomOptionCount = 0;
  api->GetOptionKey = 0;
  api->GetOptionScope = 0;
  api->GetOptionName = 0;
  api->GetOptionSection = 0;
  api->GetOptionStyle = 0;
  api->GetOptionDesc = 0;
  api->GetOptionType = 0;
  api->GetOptionBoolDef = 0;
  api->GetOptionNumberDef = 0;
  api->GetOptionNumberMin = 0;
  api->GetOptionNumberMax = 0;
  api->GetOptionNumberStep = 0;
  api->GetOptionStringDef = 0;
  api->GetOptionStringMaxLen = 0;
  api->GetOptionListCount = 0;
  api->GetOptionListDef = 0;
  api->GetOptionListItemKey = 0;
  api->GetOptionListItemName = 0;
  api->GetOptionListItemDesc = 0;
  api->GetModValidMapCount = 0;
  api->GetModValidMap = 0;
  api->OpenFileVFS = 0;
  api->CloseFileVFS = 0;
  api->ReadFileVFS = 0;
  api->FileSizeVFS = 0;
  api->InitFindVFS = 0;
  api->InitDirListVFS = 0;
  api->InitSubDirsVFS = 0;
  api->FindFilesVFS = 0;
  api->OpenArchive = 0;
  api->OpenArchiveType = 0;
  api->CloseArchive = 0;
  api->FindFilesArchive = 0;
  api->OpenArchiveFile = 0;
  api->ReadArchiveFile = 0;
  api->CloseArchiveFile = 0;
  api->SizeArchiveFile = 0;
  api->SetSpringConfigFile = 0;
  api->GetSpringConfigFile = 0;
  api->GetSpringConfigString = 0;
  api->GetSpringConfigInt = 0;
  api->GetSpringConfigFloat = 0;
  api->SetSpringConfigString = 0;
  api->SetSpringConfigInt = 0;
  api->SetSpringConfigFloat = 0;
  api->lpClose = 0;
  api->lpOpenFile = 0;
  api->lpOpenSource = 0;
  api->lpExecute = 0;
  api->lpErrorLog = 0;
  api->lpAddTableInt = 0;
  api->lpAddTableStr = 0;
  api->lpEndTable = 0;
  api->lpAddIntKeyIntVal = 0;
  api->lpAddStrKeyIntVal = 0;
  api->lpAddIntKeyBoolVal = 0;
  api->lpAddStrKeyBoolVal = 0;
  api->lpAddIntKeyFloatVal = 0;
  api->lpAddStrKeyFloatVal = 0;
  api->lpAddIntKeyStrVal = 0;
  api->lpAddStrKeyStrVal = 0;
  api->lpRootTable = 0;
  api->lpRootTableExpr = 0;
  api->lpSubTableInt = 0;
  api->lpSubTableStr = 0;
  api->lpSubTableExpr = 0;
  api->lpPopTable = 0;
  api->lpGetKeyExistsInt = 0;
  api->lpGetKeyExistsStr = 0;
  api->lpGetIntKeyType = 0;
  api->lpGetStrKeyType = 0;
  api->lpGetIntKeyListCount = 0;
  api->lpGetIntKeyListEntry = 0;
  api->lpGetStrKeyListCount = 0;
  api->lpGetStrKeyListEntry = 0;
  api->lpGetIntKeyIntVal = 0;
  api->lpGetStrKeyIntVal = 0;
  api->lpGetIntKeyBoolVal = 0;
  api->lpGetStrKeyBoolVal = 0;
  api->lpGetIntKeyFloatVal = 0;
  api->lpGetStrKeyFloatVal = 0;
  api->lpGetIntKeyStrVal = 0;
  api->lpGetStrKeyStrVal = 0;
}
#else
#include <caml/alloc.h>
#include <caml/mlvalues.h>

static void preconditions (struct unitsync *api);
static void postconditions (struct unitsync *api);


CAMLprim value
ml_UnitSync_getNextError (value api_val)
{
  struct unitsync *api = UnitSync_val (api_val);
  preconditions (api);
  const char* retval = api->GetNextError ();
  postconditions (api);
  return caml_copy_string (retval);
}

CAMLprim value
ml_UnitSync_getSpringVersion (value api_val)
{
  struct unitsync *api = UnitSync_val (api_val);
  preconditions (api);
  const char* retval = api->GetSpringVersion ();
  postconditions (api);
  return caml_copy_string (retval);
}

CAMLprim value
ml_UnitSync_getSpringVersionPatchset (value api_val)
{
  struct unitsync *api = UnitSync_val (api_val);
  preconditions (api);
  const char* retval = api->GetSpringVersionPatchset ();
  postconditions (api);
  return caml_copy_string (retval);
}

CAMLprim value
ml_UnitSync_isSpringReleaseVersion (value api_val)
{
  struct unitsync *api = UnitSync_val (api_val);
  preconditions (api);
  bool retval = api->IsSpringReleaseVersion ();
  postconditions (api);
  return Val_bool (retval);
}

CAMLprim value
ml_UnitSync_init (value api_val, value isServer_val, value id_val)
{
  struct unitsync *api = UnitSync_val (api_val);
  preconditions (api);
  bool isServer = Bool_val (isServer_val);
  int id = Int_val (id_val);
  int retval = api->Init (isServer, id);
  postconditions (api);
  return Val_int (retval);
}

CAMLprim value
ml_UnitSync_unInit (value api_val)
{
  struct unitsync *api = UnitSync_val (api_val);
  preconditions (api);
  api->UnInit ();
  postconditions (api);
  return Val_unit;
}

CAMLprim value
ml_UnitSync_getWritableDataDirectory (value api_val)
{
  struct unitsync *api = UnitSync_val (api_val);
  preconditions (api);
  const char* retval = api->GetWritableDataDirectory ();
  postconditions (api);
  return caml_copy_string (retval);
}

CAMLprim value
ml_UnitSync_getDataDirectoryCount (value api_val)
{
  struct unitsync *api = UnitSync_val (api_val);
  preconditions (api);
  int retval = api->GetDataDirectoryCount ();
  postconditions (api);
  return Val_int (retval);
}

CAMLprim value
ml_UnitSync_getDataDirectory (value api_val, value index_val)
{
  struct unitsync *api = UnitSync_val (api_val);
  preconditions (api);
  int index = Int_val (index_val);
  const char* retval = api->GetDataDirectory (index);
  postconditions (api);
  return caml_copy_string (retval);
}

CAMLprim value
ml_UnitSync_processUnits (value api_val)
{
  struct unitsync *api = UnitSync_val (api_val);
  preconditions (api);
  int retval = api->ProcessUnits ();
  postconditions (api);
  return Val_int (retval);
}

CAMLprim value
ml_UnitSync_processUnitsNoChecksum (value api_val)
{
  struct unitsync *api = UnitSync_val (api_val);
  preconditions (api);
  int retval = api->ProcessUnitsNoChecksum ();
  postconditions (api);
  return Val_int (retval);
}

CAMLprim value
ml_UnitSync_getUnitCount (value api_val)
{
  struct unitsync *api = UnitSync_val (api_val);
  preconditions (api);
  int retval = api->GetUnitCount ();
  postconditions (api);
  return Val_int (retval);
}

CAMLprim value
ml_UnitSync_getUnitName (value api_val, value unit_val)
{
  struct unitsync *api = UnitSync_val (api_val);
  preconditions (api);
  int unit = Int_val (unit_val);
  const char* retval = api->GetUnitName (unit);
  postconditions (api);
  return caml_copy_string (retval);
}

CAMLprim value
ml_UnitSync_getFullUnitName (value api_val, value unit_val)
{
  struct unitsync *api = UnitSync_val (api_val);
  preconditions (api);
  int unit = Int_val (unit_val);
  const char* retval = api->GetFullUnitName (unit);
  postconditions (api);
  return caml_copy_string (retval);
}

CAMLprim value
ml_UnitSync_addArchive (value api_val, value archiveName_val)
{
  struct unitsync *api = UnitSync_val (api_val);
  preconditions (api);
  const char* archiveName = String_val (archiveName_val);
  api->AddArchive (archiveName);
  postconditions (api);
  return Val_unit;
}

CAMLprim value
ml_UnitSync_addAllArchives (value api_val, value rootArchiveName_val)
{
  struct unitsync *api = UnitSync_val (api_val);
  preconditions (api);
  const char* rootArchiveName = String_val (rootArchiveName_val);
  api->AddAllArchives (rootArchiveName);
  postconditions (api);
  return Val_unit;
}

CAMLprim value
ml_UnitSync_removeAllArchives (value api_val)
{
  struct unitsync *api = UnitSync_val (api_val);
  preconditions (api);
  api->RemoveAllArchives ();
  postconditions (api);
  return Val_unit;
}

CAMLprim value
ml_UnitSync_getArchiveChecksum (value api_val, value archiveName_val)
{
  struct unitsync *api = UnitSync_val (api_val);
  preconditions (api);
  const char* archiveName = String_val (archiveName_val);
  unsigned int retval = api->GetArchiveChecksum (archiveName);
  postconditions (api);
  return Val_int (retval);
}

CAMLprim value
ml_UnitSync_getArchivePath (value api_val, value archiveName_val)
{
  struct unitsync *api = UnitSync_val (api_val);
  preconditions (api);
  const char* archiveName = String_val (archiveName_val);
  const char* retval = api->GetArchivePath (archiveName);
  postconditions (api);
  return caml_copy_string (retval);
}

CAMLprim value
ml_UnitSync_getMapCount (value api_val)
{
  struct unitsync *api = UnitSync_val (api_val);
  preconditions (api);
  int retval = api->GetMapCount ();
  postconditions (api);
  return Val_int (retval);
}

CAMLprim value
ml_UnitSync_getMapName (value api_val, value index_val)
{
  struct unitsync *api = UnitSync_val (api_val);
  preconditions (api);
  int index = Int_val (index_val);
  const char* retval = api->GetMapName (index);
  postconditions (api);
  return caml_copy_string (retval);
}

CAMLprim value
ml_UnitSync_getMapFileName (value api_val, value index_val)
{
  struct unitsync *api = UnitSync_val (api_val);
  preconditions (api);
  int index = Int_val (index_val);
  const char* retval = api->GetMapFileName (index);
  postconditions (api);
  return caml_copy_string (retval);
}

CAMLprim value
ml_UnitSync_getMapDescription (value api_val, value index_val)
{
  struct unitsync *api = UnitSync_val (api_val);
  preconditions (api);
  int index = Int_val (index_val);
  const char* retval = api->GetMapDescription (index);
  postconditions (api);
  return caml_copy_string (retval);
}

CAMLprim value
ml_UnitSync_getMapAuthor (value api_val, value index_val)
{
  struct unitsync *api = UnitSync_val (api_val);
  preconditions (api);
  int index = Int_val (index_val);
  const char* retval = api->GetMapAuthor (index);
  postconditions (api);
  return caml_copy_string (retval);
}

CAMLprim value
ml_UnitSync_getMapWidth (value api_val, value index_val)
{
  struct unitsync *api = UnitSync_val (api_val);
  preconditions (api);
  int index = Int_val (index_val);
  int retval = api->GetMapWidth (index);
  postconditions (api);
  return Val_int (retval);
}

CAMLprim value
ml_UnitSync_getMapHeight (value api_val, value index_val)
{
  struct unitsync *api = UnitSync_val (api_val);
  preconditions (api);
  int index = Int_val (index_val);
  int retval = api->GetMapHeight (index);
  postconditions (api);
  return Val_int (retval);
}

CAMLprim value
ml_UnitSync_getMapTidalStrength (value api_val, value index_val)
{
  struct unitsync *api = UnitSync_val (api_val);
  preconditions (api);
  int index = Int_val (index_val);
  int retval = api->GetMapTidalStrength (index);
  postconditions (api);
  return Val_int (retval);
}

CAMLprim value
ml_UnitSync_getMapWindMin (value api_val, value index_val)
{
  struct unitsync *api = UnitSync_val (api_val);
  preconditions (api);
  int index = Int_val (index_val);
  int retval = api->GetMapWindMin (index);
  postconditions (api);
  return Val_int (retval);
}

CAMLprim value
ml_UnitSync_getMapWindMax (value api_val, value index_val)
{
  struct unitsync *api = UnitSync_val (api_val);
  preconditions (api);
  int index = Int_val (index_val);
  int retval = api->GetMapWindMax (index);
  postconditions (api);
  return Val_int (retval);
}

CAMLprim value
ml_UnitSync_getMapGravity (value api_val, value index_val)
{
  struct unitsync *api = UnitSync_val (api_val);
  preconditions (api);
  int index = Int_val (index_val);
  int retval = api->GetMapGravity (index);
  postconditions (api);
  return Val_int (retval);
}

CAMLprim value
ml_UnitSync_getMapResourceCount (value api_val, value index_val)
{
  struct unitsync *api = UnitSync_val (api_val);
  preconditions (api);
  int index = Int_val (index_val);
  int retval = api->GetMapResourceCount (index);
  postconditions (api);
  return Val_int (retval);
}

CAMLprim value
ml_UnitSync_getMapResourceName (value api_val, value index_val, value resourceIndex_val)
{
  struct unitsync *api = UnitSync_val (api_val);
  preconditions (api);
  int index = Int_val (index_val);
  int resourceIndex = Int_val (resourceIndex_val);
  const char* retval = api->GetMapResourceName (index, resourceIndex);
  postconditions (api);
  return caml_copy_string (retval);
}

CAMLprim value
ml_UnitSync_getMapResourceMax (value api_val, value index_val, value resourceIndex_val)
{
  struct unitsync *api = UnitSync_val (api_val);
  preconditions (api);
  int index = Int_val (index_val);
  int resourceIndex = Int_val (resourceIndex_val);
  float retval = api->GetMapResourceMax (index, resourceIndex);
  postconditions (api);
  return make_double_val (retval);
}

CAMLprim value
ml_UnitSync_getMapResourceExtractorRadius (value api_val, value index_val, value resourceIndex_val)
{
  struct unitsync *api = UnitSync_val (api_val);
  preconditions (api);
  int index = Int_val (index_val);
  int resourceIndex = Int_val (resourceIndex_val);
  int retval = api->GetMapResourceExtractorRadius (index, resourceIndex);
  postconditions (api);
  return Val_int (retval);
}

CAMLprim value
ml_UnitSync_getMapPosCount (value api_val, value index_val)
{
  struct unitsync *api = UnitSync_val (api_val);
  preconditions (api);
  int index = Int_val (index_val);
  int retval = api->GetMapPosCount (index);
  postconditions (api);
  return Val_int (retval);
}

CAMLprim value
ml_UnitSync_getMapPosX (value api_val, value index_val, value posIndex_val)
{
  struct unitsync *api = UnitSync_val (api_val);
  preconditions (api);
  int index = Int_val (index_val);
  int posIndex = Int_val (posIndex_val);
  float retval = api->GetMapPosX (index, posIndex);
  postconditions (api);
  return make_double_val (retval);
}

CAMLprim value
ml_UnitSync_getMapPosZ (value api_val, value index_val, value posIndex_val)
{
  struct unitsync *api = UnitSync_val (api_val);
  preconditions (api);
  int index = Int_val (index_val);
  int posIndex = Int_val (posIndex_val);
  float retval = api->GetMapPosZ (index, posIndex);
  postconditions (api);
  return make_double_val (retval);
}

CAMLprim value
ml_UnitSync_getMapMinHeight (value api_val, value mapName_val)
{
  struct unitsync *api = UnitSync_val (api_val);
  preconditions (api);
  const char* mapName = String_val (mapName_val);
  float retval = api->GetMapMinHeight (mapName);
  postconditions (api);
  return make_double_val (retval);
}

CAMLprim value
ml_UnitSync_getMapMaxHeight (value api_val, value mapName_val)
{
  struct unitsync *api = UnitSync_val (api_val);
  preconditions (api);
  const char* mapName = String_val (mapName_val);
  float retval = api->GetMapMaxHeight (mapName);
  postconditions (api);
  return make_double_val (retval);
}

CAMLprim value
ml_UnitSync_getMapArchiveCount (value api_val, value mapName_val)
{
  struct unitsync *api = UnitSync_val (api_val);
  preconditions (api);
  const char* mapName = String_val (mapName_val);
  int retval = api->GetMapArchiveCount (mapName);
  postconditions (api);
  return Val_int (retval);
}

CAMLprim value
ml_UnitSync_getMapArchiveName (value api_val, value index_val)
{
  struct unitsync *api = UnitSync_val (api_val);
  preconditions (api);
  int index = Int_val (index_val);
  const char* retval = api->GetMapArchiveName (index);
  postconditions (api);
  return caml_copy_string (retval);
}

CAMLprim value
ml_UnitSync_getMapChecksum (value api_val, value index_val)
{
  struct unitsync *api = UnitSync_val (api_val);
  preconditions (api);
  int index = Int_val (index_val);
  unsigned int retval = api->GetMapChecksum (index);
  postconditions (api);
  return Val_int (retval);
}

CAMLprim value
ml_UnitSync_getMapChecksumFromName (value api_val, value mapName_val)
{
  struct unitsync *api = UnitSync_val (api_val);
  preconditions (api);
  const char* mapName = String_val (mapName_val);
  unsigned int retval = api->GetMapChecksumFromName (mapName);
  postconditions (api);
  return Val_int (retval);
}

CAMLprim value
ml_UnitSync_getSkirmishAICount (value api_val)
{
  struct unitsync *api = UnitSync_val (api_val);
  preconditions (api);
  int retval = api->GetSkirmishAICount ();
  postconditions (api);
  return Val_int (retval);
}

CAMLprim value
ml_UnitSync_getSkirmishAIInfoCount (value api_val, value index_val)
{
  struct unitsync *api = UnitSync_val (api_val);
  preconditions (api);
  int index = Int_val (index_val);
  int retval = api->GetSkirmishAIInfoCount (index);
  postconditions (api);
  return Val_int (retval);
}

CAMLprim value
ml_UnitSync_getInfoKey (value api_val, value index_val)
{
  struct unitsync *api = UnitSync_val (api_val);
  preconditions (api);
  int index = Int_val (index_val);
  const char* retval = api->GetInfoKey (index);
  postconditions (api);
  return caml_copy_string (retval);
}

CAMLprim value
ml_UnitSync_getInfoType (value api_val, value index_val)
{
  struct unitsync *api = UnitSync_val (api_val);
  preconditions (api);
  int index = Int_val (index_val);
  const char* retval = api->GetInfoType (index);
  postconditions (api);
  return caml_copy_string (retval);
}

CAMLprim value
ml_UnitSync_getInfoValue (value api_val, value index_val)
{
  struct unitsync *api = UnitSync_val (api_val);
  preconditions (api);
  int index = Int_val (index_val);
  const char* retval = api->GetInfoValue (index);
  postconditions (api);
  return caml_copy_string (retval);
}

CAMLprim value
ml_UnitSync_getInfoValueString (value api_val, value index_val)
{
  struct unitsync *api = UnitSync_val (api_val);
  preconditions (api);
  int index = Int_val (index_val);
  const char* retval = api->GetInfoValueString (index);
  postconditions (api);
  return caml_copy_string (retval);
}

CAMLprim value
ml_UnitSync_getInfoValueInteger (value api_val, value index_val)
{
  struct unitsync *api = UnitSync_val (api_val);
  preconditions (api);
  int index = Int_val (index_val);
  int retval = api->GetInfoValueInteger (index);
  postconditions (api);
  return Val_int (retval);
}

CAMLprim value
ml_UnitSync_getInfoValueFloat (value api_val, value index_val)
{
  struct unitsync *api = UnitSync_val (api_val);
  preconditions (api);
  int index = Int_val (index_val);
  float retval = api->GetInfoValueFloat (index);
  postconditions (api);
  return make_double_val (retval);
}

CAMLprim value
ml_UnitSync_getInfoValueBool (value api_val, value index_val)
{
  struct unitsync *api = UnitSync_val (api_val);
  preconditions (api);
  int index = Int_val (index_val);
  bool retval = api->GetInfoValueBool (index);
  postconditions (api);
  return Val_bool (retval);
}

CAMLprim value
ml_UnitSync_getInfoDescription (value api_val, value index_val)
{
  struct unitsync *api = UnitSync_val (api_val);
  preconditions (api);
  int index = Int_val (index_val);
  const char* retval = api->GetInfoDescription (index);
  postconditions (api);
  return caml_copy_string (retval);
}

CAMLprim value
ml_UnitSync_getSkirmishAIOptionCount (value api_val, value index_val)
{
  struct unitsync *api = UnitSync_val (api_val);
  preconditions (api);
  int index = Int_val (index_val);
  int retval = api->GetSkirmishAIOptionCount (index);
  postconditions (api);
  return Val_int (retval);
}

CAMLprim value
ml_UnitSync_getPrimaryModCount (value api_val)
{
  struct unitsync *api = UnitSync_val (api_val);
  preconditions (api);
  int retval = api->GetPrimaryModCount ();
  postconditions (api);
  return Val_int (retval);
}

CAMLprim value
ml_UnitSync_getPrimaryModInfoCount (value api_val, value index_val)
{
  struct unitsync *api = UnitSync_val (api_val);
  preconditions (api);
  int index = Int_val (index_val);
  int retval = api->GetPrimaryModInfoCount (index);
  postconditions (api);
  return Val_int (retval);
}

CAMLprim value
ml_UnitSync_getPrimaryModName (value api_val, value index_val)
{
  struct unitsync *api = UnitSync_val (api_val);
  preconditions (api);
  int index = Int_val (index_val);
  const char* retval = api->GetPrimaryModName (index);
  postconditions (api);
  return caml_copy_string (retval);
}

CAMLprim value
ml_UnitSync_getPrimaryModShortName (value api_val, value index_val)
{
  struct unitsync *api = UnitSync_val (api_val);
  preconditions (api);
  int index = Int_val (index_val);
  const char* retval = api->GetPrimaryModShortName (index);
  postconditions (api);
  return caml_copy_string (retval);
}

CAMLprim value
ml_UnitSync_getPrimaryModVersion (value api_val, value index_val)
{
  struct unitsync *api = UnitSync_val (api_val);
  preconditions (api);
  int index = Int_val (index_val);
  const char* retval = api->GetPrimaryModVersion (index);
  postconditions (api);
  return caml_copy_string (retval);
}

CAMLprim value
ml_UnitSync_getPrimaryModMutator (value api_val, value index_val)
{
  struct unitsync *api = UnitSync_val (api_val);
  preconditions (api);
  int index = Int_val (index_val);
  const char* retval = api->GetPrimaryModMutator (index);
  postconditions (api);
  return caml_copy_string (retval);
}

CAMLprim value
ml_UnitSync_getPrimaryModGame (value api_val, value index_val)
{
  struct unitsync *api = UnitSync_val (api_val);
  preconditions (api);
  int index = Int_val (index_val);
  const char* retval = api->GetPrimaryModGame (index);
  postconditions (api);
  return caml_copy_string (retval);
}

CAMLprim value
ml_UnitSync_getPrimaryModShortGame (value api_val, value index_val)
{
  struct unitsync *api = UnitSync_val (api_val);
  preconditions (api);
  int index = Int_val (index_val);
  const char* retval = api->GetPrimaryModShortGame (index);
  postconditions (api);
  return caml_copy_string (retval);
}

CAMLprim value
ml_UnitSync_getPrimaryModDescription (value api_val, value index_val)
{
  struct unitsync *api = UnitSync_val (api_val);
  preconditions (api);
  int index = Int_val (index_val);
  const char* retval = api->GetPrimaryModDescription (index);
  postconditions (api);
  return caml_copy_string (retval);
}

CAMLprim value
ml_UnitSync_getPrimaryModArchive (value api_val, value index_val)
{
  struct unitsync *api = UnitSync_val (api_val);
  preconditions (api);
  int index = Int_val (index_val);
  const char* retval = api->GetPrimaryModArchive (index);
  postconditions (api);
  return caml_copy_string (retval);
}

CAMLprim value
ml_UnitSync_getPrimaryModArchiveCount (value api_val, value index_val)
{
  struct unitsync *api = UnitSync_val (api_val);
  preconditions (api);
  int index = Int_val (index_val);
  int retval = api->GetPrimaryModArchiveCount (index);
  postconditions (api);
  return Val_int (retval);
}

CAMLprim value
ml_UnitSync_getPrimaryModArchiveList (value api_val, value archive_val)
{
  struct unitsync *api = UnitSync_val (api_val);
  preconditions (api);
  int archive = Int_val (archive_val);
  const char* retval = api->GetPrimaryModArchiveList (archive);
  postconditions (api);
  return caml_copy_string (retval);
}

CAMLprim value
ml_UnitSync_getPrimaryModIndex (value api_val, value name_val)
{
  struct unitsync *api = UnitSync_val (api_val);
  preconditions (api);
  const char* name = String_val (name_val);
  int retval = api->GetPrimaryModIndex (name);
  postconditions (api);
  return Val_int (retval);
}

CAMLprim value
ml_UnitSync_getPrimaryModChecksum (value api_val, value index_val)
{
  struct unitsync *api = UnitSync_val (api_val);
  preconditions (api);
  int index = Int_val (index_val);
  unsigned int retval = api->GetPrimaryModChecksum (index);
  postconditions (api);
  return Val_int (retval);
}

CAMLprim value
ml_UnitSync_getPrimaryModChecksumFromName (value api_val, value name_val)
{
  struct unitsync *api = UnitSync_val (api_val);
  preconditions (api);
  const char* name = String_val (name_val);
  unsigned int retval = api->GetPrimaryModChecksumFromName (name);
  postconditions (api);
  return Val_int (retval);
}

CAMLprim value
ml_UnitSync_getSideCount (value api_val)
{
  struct unitsync *api = UnitSync_val (api_val);
  preconditions (api);
  int retval = api->GetSideCount ();
  postconditions (api);
  return Val_int (retval);
}

CAMLprim value
ml_UnitSync_getSideName (value api_val, value side_val)
{
  struct unitsync *api = UnitSync_val (api_val);
  preconditions (api);
  int side = Int_val (side_val);
  const char* retval = api->GetSideName (side);
  postconditions (api);
  return caml_copy_string (retval);
}

CAMLprim value
ml_UnitSync_getSideStartUnit (value api_val, value side_val)
{
  struct unitsync *api = UnitSync_val (api_val);
  preconditions (api);
  int side = Int_val (side_val);
  const char* retval = api->GetSideStartUnit (side);
  postconditions (api);
  return caml_copy_string (retval);
}

CAMLprim value
ml_UnitSync_getMapOptionCount (value api_val, value mapName_val)
{
  struct unitsync *api = UnitSync_val (api_val);
  preconditions (api);
  const char* mapName = String_val (mapName_val);
  int retval = api->GetMapOptionCount (mapName);
  postconditions (api);
  return Val_int (retval);
}

CAMLprim value
ml_UnitSync_getModOptionCount (value api_val)
{
  struct unitsync *api = UnitSync_val (api_val);
  preconditions (api);
  int retval = api->GetModOptionCount ();
  postconditions (api);
  return Val_int (retval);
}

CAMLprim value
ml_UnitSync_getCustomOptionCount (value api_val, value fileName_val)
{
  struct unitsync *api = UnitSync_val (api_val);
  preconditions (api);
  const char* fileName = String_val (fileName_val);
  int retval = api->GetCustomOptionCount (fileName);
  postconditions (api);
  return Val_int (retval);
}

CAMLprim value
ml_UnitSync_getOptionKey (value api_val, value optIndex_val)
{
  struct unitsync *api = UnitSync_val (api_val);
  preconditions (api);
  int optIndex = Int_val (optIndex_val);
  const char* retval = api->GetOptionKey (optIndex);
  postconditions (api);
  return caml_copy_string (retval);
}

CAMLprim value
ml_UnitSync_getOptionScope (value api_val, value optIndex_val)
{
  struct unitsync *api = UnitSync_val (api_val);
  preconditions (api);
  int optIndex = Int_val (optIndex_val);
  const char* retval = api->GetOptionScope (optIndex);
  postconditions (api);
  return caml_copy_string (retval);
}

CAMLprim value
ml_UnitSync_getOptionName (value api_val, value optIndex_val)
{
  struct unitsync *api = UnitSync_val (api_val);
  preconditions (api);
  int optIndex = Int_val (optIndex_val);
  const char* retval = api->GetOptionName (optIndex);
  postconditions (api);
  return caml_copy_string (retval);
}

CAMLprim value
ml_UnitSync_getOptionSection (value api_val, value optIndex_val)
{
  struct unitsync *api = UnitSync_val (api_val);
  preconditions (api);
  int optIndex = Int_val (optIndex_val);
  const char* retval = api->GetOptionSection (optIndex);
  postconditions (api);
  return caml_copy_string (retval);
}

CAMLprim value
ml_UnitSync_getOptionStyle (value api_val, value optIndex_val)
{
  struct unitsync *api = UnitSync_val (api_val);
  preconditions (api);
  int optIndex = Int_val (optIndex_val);
  const char* retval = api->GetOptionStyle (optIndex);
  postconditions (api);
  return caml_copy_string (retval);
}

CAMLprim value
ml_UnitSync_getOptionDesc (value api_val, value optIndex_val)
{
  struct unitsync *api = UnitSync_val (api_val);
  preconditions (api);
  int optIndex = Int_val (optIndex_val);
  const char* retval = api->GetOptionDesc (optIndex);
  postconditions (api);
  return caml_copy_string (retval);
}

CAMLprim value
ml_UnitSync_getOptionType (value api_val, value optIndex_val)
{
  struct unitsync *api = UnitSync_val (api_val);
  preconditions (api);
  int optIndex = Int_val (optIndex_val);
  int retval = api->GetOptionType (optIndex);
  postconditions (api);
  return Val_int (retval);
}

CAMLprim value
ml_UnitSync_getOptionBoolDef (value api_val, value optIndex_val)
{
  struct unitsync *api = UnitSync_val (api_val);
  preconditions (api);
  int optIndex = Int_val (optIndex_val);
  int retval = api->GetOptionBoolDef (optIndex);
  postconditions (api);
  return Val_int (retval);
}

CAMLprim value
ml_UnitSync_getOptionNumberDef (value api_val, value optIndex_val)
{
  struct unitsync *api = UnitSync_val (api_val);
  preconditions (api);
  int optIndex = Int_val (optIndex_val);
  float retval = api->GetOptionNumberDef (optIndex);
  postconditions (api);
  return make_double_val (retval);
}

CAMLprim value
ml_UnitSync_getOptionNumberMin (value api_val, value optIndex_val)
{
  struct unitsync *api = UnitSync_val (api_val);
  preconditions (api);
  int optIndex = Int_val (optIndex_val);
  float retval = api->GetOptionNumberMin (optIndex);
  postconditions (api);
  return make_double_val (retval);
}

CAMLprim value
ml_UnitSync_getOptionNumberMax (value api_val, value optIndex_val)
{
  struct unitsync *api = UnitSync_val (api_val);
  preconditions (api);
  int optIndex = Int_val (optIndex_val);
  float retval = api->GetOptionNumberMax (optIndex);
  postconditions (api);
  return make_double_val (retval);
}

CAMLprim value
ml_UnitSync_getOptionNumberStep (value api_val, value optIndex_val)
{
  struct unitsync *api = UnitSync_val (api_val);
  preconditions (api);
  int optIndex = Int_val (optIndex_val);
  float retval = api->GetOptionNumberStep (optIndex);
  postconditions (api);
  return make_double_val (retval);
}

CAMLprim value
ml_UnitSync_getOptionStringDef (value api_val, value optIndex_val)
{
  struct unitsync *api = UnitSync_val (api_val);
  preconditions (api);
  int optIndex = Int_val (optIndex_val);
  const char* retval = api->GetOptionStringDef (optIndex);
  postconditions (api);
  return caml_copy_string (retval);
}

CAMLprim value
ml_UnitSync_getOptionStringMaxLen (value api_val, value optIndex_val)
{
  struct unitsync *api = UnitSync_val (api_val);
  preconditions (api);
  int optIndex = Int_val (optIndex_val);
  int retval = api->GetOptionStringMaxLen (optIndex);
  postconditions (api);
  return Val_int (retval);
}

CAMLprim value
ml_UnitSync_getOptionListCount (value api_val, value optIndex_val)
{
  struct unitsync *api = UnitSync_val (api_val);
  preconditions (api);
  int optIndex = Int_val (optIndex_val);
  int retval = api->GetOptionListCount (optIndex);
  postconditions (api);
  return Val_int (retval);
}

CAMLprim value
ml_UnitSync_getOptionListDef (value api_val, value optIndex_val)
{
  struct unitsync *api = UnitSync_val (api_val);
  preconditions (api);
  int optIndex = Int_val (optIndex_val);
  const char* retval = api->GetOptionListDef (optIndex);
  postconditions (api);
  return caml_copy_string (retval);
}

CAMLprim value
ml_UnitSync_getOptionListItemKey (value api_val, value optIndex_val, value itemIndex_val)
{
  struct unitsync *api = UnitSync_val (api_val);
  preconditions (api);
  int optIndex = Int_val (optIndex_val);
  int itemIndex = Int_val (itemIndex_val);
  const char* retval = api->GetOptionListItemKey (optIndex, itemIndex);
  postconditions (api);
  return caml_copy_string (retval);
}

CAMLprim value
ml_UnitSync_getOptionListItemName (value api_val, value optIndex_val, value itemIndex_val)
{
  struct unitsync *api = UnitSync_val (api_val);
  preconditions (api);
  int optIndex = Int_val (optIndex_val);
  int itemIndex = Int_val (itemIndex_val);
  const char* retval = api->GetOptionListItemName (optIndex, itemIndex);
  postconditions (api);
  return caml_copy_string (retval);
}

CAMLprim value
ml_UnitSync_getOptionListItemDesc (value api_val, value optIndex_val, value itemIndex_val)
{
  struct unitsync *api = UnitSync_val (api_val);
  preconditions (api);
  int optIndex = Int_val (optIndex_val);
  int itemIndex = Int_val (itemIndex_val);
  const char* retval = api->GetOptionListItemDesc (optIndex, itemIndex);
  postconditions (api);
  return caml_copy_string (retval);
}

CAMLprim value
ml_UnitSync_getModValidMapCount (value api_val)
{
  struct unitsync *api = UnitSync_val (api_val);
  preconditions (api);
  int retval = api->GetModValidMapCount ();
  postconditions (api);
  return Val_int (retval);
}

CAMLprim value
ml_UnitSync_getModValidMap (value api_val, value index_val)
{
  struct unitsync *api = UnitSync_val (api_val);
  preconditions (api);
  int index = Int_val (index_val);
  const char* retval = api->GetModValidMap (index);
  postconditions (api);
  return caml_copy_string (retval);
}

CAMLprim value
ml_UnitSync_openFileVFS (value api_val, value name_val)
{
  struct unitsync *api = UnitSync_val (api_val);
  preconditions (api);
  const char* name = String_val (name_val);
  int retval = api->OpenFileVFS (name);
  postconditions (api);
  return Val_int (retval);
}

CAMLprim value
ml_UnitSync_closeFileVFS (value api_val, value file_val)
{
  struct unitsync *api = UnitSync_val (api_val);
  preconditions (api);
  int file = Int_val (file_val);
  api->CloseFileVFS (file);
  postconditions (api);
  return Val_unit;
}

CAMLprim value
ml_UnitSync_fileSizeVFS (value api_val, value file_val)
{
  struct unitsync *api = UnitSync_val (api_val);
  preconditions (api);
  int file = Int_val (file_val);
  int retval = api->FileSizeVFS (file);
  postconditions (api);
  return Val_int (retval);
}

CAMLprim value
ml_UnitSync_initFindVFS (value api_val, value pattern_val)
{
  struct unitsync *api = UnitSync_val (api_val);
  preconditions (api);
  const char* pattern = String_val (pattern_val);
  int retval = api->InitFindVFS (pattern);
  postconditions (api);
  return Val_int (retval);
}

CAMLprim value
ml_UnitSync_initDirListVFS (value api_val, value path_val, value pattern_val, value modes_val)
{
  struct unitsync *api = UnitSync_val (api_val);
  preconditions (api);
  const char* path = String_val (path_val);
  const char* pattern = String_val (pattern_val);
  const char* modes = String_val (modes_val);
  int retval = api->InitDirListVFS (path, pattern, modes);
  postconditions (api);
  return Val_int (retval);
}

CAMLprim value
ml_UnitSync_initSubDirsVFS (value api_val, value path_val, value pattern_val, value modes_val)
{
  struct unitsync *api = UnitSync_val (api_val);
  preconditions (api);
  const char* path = String_val (path_val);
  const char* pattern = String_val (pattern_val);
  const char* modes = String_val (modes_val);
  int retval = api->InitSubDirsVFS (path, pattern, modes);
  postconditions (api);
  return Val_int (retval);
}

CAMLprim value
ml_UnitSync_openArchive (value api_val, value name_val)
{
  struct unitsync *api = UnitSync_val (api_val);
  preconditions (api);
  const char* name = String_val (name_val);
  int retval = api->OpenArchive (name);
  postconditions (api);
  return Val_int (retval);
}

CAMLprim value
ml_UnitSync_openArchiveType (value api_val, value name_val, value type_val)
{
  struct unitsync *api = UnitSync_val (api_val);
  preconditions (api);
  const char* name = String_val (name_val);
  const char* type = String_val (type_val);
  int retval = api->OpenArchiveType (name, type);
  postconditions (api);
  return Val_int (retval);
}

CAMLprim value
ml_UnitSync_closeArchive (value api_val, value archive_val)
{
  struct unitsync *api = UnitSync_val (api_val);
  preconditions (api);
  int archive = Int_val (archive_val);
  api->CloseArchive (archive);
  postconditions (api);
  return Val_unit;
}

CAMLprim value
ml_UnitSync_openArchiveFile (value api_val, value archive_val, value name_val)
{
  struct unitsync *api = UnitSync_val (api_val);
  preconditions (api);
  int archive = Int_val (archive_val);
  const char* name = String_val (name_val);
  int retval = api->OpenArchiveFile (archive, name);
  postconditions (api);
  return Val_int (retval);
}

CAMLprim value
ml_UnitSync_closeArchiveFile (value api_val, value archive_val, value file_val)
{
  struct unitsync *api = UnitSync_val (api_val);
  preconditions (api);
  int archive = Int_val (archive_val);
  int file = Int_val (file_val);
  api->CloseArchiveFile (archive, file);
  postconditions (api);
  return Val_unit;
}

CAMLprim value
ml_UnitSync_sizeArchiveFile (value api_val, value archive_val, value file_val)
{
  struct unitsync *api = UnitSync_val (api_val);
  preconditions (api);
  int archive = Int_val (archive_val);
  int file = Int_val (file_val);
  int retval = api->SizeArchiveFile (archive, file);
  postconditions (api);
  return Val_int (retval);
}

CAMLprim value
ml_UnitSync_setSpringConfigFile (value api_val, value fileNameAsAbsolutePath_val)
{
  struct unitsync *api = UnitSync_val (api_val);
  preconditions (api);
  const char* fileNameAsAbsolutePath = String_val (fileNameAsAbsolutePath_val);
  api->SetSpringConfigFile (fileNameAsAbsolutePath);
  postconditions (api);
  return Val_unit;
}

CAMLprim value
ml_UnitSync_getSpringConfigFile (value api_val)
{
  struct unitsync *api = UnitSync_val (api_val);
  preconditions (api);
  const char* retval = api->GetSpringConfigFile ();
  postconditions (api);
  return caml_copy_string (retval);
}

CAMLprim value
ml_UnitSync_getSpringConfigString (value api_val, value name_val, value defValue_val)
{
  struct unitsync *api = UnitSync_val (api_val);
  preconditions (api);
  const char* name = String_val (name_val);
  const char* defValue = String_val (defValue_val);
  const char* retval = api->GetSpringConfigString (name, defValue);
  postconditions (api);
  return caml_copy_string (retval);
}

CAMLprim value
ml_UnitSync_getSpringConfigInt (value api_val, value name_val, value defValue_val)
{
  struct unitsync *api = UnitSync_val (api_val);
  preconditions (api);
  const char* name = String_val (name_val);
  const int defValue = Int_val (defValue_val);
  int retval = api->GetSpringConfigInt (name, defValue);
  postconditions (api);
  return Val_int (retval);
}

CAMLprim value
ml_UnitSync_getSpringConfigFloat (value api_val, value name_val, value defValue_val)
{
  struct unitsync *api = UnitSync_val (api_val);
  preconditions (api);
  const char* name = String_val (name_val);
  const float defValue = Double_val (defValue_val);
  float retval = api->GetSpringConfigFloat (name, defValue);
  postconditions (api);
  return make_double_val (retval);
}

CAMLprim value
ml_UnitSync_setSpringConfigString (value api_val, value name_val, value value_val)
{
  struct unitsync *api = UnitSync_val (api_val);
  preconditions (api);
  const char* name = String_val (name_val);
  const char* value = String_val (value_val);
  api->SetSpringConfigString (name, value);
  postconditions (api);
  return Val_unit;
}

CAMLprim value
ml_UnitSync_setSpringConfigInt (value api_val, value name_val, value value_val)
{
  struct unitsync *api = UnitSync_val (api_val);
  preconditions (api);
  const char* name = String_val (name_val);
  const int value = Int_val (value_val);
  api->SetSpringConfigInt (name, value);
  postconditions (api);
  return Val_unit;
}

CAMLprim value
ml_UnitSync_setSpringConfigFloat (value api_val, value name_val, value value_val)
{
  struct unitsync *api = UnitSync_val (api_val);
  preconditions (api);
  const char* name = String_val (name_val);
  const float value = Double_val (value_val);
  api->SetSpringConfigFloat (name, value);
  postconditions (api);
  return Val_unit;
}

CAMLprim value
ml_UnitSync_lpClose (value api_val)
{
  struct unitsync *api = UnitSync_val (api_val);
  preconditions (api);
  api->lpClose ();
  postconditions (api);
  return Val_unit;
}

CAMLprim value
ml_UnitSync_lpOpenFile (value api_val, value fileName_val, value fileModes_val, value accessModes_val)
{
  struct unitsync *api = UnitSync_val (api_val);
  preconditions (api);
  const char* fileName = String_val (fileName_val);
  const char* fileModes = String_val (fileModes_val);
  const char* accessModes = String_val (accessModes_val);
  int retval = api->lpOpenFile (fileName, fileModes, accessModes);
  postconditions (api);
  return Val_int (retval);
}

CAMLprim value
ml_UnitSync_lpOpenSource (value api_val, value source_val, value accessModes_val)
{
  struct unitsync *api = UnitSync_val (api_val);
  preconditions (api);
  const char* source = String_val (source_val);
  const char* accessModes = String_val (accessModes_val);
  int retval = api->lpOpenSource (source, accessModes);
  postconditions (api);
  return Val_int (retval);
}

CAMLprim value
ml_UnitSync_lpExecute (value api_val)
{
  struct unitsync *api = UnitSync_val (api_val);
  preconditions (api);
  int retval = api->lpExecute ();
  postconditions (api);
  return Val_int (retval);
}

CAMLprim value
ml_UnitSync_lpErrorLog (value api_val)
{
  struct unitsync *api = UnitSync_val (api_val);
  preconditions (api);
  const char* retval = api->lpErrorLog ();
  postconditions (api);
  return caml_copy_string (retval);
}

CAMLprim value
ml_UnitSync_lpAddTableInt (value api_val, value key_val, value override_val)
{
  struct unitsync *api = UnitSync_val (api_val);
  preconditions (api);
  int key = Int_val (key_val);
  int override = Int_val (override_val);
  api->lpAddTableInt (key, override);
  postconditions (api);
  return Val_unit;
}

CAMLprim value
ml_UnitSync_lpAddTableStr (value api_val, value key_val, value override_val)
{
  struct unitsync *api = UnitSync_val (api_val);
  preconditions (api);
  const char* key = String_val (key_val);
  int override = Int_val (override_val);
  api->lpAddTableStr (key, override);
  postconditions (api);
  return Val_unit;
}

CAMLprim value
ml_UnitSync_lpEndTable (value api_val)
{
  struct unitsync *api = UnitSync_val (api_val);
  preconditions (api);
  api->lpEndTable ();
  postconditions (api);
  return Val_unit;
}

CAMLprim value
ml_UnitSync_lpAddIntKeyIntVal (value api_val, value key_val, value value_val)
{
  struct unitsync *api = UnitSync_val (api_val);
  preconditions (api);
  int key = Int_val (key_val);
  int value = Int_val (value_val);
  api->lpAddIntKeyIntVal (key, value);
  postconditions (api);
  return Val_unit;
}

CAMLprim value
ml_UnitSync_lpAddStrKeyIntVal (value api_val, value key_val, value value_val)
{
  struct unitsync *api = UnitSync_val (api_val);
  preconditions (api);
  const char* key = String_val (key_val);
  int value = Int_val (value_val);
  api->lpAddStrKeyIntVal (key, value);
  postconditions (api);
  return Val_unit;
}

CAMLprim value
ml_UnitSync_lpAddIntKeyBoolVal (value api_val, value key_val, value value_val)
{
  struct unitsync *api = UnitSync_val (api_val);
  preconditions (api);
  int key = Int_val (key_val);
  int value = Int_val (value_val);
  api->lpAddIntKeyBoolVal (key, value);
  postconditions (api);
  return Val_unit;
}

CAMLprim value
ml_UnitSync_lpAddStrKeyBoolVal (value api_val, value key_val, value value_val)
{
  struct unitsync *api = UnitSync_val (api_val);
  preconditions (api);
  const char* key = String_val (key_val);
  int value = Int_val (value_val);
  api->lpAddStrKeyBoolVal (key, value);
  postconditions (api);
  return Val_unit;
}

CAMLprim value
ml_UnitSync_lpAddIntKeyFloatVal (value api_val, value key_val, value value_val)
{
  struct unitsync *api = UnitSync_val (api_val);
  preconditions (api);
  int key = Int_val (key_val);
  float value = Double_val (value_val);
  api->lpAddIntKeyFloatVal (key, value);
  postconditions (api);
  return Val_unit;
}

CAMLprim value
ml_UnitSync_lpAddStrKeyFloatVal (value api_val, value key_val, value value_val)
{
  struct unitsync *api = UnitSync_val (api_val);
  preconditions (api);
  const char* key = String_val (key_val);
  float value = Double_val (value_val);
  api->lpAddStrKeyFloatVal (key, value);
  postconditions (api);
  return Val_unit;
}

CAMLprim value
ml_UnitSync_lpAddIntKeyStrVal (value api_val, value key_val, value value_val)
{
  struct unitsync *api = UnitSync_val (api_val);
  preconditions (api);
  int key = Int_val (key_val);
  const char* value = String_val (value_val);
  api->lpAddIntKeyStrVal (key, value);
  postconditions (api);
  return Val_unit;
}

CAMLprim value
ml_UnitSync_lpAddStrKeyStrVal (value api_val, value key_val, value value_val)
{
  struct unitsync *api = UnitSync_val (api_val);
  preconditions (api);
  const char* key = String_val (key_val);
  const char* value = String_val (value_val);
  api->lpAddStrKeyStrVal (key, value);
  postconditions (api);
  return Val_unit;
}

CAMLprim value
ml_UnitSync_lpRootTable (value api_val)
{
  struct unitsync *api = UnitSync_val (api_val);
  preconditions (api);
  int retval = api->lpRootTable ();
  postconditions (api);
  return Val_int (retval);
}

CAMLprim value
ml_UnitSync_lpRootTableExpr (value api_val, value expr_val)
{
  struct unitsync *api = UnitSync_val (api_val);
  preconditions (api);
  const char* expr = String_val (expr_val);
  int retval = api->lpRootTableExpr (expr);
  postconditions (api);
  return Val_int (retval);
}

CAMLprim value
ml_UnitSync_lpSubTableInt (value api_val, value key_val)
{
  struct unitsync *api = UnitSync_val (api_val);
  preconditions (api);
  int key = Int_val (key_val);
  int retval = api->lpSubTableInt (key);
  postconditions (api);
  return Val_int (retval);
}

CAMLprim value
ml_UnitSync_lpSubTableStr (value api_val, value key_val)
{
  struct unitsync *api = UnitSync_val (api_val);
  preconditions (api);
  const char* key = String_val (key_val);
  int retval = api->lpSubTableStr (key);
  postconditions (api);
  return Val_int (retval);
}

CAMLprim value
ml_UnitSync_lpSubTableExpr (value api_val, value expr_val)
{
  struct unitsync *api = UnitSync_val (api_val);
  preconditions (api);
  const char* expr = String_val (expr_val);
  int retval = api->lpSubTableExpr (expr);
  postconditions (api);
  return Val_int (retval);
}

CAMLprim value
ml_UnitSync_lpPopTable (value api_val)
{
  struct unitsync *api = UnitSync_val (api_val);
  preconditions (api);
  api->lpPopTable ();
  postconditions (api);
  return Val_unit;
}

CAMLprim value
ml_UnitSync_lpGetKeyExistsInt (value api_val, value key_val)
{
  struct unitsync *api = UnitSync_val (api_val);
  preconditions (api);
  int key = Int_val (key_val);
  int retval = api->lpGetKeyExistsInt (key);
  postconditions (api);
  return Val_int (retval);
}

CAMLprim value
ml_UnitSync_lpGetKeyExistsStr (value api_val, value key_val)
{
  struct unitsync *api = UnitSync_val (api_val);
  preconditions (api);
  const char* key = String_val (key_val);
  int retval = api->lpGetKeyExistsStr (key);
  postconditions (api);
  return Val_int (retval);
}

CAMLprim value
ml_UnitSync_lpGetIntKeyType (value api_val, value key_val)
{
  struct unitsync *api = UnitSync_val (api_val);
  preconditions (api);
  int key = Int_val (key_val);
  int retval = api->lpGetIntKeyType (key);
  postconditions (api);
  return Val_int (retval);
}

CAMLprim value
ml_UnitSync_lpGetStrKeyType (value api_val, value key_val)
{
  struct unitsync *api = UnitSync_val (api_val);
  preconditions (api);
  const char* key = String_val (key_val);
  int retval = api->lpGetStrKeyType (key);
  postconditions (api);
  return Val_int (retval);
}

CAMLprim value
ml_UnitSync_lpGetIntKeyListCount (value api_val)
{
  struct unitsync *api = UnitSync_val (api_val);
  preconditions (api);
  int retval = api->lpGetIntKeyListCount ();
  postconditions (api);
  return Val_int (retval);
}

CAMLprim value
ml_UnitSync_lpGetIntKeyListEntry (value api_val, value index_val)
{
  struct unitsync *api = UnitSync_val (api_val);
  preconditions (api);
  int index = Int_val (index_val);
  int retval = api->lpGetIntKeyListEntry (index);
  postconditions (api);
  return Val_int (retval);
}

CAMLprim value
ml_UnitSync_lpGetStrKeyListCount (value api_val)
{
  struct unitsync *api = UnitSync_val (api_val);
  preconditions (api);
  int retval = api->lpGetStrKeyListCount ();
  postconditions (api);
  return Val_int (retval);
}

CAMLprim value
ml_UnitSync_lpGetStrKeyListEntry (value api_val, value index_val)
{
  struct unitsync *api = UnitSync_val (api_val);
  preconditions (api);
  int index = Int_val (index_val);
  const char* retval = api->lpGetStrKeyListEntry (index);
  postconditions (api);
  return caml_copy_string (retval);
}

CAMLprim value
ml_UnitSync_lpGetIntKeyIntVal (value api_val, value key_val, value defValue_val)
{
  struct unitsync *api = UnitSync_val (api_val);
  preconditions (api);
  int key = Int_val (key_val);
  int defValue = Int_val (defValue_val);
  int retval = api->lpGetIntKeyIntVal (key, defValue);
  postconditions (api);
  return Val_int (retval);
}

CAMLprim value
ml_UnitSync_lpGetStrKeyIntVal (value api_val, value key_val, value defValue_val)
{
  struct unitsync *api = UnitSync_val (api_val);
  preconditions (api);
  const char* key = String_val (key_val);
  int defValue = Int_val (defValue_val);
  int retval = api->lpGetStrKeyIntVal (key, defValue);
  postconditions (api);
  return Val_int (retval);
}

CAMLprim value
ml_UnitSync_lpGetIntKeyBoolVal (value api_val, value key_val, value defValue_val)
{
  struct unitsync *api = UnitSync_val (api_val);
  preconditions (api);
  int key = Int_val (key_val);
  int defValue = Int_val (defValue_val);
  int retval = api->lpGetIntKeyBoolVal (key, defValue);
  postconditions (api);
  return Val_int (retval);
}

CAMLprim value
ml_UnitSync_lpGetStrKeyBoolVal (value api_val, value key_val, value defValue_val)
{
  struct unitsync *api = UnitSync_val (api_val);
  preconditions (api);
  const char* key = String_val (key_val);
  int defValue = Int_val (defValue_val);
  int retval = api->lpGetStrKeyBoolVal (key, defValue);
  postconditions (api);
  return Val_int (retval);
}

CAMLprim value
ml_UnitSync_lpGetIntKeyFloatVal (value api_val, value key_val, value defValue_val)
{
  struct unitsync *api = UnitSync_val (api_val);
  preconditions (api);
  int key = Int_val (key_val);
  float defValue = Double_val (defValue_val);
  float retval = api->lpGetIntKeyFloatVal (key, defValue);
  postconditions (api);
  return make_double_val (retval);
}

CAMLprim value
ml_UnitSync_lpGetStrKeyFloatVal (value api_val, value key_val, value defValue_val)
{
  struct unitsync *api = UnitSync_val (api_val);
  preconditions (api);
  const char* key = String_val (key_val);
  float defValue = Double_val (defValue_val);
  float retval = api->lpGetStrKeyFloatVal (key, defValue);
  postconditions (api);
  return make_double_val (retval);
}

CAMLprim value
ml_UnitSync_lpGetIntKeyStrVal (value api_val, value key_val, value defValue_val)
{
  struct unitsync *api = UnitSync_val (api_val);
  preconditions (api);
  int key = Int_val (key_val);
  const char* defValue = String_val (defValue_val);
  const char* retval = api->lpGetIntKeyStrVal (key, defValue);
  postconditions (api);
  return caml_copy_string (retval);
}

CAMLprim value
ml_UnitSync_lpGetStrKeyStrVal (value api_val, value key_val, value defValue_val)
{
  struct unitsync *api = UnitSync_val (api_val);
  preconditions (api);
  const char* key = String_val (key_val);
  const char* defValue = String_val (defValue_val);
  const char* retval = api->lpGetStrKeyStrVal (key, defValue);
  postconditions (api);
  return caml_copy_string (retval);
}
#endif

#if 0 /* ocaml code */
external getNextError : t -> string = "ml_UnitSync_getNextError"
external getSpringVersion : t -> string = "ml_UnitSync_getSpringVersion"
external getSpringVersionPatchset : t -> string = "ml_UnitSync_getSpringVersionPatchset"
external isSpringReleaseVersion : t -> bool = "ml_UnitSync_isSpringReleaseVersion"
external init : t -> bool -> int -> int = "ml_UnitSync_init"
external unInit : t -> unit = "ml_UnitSync_unInit"
external getWritableDataDirectory : t -> string = "ml_UnitSync_getWritableDataDirectory"
external getDataDirectoryCount : t -> int = "ml_UnitSync_getDataDirectoryCount"
external getDataDirectory : t -> int -> string = "ml_UnitSync_getDataDirectory"
external processUnits : t -> int = "ml_UnitSync_processUnits"
external processUnitsNoChecksum : t -> int = "ml_UnitSync_processUnitsNoChecksum"
external getUnitCount : t -> int = "ml_UnitSync_getUnitCount"
external getUnitName : t -> int -> string = "ml_UnitSync_getUnitName"
external getFullUnitName : t -> int -> string = "ml_UnitSync_getFullUnitName"
external addArchive : t -> string -> unit = "ml_UnitSync_addArchive"
external addAllArchives : t -> string -> unit = "ml_UnitSync_addAllArchives"
external removeAllArchives : t -> unit = "ml_UnitSync_removeAllArchives"
external getArchiveChecksum : t -> string -> int = "ml_UnitSync_getArchiveChecksum"
external getArchivePath : t -> string -> string = "ml_UnitSync_getArchivePath"
external getMapCount : t -> int = "ml_UnitSync_getMapCount"
external getMapName : t -> int -> string = "ml_UnitSync_getMapName"
external getMapFileName : t -> int -> string = "ml_UnitSync_getMapFileName"
external getMapDescription : t -> int -> string = "ml_UnitSync_getMapDescription"
external getMapAuthor : t -> int -> string = "ml_UnitSync_getMapAuthor"
external getMapWidth : t -> int -> int = "ml_UnitSync_getMapWidth"
external getMapHeight : t -> int -> int = "ml_UnitSync_getMapHeight"
external getMapTidalStrength : t -> int -> int = "ml_UnitSync_getMapTidalStrength"
external getMapWindMin : t -> int -> int = "ml_UnitSync_getMapWindMin"
external getMapWindMax : t -> int -> int = "ml_UnitSync_getMapWindMax"
external getMapGravity : t -> int -> int = "ml_UnitSync_getMapGravity"
external getMapResourceCount : t -> int -> int = "ml_UnitSync_getMapResourceCount"
external getMapResourceName : t -> int -> int -> string = "ml_UnitSync_getMapResourceName"
external getMapResourceMax : t -> int -> int -> float = "ml_UnitSync_getMapResourceMax"
external getMapResourceExtractorRadius : t -> int -> int -> int = "ml_UnitSync_getMapResourceExtractorRadius"
external getMapPosCount : t -> int -> int = "ml_UnitSync_getMapPosCount"
external getMapPosX : t -> int -> int -> float = "ml_UnitSync_getMapPosX"
external getMapPosZ : t -> int -> int -> float = "ml_UnitSync_getMapPosZ"
external getMapMinHeight : t -> string -> float = "ml_UnitSync_getMapMinHeight"
external getMapMaxHeight : t -> string -> float = "ml_UnitSync_getMapMaxHeight"
external getMapArchiveCount : t -> string -> int = "ml_UnitSync_getMapArchiveCount"
external getMapArchiveName : t -> int -> string = "ml_UnitSync_getMapArchiveName"
external getMapChecksum : t -> int -> int = "ml_UnitSync_getMapChecksum"
external getMapChecksumFromName : t -> string -> int = "ml_UnitSync_getMapChecksumFromName"
external getSkirmishAICount : t -> int = "ml_UnitSync_getSkirmishAICount"
external getSkirmishAIInfoCount : t -> int -> int = "ml_UnitSync_getSkirmishAIInfoCount"
external getInfoKey : t -> int -> string = "ml_UnitSync_getInfoKey"
external getInfoType : t -> int -> string = "ml_UnitSync_getInfoType"
external getInfoValue : t -> int -> string = "ml_UnitSync_getInfoValue"
external getInfoValueString : t -> int -> string = "ml_UnitSync_getInfoValueString"
external getInfoValueInteger : t -> int -> int = "ml_UnitSync_getInfoValueInteger"
external getInfoValueFloat : t -> int -> float = "ml_UnitSync_getInfoValueFloat"
external getInfoValueBool : t -> int -> bool = "ml_UnitSync_getInfoValueBool"
external getInfoDescription : t -> int -> string = "ml_UnitSync_getInfoDescription"
external getSkirmishAIOptionCount : t -> int -> int = "ml_UnitSync_getSkirmishAIOptionCount"
external getPrimaryModCount : t -> int = "ml_UnitSync_getPrimaryModCount"
external getPrimaryModInfoCount : t -> int -> int = "ml_UnitSync_getPrimaryModInfoCount"
external getPrimaryModName : t -> int -> string = "ml_UnitSync_getPrimaryModName"
external getPrimaryModShortName : t -> int -> string = "ml_UnitSync_getPrimaryModShortName"
external getPrimaryModVersion : t -> int -> string = "ml_UnitSync_getPrimaryModVersion"
external getPrimaryModMutator : t -> int -> string = "ml_UnitSync_getPrimaryModMutator"
external getPrimaryModGame : t -> int -> string = "ml_UnitSync_getPrimaryModGame"
external getPrimaryModShortGame : t -> int -> string = "ml_UnitSync_getPrimaryModShortGame"
external getPrimaryModDescription : t -> int -> string = "ml_UnitSync_getPrimaryModDescription"
external getPrimaryModArchive : t -> int -> string = "ml_UnitSync_getPrimaryModArchive"
external getPrimaryModArchiveCount : t -> int -> int = "ml_UnitSync_getPrimaryModArchiveCount"
external getPrimaryModArchiveList : t -> int -> string = "ml_UnitSync_getPrimaryModArchiveList"
external getPrimaryModIndex : t -> string -> int = "ml_UnitSync_getPrimaryModIndex"
external getPrimaryModChecksum : t -> int -> int = "ml_UnitSync_getPrimaryModChecksum"
external getPrimaryModChecksumFromName : t -> string -> int = "ml_UnitSync_getPrimaryModChecksumFromName"
external getSideCount : t -> int = "ml_UnitSync_getSideCount"
external getSideName : t -> int -> string = "ml_UnitSync_getSideName"
external getSideStartUnit : t -> int -> string = "ml_UnitSync_getSideStartUnit"
external getMapOptionCount : t -> string -> int = "ml_UnitSync_getMapOptionCount"
external getModOptionCount : t -> int = "ml_UnitSync_getModOptionCount"
external getCustomOptionCount : t -> string -> int = "ml_UnitSync_getCustomOptionCount"
external getOptionKey : t -> int -> string = "ml_UnitSync_getOptionKey"
external getOptionScope : t -> int -> string = "ml_UnitSync_getOptionScope"
external getOptionName : t -> int -> string = "ml_UnitSync_getOptionName"
external getOptionSection : t -> int -> string = "ml_UnitSync_getOptionSection"
external getOptionStyle : t -> int -> string = "ml_UnitSync_getOptionStyle"
external getOptionDesc : t -> int -> string = "ml_UnitSync_getOptionDesc"
external getOptionType : t -> int -> int = "ml_UnitSync_getOptionType"
external getOptionBoolDef : t -> int -> int = "ml_UnitSync_getOptionBoolDef"
external getOptionNumberDef : t -> int -> float = "ml_UnitSync_getOptionNumberDef"
external getOptionNumberMin : t -> int -> float = "ml_UnitSync_getOptionNumberMin"
external getOptionNumberMax : t -> int -> float = "ml_UnitSync_getOptionNumberMax"
external getOptionNumberStep : t -> int -> float = "ml_UnitSync_getOptionNumberStep"
external getOptionStringDef : t -> int -> string = "ml_UnitSync_getOptionStringDef"
external getOptionStringMaxLen : t -> int -> int = "ml_UnitSync_getOptionStringMaxLen"
external getOptionListCount : t -> int -> int = "ml_UnitSync_getOptionListCount"
external getOptionListDef : t -> int -> string = "ml_UnitSync_getOptionListDef"
external getOptionListItemKey : t -> int -> int -> string = "ml_UnitSync_getOptionListItemKey"
external getOptionListItemName : t -> int -> int -> string = "ml_UnitSync_getOptionListItemName"
external getOptionListItemDesc : t -> int -> int -> string = "ml_UnitSync_getOptionListItemDesc"
external getModValidMapCount : t -> int = "ml_UnitSync_getModValidMapCount"
external getModValidMap : t -> int -> string = "ml_UnitSync_getModValidMap"
external openFileVFS : t -> string -> int = "ml_UnitSync_openFileVFS"
external closeFileVFS : t -> int -> unit = "ml_UnitSync_closeFileVFS"
external fileSizeVFS : t -> int -> int = "ml_UnitSync_fileSizeVFS"
external initFindVFS : t -> string -> int = "ml_UnitSync_initFindVFS"
external initDirListVFS : t -> string -> string -> string -> int = "ml_UnitSync_initDirListVFS"
external initSubDirsVFS : t -> string -> string -> string -> int = "ml_UnitSync_initSubDirsVFS"
external openArchive : t -> string -> int = "ml_UnitSync_openArchive"
external openArchiveType : t -> string -> string -> int = "ml_UnitSync_openArchiveType"
external closeArchive : t -> int -> unit = "ml_UnitSync_closeArchive"
external openArchiveFile : t -> int -> string -> int = "ml_UnitSync_openArchiveFile"
external closeArchiveFile : t -> int -> int -> unit = "ml_UnitSync_closeArchiveFile"
external sizeArchiveFile : t -> int -> int -> int = "ml_UnitSync_sizeArchiveFile"
external setSpringConfigFile : t -> string -> unit = "ml_UnitSync_setSpringConfigFile"
external getSpringConfigFile : t -> string = "ml_UnitSync_getSpringConfigFile"
external getSpringConfigString : t -> string -> string -> string = "ml_UnitSync_getSpringConfigString"
external getSpringConfigInt : t -> string -> int -> int = "ml_UnitSync_getSpringConfigInt"
external getSpringConfigFloat : t -> string -> float -> float = "ml_UnitSync_getSpringConfigFloat"
external setSpringConfigString : t -> string -> string -> unit = "ml_UnitSync_setSpringConfigString"
external setSpringConfigInt : t -> string -> int -> unit = "ml_UnitSync_setSpringConfigInt"
external setSpringConfigFloat : t -> string -> float -> unit = "ml_UnitSync_setSpringConfigFloat"
external lpClose : t -> unit = "ml_UnitSync_lpClose"
external lpOpenFile : t -> string -> string -> string -> int = "ml_UnitSync_lpOpenFile"
external lpOpenSource : t -> string -> string -> int = "ml_UnitSync_lpOpenSource"
external lpExecute : t -> int = "ml_UnitSync_lpExecute"
external lpErrorLog : t -> string = "ml_UnitSync_lpErrorLog"
external lpAddTableInt : t -> int -> int -> unit = "ml_UnitSync_lpAddTableInt"
external lpAddTableStr : t -> string -> int -> unit = "ml_UnitSync_lpAddTableStr"
external lpEndTable : t -> unit = "ml_UnitSync_lpEndTable"
external lpAddIntKeyIntVal : t -> int -> int -> unit = "ml_UnitSync_lpAddIntKeyIntVal"
external lpAddStrKeyIntVal : t -> string -> int -> unit = "ml_UnitSync_lpAddStrKeyIntVal"
external lpAddIntKeyBoolVal : t -> int -> int -> unit = "ml_UnitSync_lpAddIntKeyBoolVal"
external lpAddStrKeyBoolVal : t -> string -> int -> unit = "ml_UnitSync_lpAddStrKeyBoolVal"
external lpAddIntKeyFloatVal : t -> int -> float -> unit = "ml_UnitSync_lpAddIntKeyFloatVal"
external lpAddStrKeyFloatVal : t -> string -> float -> unit = "ml_UnitSync_lpAddStrKeyFloatVal"
external lpAddIntKeyStrVal : t -> int -> string -> unit = "ml_UnitSync_lpAddIntKeyStrVal"
external lpAddStrKeyStrVal : t -> string -> string -> unit = "ml_UnitSync_lpAddStrKeyStrVal"
external lpRootTable : t -> int = "ml_UnitSync_lpRootTable"
external lpRootTableExpr : t -> string -> int = "ml_UnitSync_lpRootTableExpr"
external lpSubTableInt : t -> int -> int = "ml_UnitSync_lpSubTableInt"
external lpSubTableStr : t -> string -> int = "ml_UnitSync_lpSubTableStr"
external lpSubTableExpr : t -> string -> int = "ml_UnitSync_lpSubTableExpr"
external lpPopTable : t -> unit = "ml_UnitSync_lpPopTable"
external lpGetKeyExistsInt : t -> int -> int = "ml_UnitSync_lpGetKeyExistsInt"
external lpGetKeyExistsStr : t -> string -> int = "ml_UnitSync_lpGetKeyExistsStr"
external lpGetIntKeyType : t -> int -> int = "ml_UnitSync_lpGetIntKeyType"
external lpGetStrKeyType : t -> string -> int = "ml_UnitSync_lpGetStrKeyType"
external lpGetIntKeyListCount : t -> int = "ml_UnitSync_lpGetIntKeyListCount"
external lpGetIntKeyListEntry : t -> int -> int = "ml_UnitSync_lpGetIntKeyListEntry"
external lpGetStrKeyListCount : t -> int = "ml_UnitSync_lpGetStrKeyListCount"
external lpGetStrKeyListEntry : t -> int -> string = "ml_UnitSync_lpGetStrKeyListEntry"
external lpGetIntKeyIntVal : t -> int -> int -> int = "ml_UnitSync_lpGetIntKeyIntVal"
external lpGetStrKeyIntVal : t -> string -> int -> int = "ml_UnitSync_lpGetStrKeyIntVal"
external lpGetIntKeyBoolVal : t -> int -> int -> int = "ml_UnitSync_lpGetIntKeyBoolVal"
external lpGetStrKeyBoolVal : t -> string -> int -> int = "ml_UnitSync_lpGetStrKeyBoolVal"
external lpGetIntKeyFloatVal : t -> int -> float -> float = "ml_UnitSync_lpGetIntKeyFloatVal"
external lpGetStrKeyFloatVal : t -> string -> float -> float = "ml_UnitSync_lpGetStrKeyFloatVal"
external lpGetIntKeyStrVal : t -> int -> string -> string = "ml_UnitSync_lpGetIntKeyStrVal"
external lpGetStrKeyStrVal : t -> string -> string -> string = "ml_UnitSync_lpGetStrKeyStrVal"
#endif
