The GSL-FFI-MATH module
***********************

.. current-library:: dylan-gsl
.. current-module:: gsl-ffi-math

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

.. function:: gsl-fcmp

   :signature: gsl-fcmp (x y epsilon) => (comparison)

   :parameter x: An instance of ``export-type-for(<c-double>)``.
   :parameter y: An instance of ``export-type-for(<c-double>)``.
   :parameter epsilon: An instance of ``export-type-for(<c-double>)``.
   :value comparison: An instance of ``import-type-for(<c-int>)``.