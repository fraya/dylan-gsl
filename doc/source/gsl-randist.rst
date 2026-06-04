GSL-RANDIST
***********

.. current-library:: dylan-gsl
.. current-module:: gsl-randist

This module provides functionality to generate random variates from
distributions.

With polymorphism and multimethods I have reduced the number of
functions available in the original GSL library, reducing the
interface and the number of parameters passed to each function. This
approach can be seen at :class:`<gsl-randist>`.

The distributions available in this module are:

- :class:`<gsl-gaussian>`
- :class:`<gsl-ugaussian>`
- :class:`<gsl-gaussian-tail>`
- :class:`<gsl-ugaussian-tail>`


The ``<gsl-randist>`` interface
====================================

.. class:: <gsl-randist>
   :abstract:
   :uninstantiable:

   Base class for all distributions.

   :keyword rng:

     Random number generator. An instance of :class:`<gsl-rng>`.  Used
     to generate random variates from the distribution.

   :operations:

     - :func:`gsl-ran-variate`
     - :func:`gsl-ran-pdf`
     - :func:`gsl-cdf-p`
     - :func:`gsl-cdf-q`
     - :func:`gsl-cdf-pinv`
     - :func:`gsl-cdf-qinv`

Operations
----------

.. generic-function:: gsl-ran-variate

   :signature: gsl-ran-variate (distribution) => (variate)

   Generates a random variate from the distribution.

   :parameter distribution:

     An instance of :class:`<gsl-randist>`.

   :result variate:

     A random variate from the distribution.  An instance of
     :drm:`<float>`.

.. generic-function:: gsl-ran-pdf

   Evaluates the probability density function (PDF) for the
   distribution.

   :signature: gsl-ran-pdf (distribution, x) => (pd)

   :parameter distribution:

     An instance of :class:`<gsl-randist>`.

   :parameter x:

     The value at which to evaluate the probability density function.
     An instance of :drm:`<float>`.

   :result pd:

     The probability density at x. An instance of :drm:`<float>`.

.. generic-function:: gsl-cdf-p

   Evaluates the cumulative distribution function (CDF) for the
   distribution.

   :signature: gsl-cdf-p (distribution, x) => (cd)

   :parameter distribution:

     An instance of :class:`<gsl-randist>`.

   :parameter x:

     The value at which to evaluate the cumulative distribution
     function.  An instance of :drm:`<float>`.

   :result cd:

     The cumulative probability at x. An instance of :drm:`<float>`.

.. generic-function:: gsl-cdf-q

   :signature: gsl-cdf-q (distribution, x) => (cd)

   :parameter distribution:

     An instance of :class:`<gsl-randist>`.

   :parameter x:

     The value at which to evaluate the survival function.  An
     instance of :drm:`<float>`.

   :result cd:

     The survival function at x. An instance of :drm:`<float>`.

.. generic-function:: gsl-cdf-pinv

   Evaluates the inverse cumulative distribution function (CDF) for
   the distribution.

   :signature: gsl-cdf-pinv (distribution, x) => (cd)

   :parameter distribution:

     An instance of :class:`<gsl-randist>`.

   :parameter x:

     The value at which to evaluate the inverse cumulative
     distribution function.  An instance of :drm:`<float>`.

   :result cd:

     The inverse cumulative distribution function at x. An instance of :drm:`<float>`.

.. generic-function:: gsl-cdf-qinv

   Evaluates the inverse cumulative distribution function (CDF) for
   the distribution.

   :signature: gsl-cdf-qinv (distribution, x) => (cd)

   :parameter distribution:

     An instance of :class:`<gsl-randist>`.

   :parameter x:

     The value at which to evaluate the inverse survival function.  An
     instance of :drm:`<float>`.

   :result cd:

     The inverse survival function at x. An instance of
     :drm:`<float>`.

Gaussian Distribution
=====================

.. class:: <gsl-randist-gaussian>
   :abstract:
   :uninstantiable:

   :supers: :class:`<gsl-randist>`

   :keyword sigma:

      Standard deviation. An instance of :drm:`<float>`.

   :slot gsl-randist-sigma:

      The standard deviation of the distribution. An instance of
      :drm:`<float>`.

   :summary:

      Base class of Gaussian distributions.

