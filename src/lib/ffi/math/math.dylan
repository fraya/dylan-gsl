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