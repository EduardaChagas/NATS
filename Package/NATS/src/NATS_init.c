#include <stdlib.h>
#include <R_ext/Rdynload.h>
#include <R.h>
#include <Rinternals.h>
#include <Rmath.h>


/* FIXME: 
   Check these declarations against the C/Fortran source code.
*/

/* .C calls */
extern SEXP BandtPompe(SEXP *, SEXP *, SEXP *);

static const R_CMethodDef CEntries[] = {
    {"BandtPompe", (DL_FUNC) &BandtPompe, 3},
    {NULL, NULL, 0}
};

void R_init_statcomp(DllInfo *dll)
{
    R_registerRoutines(dll, CEntries, NULL, NULL, NULL);
    R_useDynamicSymbols(dll, FALSE);
}
