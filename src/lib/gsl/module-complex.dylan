Module: dylan-user
Synopsis: Module for complex numbers
Author: Fernando Raya
Copyright: Copyright (C) 2026, Dylan Hackers. All rights reserved.
License: See LICENSE in this distribution for details.
Reference: https://www.gnu.org/software/gsl/doc/html/complex.html

define module gsl-complex

  create
    <gsl-complex>,
    gsl-complex,
    gsl-complex-polar,
    gsl-complex-real,
    gsl-complex-imag,
    gsl-complex-arg,
    gsl-complex-abs,
    gsl-complex-abs2,
    gsl-complex-logabs,
    gsl-complex-add-real,
    gsl-complex-sub-real,
    gsl-complex-mul-real,
    gsl-complex-div-real,
    gsl-complex-add-imag,
    gsl-complex-sub-imag,
    gsl-complex-mul-imag,
    gsl-complex-div-imag;

end module;

define module gsl-complex-impl

  use common-dylan;
  use c-ffi;
  use gsl-ffi-complex,
    prefix: "ffi/";
  use gsl-complex;
  
end module;
