Module: gsl-complex-impl
Synopsis: Module for complex numbers
Author: Fernando Raya
Copyright: Copyright (C) 2026, Dylan Hackers. All rights reserved.
License: See LICENSE in this distribution for details.
Reference: https://www.gnu.org/software/gsl/doc/html/complex.html

define function #c
    (r :: <real>, #key i :: <real> = 0)
 => (complex :: <gsl-complex>)
  gsl-complex-rect(r, i)
end;
  
  
