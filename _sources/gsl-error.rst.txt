The GSL-ERROR module
********************

.. current-library:: dylan-gsl
.. current-module:: gsl-error

Base error class
================

.. class:: <gsl-error>

   :superclasses: :drm:`<error>`

   :keyword required code: An instance of :drm:`<integer>`.

.. generic-function:: gsl-error-code

   :signature: gsl-error-code (object) => (value)

   :parameter object: An instance of ``{<gsl-error> in gsl-error}``.
   :value value: An instance of :drm:`<integer>`.

.. generic-function:: gsl-error-message

   :signature: gsl-error-message (err) => (message)

   :parameter err: An instance of :class:`<gsl-error>`.
   :value message: An instance of :drm:`<string>`.

Error types
===========

.. class:: <gsl-bad-function>

   :superclasses: :class:`<gsl-error>`


.. class:: <gsl-bad-length>

   :superclasses: :class:`<gsl-error>`


.. class:: <gsl-bad-tolerance>

   :superclasses: :class:`<gsl-error>`


.. class:: <gsl-cache-limit-exceeded>

   :superclasses: :class:`<gsl-error>`


.. class:: <gsl-continue>

   :superclasses: :class:`<gsl-error>`


.. class:: <gsl-divergence>

   :superclasses: :class:`<gsl-error>`


.. class:: <gsl-domain-error>

   :superclasses: :class:`<gsl-error>`


.. class:: <gsl-end-of-file>

   :superclasses: :class:`<gsl-error>`


.. class:: <gsl-factorization-failed>

   :superclasses: :class:`<gsl-error>`


.. class:: <gsl-failed>

   :superclasses: :class:`<gsl-error>`


.. class:: <gsl-failure>

   :superclasses: :class:`<gsl-error>`


.. class:: <gsl-fault>

   :superclasses: :class:`<gsl-error>`


.. class:: <gsl-invalid-argument>

   :superclasses: :class:`<gsl-error>`


.. class:: <gsl-loss-of-accuracy>

   :superclasses: :class:`<gsl-error>`


.. class:: <gsl-max-iterations>

   :superclasses: :class:`<gsl-error>`


.. class:: <gsl-no-memory>

   :superclasses: :class:`<gsl-error>`


.. class:: <gsl-no-progress-jacobian>

   :superclasses: :class:`<gsl-error>`


.. class:: <gsl-no-progress>

   :superclasses: :class:`<gsl-error>`


.. class:: <gsl-not-square>

   :superclasses: :class:`<gsl-error>`


.. class:: <gsl-overflow>

   :superclasses: :class:`<gsl-error>`


.. class:: <gsl-range-error>

   :superclasses: :class:`<gsl-error>`


.. class:: <gsl-roundoff-error>

   :superclasses: :class:`<gsl-error>`


.. class:: <gsl-runaway>

   :superclasses: :class:`<gsl-error>`


.. class:: <gsl-sanity-check-failed>

   :superclasses: :class:`<gsl-error>`


.. class:: <gsl-singularity>

   :superclasses: :class:`<gsl-error>`


.. class:: <gsl-table-limit-exceeded>

   :superclasses: :class:`<gsl-error>`


.. class:: <gsl-tolerance-f>

   :superclasses: :class:`<gsl-error>`


.. class:: <gsl-tolerance-gradient>

   :superclasses: :class:`<gsl-error>`


.. class:: <gsl-tolerance-x>

   :superclasses: :class:`<gsl-error>`


.. class:: <gsl-tolerance>

   :superclasses: :class:`<gsl-error>`


.. class:: <gsl-underflow>

   :superclasses: :class:`<gsl-error>`


.. class:: <gsl-unimplemented>

   :superclasses: :class:`<gsl-error>`


.. class:: <gsl-unsupported>

   :superclasses: :class:`<gsl-error>`


.. class:: <gsl-zero-division>

   :superclasses: :class:`<gsl-error>`

