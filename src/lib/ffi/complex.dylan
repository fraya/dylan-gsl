Module: gsl-ffi-complex-impl
Synopsis: Module for complex numbers
Author: Fernando Raya
Copyright: Copyright (C) 2026, Dylan Hackers. All rights reserved.
License: See LICENSE in this distribution for details.

// Macros to map FFI complex functions.
// It follows the signature pattern of argument types, arrows between them and result type
// i.e. <gsl-complex*> -> <c-double> -> <gsl-complex*>

define macro ffi-complex->double-definer
  { define ffi-complex->double end }
    => { }
  { define ffi-complex->double ?fname:name => ?cname:token; ?more:* end }
    => { define c-function ?fname
           input parameter c :: <gsl-complex*>;
           result n :: <c-double>;
           c-name: ?cname;
         end;
         define ffi-complex->double ?more end }
end macro;

define macro ffi-complex->complex-definer
  { define ffi-complex->complex end }
    => { }
  { define ffi-complex->complex ?operator:name => ?cname:token; ?more:* end }
    => { define c-function ?operator
           input parameter z :: <gsl-complex*>;
           result c :: <gsl-complex*>;
           c-name: ?cname;
         end;
         define ffi-complex->complex ?more end }
end macro;

define macro ffi-complex->double->complex-definer
  { define ffi-complex->double->complex end }
   => { }
  { define ffi-complex->double->complex ?operator:name => ?cname:token; ?more:* end }
    => { define c-function ?operator
           input parameter  a :: <gsl-complex*>;
           input parameter  b :: <c-double>;
           result c :: <gsl-complex*>;
           c-name: ?cname;
         end;
         define ffi-complex->double->complex ?more end }
end macro;

define macro ffi-double->complex-definer
  { define ffi-double->complex end }
    => { }
  { define ffi-double->complex ?operator:name => ?cname:token; ?more:* end }
    => { define c-function ?operator
           input  parameter z :: <c-double>;
           result c :: <gsl-complex*>;
           c-name: ?cname;
         end;
         define ffi-double->complex ?more end }
end macro;

define macro ffi-complex->complex->complex-definer
  { define ffi-complex->complex->complex end }
    => { }
  { define ffi-complex->complex->complex ?operator:name => ?cname:token; ?more:* end }
    => { define c-function ?operator
           input  parameter a  :: <gsl-complex*>;
           input  parameter b  :: <gsl-complex*>;
           result c :: <gsl-complex*>;
           c-name: ?cname;
         end;
         define ffi-complex->complex->complex ?more end }
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

define c-function gsl-complex-pow-real
  input parameter z :: <gsl-complex*>;
  input parameter x :: <c-double>;
  result c :: <gsl-complex*>;
  c-name: "gsl_complex_pow_real";
end;

// Mappings to FFI functions

define ffi-complex->double
  gsl-complex-arg    => "gsl_complex_arg_shim";
  gsl-complex-abs    => "gsl_complex_abs_shim";
  gsl-complex-abs2   => "gsl_complex_abs2_shim";
  gsl-complex-logabs => "gsl_complex_logabs_shim";
end;

define ffi-complex->complex->complex
  gsl-complex-add   => "gsl_complex_add_shim";
  gsl-complex-sub   => "gsl_complex_sub_shim";
  gsl-complex-mul   => "gsl_complex_mul_shim";
  gsl-complex-div   => "gsl_complex_div_shim";
  gsl-complex-pow   => "gsl_complex_pow";
  gsl-complex-log-b => "gsl_complex_log_b";
end;

define ffi-complex->double->complex
  gsl-complex-add-real => "gsl_complex_add_real_shim";
  gsl-complex-sub-real => "gsl_complex_sub_real_shim";
  gsl-complex-mul-real => "gsl_complex_mul_real_shim";
  gsl-complex-div-real => "gsl_complex_div_real_shim";
  gsl-complex-add-imag => "gsl_complex_add_imag_shim";
  gsl-complex-sub-imag => "gsl_complex_sub_imag_shim";
  gsl-complex-mul-imag => "gsl_complex_mul_imag_shim";
  gsl-complex-div-imag => "gsl_complex_div_imag_shim";
end;

define ffi-complex->complex
  gsl-complex-conjugate => "gsl_complex_conjugate";
  gsl-complex-inverse   => "gsl_complex_inverse";
  gsl-complex-negative  => "gsl_complex_negative";
  gsl-complex-sqrt  => "gsl_complex_sqrt";
  gsl-complex-exp   => "gsl_complex_exp";
  gsl-complex-log   => "gsl_complex_log";
  gsl-complex-log10 => "gsl_complex_log10";
end;

define ffi-complex->complex
  gsl-complex-sin => "gsl_complex_sin";
  gsl-complex-cos => "gsl_complex_cos";
  gsl-complex-tan => "gsl_complex_tan";
  gsl-complex-sec => "gsl_complex_sec";
  gsl-complex-csc => "gsl_complex_csc";
  gsl-complex-cot => "gsl_complex_cot";
  gsl-complex-arcsin => "gsl_complex_arcsin";
  gsl-complex-arccos => "gsl_complex_arccos";
  gsl-complex-arctan => "gsl_complex_arctan";
  gsl-complex-arcsec => "gsl_complex_arcsec";
  gsl-complex-arccsc => "gsl_complex_arccsc";
  gsl-complex-arccot => "gsl_complex_arccot";
end;

define ffi-double->complex
  gsl-complex-sqrt-real => "gsl_complex_sqrt_real";
  gsl-complex-arcsin-real => "gsl_complex_arcsin_real";
  gsl-complex-arccos-real => "gsl_complex_arccos_real";
  gsl-complex-arcsec-real => "gsl_complex_arcsec_real";
  gsl-complex-arccsc-real => "gsl_complex_arccsc_real";
  gsl-complex-arccosh-real => "gsl_complex_arccosh_real";
  gsl-complex-arctanh-real => "gsl_complex_arctanh_real";
end;

define ffi-complex->complex
  gsl-complex-sinh => "gsl_complex_sinh";
  gsl-complex-cosh => "gsl_complex_cosh";
  gsl-complex-tanh => "gsl_complex_tanh";
  gsl-complex-sech => "gsl_complex_sech";
  gsl-complex-csch => "gsl_complex_csch";
  gsl-complex-coth => "gsl_complex_coth";
  gsl-complex-arcsinh => "gsl_complex_arcsinh";
  gsl-complex-arccosh => "gsl_complex_arccosh";
  gsl-complex-arctanh => "gsl_complex_arctanh";
  gsl-complex-arcsech => "gsl_complex_arcsech";
  gsl-complex-arccsch => "gsl_complex_arccsch";
  gsl-complex-arccoth => "gsl_complex_arccoth";
end;

