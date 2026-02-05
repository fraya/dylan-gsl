Module: dylan-user
Synopsis: Module for common support functions, macros and constants.
Author: Fernando Raya
Copyright: Copyright (C) 2026, Dylan Hackers. All rights reserved.
License: See LICENSE in this distribution for details.

define module gsl-common

  create
    <double-float?>,
    <vector-double-float>,
    <vector-double-float?>,
    vector-double-float,
    <numeric-sequence>;

  create
    with-c-double-array;

end module;

define module gsl-common-impl

  use common-dylan;
  use c-ffi;

  use gsl-common;

end module;