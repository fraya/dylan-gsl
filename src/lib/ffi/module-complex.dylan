Module: dylan-user
Synopsis: Module for FFI complex numbers
Author: Fernando Raya
Copyright: Copyright (C) 2026, Dylan Hackers. All rights reserved.
License: See License.txt in this distribution for details.

define module gsl-ffi-complex

  // Complex number

  create
    <gsl-complex*>,
    gsl-complex-real,
    gsl-complex-imag;

  // Assigning complex numbers

  create
    gsl-complex,
    gsl-complex-polar;

  // Properties of complex numbers

  create
    gsl-complex-arg,
    gsl-complex-abs,
    gsl-complex-abs2,
    gsl-complex-logabs;

  // Complex arithmetic operators

  create
    gsl-complex-add,
    gsl-complex-sub,
    gsl-complex-mul,
    gsl-complex-div,
    gsl-complex-add-real,
    gsl-complex-sub-real,
    gsl-complex-mul-real,
    gsl-complex-div-real,
    gsl-complex-add-imag,
    gsl-complex-sub-imag,
    gsl-complex-mul-imag,
    gsl-complex-div-imag,
    gsl-complex-conjugate,
    gsl-complex-inverse,
    gsl-complex-negative;

  // Elementary complex functions

  create
    gsl-complex-sqrt,
    gsl-complex-sqrt-real,
    gsl-complex-pow,
    gsl-complex-pow-real,
    gsl-complex-exp,
    gsl-complex-log,
    gsl-complex-log10,
    gsl-complex-log-b;

  // Complex trigonometric functions

  create
    gsl-complex-sin,
    gsl-complex-cos,
    gsl-complex-tan,
    gsl-complex-sec,
    gsl-complex-csc,
    gsl-complex-cot;

  // Inverse complex trigonometric functions

  create
    gsl-complex-arcsin,
    gsl-complex-arcsin-real,
    gsl-complex-arccos,
    gsl-complex-arccos-real,
    gsl-complex-arctan,
    gsl-complex-arcsec,
    gsl-complex-arcsec-real,
    gsl-complex-arccsc,
    gsl-complex-arccsc-real,
    gsl-complex-arccot;

  // Complex hyperbolic functions

  create
    gsl-complex-sinh,
    gsl-complex-cosh,
    gsl-complex-tanh,
    gsl-complex-sech,
    gsl-complex-csch,
    gsl-complex-coth;

  // Inverse complex hyperbolic functions

  create
    gsl-complex-arcsinh,
    gsl-complex-arccosh,
    gsl-complex-arccosh-real,
    gsl-complex-arctanh,
    gsl-complex-arctanh-real,
    gsl-complex-arcsech,
    gsl-complex-arccsch,
    gsl-complex-arccoth;

end module;

define module gsl-ffi-complex-impl

  use common-dylan;
  use c-ffi;

  use gsl-ffi-complex;

end module;
