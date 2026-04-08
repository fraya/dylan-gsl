#include <gsl/gsl_complex.h>
#include <gsl/gsl_complex_math.h>

void gsl_complex_polar_shim (double r, double i, double* rr, double* ii) {
  gsl_complex c = gsl_complex_polar(r, i);
  *rr = GSL_REAL(c);
  *ii = GSL_IMAG(c);
}

#define DEFINE_GSL_COMPLEX_PROPERTY_SHIM(name) \
double gsl_complex_##name##_shim (double r, double i) { \
  gsl_complex z = gsl_complex_rect(r, i); \
  return gsl_complex_##name(z); \
}

DEFINE_GSL_COMPLEX_PROPERTY_SHIM(arg)
DEFINE_GSL_COMPLEX_PROPERTY_SHIM(abs)
DEFINE_GSL_COMPLEX_PROPERTY_SHIM(abs2)
DEFINE_GSL_COMPLEX_PROPERTY_SHIM(logabs)

#define DEFINE_GSL_COMPLEX_BINARY_OPERATOR_SHIM(name) \
void gsl_complex_##name##_shim (double r1, double i1, double r2, double i2, double *r, double *i) { \
  gsl_complex a = gsl_complex_rect(r1, i1); \
  gsl_complex b = gsl_complex_rect(r2, i2); \
  gsl_complex c = gsl_complex_##name(a, b); \
  *r = GSL_REAL(c); \
  *i = GSL_IMAG(c); \
}

DEFINE_GSL_COMPLEX_BINARY_OPERATOR_SHIM(add)
DEFINE_GSL_COMPLEX_BINARY_OPERATOR_SHIM(sub)
DEFINE_GSL_COMPLEX_BINARY_OPERATOR_SHIM(mul)
DEFINE_GSL_COMPLEX_BINARY_OPERATOR_SHIM(div)

// Macro to make operations (+,-,*,/) between a complex number and a
// double (real o imaginary part)

#define DEFINE_GSL_COMPLEX_BINARY_OPERATOR_WITH_REAL_SHIM(name) \
void gsl_complex_##name##_shim (double r1, double i1, double x, double *r, double *i) { \
  gsl_complex a = gsl_complex_rect(r1, i1); \
  gsl_complex b = gsl_complex_##name(a, x); \
  *r = GSL_REAL(b); \
  *i = GSL_IMAG(b); \
}

DEFINE_GSL_COMPLEX_BINARY_OPERATOR_WITH_REAL_SHIM(add_real)
DEFINE_GSL_COMPLEX_BINARY_OPERATOR_WITH_REAL_SHIM(sub_real)
DEFINE_GSL_COMPLEX_BINARY_OPERATOR_WITH_REAL_SHIM(mul_real)
DEFINE_GSL_COMPLEX_BINARY_OPERATOR_WITH_REAL_SHIM(div_real)

DEFINE_GSL_COMPLEX_BINARY_OPERATOR_WITH_REAL_SHIM(add_imag)
DEFINE_GSL_COMPLEX_BINARY_OPERATOR_WITH_REAL_SHIM(sub_imag)
DEFINE_GSL_COMPLEX_BINARY_OPERATOR_WITH_REAL_SHIM(mul_imag)
DEFINE_GSL_COMPLEX_BINARY_OPERATOR_WITH_REAL_SHIM(div_imag)

