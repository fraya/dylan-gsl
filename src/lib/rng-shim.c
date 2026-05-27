#include <gsl/gsl_rng.h>

gsl_rng_type* gsl_rng_default_shim () {
  return gsl_rng_default;
}

unsigned long int gsl_rng_default_seed_shim () {
  return gsl_rng_default_seed;
}

