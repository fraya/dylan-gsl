Module: dylan-user
Synopsis: Module for GSL math functions and constants
Author: Fernando Raya
Copyright: Copyright (C) 2026, Dylan Hackers. All rights reserved.
License: See License.txt in this distribution for details.

define module gsl-ffi-math

  create
    $gsl-e,
    $gsl-log2e,
    $gsl-log10e,
    $gsl-sqrt2,
    $gsl-sqrt1/2,
    $gsl-sqrt3,
    $gsl-sqrt1/3,
    $gsl-pi,
    $gsl-pi/2,
    $gsl-pi/4;

  create
    gsl-fcmp,
    gsl-isnan,
    gsl-isinf;

  // Elementary functions
  create
    gsl-log1p,
    gsl-expm1,
    gsl-hypot,
    gsl-hypot3,
    gsl-acosh,
    gsl-asinh,
    gsl-atanh,
    gsl-atan2,
    gsl-ldexp,
    gsl-frexp;

end module;

define module gsl-ffi-math-impl
  use common-dylan;
  use c-ffi;
  
  use gsl-ffi-math;
end module;
  
