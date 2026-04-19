Module: gsl-ffi-complex-impl
Synopsis: Module for complex numbers
Author: Fernando Raya
Copyright: Copyright (C) 2026, Dylan Hackers. All rights reserved.
License: See LICENSE in this distribution for details.

define macro complex-property-definer
  { define complex-property ?fname:name => ?cname:token end }
    => { define c-function ?fname
           input parameter c :: <gsl-complex*>;
           result n :: <c-double>;
           c-name: ?cname;
         end; }
end macro;

// Unary operator <gsl-complex*> -> <gsl-complex*>

define macro complex-unary-operator-definer
  { define complex-unary-operator ?operator:name => ?cname:token end }
    => { define c-function ?operator
           input  parameter z :: <gsl-complex*>;
           result c :: <gsl-complex*>;
           c-name: ?cname;
         end; }
end macro;

// Define a binding for a binary operator when the first is a
// <gsl-complex*> number and the second is a <c-double>
// <gsl-complex*> -> <c-double> -> <gsl-complex*>

define macro complex-binary-operator-real-definer
  { define complex-binary-operator-real ?operator:name => ?cname:token end }
    => { define c-function ?operator
           input parameter  a :: <gsl-complex*>;
           input parameter  b :: <c-double>;
           result c :: <gsl-complex*>;
           c-name: ?cname;
         end; }
end macro;

// <c-double> -> <gsl-complex*>

define macro complex-unary-real-operator-definer
  { define complex-unary-real-operator ?operator:name => ?cname:token end }
    => { define c-function ?operator
           input  parameter z :: <c-double>;
           result c :: <gsl-complex*>;
           c-name: ?cname;
         end; }
end macro;

// Define a binding for a binary operator when both are <gsl-complex*>
// numbers
// <gsl-complex*> -> <gsl-complex*> -> <gsl-complex*>

define macro complex-binary-operator-definer
  { define complex-binary-operator ?operator:name => ?cname:token end }
    => { define c-function ?operator
           input  parameter a  :: <gsl-complex*>;
           input  parameter b  :: <gsl-complex*>;
           result c :: <gsl-complex*>;
           c-name: ?cname;
         end; }
end macro;

// Complex number

define c-struct %<gsl-complex>
  array slot gsl-complex-data :: <c-double>,
    length: 2,
    setter: #f;
  pointer-type-name: <gsl-complex*>;
  c-name: "gsl_complex";
end;

ignore(gsl-complex-data);

define c-function gsl-complex-real
  input parameter c :: <gsl-complex*>;
  result r :: <c-double>;
  c-name: "gsl_complex_real_shim";
end;

define c-function gsl-complex-imag
  input parameter c :: <gsl-complex*>;
  result r :: <c-double>;
  c-name: "gsl_complex_imag_shim";
end;

// Assigning complex numbers

define c-function gsl-complex
  input parameter  r :: <c-double>;
  input parameter  i :: <c-double>;
  result c :: <gsl-complex*>;
  c-name: "gsl_complex_shim";
end;

define c-function gsl-complex-polar
  input parameter  r  :: <c-double>;
  input parameter  i  :: <c-double>;
  result c :: <gsl-complex*>;
  c-name: "gsl_complex_polar_shim";
end;

// Properties of complex numbers

define complex-property gsl-complex-arg => "gsl_complex_arg_shim" end;
define complex-property gsl-complex-abs => "gsl_complex_abs_shim" end;
define complex-property gsl-complex-abs2 => "gsl_complex_abs2_shim" end;
define complex-property gsl-complex-logabs => "gsl_complex_logabs_shim" end;

// Complex arithmetic operators

define complex-binary-operator gsl-complex-add => "gsl_complex_add_shim" end;
define complex-binary-operator gsl-complex-sub => "gsl_complex_sub_shim" end;
define complex-binary-operator gsl-complex-mul => "gsl_complex_mul_shim" end;
define complex-binary-operator gsl-complex-div => "gsl_complex_div_shim" end;

define complex-binary-operator-real gsl-complex-add-real => "gsl_complex_add_real_shim" end;
define complex-binary-operator-real gsl-complex-sub-real => "gsl_complex_sub_real_shim" end;
define complex-binary-operator-real gsl-complex-mul-real => "gsl_complex_mul_real_shim" end;
define complex-binary-operator-real gsl-complex-div-real => "gsl_complex_div_real_shim" end;

