Module: dylan-user
Synopsis: Module for FFI complex numbers
Author: Fernando Raya
Copyright: Copyright (C) 2026, Dylan Hackers. All rights reserved.
License: See License.txt in this distribution for details.

define module gsl-ffi-complex

  create
    <gsl-complex>,
    gsl-complex-real,
    gsl-complex-imag,
    gsl-complex-rect,
    gsl-complex-polar;

end module;

define module gsl-ffi-complex-impl

  use common-dylan;
  use c-ffi;

  use gsl-ffi-complex;

end module;
