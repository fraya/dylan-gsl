Module: dylan-user
Synopsis: Module for complex numbers
Author: Fernando Raya
Copyright: Copyright (C) 2026, Dylan Hackers. All rights reserved.
License: See LICENSE in this distribution for details.
Reference: https://www.gnu.org/software/gsl/doc/html/complex.html

define module gsl-complex

  use gsl-ffi-complex,
    rename: { <gsl-complex*> => <gsl-complex> },
    export: all;

end module;

define module gsl-complex-impl

  use common-dylan;
  use c-ffi;
  use gsl-ffi-complex;
  use gsl-complex;
  
end module;
