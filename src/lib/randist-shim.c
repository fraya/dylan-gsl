#include <gsl/gsl_randist.h>

double* gsl_ran_dir_nd_shim(gsl_rng* r, size_t n) {
  double* x = (double*)malloc(n * sizeof(double));
  gsl_ran_dir_nd(r, n, x);
  return x;
}