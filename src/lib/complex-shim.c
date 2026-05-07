#include <stdlib.h>
#include <gsl/gsl_complex.h>
#include <gsl/gsl_complex_math.h>

// Complex number

gsl_complex* gsl_complex_ptr(gsl_complex c) {
  gsl_complex *r = (gsl_complex*) malloc(sizeof(gsl_complex));
  GSL_SET_COMPLEX(r, GSL_REAL(c), GSL_IMAG(c));
  return r;
}

gsl_complex* gsl_complex_shim (double r, double i) {
  return gsl_complex_ptr(gsl_complex_rect(r, i));
}

void gsl_complex_destroy(gsl_complex* c) {
  free(c);
}

double gsl_complex_real_shim (gsl_complex *c) {
  return GSL_REAL(*c);
}

double gsl_complex_imag_shim (gsl_complex *c) {
  return GSL_IMAG(*c);
}

gsl_complex* gsl_complex_polar_shim (double r, double i) {
  return gsl_complex_ptr(gsl_complex_polar(r, i));
}

#define DEFINE_COMPLEX_DOUBLE_SHIM(name)            \
double gsl_complex_##name##_shim (gsl_complex* x) { \
  return gsl_complex_##name(*x); \
}

// real -> complex

#define DEFINE_REAL_COMPLEX_SHIM(name) \
gsl_complex* gsl_complex_##name##_shim (double x) {  \
  return gsl_complex_ptr(gsl_complex_##name(x)); \
}

// complex -> real -> complex

#define DEFINE_COMPLEX_REAL_COMPLEX_SHIM(name) \
gsl_complex* gsl_complex_##name##_shim (gsl_complex *a, double x) {  \
  return gsl_complex_ptr(gsl_complex_##name(*a, x)); \
}

// complex -> complex

#define DEFINE_COMPLEX_COMPLEX_SHIM(name) \
gsl_complex* gsl_complex_##name##_shim (gsl_complex *a) {  \
  return gsl_complex_ptr(gsl_complex_##name(*a)); \
}

// complex -> complex -> complex

#define DEFINE_COMPLEX_COMPLEX_COMPLEX_SHIM(name) \
gsl_complex* gsl_complex_##name##_shim (gsl_complex *a, gsl_complex *b) { \
  return gsl_complex_ptr(gsl_complex_##name(*a, *b)); \
}

// Properties of complex numbers

DEFINE_COMPLEX_DOUBLE_SHIM(arg)
DEFINE_COMPLEX_DOUBLE_SHIM(abs)
DEFINE_COMPLEX_DOUBLE_SHIM(abs2)
DEFINE_COMPLEX_DOUBLE_SHIM(logabs)

// Complex arithmetic operators

DEFINE_COMPLEX_COMPLEX_COMPLEX_SHIM(add)
DEFINE_COMPLEX_COMPLEX_COMPLEX_SHIM(sub)
DEFINE_COMPLEX_COMPLEX_COMPLEX_SHIM(mul)
DEFINE_COMPLEX_COMPLEX_COMPLEX_SHIM(div)

// Add a complex to a double (real part or imaginary)

DEFINE_COMPLEX_REAL_COMPLEX_SHIM(add_real)
DEFINE_COMPLEX_REAL_COMPLEX_SHIM(sub_real)
DEFINE_COMPLEX_REAL_COMPLEX_SHIM(mul_real)
DEFINE_COMPLEX_REAL_COMPLEX_SHIM(div_real)

DEFINE_COMPLEX_REAL_COMPLEX_SHIM(add_imag)
DEFINE_COMPLEX_REAL_COMPLEX_SHIM(sub_imag)
DEFINE_COMPLEX_REAL_COMPLEX_SHIM(mul_imag)
DEFINE_COMPLEX_REAL_COMPLEX_SHIM(div_imag)

DEFINE_COMPLEX_COMPLEX_SHIM(conjugate);
DEFINE_COMPLEX_COMPLEX_SHIM(inverse);
DEFINE_COMPLEX_COMPLEX_SHIM(negative);

// Elementary Complex Functions

DEFINE_COMPLEX_COMPLEX_SHIM(sqrt);
DEFINE_COMPLEX_COMPLEX_SHIM(exp);
DEFINE_COMPLEX_COMPLEX_SHIM(log);
DEFINE_COMPLEX_COMPLEX_SHIM(log10);
DEFINE_REAL_COMPLEX_SHIM(sqrt_real);

DEFINE_COMPLEX_REAL_COMPLEX_SHIM(pow_real)
DEFINE_COMPLEX_COMPLEX_COMPLEX_SHIM(log_b)
DEFINE_COMPLEX_COMPLEX_COMPLEX_SHIM(pow)

DEFINE_COMPLEX_COMPLEX_SHIM(sin)
DEFINE_COMPLEX_COMPLEX_SHIM(cos)
DEFINE_COMPLEX_COMPLEX_SHIM(tan)
DEFINE_COMPLEX_COMPLEX_SHIM(sec)
DEFINE_COMPLEX_COMPLEX_SHIM(csc)
DEFINE_COMPLEX_COMPLEX_SHIM(cot)

// Inverse complex trigonometric functions

DEFINE_COMPLEX_COMPLEX_SHIM(arcsin)
DEFINE_COMPLEX_COMPLEX_SHIM(arccos)
DEFINE_COMPLEX_COMPLEX_SHIM(arctan)
DEFINE_COMPLEX_COMPLEX_SHIM(arcsec)
DEFINE_COMPLEX_COMPLEX_SHIM(arccsc)
DEFINE_COMPLEX_COMPLEX_SHIM(arccot)

DEFINE_REAL_COMPLEX_SHIM(arcsin_real)
DEFINE_REAL_COMPLEX_SHIM(arccos_real)
DEFINE_REAL_COMPLEX_SHIM(arcsec_real)
DEFINE_REAL_COMPLEX_SHIM(arccsc_real)
DEFINE_REAL_COMPLEX_SHIM(arccosh_real)
DEFINE_REAL_COMPLEX_SHIM(arctanh_real)

// Complex hyperbolic functions

DEFINE_COMPLEX_COMPLEX_SHIM(sinh)
DEFINE_COMPLEX_COMPLEX_SHIM(cosh)
DEFINE_COMPLEX_COMPLEX_SHIM(tanh)
DEFINE_COMPLEX_COMPLEX_SHIM(sech)
DEFINE_COMPLEX_COMPLEX_SHIM(csch)
DEFINE_COMPLEX_COMPLEX_SHIM(coth)

// Inverse complex hyperbolic functions

DEFINE_COMPLEX_COMPLEX_SHIM(arcsinh)
DEFINE_COMPLEX_COMPLEX_SHIM(arccosh)
DEFINE_COMPLEX_COMPLEX_SHIM(arctanh)
DEFINE_COMPLEX_COMPLEX_SHIM(arcsech)
DEFINE_COMPLEX_COMPLEX_SHIM(arccsch)
DEFINE_COMPLEX_COMPLEX_SHIM(arccoth)
