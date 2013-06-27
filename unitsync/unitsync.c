#include <math.h>

#include <caml/alloc.h>
#include <caml/custom.h>
#include <caml/fail.h>
#include <caml/mlvalues.h>

#define UnitSync_val(v) (((struct unitsync *) Data_custom_val (v)))


static value
make_double_val (double f)
{
  return caml_copy_double (round (f * 100000) / 100000);
}


#define CLIENT 1
#include "unitsync_api.c"


static void
unitsync_finalize (value apival)
{
  struct unitsync *api = UnitSync_val (apival);
  api->UnInit ();
  unload_unitsync (api);
}


struct custom_operations unitsync_ops = {
  "UnitSync library",
  unitsync_finalize,
  custom_compare_default,
  custom_hash_default,
  custom_serialize_default,
  custom_deserialize_default,
  custom_compare_ext_default,
};


static void
preconditions (struct unitsync *api)
{
  if (!api->lib)
    failwith ("unitsync library not initialised");
  char const *err = api->GetNextError ();
  if (err)
    failwith (err);
}

static void
postconditions (struct unitsync *api)
{
  preconditions (api);
}


CAMLprim value
ml_UnitSync_load (value dll, value isServer)
{
  value apival = caml_alloc_custom (&unitsync_ops, sizeof (struct unitsync), 0, 1);

  struct unitsync *api = UnitSync_val (apival);
  char const *err = load_unitsync (String_val (dll), api);
  if (err)
    failwith (err);

  api->Init (Bool_val (isServer), 0);

  return apival;
}
