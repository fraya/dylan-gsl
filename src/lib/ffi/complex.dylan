Module: gsl-ffi-complex-impl
Synopsis: Module for complex numbers
Author: Fernando Raya
Copyright: Copyright (C) 2026, Dylan Hackers. All rights reserved.
License: See LICENSE in this distribution for details.

// Complex number

define c-struct %gsl-complex
  array slot gsl-complex-data :: <c-double>,
    length: 2,
    setter: #f;
  pointer-type-name: <%gsl-complex*>;
  c-name: "gsl_complex";
end;

define c-subtype <gsl-complex> (<%gsl-complex*>, <number>) end;

ignore(gsl-complex-data);

define c-function gsl-complex-real
  parameter c :: <gsl-complex>;
  result r :: <c-double>;
  c-name: "gsl_complex_real_shim";
end;

define c-function gsl-complex-imag
  parameter c :: <gsl-complex>;
  result r :: <c-double>;
  c-name: "gsl_complex_imag_shim";
end;

// Assigning complex numbers

define c-function gsl-complex
  parameter r :: <c-double>;
  parameter i :: <c-double>;
  result c :: <gsl-complex>;
  c-name: "gsl_complex_shim";
end;

define c-function gsl-complex-polar
  parameter r :: <c-double>;
  parameter i :: <c-double>;
  result c :: <gsl-complex>;
  c-name: "gsl_complex_polar_shim";
end;

///////////////////////////////////////////////////////////////////////////////
//
// Properties of complex numbers
//
///////////////////////////////////////////////////////////////////////////////

define c-function gsl-complex-arg
  parameter a :: <gsl-complex>;
  result z :: <c-double>;
  c-name: "gsl_complex_arg_shim";
end;

define c-function gsl-complex-abs
  parameter a :: <gsl-complex>;
  result z :: <c-double>;
  c-name: "gsl_complex_abs_shim";
end;

define c-function gsl-complex-abs2
  parameter a :: <gsl-complex>;
  result z :: <c-double>;
  c-name: "gsl_complex_abs2_shim";
end;

define c-function gsl-complex-logabs
  parameter a :: <gsl-complex>;
  result z :: <c-double>;
  c-name: "gsl_complex_logabs_shim";
end;

///////////////////////////////////////////////////////////////////////////////
//
// Complex arithmetic operators
//
///////////////////////////////////////////////////////////////////////////////

define c-function gsl-complex-add
  parameter a :: <gsl-complex>;
  parameter b :: <gsl-complex>;
  result z :: <gsl-complex>;
  c-name: "gsl_complex_add_shim";
end;

define c-function gsl-complex-sub
  parameter a :: <gsl-complex>;
  parameter b :: <gsl-complex>;
  result z :: <gsl-complex>;
  c-name: "gsl_complex_sub_shim";
end;

define c-function gsl-complex-mul
  parameter a :: <gsl-complex>;
  parameter b :: <gsl-complex>;
  result z :: <gsl-complex>;
  c-name: "gsl_complex_mul_shim";
end;

define c-function gsl-complex-div
  parameter a :: <gsl-complex>;
  parameter b :: <gsl-complex>;
  result z :: <gsl-complex>;
  c-name: "gsl_complex_div_shim";
end;

// Operations with the real part of the complex number

define c-function gsl-complex-add-real
  parameter a :: <gsl-complex>;
  parameter b :: <c-double>;
  result z :: <gsl-complex>;
  c-name: "gsl_complex_add_real_shim";
end;

define c-function gsl-complex-sub-real
  parameter a :: <gsl-complex>;
  parameter b :: <c-double>;
  result z :: <gsl-complex>;
  c-name: "gsl_complex_sub_real_shim";
end;

define c-function gsl-complex-mul-real
  parameter a :: <gsl-complex>;
  parameter b :: <c-double>;
  result z :: <gsl-complex>;
  c-name: "gsl_complex_mul_real_shim";
end;

define c-function gsl-complex-div-real
  parameter a :: <gsl-complex>;
  parameter b :: <c-double>;
  result z :: <gsl-complex>;
  c-name: "gsl_complex_div_real_shim";
end;

// Operations with the imaginary part of the complex number

define c-function gsl-complex-add-imag
  parameter a :: <gsl-complex>;
  parameter b :: <c-double>;
  result z :: <gsl-complex>;
  c-name: "gsl_complex_add_imag_shim";
end;

