#include <gsl/gsl_randist.h>

double* gsl_ran_dir_nd_shim(gsl_rng* r, size_t n) {
  double* x = (double*)malloc(n * sizeof(double));
  gsl_ran_dir_nd(r, n, x);
  return x;
}

unsigned int* gsl_ran_multinomial_shim
  (gsl_rng* r, size_t k, unsigned int n, double* p) 
{
  unsigned int* nv = (unsigned int*)malloc(k * sizeof(unsigned int));
  if (nv == NULL) {
    return NULL;
  }

  gsl_ran_multinomial(r, k, n, p, nv);
  return nv;
}