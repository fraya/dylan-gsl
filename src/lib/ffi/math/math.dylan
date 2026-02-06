Module: gsl-ffi-math-impl
Synopsis: Implementation of the GSL mathematical functions and constants.
Author: Fernando Raya
Copyright: Copyright (C) 2026, Dylan Hackers. All rights reserved.
License: See LICENSE in this distribution for details.
Reference: https://www.gnu.org/software/gsl/doc/html/math.html#mathematical-constants
           https://www.gnu.org/software/gsl/doc/html/math.html#c.gsl_fcmp

define constant $gsl-e :: <double-float> 
  = 2.71828182845904523536028747135;

define constant $gsl-log2e :: <double-float>
  = 1.44269504088896340735992468100d0;

define constant $gsl-log10e :: <double-float>
  = 0.43429448190325182765112891892d0;

define constant $gsl-sqrt2 :: <double-float>
  = 1.41421356237309504880168872421d0;

define constant $gsl-sqrt1/2 :: <double-float>
  = 0.707106781186547524400844362105d0;

define constant $gsl-sqrt3 :: <double-float>
  = 1.73205081001472754747003233624d0;

define constant $gsl-sqrt1/3 :: <double-float>
  = 0.577350269189625764509148780502d0;

define constant $gsl-pi :: <double-float>
  = 3.14159265358979323846264338328d0;

define constant $gsl-pi/2 :: <double-float>
  = 1.57079632679489661923132169164d0;

define constant $gsl-pi/4 :: <double-float>
  = 0.78539816339744830961566084582d0;

define c-function gsl-fcmp
  input parameter x :: <c-double>;
  input parameter y :: <c-double>;
  input parameter epsilon :: <c-double>;
  result comparison :: <c-int>;
  c-name: "gsl_fcmp";
end;

define c-function gsl-isnan
  input parameter x :: <c-double>;
  result is-not-a-number :: <c-int>;
  c-name: "gsl_isnan";
end;

define c-function gsl-isinf
  input parameter x :: <c-double>;
  result is-infinity :: <c-int>;
  c-name: "gsl_isinf";
end;

// Elementary functions

define c-function gsl-log1p
  input parameter x :: <c-double>;
  result log1p-x :: <c-double>;
  c-name: "gsl_log1p";
end;

define c-function gsl-expm1
  input parameter x :: <c-double>;
  result expm1-x :: <c-double>;
  c-name: "gsl_expm1";
end;

define c-function gsl-hypot
  input parameter x :: <c-double>;
  input parameter y :: <c-double>;
  result hypot-xy :: <c-double>;
  c-name: "gsl_hypot";
end;

define c-function gsl-hypot3
  input parameter x :: <c-double>;
  input parameter y :: <c-double>;
  input parameter z :: <c-double>;
  result hypot3-xyz :: <c-double>;
  c-name: "gsl_hypot3";
end;

define c-function gsl-acosh
  input parameter x :: <c-double>;
  result acosh-x :: <c-double>;
  c-name: "gsl_acosh";
end;

define c-function gsl-asinh
  input parameter x :: <c-double>;
  result asinh-x :: <c-double>;
  c-name: "gsl_asinh";
end;

define c-function gsl-atanh
  input parameter x :: <c-double>;
  result atanh-x :: <c-double>;
  c-name: "gsl_atanh";
end;

define c-function gsl-ldexp
  input parameter x :: <c-double>;
  input parameter n :: <c-int>;
  result ldexp-xn :: <c-double>;
  c-name: "gsl_ldexp";
end;

define c-function gsl-frexp
  input parameter x :: <c-double>;
  input parameter n :: <c-int>;
  result frexp-xn :: <c-double>;
  c-name: "gsl_frexp";
end;