define c-function gsl-complex-sub-imag
  parameter a :: <gsl-complex>;
  parameter b :: <c-double>;
  result z :: <gsl-complex>;
  c-name: "gsl_complex_sub_imag_shim";
end;

define c-function gsl-complex-mul-imag
  parameter a :: <gsl-complex>;
  parameter b :: <c-double>;
  result z :: <gsl-complex>;
  c-name: "gsl_complex_mul_imag_shim";
end;

define c-function gsl-complex-div-imag
  parameter a :: <gsl-complex>;
  parameter b :: <c-double>;
  result z :: <gsl-complex>;
  c-name: "gsl_complex_div_imag_shim";
end;

define c-function gsl-complex-conjugate
  parameter a :: <gsl-complex>;
  result z :: <gsl-complex>;
  c-name: "gsl_complex_conjugate_shim";
end;

define c-function gsl-complex-inverse
  parameter a :: <gsl-complex>;
  result z :: <gsl-complex>;
  c-name: "gsl_complex_inverse_shim";
end;

define c-function gsl-complex-negative
  parameter a :: <gsl-complex>;
  result z :: <gsl-complex>;
  c-name: "gsl_complex_negative_shim";
end;

///////////////////////////////////////////////////////////////////////////////
//
// Elementary Complex Functions
//
///////////////////////////////////////////////////////////////////////////////

define c-function gsl-complex-sqrt
  parameter a :: <gsl-complex>;
  result z :: <gsl-complex>;
  c-name: "gsl_complex_sqrt_shim";
end;

define c-function gsl-complex-exp
  parameter a :: <gsl-complex>;
  result z :: <gsl-complex>;
  c-name: "gsl_complex_exp_shim";
end;

define c-function gsl-complex-log
  parameter a :: <gsl-complex>;
  result z :: <gsl-complex>;
  c-name: "gsl_complex_log_shim";
end;

define c-function gsl-complex-log10
  parameter a :: <gsl-complex>;
  result z :: <gsl-complex>;
  c-name: "gsl_complex_log10_shim";
end;

define c-function gsl-complex-sqrt-real
  parameter a :: <c-double>;
  result z :: <gsl-complex>;
  c-name: "gsl_complex_sqrt_real_shim";
end;

define c-function gsl-complex-pow
  parameter a :: <gsl-complex>;
  parameter b :: <gsl-complex>;
  result z :: <gsl-complex>;
  c-name: "gsl_complex_pow_shim";
end;

define c-function gsl-complex-pow-real
  parameter z :: <gsl-complex>;
  parameter x :: <c-double>;
  result c :: <gsl-complex>;
  c-name: "gsl_complex_pow_real_shim";
end;

define c-function gsl-complex-log-b
  parameter a :: <gsl-complex>;
  parameter b :: <gsl-complex>;
  result z :: <gsl-complex>;
  c-name: "gsl_complex_log_b_shim";
end;

///////////////////////////////////////////////////////////////////////////////
//
// Complex Trigonometric Functions
//
///////////////////////////////////////////////////////////////////////////////

define c-function gsl-complex-sin
  parameter a :: <gsl-complex>;
  result z :: <gsl-complex>;
  c-name: "gsl_complex_sin_shim";
end;

define c-function gsl-complex-cos
  parameter a :: <gsl-complex>;
  result z :: <gsl-complex>;
  c-name: "gsl_complex_cos_shim";
end;

define c-function gsl-complex-tan
  parameter a :: <gsl-complex>;
  result z :: <gsl-complex>;
  c-name: "gsl_complex_tan_shim";
end;

define c-function gsl-complex-sec
  parameter a :: <gsl-complex>;
  result z :: <gsl-complex>;
  c-name: "gsl_complex_sec_shim";
end;

define c-function gsl-complex-csc
  parameter a :: <gsl-complex>;
  result z :: <gsl-complex>;
  c-name: "gsl_complex_csc_shim";
end;

define c-function gsl-complex-cot
  parameter a :: <gsl-complex>;
  result z :: <gsl-complex>;
  c-name: "gsl_complex_cot_shim";
end;

///////////////////////////////////////////////////////////////////////////////
//
// Inverse Complex Trigonometric Functions
//
///////////////////////////////////////////////////////////////////////////////

define c-function gsl-complex-arcsin
  parameter a :: <gsl-complex>;
  result z :: <gsl-complex>;
  c-name: "gsl_complex_arcsin_shim";
end;

