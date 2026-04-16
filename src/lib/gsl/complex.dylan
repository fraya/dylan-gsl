Module: gsl-complex-impl
Synopsis: Module for complex numbers
Author: Fernando Raya
Copyright: Copyright (C) 2026, Dylan Hackers. All rights reserved.
License: See LICENSE in this distribution for details.
Reference: https://www.gnu.org/software/gsl/doc/html/complex.html

// Define common operators (+, -, *, /) for <gsl-complex>, calling
// the c-binding

define macro complex-binary-operator-definer
  { define complex-binary-operator ?operator:name => ?ffi:expression end }
    => { define method ?operator
             (a :: <gsl-complex>, b :: <gsl-complex>) => (_ :: <gsl-complex>)
           ?ffi(a, b);
         end; }
end macro;

define complex-binary-operator \+ => gsl-complex-add end;
define complex-binary-operator \- => gsl-complex-sub end;
define complex-binary-operator \* => gsl-complex-mul end;
define complex-binary-operator \/ => gsl-complex-div end;

// Define common operators (+, -, *, /) when the first operand is a
// <gsl-complex> and the second a <float>

define macro complex-binary-real-operator-definer
  { define complex-binary-real-operator ?operator:name => ?ffi:expression end }
    => { define method ?operator
             (a :: <gsl-complex>, b :: <float>) => (_ :: <gsl-complex>)
           ?ffi(a, b);
         end; }
end macro;

define complex-binary-real-operator \+ => gsl-complex-add-real end;
define complex-binary-real-operator \- => gsl-complex-sub-real end;
define complex-binary-real-operator \* => gsl-complex-mul-real end;
define complex-binary-real-operator \/ => gsl-complex-div-real end;
