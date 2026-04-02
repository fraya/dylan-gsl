Module: dylan-user
Synopsis: Module for FFI complex numbers
Author: Fernando Raya
Copyright: Copyright (C) 2026, Dylan Hackers. All rights reserved.
License: See License.txt in this distribution for details.

define module gsl-ffi-complex

  create
    gsl-complex-polar,
    gsl-complex-arg,
    gsl-complex-abs,
    gsl-complex-abs2,
    gsl-complex-logabs,
    gsl-complex-add,
    gsl-complex-sub,
    gsl-complex-mul,
    gsl-complex-div;

end module;

define module gsl-ffi-complex-impl

  use common-dylan;
  use c-ffi;

  use gsl-ffi-complex;

end module;
