Module: gsl-complex-impl
Synopsis: Module for complex numbers
Author: Fernando Raya
Copyright: Copyright (C) 2026, Dylan Hackers. All rights reserved.
License: See LICENSE in this distribution for details.
Reference: https://www.gnu.org/software/gsl/doc/html/complex.html

define class <gsl-complex> (<object>)
  slot %gsl-complex-data :: ffi/<gsl-complex*>,
    init-keyword: %data:,
    init-value: null-pointer(ffi/<gsl-complex*>);
end;

define method initialize
    (c :: <gsl-complex>, #key r :: <float> = 0.0d0, i :: <float> = 0.0d0)
 => ()
  drain-finalization-queue();
  next-method();
  if (null-pointer?(c.%gsl-complex-data))
    c.%gsl-complex-data := ffi/gsl-complex(r, i)
  end;
  finalize-when-unreachable(c);
end;

define method finalize
    (c :: <gsl-complex>) => ()
  ffi/gsl-complex-destroy(c.%gsl-complex-data)
end;

define function gsl-complex
    (r :: <float>, i :: <float>) => (_ :: <gsl-complex>)
  make(<gsl-complex>, r: r, i: i)
end;

define function gsl-complex-real
    (c :: <gsl-complex>) => (r :: <float>)
  ffi/gsl-complex-real(c.%gsl-complex-data)
end;

define function gsl-complex-imag
    (c :: <gsl-complex>) => (r :: <float>)
  ffi/gsl-complex-imag(c.%gsl-complex-data)
end;

define function gsl-complex-polar
    (r :: <float>, i :: <float>) => (polar :: <gsl-complex>)
  make(<gsl-complex>, %data: ffi/gsl-complex-polar(r, i))
end;

define function gsl-complex-arg
    (a :: <gsl-complex>) => (_ :: <float>)
  ffi/gsl-complex-arg(a.%gsl-complex-data)
end;

define function gsl-complex-abs
    (a :: <gsl-complex>) => (_ :: <float>)
  ffi/gsl-complex-abs(a.%gsl-complex-data)
end;

define function gsl-complex-abs2
    (a :: <gsl-complex>) => (_ :: <float>)
  ffi/gsl-complex-abs2(a.%gsl-complex-data)
end;

define function gsl-complex-logabs
    (a :: <gsl-complex>) => (_ :: <float>)
  ffi/gsl-complex-logabs(a.%gsl-complex-data)
end;

///////////////////////////////////////////////////////////////////////////////
//
// Complex arithmetic operators
//
///////////////////////////////////////////////////////////////////////////////

define method \+
    (a :: <gsl-complex>, b :: <gsl-complex>) => (_ :: <gsl-complex>)
  make(<gsl-complex>,
       %data: ffi/gsl-complex-add(a.%gsl-complex-data, b.%gsl-complex-data))
end;

define method \-
    (a :: <gsl-complex>, b :: <gsl-complex>) => (_ :: <gsl-complex>)
  make(<gsl-complex>,
       %data: ffi/gsl-complex-sub(a.%gsl-complex-data, b.%gsl-complex-data))
end;

define method \*
    (a :: <gsl-complex>, b :: <gsl-complex>) => (_ :: <gsl-complex>)
  make(<gsl-complex>,
       %data: ffi/gsl-complex-mul(a.%gsl-complex-data, b.%gsl-complex-data))
end;

define method \/
    (a :: <gsl-complex>, b :: <gsl-complex>) => (_ :: <gsl-complex>)
  make(<gsl-complex>,
       %data: ffi/gsl-complex-div(a.%gsl-complex-data, b.%gsl-complex-data))
end;

// Adds a complex number to a real number (not imaginary part)

define method \+
    (a :: <gsl-complex>, b :: <float>) => (_ :: <gsl-complex>)
  make(<gsl-complex>,
       %data: ffi/gsl-complex-add-real(a.%gsl-complex-data, b))
end;

define method \-
    (a :: <gsl-complex>, b :: <float>) => (_ :: <gsl-complex>)
  make(<gsl-complex>,
       %data: ffi/gsl-complex-sub-real(a.%gsl-complex-data, b))
end;

define method \*
    (a :: <gsl-complex>, b :: <float>) => (_ :: <gsl-complex>)
  make(<gsl-complex>,
       %data: ffi/gsl-complex-mul-real(a.%gsl-complex-data, b))
end;

define method \/
    (a :: <gsl-complex>, b :: <float>) => (_ :: <gsl-complex>)
  make(<gsl-complex>,
       %data: ffi/gsl-complex-div-real(a.%gsl-complex-data, b))
end;

define function gsl-complex-add-imag
    (a :: <gsl-complex>, i :: <float>) => (c :: <gsl-complex>)
  make(<gsl-complex>,
       data: ffi/gsl-complex-add-imag(a.%gsl-complex-data, i))
end;

define function gsl-complex-sub-imag
    (a :: <gsl-complex>, i :: <float>) => (c :: <gsl-complex>)
  make(<gsl-complex>,
       %data: ffi/gsl-complex-sub-imag(a.%gsl-complex-data, i))
end;

define function gsl-complex-mul-imag
    (a :: <gsl-complex>, i :: <float>) => (c :: <gsl-complex>)
  make(<gsl-complex>,
       %data: ffi/gsl-complex-mul-imag(a.%gsl-complex-data, i))
end;

define function gsl-complex-div-imag
    (a :: <gsl-complex>, i :: <float>) => (c :: <gsl-complex>)
  make(<gsl-complex>,
       %data: ffi/gsl-complex-div-imag(a.%gsl-complex-data, i))
end;

define function gsl-complex-conjugate
    (a :: <gsl-complex>) => (_ :: <gsl-complex>)
  make(<gsl-complex>,
       %data: ffi/gsl-complex-conjugate(a.%gsl-complex-data))
end;

define function gsl-complex-inverse
    (a :: <gsl-complex>) => (_ :: <gsl-complex>)
  make(<gsl-complex>,
       %data: ffi/gsl-complex-inverse(a.%gsl-complex-data))
end;

define method negative
    (a :: <gsl-complex>) => (_ :: <gsl-complex>)
  make(<gsl-complex>,
       %data: ffi/gsl-complex-negative(a.%gsl-complex-data))
end;

///////////////////////////////////////////////////////////////////////////////
//
// Elementary Complex Functions
//
///////////////////////////////////////////////////////////////////////////////

define function gsl-complex-sqrt
    (a :: <gsl-complex>) => (_ :: <gsl-complex>)
  make(<gsl-complex>,
       %data: ffi/gsl-complex-sqrt(a.%gsl-complex-data))
end;

define function gsl-complex-exp
    (a :: <gsl-complex>) => (_ :: <gsl-complex>)
  make(<gsl-complex>,
       %data: ffi/gsl-complex-exp(a.%gsl-complex-data))
end;

define function gsl-complex-log
    (a :: <gsl-complex>) => (_ :: <gsl-complex>)
  make(<gsl-complex>,
       %data: ffi/gsl-complex-log(a.%gsl-complex-data))
end;

define function gsl-complex-log10
    (a :: <gsl-complex>) => (_ :: <gsl-complex>)
  make(<gsl-complex>,
       %data: ffi/gsl-complex-log10(a.%gsl-complex-data))
end;

define function gsl-complex-sqrt-real
    (a :: <float>, b :: <gsl-complex>) => (_ :: <gsl-complex>)
  make(<gsl-complex>,
       %data: ffi/gsl-complex-sqrt-real(a, b.%gsl-complex-data))
end;

define function gsl-complex-pow
    (a :: <gsl-complex>, b :: <gsl-complex>) => (_ :: <gsl-complex>)
  make(<gsl-complex>,
       %data: ffi/gsl-complex-pow(a.%gsl-complex-data, b.%gsl-complex-data))
end;

define function gsl-complex-pow-real
    (a :: <gsl-complex>, x :: <float>) => (_ :: <gsl-complex>)
  make(<gsl-complex>,
       %data: ffi/gsl-complex-pow-real(a.%gsl-complex-data, x))
end;

define function gsl-complex-log-b
    (a :: <gsl-complex>, b :: <gsl-complex>) => (_ :: <gsl-complex>)
  make(<gsl-complex>,
       %data: ffi/gsl-complex-log-b(a.%gsl-complex-data, b.%gsl-complex-data))
end;

///////////////////////////////////////////////////////////////////////////////
//
// Complex Trigonometric Functions
//
///////////////////////////////////////////////////////////////////////////////

define function gsl-complex-sin
    (a :: <gsl-complex>) => (c :: <gsl-complex>)
  make(<gsl-complex>,
       %data: ffi/gsl-complex-sin(a.%gsl-complex-data))
end;

define function gsl-complex-cos
    (a :: <gsl-complex>) => (c :: <gsl-complex>)
  make(<gsl-complex>,
       %data: ffi/gsl-complex-cos(a.%gsl-complex-data))
end;

define function gsl-complex-tan
    (a :: <gsl-complex>) => (c :: <gsl-complex>)
  make(<gsl-complex>,
       %data: ffi/gsl-complex-tan(a.%gsl-complex-data))
end;

define function gsl-complex-sec
    (a :: <gsl-complex>) => (c :: <gsl-complex>)
  make(<gsl-complex>,
       %data: ffi/gsl-complex-sec(a.%gsl-complex-data))
end;

define function gsl-complex-csc
    (a :: <gsl-complex>) => (c :: <gsl-complex>)
  make(<gsl-complex>,
       %data: ffi/gsl-complex-csc(a.%gsl-complex-data))
end;

define function gsl-complex-cot
    (a :: <gsl-complex>) => (c :: <gsl-complex>)
  make(<gsl-complex>,
       %data: ffi/gsl-complex-cot(a.%gsl-complex-data))
end;

///////////////////////////////////////////////////////////////////////////////
//
// Inverse Complex Trigonometric Functions
//
///////////////////////////////////////////////////////////////////////////////

define function gsl-complex-arcsin
    (a :: <gsl-complex>, b :: <gsl-complex>) => (c :: <gsl-complex>)
  make(<gsl-complex>,
       %data: ffi/gsl-complex-arcsin(a.%gsl-complex-data, b.%gsl-complex-data))
end;

define function gsl-complex-arccos
    (a :: <gsl-complex>) => (c :: <gsl-complex>)
  make(<gsl-complex>,
       %data: ffi/gsl-complex-arccos(a.%gsl-complex-data))
end;

define function gsl-complex-arctan
    (a :: <gsl-complex>) => (c :: <gsl-complex>)
  make(<gsl-complex>,
       %data: ffi/gsl-complex-arctan(a.%gsl-complex-data))
end;

define function gsl-complex-arcsec
    (a :: <gsl-complex>) => (c :: <gsl-complex>)
  make(<gsl-complex>,
       %data: ffi/gsl-complex-arcsec(a.%gsl-complex-data))
end;

define function gsl-complex-arccsc
    (a :: <gsl-complex>) => (c :: <gsl-complex>)
  make(<gsl-complex>,
       %data: ffi/gsl-complex-arccsc(a.%gsl-complex-data))
end;

define function gsl-complex-arccot
    (a :: <gsl-complex>) => (c :: <gsl-complex>)
  make(<gsl-complex>,
       %data: ffi/gsl-complex-arccot(a.%gsl-complex-data))
end;

define function gsl-complex-arcsin-real
    (x :: <float>) => (c :: <gsl-complex>)
  make(<gsl-complex>,
       %data: ffi/gsl-complex-arcsin-real(x))
end;

define function gsl-complex-arccos-real
    (x :: <float>, a :: <gsl-complex>) => (c :: <gsl-complex>)
  make(<gsl-complex>,
       %data: ffi/gsl-complex-arccos-real(x, a.%gsl-complex-data))
end;

define function gsl-complex-arcsec-real
    (x :: <float>, a :: <gsl-complex>) => (c :: <gsl-complex>)
  make(<gsl-complex>,
       %data: ffi/gsl-complex-arcsec-real(x, a.%gsl-complex-data))
end;

define function gsl-complex-arccsc-real
    (x :: <float>, a :: <gsl-complex>) => (c :: <gsl-complex>)
  make(<gsl-complex>,
       %data: ffi/gsl-complex-arccsc-real(x, a.%gsl-complex-data))
end;

define function gsl-complex-arccosh-real
    (x :: <float>, a :: <gsl-complex>) => (c :: <gsl-complex>)
  make(<gsl-complex>,
       %data: ffi/gsl-complex-arccosh-real(x, a.%gsl-complex-data))
end;

define function gsl-complex-arctanh-real
    (x :: <float>, a :: <gsl-complex>) => (c :: <gsl-complex>)
  make(<gsl-complex>,
       %data: ffi/gsl-complex-arctanh-real(x, a.%gsl-complex-data))
end;

///////////////////////////////////////////////////////////////////////////////
//
// Complex Hyperbolic Functions
//
///////////////////////////////////////////////////////////////////////////////

define function gsl-complex-sinh
    (a :: <gsl-complex>) => (c :: <gsl-complex>)
  make(<gsl-complex>,
       %data: ffi/gsl-complex-sinh(a.%gsl-complex-data))
end;

define function gsl-complex-cosh
    (a :: <gsl-complex>) => (c :: <gsl-complex>)
  make(<gsl-complex>,
       %data: ffi/gsl-complex-cosh(a.%gsl-complex-data))
end;

define function gsl-complex-tanh
    (a :: <gsl-complex>) => (c :: <gsl-complex>)
  make(<gsl-complex>,
       %data: ffi/gsl-complex-tanh(a.%gsl-complex-data))
end;

define function gsl-complex-sech
    (a :: <gsl-complex>) => (c :: <gsl-complex>)
  make(<gsl-complex>,
       %data: ffi/gsl-complex-sech(a.%gsl-complex-data))
end;

define function gsl-complex-csch
    (a :: <gsl-complex>) => (c :: <gsl-complex>)
  make(<gsl-complex>,
       %data: ffi/gsl-complex-csch(a.%gsl-complex-data))
end;

define function gsl-complex-coth
    (a :: <gsl-complex>) => (c :: <gsl-complex>)
  make(<gsl-complex>,
       %data: ffi/gsl-complex-coth(a.%gsl-complex-data))
end;

///////////////////////////////////////////////////////////////////////////////
//
// Inverse Complex Hyperbolic Functions
//
///////////////////////////////////////////////////////////////////////////////

define function gsl-complex-arcsinh
    (a :: <gsl-complex>) => (c :: <gsl-complex>)
  make(<gsl-complex>,
       %data: ffi/gsl-complex-arcsinh(a.%gsl-complex-data))
end;

define function gsl-complex-arccosh
    (a :: <gsl-complex>) => (c :: <gsl-complex>)
  make(<gsl-complex>,
       %data: ffi/gsl-complex-arccosh(a.%gsl-complex-data))
end;

define function gsl-complex-arctanh
    (a :: <gsl-complex>) => (c :: <gsl-complex>)
  make(<gsl-complex>,
       %data: ffi/gsl-complex-arctanh(a.%gsl-complex-data))
end;

define function gsl-complex-arcsech
    (a :: <gsl-complex>) => (c :: <gsl-complex>)
  make(<gsl-complex>,
       %data: ffi/gsl-complex-arcsech(a.%gsl-complex-data))
end;

define function gsl-complex-arccsch
    (a :: <gsl-complex>) => (c :: <gsl-complex>)
  make(<gsl-complex>,
       %data: ffi/gsl-complex-arccsch(a.%gsl-complex-data))
end;

define function gsl-complex-arccoth
    (a :: <gsl-complex>) => (c :: <gsl-complex>)
  make(<gsl-complex>,
       %data: ffi/gsl-complex-arccoth(a.%gsl-complex-data))
end;
