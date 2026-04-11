Module: gsl-complex-impl
Synopsis: Module for complex numbers
Author: Fernando Raya
Copyright: Copyright (C) 2026, Dylan Hackers. All rights reserved.
License: See LICENSE in this distribution for details.
Reference: https://www.gnu.org/software/gsl/doc/html/complex.html

define class <gsl-complex> (<object>)
  constant slot gsl-complex-data :: ffi/<gsl-complex*>,
    required-init-keyword: data:;
end;

define function gsl-complex
    (r :: <float>, i :: <float>) => (_ :: <gsl-complex>)
  make(<gsl-complex>, data: ffi/gsl-complex(r, i))
end;

define function gsl-complex-real
    (c :: <gsl-complex>) => (r :: <float>)
  ffi/gsl-complex-real(c.gsl-complex-data)
end;

define function gsl-complex-imag
    (c :: <gsl-complex>) => (i :: <float>)
  ffi/gsl-complex-imag(c.gsl-complex-data)
end;

define function gsl-complex-polar
    (r :: <float>, theta :: <float>) => (c :: <gsl-complex>)
  make(<gsl-complex>, data: ffi/gsl-complex-polar(r, theta))
end;

define macro complex-property-definer
  { define complex-property ?property:name => ?ffi:expression end }
    => { define function ?property
             (c :: <gsl-complex>) => (_ :: <float>)
           ?ffi(c.gsl-complex-data)
         end; }
end macro;

define complex-property gsl-complex-arg    => ffi/gsl-complex-arg end;
define complex-property gsl-complex-abs    => ffi/gsl-complex-abs end;
define complex-property gsl-complex-abs2   => ffi/gsl-complex-abs2 end;
define complex-property gsl-complex-logabs => ffi/gsl-complex-logabs end;

define macro complex-binary-operator-definer
  { define complex-binary-operator ?operator:name => ?ffi:expression end }
    => { define method ?operator
             (a :: <gsl-complex>, b :: <gsl-complex>) => (_ :: <gsl-complex>)
           let data :: ffi/<gsl-complex*> = ?ffi(a.gsl-complex-data, b.gsl-complex-data);
           make(<gsl-complex>, data: data);
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
           let data = ?ffi(a.gsl-complex-data, x);
           make(<gsl-complex>, data: data);
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
