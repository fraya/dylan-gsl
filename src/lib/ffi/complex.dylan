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

define macro ffi-complex-property-definer
  { define ffi-complex-property ?fname:name => ?cname:token }
    => { define c-function ?fname
           input parameter r :: <c-double>;
           input parameter i :: <c-double>;
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
           input  parameter r1 :: <c-double>;
           input  parameter i1 :: <c-double>;
           input  parameter r2 :: <c-double>;
           input  parameter i2 :: <c-double>;
           output parameter r  :: <c-double*>;
           output parameter i  :: <c-double*>;
           c-name: ?cname;
         end; }
end macro;

define ffi-complex-binary-operator gsl-complex-add => "gsl_complex_add_shim";
define ffi-complex-binary-operator gsl-complex-sub => "gsl_complex_sub_shim";
define ffi-complex-binary-operator gsl-complex-mul => "gsl_complex_mul_shim";
define ffi-complex-binary-operator gsl-complex-div => "gsl_complex_div_shim";
