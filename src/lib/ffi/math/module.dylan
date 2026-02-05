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
    gsl-fcmp;

end module;

define module gsl-ffi-math-impl
  use common-dylan;
  use c-ffi;
  
  use gsl-ffi-math;
end module;
  