define c-function gsl-complex-arccos
  parameter a :: <gsl-complex>;
  result z :: <gsl-complex>;
  c-name: "gsl_complex_arccos_shim";
end;

define c-function gsl-complex-arctan
  parameter a :: <gsl-complex>;
  result z :: <gsl-complex>;
  c-name: "gsl_complex_arctan_shim";
end;

define c-function gsl-complex-arcsec
  parameter a :: <gsl-complex>;
  result z :: <gsl-complex>;
  c-name: "gsl_complex_arcsec_shim";
end;

define c-function gsl-complex-arccsc
  parameter a :: <gsl-complex>;
  result z :: <gsl-complex>;
  c-name: "gsl_complex_arccsc_shim";
end;

define c-function gsl-complex-arccot
  parameter a :: <gsl-complex>;
  result z :: <gsl-complex>;
  c-name: "gsl_complex_arccot_shim";
end;

define c-function gsl-complex-arcsin-real
  parameter a :: <c-double>;
  result z :: <gsl-complex>;
  c-name: "gsl_complex_arcsin_real_shim";
end;

define c-function gsl-complex-arccos-real
  parameter a :: <c-double>;
  result z :: <gsl-complex>;
  c-name: "gsl_complex_arccos_real_shim";
end;

define c-function gsl-complex-arcsec-real
  parameter a :: <c-double>;
  result z :: <gsl-complex>;
  c-name: "gsl_complex_arcsec_real_shim";
end;

define c-function gsl-complex-arccsc-real
  parameter a :: <c-double>;
  result z :: <gsl-complex>;
  c-name: "gsl_complex_arccsc_real_shim";
end;

define c-function gsl-complex-arccosh-real
  parameter a :: <c-double>;
  result z :: <gsl-complex>;
  c-name: "gsl_complex_arccosh_real_shim";
end;

define c-function gsl-complex-arctanh-real
  parameter a :: <c-double>;
  result z :: <gsl-complex>;
  c-name: "gsl_complex_arctanh_real_shim";
end;

///////////////////////////////////////////////////////////////////////////////
//
// Complex Hyperbolic Functions
//
///////////////////////////////////////////////////////////////////////////////

define c-function gsl-complex-sinh
  parameter a :: <gsl-complex>;
  result z :: <gsl-complex>;
  c-name: "gsl_complex_sinh_shim";
end;

define c-function gsl-complex-cosh
  parameter a :: <gsl-complex>;
  result z :: <gsl-complex>;
  c-name: "gsl_complex_cosh_shim";
end;

define c-function gsl-complex-tanh
  parameter a :: <gsl-complex>;
  result z :: <gsl-complex>;
  c-name: "gsl_complex_tanh_shim";
end;

define c-function gsl-complex-sech
  parameter a :: <gsl-complex>;
  result z :: <gsl-complex>;
  c-name: "gsl_complex_sech_shim";
end;

define c-function gsl-complex-csch
  parameter a :: <gsl-complex>;
  result z :: <gsl-complex>;
  c-name: "gsl_complex_csch_shim";
end;

define c-function gsl-complex-coth
  parameter a :: <gsl-complex>;
  result z :: <gsl-complex>;
  c-name: "gsl_complex_coth_shim";
end;

///////////////////////////////////////////////////////////////////////////////
//
// Inverse Complex Hyperbolic Functions
//
///////////////////////////////////////////////////////////////////////////////

define c-function gsl-complex-arcsinh
  parameter a :: <gsl-complex>;
  result z :: <gsl-complex>;
  c-name: "gsl_complex_arcsinh_shim";
end;

define c-function gsl-complex-arccosh
  parameter a :: <gsl-complex>;
  result z :: <gsl-complex>;
  c-name: "gsl_complex_arccosh_shim";
end;

define c-function gsl-complex-arctanh
  parameter a :: <gsl-complex>;
  result z :: <gsl-complex>;
  c-name: "gsl_complex_arctanh_shim";
end;

define c-function gsl-complex-arcsech
  parameter a :: <gsl-complex>;
  result z :: <gsl-complex>;
  c-name: "gsl_complex_arcsech_shim";
end;

define c-function gsl-complex-arccsch
  parameter a :: <gsl-complex>;
  result z :: <gsl-complex>;
  c-name: "gsl_complex_arccsch_shim";
end;

define c-function gsl-complex-arccoth
  parameter a :: <gsl-complex>;
  result z :: <gsl-complex>;
  c-name: "gsl_complex_arccoth_shim";
end;
