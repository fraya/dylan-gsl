Module: gsl-ffi-complex-impl
Synopsis: Module for complex numbers
Author: Fernando Raya
Copyright: Copyright (C) 2026, Dylan Hackers. All rights reserved.
License: See LICENSE in this distribution for details.

define c-function gsl-complex-polar
  input parameter r   :: <c-double>;
  input parameter i   :: <c-double>;
  output parameter rr :: <c-double*>;
  output parameter ii :: <c-double*>;
  c-name: "gsl_complex_polar_shim";
end;

define c-function gsl-complex-arg
  input parameter r :: <c-double>;
  input parameter i :: <c-double>;
  result arg :: <c-double>;
  c-name: "gsl_complex_arg_shim";
end;

define c-function gsl-complex-abs
  input parameter r :: <c-double>;
  input parameter i :: <c-double>;
  result abs :: <c-double>;
  c-name: "gsl_complex_abs_shim";
end;

define c-function gsl-complex-abs2
  input parameter r :: <c-double>;
  input parameter i :: <c-double>;
  result abs :: <c-double>;
  c-name: "gsl_complex_abs2_shim";
end;

define c-function gsl-complex-logabs
  input parameter r :: <c-double>;
  input parameter i :: <c-double>;
  result logabs :: <c-double>;
  c-name: "gsl_complex_logabs_shim";
end;

define macro ffi-complex-binary-operator-definer
  { define ffi-complex-binary-operator ?operator:name using ?cname:token end }
    => { define c-function ?operator
           input  parameter r1 :: <c-double>;
           input  parameter i1 :: <c-double>;
           input  parameter r2 :: <c-double>;
           input  parameter i2 :: <c-double>;
           output parameter r  :: <c-double*>;
           output parameter i  :: <c-double*>;
           c-name: ?cname;
         end; }
end macro;

define ffi-complex-binary-operator gsl-complex-add using "gsl_complex_add_shim" end;
define ffi-complex-binary-operator gsl-complex-sub using "gsl_complex_sub_shim" end;
define ffi-complex-binary-operator gsl-complex-mul using "gsl_complex_mul_shim" end;
define ffi-complex-binary-operator gsl-complex-div using "gsl_complex_div_shim" end;
