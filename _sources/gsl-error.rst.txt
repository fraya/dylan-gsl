GSL-ERROR
*********

.. current-library:: dylan-gsl
.. current-module:: gsl-error

Base error class
================

.. class:: <gsl-error>
   :abstract:
   :instantiable:

   :superclasses: :drm:`<error>`

   :keyword required code: An instance of :drm:`<integer>`.

   :keyword filename: An instance of false-or(:drm:`<string>`).

   :keyword line: An instance of false-or(:drm:`<integer>`).

   :keyword reason: An instance of false-or(:drm:`<string>`).

   :slot gsl-error-code: An instance of :drm:`<integer>`.

   :slot gsl-error-filename: An instance of false-or(:drm:`<string>`).

   :slot gsl-error-line: An instance of false-or(:drm:`<integer>`).

   :slot gsl-error-reason: An instance of false-or(:drm:`<string>`).

.. generic-function:: gsl-error-message

   :signature: gsl-error-message (err) => (message)

   :parameter err: An instance of :class:`<gsl-error>`.
   :value message: An instance of :drm:`<string>`.

.. method:: gsl-error-message
   :specializer: <gsl-error>
   :no-contents-entry:

.. generic-function:: gsl-error-details

   :signature: gsl-error-details (err) => (details)

   :parameter err: An instance of :class:`<gsl-error>`.
   :value details: An instance of :drm:`<string>`.

.. method:: gsl-error-details
   :specializer: <gsl-error>

Error types
===========

.. class:: <gsl-error-failure>
   :instantiable:

   :superclasses: <gsl-error>

.. class:: <gsl-error-failure>
   :instantiable:

   :superclasses: <gsl-error>

.. class:: <gsl-error-continue>
   :instantiable:

   :superclasses: <gsl-error>

.. class:: <gsl-error-domain>
   :instantiable:

   :superclasses: <gsl-error>

.. class:: <gsl-error-domain>
   :instantiable:

   :superclasses: <gsl-error>

.. class:: <gsl-error-range>
   :instantiable:

   :superclasses: <gsl-error>

.. class:: <gsl-error-fault>
   :instantiable:

   :superclasses: <gsl-error>

.. class:: <gsl-error-invalid-argument>
   :instantiable:

   :superclasses: <gsl-error>

.. class:: <gsl-error-invalid-argument>
   :instantiable:

   :superclasses: <gsl-error>

.. class:: <gsl-error-failed>
   :instantiable:

   :superclasses: <gsl-error>

.. class:: <gsl-error-factorization-failed>
   :instantiable:

   :superclasses: <gsl-error>

.. class:: <gsl-error-sanity-check-failed>
   :instantiable:

   :superclasses: <gsl-error>

.. class:: <gsl-error-no-memory>
   :instantiable:

   :superclasses: <gsl-error>

.. class:: <gsl-error-bad-function>
   :instantiable:

   :superclasses: <gsl-error>

.. class:: <gsl-error-runaway>
   :instantiable:

   :superclasses: <gsl-error>

.. class:: <gsl-error-max-iterations>
   :instantiable:

   :superclasses: <gsl-error>

.. class:: <gsl-error-zero-division>
   :instantiable:

   :superclasses: <gsl-error>

.. class:: <gsl-error-bad-tolerance>
   :instantiable:

   :superclasses: <gsl-error>

.. class:: <gsl-error-tolerance>
   :instantiable:

   :superclasses: <gsl-error>

.. class:: <gsl-error-underflow>
   :instantiable:

   :superclasses: <gsl-error>

.. class:: <gsl-error-overflow>
   :instantiable:

   :superclasses: <gsl-error>

.. class:: <gsl-error-loss-of-accuracy>
   :instantiable:

   :superclasses: <gsl-error>

.. class:: <gsl-error-roundoff>
   :instantiable:

   :superclasses: <gsl-error>

.. class:: <gsl-error-bad-length>
   :instantiable:

   :superclasses: <gsl-error>

.. class:: <gsl-error-not-square>
   :instantiable:

   :superclasses: <gsl-error>

.. class:: <gsl-error-singularity>
   :instantiable:

   :superclasses: <gsl-error>

.. class:: <gsl-error-divergence>
   :instantiable:

   :superclasses: <gsl-error>

.. class:: <gsl-error-unsupported>
   :instantiable:

   :superclasses: <gsl-error>

.. class:: <gsl-error-unimplemented>
   :instantiable:

   :superclasses: <gsl-error>

.. class:: <gsl-error-cache-limit-exceeded>
   :instantiable:

   :superclasses: <gsl-error>

.. class:: <gsl-error-table-limit-exceeded>
   :instantiable:

   :superclasses: <gsl-error>

.. class:: <gsl-error-no-progress>
   :instantiable:

   :superclasses: <gsl-error>

.. class:: <gsl-error-no-progress-jacobian>
   :instantiable:

   :superclasses: <gsl-error>

.. class:: <gsl-error-tolerance-f>
   :instantiable:

   :superclasses: <gsl-error>

.. class:: <gsl-error-tolerance-x>
   :instantiable:

   :superclasses: <gsl-error>

.. class:: <gsl-error-tolerance-gradient>
   :instantiable:

   :superclasses: <gsl-error>

.. class:: <gsl-error-end-of-file>
   :instantiable:

   :superclasses: <gsl-error>
