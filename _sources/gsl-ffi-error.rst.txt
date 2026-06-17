GSL-FFI-ERROR
*************

.. current-library:: dylan-gsl
.. current-module:: gsl-ffi-error


Error functions
===============

.. function:: gsl-strerror

   :signature: gsl-strerror (status) => (message)

   :param status: An instance of :class:`<c-int>`.
   :value message: An instance of :class:`<c-string>`.

.. function:: gsl-set-error-handler

   :signature: gsl-set-error-handler (handler) => (previous-handler)

   :param handler: Type ``<c-void*>``.
   :value previous-handler: Type ``<c-void*>``.

.. function:: gsl-set-error-handler-off

   :signature: gsl-set-error-handler-off () => (previous-handler)

   :value previous-handler: Type ``<c-void*>``.

.. variable:: *gsl-error-handler*

