The GSL-FFI-ERROR module
************************

.. current-library:: dylan-gsl
.. current-module:: gsl-ffi-error

Error constants
===============

.. constant:: $gsl-continue

.. constant:: $gsl-ebadfunc

.. constant:: $gsl-ebadlen

.. constant:: $gsl-ebadtol

.. constant:: $gsl-ecache

.. constant:: $gsl-ediv

.. constant:: $gsl-edom

.. constant:: $gsl-efactor

.. constant:: $gsl-efailed

.. constant:: $gsl-efault

.. constant:: $gsl-einval

.. constant:: $gsl-eloss

.. constant:: $gsl-emaxiter

.. constant:: $gsl-enomem

.. constant:: $gsl-enoprog

.. constant:: $gsl-enoprogjac

.. constant:: $gsl-enotsq

.. constant:: $gsl-eof

.. constant:: $gsl-erange

.. constant:: $gsl-eround

.. constant:: $gsl-erunaway

.. constant:: $gsl-esanity

.. constant:: $gsl-esing

.. constant:: $gsl-etable

.. constant:: $gsl-etol

.. constant:: $gsl-etolf

.. constant:: $gsl-etolg

.. constant:: $gsl-etolx

.. constant:: $gsl-eunderflow

.. constant:: $gsl-eunimpl

.. constant:: $gsl-eunsupp

.. constant:: $gsl-ezero

.. constant:: $gsl-failure

.. constant:: $gsl-ovrflw

Error functions
===============

.. function:: gsl-strerror

   :signature: gsl-strerror (status) => (message)

   :parameter status: An instance of ``export-type-for(<c-int>)``.
   :value message: An instance of ``import-type-for(<c-string>)``.