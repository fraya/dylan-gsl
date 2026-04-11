#include <stdio.h>
#include <stdlib.h>
#include <gsl/gsl_complex.h>
#include <gsl/gsl_complex_math.h>

gsl_complex* gsl_complex_shim (double r, double i) {
  gsl_complex *c = (gsl_complex *)calloc(1, sizeof(gsl_complex));
  if (c != NULL) {
    GSL_SET_COMPLEX(c, r, i);
  }
  return c;
}

double gsl_complex_real_shim (gsl_complex *c) {
  return GSL_REAL(*c);
}

double gsl_complex_imag_shim (gsl_complex *c) {
  return GSL_IMAG(*c);
}

gsl_complex* gsl_complex_polar_shim (double r, double i) {
  gsl_complex p  = gsl_complex_polar(r, i);
  gsl_complex *c = (gsl_complex *)calloc(1,sizeof(gsl_complex));
  GSL_SET_COMPLEX(c, GSL_REAL(p), GSL_IMAG(p));
  return c;
}

#define DEFINE_GSL_COMPLEX_PROPERTY_SHIM(name) \
double gsl_complex_##name##_shim (gsl_complex* x) { \
  return gsl_complex_##name(*x); \
}

DEFINE_GSL_COMPLEX_PROPERTY_SHIM(arg)
DEFINE_GSL_COMPLEX_PROPERTY_SHIM(abs)
DEFINE_GSL_COMPLEX_PROPERTY_SHIM(abs2)
DEFINE_GSL_COMPLEX_PROPERTY_SHIM(logabs)

#define DEFINE_GSL_COMPLEX_BINARY_OPERATOR_SHIM(name) \
gsl_complex* gsl_complex_##name##_shim (gsl_complex *a, gsl_complex *b) {  \
  gsl_complex c  = gsl_complex_##name(*a, *b); \
  gsl_complex *r = (gsl_complex *)malloc(sizeof(gsl_complex)); \
  GSL_SET_COMPLEX(r, GSL_REAL(c), GSL_IMAG(c)); \
  return r; \
}

DEFINE_GSL_COMPLEX_BINARY_OPERATOR_SHIM(add)
DEFINE_GSL_COMPLEX_BINARY_OPERATOR_SHIM(sub)
DEFINE_GSL_COMPLEX_BINARY_OPERATOR_SHIM(mul)
DEFINE_GSL_COMPLEX_BINARY_OPERATOR_SHIM(div)

// Macro to make operations (+,-,*,/) between a complex number and a
// double (real o imaginary part)

#define DEFINE_GSL_COMPLEX_BINARY_OPERATOR_WITH_REAL_SHIM(name) \
gsl_complex* gsl_complex_##name##_shim (gsl_complex *a, double x) { \
  gsl_complex c  = gsl_complex_##name(*a, x); \
  gsl_complex *r = (gsl_complex*)malloc(sizeof(gsl_complex)); \
  GSL_SET_COMPLEX(r, GSL_REAL(c), GSL_IMAG(c)); \
  return r; \
}

DEFINE_GSL_COMPLEX_BINARY_OPERATOR_WITH_REAL_SHIM(add_real)
DEFINE_GSL_COMPLEX_BINARY_OPERATOR_WITH_REAL_SHIM(sub_real)
DEFINE_GSL_COMPLEX_BINARY_OPERATOR_WITH_REAL_SHIM(mul_real)
DEFINE_GSL_COMPLEX_BINARY_OPERATOR_WITH_REAL_SHIM(div_real)

DEFINE_GSL_COMPLEX_BINARY_OPERATOR_WITH_REAL_SHIM(add_imag)
DEFINE_GSL_COMPLEX_BINARY_OPERATOR_WITH_REAL_SHIM(sub_imag)
DEFINE_GSL_COMPLEX_BINARY_OPERATOR_WITH_REAL_SHIM(mul_imag)
DEFINE_GSL_COMPLEX_BINARY_OPERATOR_WITH_REAL_SHIM(div_imag)