.. class:: <gsl-gaussian>
   :instantiable:

   A Gaussian distribution. This returns random values of Gaussian
   probability density function.  See the original GSL documentation
   for more information at `Gaussian Distribution
   <https://www.gnu.org/software/gsl/doc/html_node/Gaussian-Distribution.html>`_.
   This distribution stores the type of algorithm used to generate
   random variates.

   :supers: :class:`<gsl-randist-gaussian>`

   :keyword algorithm:

     The algorithm to use for generating random variates.  An instance
     of :class:`<gsl-gaussian-algorithm>`.  This keyword is optional
     and the default value is :const:`$gaussian-box-muller`.  See
     :class:`<gsl-gaussian-algorithm>` for more information.

   :slot gsl-gaussian-algorithm:

      An instance of :class:`<gsl-gaussian-algorithm>`.

   :operations:

      The following operations are defined for
      :class:`<gsl-gaussian>`.  There is no documentation
      available since is the same as the parent class.  See operations
      in :class:`<gsl-randist>` for more information.

      - :func:`gsl-randist-sigma(<gsl-randist-gaussian>)`
      - :meth:`gsl-ran-variate(<gsl-randist-gaussian>)`
      - :meth:`gsl-ran-pdf(<gsl-randist-gaussian>)`
      - :meth:`gsl-cdf-p(<gsl-randist-gaussian>)`
      - :meth:`gsl-cdf-q(<gsl-randist-gaussian>)`
      - :meth:`gsl-cdf-pinv(<gsl-randist-gaussian>)`
      - :meth:`gsl-cdf-qinv(<gsl-randist-gaussian>)`

   :example:

     .. code-block:: dylan

        let d = make(<gsl-gaussian>, sigma: 0.5d0, rng: make(<gsl-rng>));
        let k = d.gsl-ran-variate;

        // Change default algorithm
        d.gsl-gaussian-algorithm := $gaussian-ratio-method;
        let u = d.gsl-ran-variate;

   :example:

      .. code-block:: dylan

        let d = make(<gsl-gaussian>,
                     rng: make(<gsl-rng>),
                     sigma: 1,
                     algorithm: $gaussian-ratio-method);

        let k = d.gsl-ran-variate;


Gaussian algorithms
-------------------

.. class:: <gsl-gaussian-algorithm>

   Type of Gaussian distribution algorithms used to generate random
   variates.

.. constant:: $gaussian-box-muller

   Box-Muller algorithm. This is the default value.

.. constant:: $gaussian-ziggurat

   Computes a Gaussian random variate using the alternative
   Marsaglia-Tsang ziggurat method.  The Ziggurat algorithm is the
   fastest available algorithm in most cases.

.. constant:: $gaussian-ratio-method

   Kinderman-Monahan-Leva ratio method.

The Unit Gaussian Distribution
==============================

.. class:: <gsl-ugaussian>
   :instantiable:

   :supers: :class:`<gsl-randist>`

   :key algorithm:

     The algorithm to use for generating random variates.  An instance
     of :class:`<gsl-ugaussian-algorithm>`.  Default value is
     :const:`$ugaussian-default`.

   :operations:

      The following operations have no documentation available since
      is the same as the parent class. See operations in
      :class:`<gsl-randist>` for more information.

      - :meth:`gsl-ran-variate(<gsl-randist-ugassian>)`
      - :meth:`gsl-ran-pdf(<gsl-randist-ugassian>)`
      - :meth:`gsl-cdf-p(<gsl-randist-ugassian>)`
      - :meth:`gsl-cdf-q(<gsl-randist-ugassian>)`
      - :meth:`gsl-cdf-pinv(<gsl-randist-ugassian>)`
      - :meth:`gsl-cdf-qinv(<gsl-randist-ugassian>)`

   :summary:

      These functions compute results for the tail of a unit Gaussian
      distribution. They are equivalent to the functions above with a
      standard deviation of one, sigma = 1.

Ugaussian algorithms
--------------------

.. class:: <gsl-ugaussian-algorithm>

   Type of Ugaussian distribution algorithms used to generate random
   variates.

.. constant:: $ugaussian-default

   The default algorithm for generating Ugaussian random variates.

.. constant:: $ugaussian-ratio-method

   Computes a Ugaussian random variate using the ratio method.  The
   ratio method is the fastest available algorithm in most cases.

The tail distributions
======================

.. class:: <gsl-randist-tail>
   :abstract:

   :supers: :drm:`<object>`

   :slot gsl-randist-a:

      An instance of :drm:`<float>`.

   :summary:

      The base class of all tail distributions.

.. class:: <gsl-gaussian-tail>
   :instantiable:

   :supers:

      :class:`<gsl-randist-gaussian>`
      :class:`<gsl-randist-tail>`

   :operations:

         - :meth:`gsl-ran-variate(<gsl-gaussian-tail>)`
         - :meth:`gsl-ran-pdf(<gsl-gaussian-tail>)`

   :summary:

      Provides random variates from the upper tail of a Gaussian
      distribution with standard deviation ``sigma``. The values returned
      are larger than the lower limit ``a``, which must be positive.

.. class:: <gsl-ugaussian-tail>
   :instantiable:

   :supers:

      :class:`<gsl-ugaussian>`
      :class:`<gsl-randist-tail>`

   :operations:

         - :meth:`gsl-ran-variate(<gsl-ugaussian-tail>)`
         - :meth:`gsl-ran-pdf(<gsl-ugaussian-tail>)`

   :summary:

      Compute results for the tail of a unit Gaussian
      distribution. They are equivalent to the
      :class:`<gsl-gaussian-tail>` with a standard deviation of one,
      sigma = 1.

