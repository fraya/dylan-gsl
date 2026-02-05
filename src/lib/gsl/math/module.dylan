Module: dylan-user
Synopsis: Module for GSL math functions and constants
Author: Fernando Raya
Copyright: Copyright (C) 2026, Dylan Hackers. All rights reserved.
License: See License.txt in this distribution for details.

define module gsl-math

  use gsl-ffi-math,
    export: { all },
    exclude: { gsl-fcmp };
  // double float comparison

  create
    $default-epsilon,
    *epsilon*,
    f=,
    f~=,
    f<,
    f>,
    f<=,
    f>=;

end module;

define module gsl-math-impl
  use common-dylan;
  use c-ffi;
  use gsl-ffi-math;

  use gsl-math;
end module;
  
