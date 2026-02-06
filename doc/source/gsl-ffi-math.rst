The GSL-FFI-MATH module
***********************

.. current-library:: dylan-gsl
.. current-module:: gsl-ffi-math

Mathematical constants
======================

.. constant:: $gsl-e

.. constant:: $gsl-log10e

.. constant:: $gsl-log2e

.. constant:: $gsl-pi

.. constant:: $gsl-pi/2

.. constant:: $gsl-pi/4

.. constant:: $gsl-sqrt1/2

.. constant:: $gsl-sqrt1/3

.. constant:: $gsl-sqrt2

.. constant:: $gsl-sqrt3

Floating point comparison
=========================

.. function:: gsl-fcmp

   :signature: gsl-fcmp (x y epsilon) => (comparison)

   :parameter x: An instance of ``export-type-for(<c-double>)``.
   :parameter y: An instance of ``export-type-for(<c-double>)``.
   :parameter epsilon: An instance of ``export-type-for(<c-double>)``.
   :value comparison: An instance of ``import-type-for(<c-int>)``.

Elementary functions
====================

.. function:: gsl-log1p

   :signature: gsl-log1p (x) => (log1p-x)

   :parameter x: An instance of ``export-type-for(<c-double>)``.
   :value log1p-x: An instance of ``import-type-for(<c-double>)``.

.. function:: gsl-expm1

   :signature: gsl-expm1 (x) => (expm1-x)

   :parameter x: An instance of ``export-type-for(<c-double>)``.
   :value expm1-x: An instance of ``import-type-for(<c-double>)``.

.. function:: gsl-hypot

   :signature: gsl-hypot (x y) => (hypot-xy)

   :parameter x: An instance of ``export-type-for(<c-double>)``.
   :parameter y: An instance of ``export-type-for(<c-double>)``.
   :value hypot-xy: An instance of ``import-type-for(<c-double>)``.

.. function:: gsl-hypot3

   :signature: gsl-hypot3 (x y z) => (hypot3-xyz)

   :parameter x: An instance of ``export-type-for(<c-double>)``.
   :parameter y: An instance of ``export-type-for(<c-double>)``.
   :parameter z: An instance of ``export-type-for(<c-double>)``.
   :value hypot3-xyz: An instance of ``import-type-for(<c-double>)``.

.. function:: gsl-acosh

   :signature: gsl-acosh (x) => (acosh-x)

   :parameter x: An instance of ``export-type-for(<c-double>)``.
   :value acosh-x: An instance of ``import-type-for(<c-double>)``.

.. function:: gsl-asinh

   :signature: gsl-asinh (x) => (asinh-x)

   :parameter x: An instance of ``export-type-for(<c-double>)``.
   :value asinh-x: An instance of ``import-type-for(<c-double>)``.

.. function:: gsl-atanh

   :signature: gsl-atanh (x) => (atanh-x)

   :parameter x: An instance of ``export-type-for(<c-double>)``.
   :value atanh-x: An instance of ``import-type-for(<c-double>)``.

.. function:: gsl-ldexp

   :signature: gsl-ldexp (x n) => (ldexp-xn)

   :parameter x: An instance of ``export-type-for(<c-double>)``.
   :parameter n: An instance of ``export-type-for(<c-int>)``.
   :value ldexp-xn: An instance of ``import-type-for(<c-double>)``.

.. function:: gsl-frexp

   :signature: gsl-frexp (x n) => (frexp-xn)

   :parameter x: An instance of ``export-type-for(<c-double>)``.
   :parameter n: An instance of ``export-type-for(<c-int>)``.
   :value frexp-xn: An instance of ``import-type-for(<c-double>)``.

.. function:: gsl-hypot3

   :signature: gsl-hypot3 (x y z) => (hypot3-xyz)

   :parameter x: An instance of ``export-type-for(<c-double>)``.
   :parameter y: An instance of ``export-type-for(<c-double>)``.
   :parameter z: An instance of ``export-type-for(<c-double>)``.
   :value hypot3-xyz: An instance of ``import-type-for(<c-double>)``.

.. function:: gsl-acosh

   :signature: gsl-acosh (x) => (acosh-x)

   :parameter x: An instance of ``export-type-for(<c-double>)``.
   :value acosh-x: An instance of ``import-type-for(<c-double>)``.

.. function:: gsl-asinh

   :signature: gsl-asinh (x) => (asinh-x)

   :parameter x: An instance of ``export-type-for(<c-double>)``.
   :value asinh-x: An instance of ``import-type-for(<c-double>)``.

.. function:: gsl-atanh

   :signature: gsl-atanh (x) => (atanh-x)

   :parameter x: An instance of ``export-type-for(<c-double>)``.
   :value atanh-x: An instance of ``import-type-for(<c-double>)``.

.. function:: gsl-ldexp

   :signature: gsl-ldexp (x n) => (ldexp-xn)

   :parameter x: An instance of ``export-type-for(<c-double>)``.
   :parameter n: An instance of ``export-type-for(<c-int>)``.
   :value ldexp-xn: An instance of ``import-type-for(<c-double>)``.

.. function:: gsl-frexp

   :signature: gsl-frexp (x n) => (frexp-xn)

   :parameter x: An instance of ``export-type-for(<c-double>)``.
   :parameter n: An instance of ``export-type-for(<c-int>)``.
   :value frexp-xn: An instance of ``import-type-for(<c-double>)``.