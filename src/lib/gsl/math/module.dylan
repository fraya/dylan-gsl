Module: dylan-user
Synopsis: Module for GSL math functions and constants
Author: Fernando Raya
Copyright: Copyright (C) 2026, Dylan Hackers. All rights reserved.
License: See License.txt in this distribution for details.

define module gsl-math

  use gsl-ffi-math,
    rename: {
      gsl-log1p => log1p,
      gsl-expm1 => expm1,
      gsl-hypot => hypot,
      gsl-hypot3 => hypot3,
      gsl-acosh => acosh,
      gsl-asinh => asinh,
      gsl-atanh => atanh,
      gsl-atan2 => atan2,
      gsl-ldexp => ldexp,
      gsl-frexp => frexp
    },
    export: {
      all
    },
    exclude: {
      gsl-fcmp
    };


  // double float comparison

  create
    $default-epsilon,
    *epsilon*,
    f=,
    f~=,
    f<,
    f>,
    f<=,
    f>=,
    nan?;

  // Infinity numbers

  create
    infinity?,
    positive-infinity?,
    negative-infinity?;

end module;

define module gsl-math-impl
  use common-dylan;
  use c-ffi;
  use gsl-ffi-math;

  use gsl-math;
end module;
  
