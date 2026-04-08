#include <gsl/gsl_complex.h>
#include <gsl/gsl_complex_math.h>

void gsl_complex_polar_shim (double r, double i, double* rr, double* ii) {
  gsl_complex c = gsl_complex_polar(r, i);
  *rr = GSL_REAL(c);
  *ii = GSL_IMAG(c);
}

#define DEFINE_GSL_SHIM_UNARY(name) \
double gsl_complex_##name##_shim (double r, double i) { \
  gsl_complex z = gsl_complex_rect(r, i); \
  return gsl_complex_##name(z); \
}

DEFINE_GSL_SHIM_UNARY(arg)
DEFINE_GSL_SHIM_UNARY(abs)
DEFINE_GSL_SHIM_UNARY(abs2)
DEFINE_GSL_SHIM_UNARY(logabs)

#define DEFINE_GSL_SHIM_BIN(name) \
void gsl_complex_##name##_shim (double r1, double i1, double r2, double i2, double *r, double *i) { \
  gsl_complex a = gsl_complex_rect(r1, i1); \
  gsl_complex b = gsl_complex_rect(r2, i2); \
  gsl_complex c = gsl_complex_##name(a, b); \
  *r = GSL_REAL(c); \
  *i = GSL_IMAG(c); \
}

DEFINE_GSL_SHIM_BIN(add)
DEFINE_GSL_SHIM_BIN(sub)
DEFINE_GSL_SHIM_BIN(mul)
DEFINE_GSL_SHIM_BIN(div)

// Macro to make operations (+,-,*,/) between a complex number and a
// double (real o imaginary part)

#define DEFINE_GSL_SHIM_BIN_REAL(name) \
void gsl_complex_##name##_shim (double r1, double i1, double x, double *r, double *i) { \
  gsl_complex a = gsl_complex_rect(r1, i1); \
  gsl_complex b = gsl_complex_##name(a, x); \
  *r = GSL_REAL(b); \
  *i = GSL_IMAG(b); \
}

DEFINE_GSL_SHIM_BIN_REAL(add_real)
DEFINE_GSL_SHIM_BIN_REAL(sub_real)
DEFINE_GSL_SHIM_BIN_REAL(mul_real)
DEFINE_GSL_SHIM_BIN_REAL(div_real)

DEFINE_GSL_SHIM_BIN_REAL(add_imag)
DEFINE_GSL_SHIM_BIN_REAL(sub_imag)
DEFINE_GSL_SHIM_BIN_REAL(mul_imag)
DEFINE_GSL_SHIM_BIN_REAL(div_imag)

