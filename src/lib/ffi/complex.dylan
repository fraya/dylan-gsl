Module: gsl-ffi-complex-impl
Synopsis: Module for complex numbers
Author: Fernando Raya
Copyright: Copyright (C) 2026, Dylan Hackers. All rights reserved.
License: See LICENSE in this distribution for details.

define c-struct <gsl-complex>
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

define macro ffi-complex-property-definer
  { define ffi-complex-property ?fname:name => ?cname:token }
    => { define c-function ?fname
           input parameter c :: <gsl-complex*>;
           result n :: <c-double>;
           c-name: ?cname;
         end; }
end macro;

define ffi-complex-property gsl-complex-arg    => "gsl_complex_arg_shim";
define ffi-complex-property gsl-complex-abs    => "gsl_complex_abs_shim";
define ffi-complex-property gsl-complex-abs2   => "gsl_complex_abs2_shim";
define ffi-complex-property gsl-complex-logabs => "gsl_complex_logabs_shim";

define macro ffi-complex-binary-operator-definer
  { define ffi-complex-binary-operator ?operator:name => ?cname:token }
    => { define c-function ?operator
           input  parameter a  :: <gsl-complex*>;
           input  parameter b  :: <gsl-complex*>;
           result c :: <gsl-complex*>;
           c-name: ?cname;
         end; }
end macro;

define ffi-complex-binary-operator gsl-complex-add => "gsl_complex_add_shim";
define ffi-complex-binary-operator gsl-complex-sub => "gsl_complex_sub_shim";
define ffi-complex-binary-operator gsl-complex-mul => "gsl_complex_mul_shim";
define ffi-complex-binary-operator gsl-complex-div => "gsl_complex_div_shim";

define macro ffi-complex-binary-operator-real-definer
  { define ffi-complex-binary-operator-real ?operator:name => ?cname:token }
    => { define c-function ?operator
           input parameter  a :: <gsl-complex*>;
           input parameter  b :: <c-double>;
           result c :: <gsl-complex*>;
           c-name: ?cname;
         end; }
end macro;

define ffi-complex-binary-operator-real gsl-complex-add-real => "gsl_complex_add_real_shim";
define ffi-complex-binary-operator-real gsl-complex-sub-real => "gsl_complex_sub_real_shim";
define ffi-complex-binary-operator-real gsl-complex-mul-real => "gsl_complex_mul_real_shim";
define ffi-complex-binary-operator-real gsl-complex-div-real => "gsl_complex_div_real_shim";

define ffi-complex-binary-operator-real gsl-complex-add-imag => "gsl_complex_add_imag_shim";
define ffi-complex-binary-operator-real gsl-complex-sub-imag => "gsl_complex_sub_imag_shim";
define ffi-complex-binary-operator-real gsl-complex-mul-imag => "gsl_complex_mul_imag_shim";
define ffi-complex-binary-operator-real gsl-complex-div-imag => "gsl_complex_div_imag_shim";
