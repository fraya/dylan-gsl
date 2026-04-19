Module: gsl-complex-impl
Synopsis: Module for complex numbers
Author: Fernando Raya
Copyright: Copyright (C) 2026, Dylan Hackers. All rights reserved.
License: See LICENSE in this distribution for details.
Reference: https://www.gnu.org/software/gsl/doc/html/complex.html

define method \+
    (a :: <gsl-complex>, b :: <gsl-complex>) => (_ :: <gsl-complex>)
  gsl-complex-add(a, b);
end;

define method \-
    (a :: <gsl-complex>, b :: <gsl-complex>) => (_ :: <gsl-complex>)
  gsl-complex-sub(a, b);
end;

define method \*
    (a :: <gsl-complex>, b :: <gsl-complex>) => (_ :: <gsl-complex>)
  gsl-complex-mul(a, b);
end;

define method \/
    (a :: <gsl-complex>, b :: <gsl-complex>) => (_ :: <gsl-complex>)
  gsl-complex-div(a, b);
end;

// Adds a complex number to a real number (not imaginary part)

define method \+
    (a :: <gsl-complex>, b :: <float>) => (_ :: <gsl-complex>)
  gsl-complex-add-real(a, b);
end;

define method \-
    (a :: <gsl-complex>, b :: <float>) => (_ :: <gsl-complex>)
  gsl-complex-sub-real(a, b);
end;

define method \*
    (a :: <gsl-complex>, b :: <float>) => (_ :: <gsl-complex>)
  gsl-complex-mul-real(a, b);
end;

define method \/
    (a :: <gsl-complex>, b :: <float>) => (_ :: <gsl-complex>)
  gsl-complex-div-real(a, b);
end;

// Adds a real number (not the imaginary part) to a complex number

define method \+
    (a :: <float>, b :: <gsl-complex>) => (_ :: <gsl-complex>)
  gsl-complex-add-real(b, a);
end;

define method \-
    (a :: <float>, b :: <gsl-complex>) => (_ :: <gsl-complex>)
  gsl-complex-sub-real(b, a);
end;

define method \*
    (a :: <float>, b :: <gsl-complex>) => (_ :: <gsl-complex>)
  gsl-complex-mul-real(b, a);
end;

define method \/
    (a :: <float>, b :: <gsl-complex>) => (_ :: <gsl-complex>)
  gsl-complex-div-real(b, a);
end;