define complex-binary-operator-real gsl-complex-add-imag => "gsl_complex_add_imag_shim" end;
define complex-binary-operator-real gsl-complex-sub-imag => "gsl_complex_sub_imag_shim" end;
define complex-binary-operator-real gsl-complex-mul-imag => "gsl_complex_mul_imag_shim" end;
define complex-binary-operator-real gsl-complex-div-imag => "gsl_complex_div_imag_shim" end;

define complex-unary-operator gsl-complex-conjugate => "gsl_complex_conjugate" end;
define complex-unary-operator gsl-complex-inverse => "gsl_complex_inverse" end;
define complex-unary-operator gsl-complex-negative => "gsl_complex_negative" end;

// Elementary complex functions

define complex-unary-operator gsl-complex-sqrt => "gsl_complex_sqrt" end;
define complex-binary-operator gsl-complex-pow => "gsl_complex_pow" end;
define complex-unary-operator gsl-complex-exp => "gsl_complex_exp" end;
define complex-unary-operator gsl-complex-log => "gsl_complex_log" end;
define complex-unary-operator gsl-complex-log10 => "gsl_complex_log10" end;
define complex-binary-operator gsl-complex-log-b => "gsl_complex_log_b" end;
define complex-unary-real-operator gsl-complex-sqrt-real => "gsl_complex_sqrt_real" end;
define complex-binary-operator-real gsl-complex-pow-real => "gsl_complex_pow_real" end;

// Complex trigonometric functions

define complex-unary-operator gsl-complex-sin => "gsl_complex_sin" end;
define complex-unary-operator gsl-complex-cos => "gsl_complex_cos" end;
define complex-unary-operator gsl-complex-tan => "gsl_complex_tan" end;
define complex-unary-operator gsl-complex-sec => "gsl_complex_sec" end;
define complex-unary-operator gsl-complex-csc => "gsl_complex_csc" end;
define complex-unary-operator gsl-complex-cot => "gsl_complex_cot" end;

// Inverse complex trigonometric functions

define complex-unary-operator gsl-complex-arcsin => "gsl_complex_arcsin" end;
define complex-unary-operator gsl-complex-arccos => "gsl_complex_arccos" end;
define complex-unary-operator gsl-complex-arctan => "gsl_complex_arctan" end;
define complex-unary-operator gsl-complex-arcsec => "gsl_complex_arcsec" end;
define complex-unary-operator gsl-complex-arccsc => "gsl_complex_arccsc" end;
define complex-unary-operator gsl-complex-arccot => "gsl_complex_arccot" end;
define complex-unary-real-operator gsl-complex-arcsin-real => "gsl_complex_arcsin_real" end;
define complex-unary-real-operator gsl-complex-arccos-real => "gsl_complex_arccos_real" end;
define complex-unary-real-operator gsl-complex-arcsec-real => "gsl_complex_arcsec_real" end;
define complex-unary-real-operator gsl-complex-arccsc-real => "gsl_complex_arccsc_real" end;

// Complex hyperbolic functions

define complex-unary-operator gsl-complex-sinh => "gsl_complex_sinh" end;
define complex-unary-operator gsl-complex-cosh => "gsl_complex_cosh" end;
define complex-unary-operator gsl-complex-tanh => "gsl_complex_tanh" end;
define complex-unary-operator gsl-complex-sech => "gsl_complex_sech" end;
define complex-unary-operator gsl-complex-csch => "gsl_complex_csch" end;
define complex-unary-operator gsl-complex-coth => "gsl_complex_coth" end;

// Inverse complex hyperbolic functions

define complex-unary-operator gsl-complex-arcsinh => "gsl_complex_arcsinh" end;
define complex-unary-operator gsl-complex-arccosh => "gsl_complex_arccosh" end;
define complex-unary-real-operator gsl-complex-arccosh-real => "gsl_complex_arccosh_real" end;
define complex-unary-operator gsl-complex-arctanh => "gsl_complex_arctanh" end;
define complex-unary-real-operator gsl-complex-arctanh-real => "gsl_complex_arctanh_real" end;
define complex-unary-operator gsl-complex-arcsech => "gsl_complex_arcsech" end;
define complex-unary-operator gsl-complex-arccsch => "gsl_complex_arccsch" end;
define complex-unary-operator gsl-complex-arccoth => "gsl_complex_arccoth" end;
