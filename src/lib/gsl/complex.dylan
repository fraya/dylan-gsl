Module: gsl-complex-impl
Synopsis: Module for complex numbers
Author: Fernando Raya
Copyright: Copyright (C) 2026, Dylan Hackers. All rights reserved.
License: See LICENSE in this distribution for details.
Reference: https://www.gnu.org/software/gsl/doc/html/complex.html

define class <gsl-complex> (<object>)
  constant slot gsl-complex-real :: <float>,
    required-init-keyword: r:;
  constant slot gsl-complex-imag :: <float> = 0.0,
    init-keyword: i:;
end;

define function gsl-complex
    (r :: <float>, i :: <float>) => (c :: <gsl-complex>)
  make(<gsl-complex>, r: r, i: i)
end;

define function gsl-complex-polar
    (r :: <float>, theta :: <float>) => (c :: <gsl-complex>)
  let (rr, ii) = ffi/gsl-complex-polar(r, theta);
  make(<gsl-complex>, r: rr, i:  ii);
end;

define macro complex-property-definer
  { define complex-property ?property:name using ?ffi:expression end }
    => { define function ?property
             (c :: <gsl-complex>) => (_ :: <float>)
           ?ffi(c.gsl-complex-real, c.gsl-complex-imag)
         end; }
end macro;

define complex-property gsl-complex-arg using ffi/gsl-complex-arg end;
define complex-property gsl-complex-abs using ffi/gsl-complex-abs end;
define complex-property gsl-complex-abs2 using ffi/gsl-complex-abs2 end;
define complex-property gsl-complex-logabs using ffi/gsl-complex-logabs end;

define macro complex-binary-operator-definer
  { define complex-binary-operator ?operator:name => ?ffi:expression end }
    => { define method ?operator
             (a :: <gsl-complex>, b :: <gsl-complex>) => (_ :: <gsl-complex>)
           let ar = a.gsl-complex-real; let ai = a.gsl-complex-imag;
           let br = b.gsl-complex-real; let bi = b.gsl-complex-real;
           let (r, i) = ?ffi(ar, ai, br, bi);
           make(<gsl-complex>, r: r, i: i);
         end; }
end macro;

define complex-binary-operator \+ => ffi/gsl-complex-add end;
define complex-binary-operator \- => ffi/gsl-complex-sub end;
define complex-binary-operator \* => ffi/gsl-complex-mul end;
define complex-binary-operator \/ => ffi/gsl-complex-div end;

// destructure the complex number, execute a function and create a
// complex number from results
define macro complex-binary-real-operator-definer
  { define complex-binary-real-operator ?operator:name => ?ffi:expression end }
    => { define function ?operator
             (a :: <gsl-complex>, x :: <float>) => (_ :: <gsl-complex>)
           let (r, i) = ?ffi(a.gsl-complex-real, a.gsl-complex-imag, x);
           make(<gsl-complex>, r: r, i: i);
         end; }
end macro;

// Operations with the real part and a number
define complex-binary-real-operator gsl-complex-add-real => ffi/gsl-complex-add-real end;
define complex-binary-real-operator gsl-complex-sub-real => ffi/gsl-complex-sub-real end;
define complex-binary-real-operator gsl-complex-mul-real => ffi/gsl-complex-mul-real end;
define complex-binary-real-operator gsl-complex-div-real => ffi/gsl-complex-div-real end;

// Operations with the imaginary part and a number
define complex-binary-real-operator gsl-complex-add-imag => ffi/gsl-complex-add-imag end;
define complex-binary-real-operator gsl-complex-sub-imag => ffi/gsl-complex-sub-imag end;
define complex-binary-real-operator gsl-complex-mul-imag => ffi/gsl-complex-mul-imag end;
define complex-binary-real-operator gsl-complex-div-imag => ffi/gsl-complex-div-imag end;
