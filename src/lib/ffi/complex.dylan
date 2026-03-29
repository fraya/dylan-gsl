Module: gsl-ffi-complex-impl
Synopsis: Module for complex numbers
Author: Fernando Raya
Copyright: Copyright (C) 2026, Dylan Hackers. All rights reserved.
License: See LICENSE in this distribution for details.

define c-struct <gsl-complex>
  array slot %gsl-complex-array :: <c-double>,
    length: 2,
    setter: #f;
  c-name: "typedef struct gsl_complex";
  pointer-type-name: <gsl-complex*>;
end;

ignore(%gsl-complex-array);

define function gsl-complex-real
    (c :: <gsl-complex*>) => (r :: <float>)
  %gsl-complex-array(c, 0)
end;

define function gsl-complex-imag
    (c :: <gsl-complex*>) => (i :: <float>)
  %gsl-complex-array(c, 1)
end;

// Assigning complex numbers

define c-function gsl-complex-rect
  input parameter x :: <c-double>;
  input parameter y :: <c-double>;
  result complex :: <gsl-complex>;
  c-name: "gsl_complex_rect";
end;

define c-function gsl-complex-polar
  input parameter r :: <c-double>;
  input parameter theta :: <c-double>;
  result complex :: <gsl-complex>;
  c-name: "gsl_complex_polar";
end;
