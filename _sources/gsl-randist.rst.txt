GSL-RANDIST
***********

.. current-library:: dylan-gsl
.. current-module:: gsl-randist

This module provides functionality to generate random variates from
distributions.

Polymorphism and multimethods were used to simplify the original GSL
library interface, reducing both the function count and the number of
parameters per function. See :class:`<gsl-randist>` for examples of
this design.

The continuous distributions available in this module are:

- :class:`<gsl-randist-gaussian>`
- :class:`<gsl-randist-ugaussian>`
- :class:`<gsl-randist-gaussian-tail>`
- :class:`<gsl-randist-ugaussian-tail>`
- :class:`<gsl-randist-exponential>`
- :class:`<gsl-randist-laplace>`
- :class:`<gsl-randist-exppow>`
- :class:`<gsl-randist-cauchy>`
- :class:`<gsl-randist-rayleigh>`
- :class:`<gsl-randist-rayleigh-tail>`
- :class:`<gsl-randist-landau>`
- :class:`<gsl-randist-levy>`
- :class:`<gsl-randist-levy-skew>`
- :class:`<gsl-randist-gamma>`
- :class:`<gsl-randist-flat>`
- :class:`<gsl-randist-lognormal>`
- :class:`<gsl-randist-chisq>`
- :class:`<gsl-randist-fdist>`
- :class:`<gsl-randist-tdist>`
- :class:`<gsl-randist-beta>`
- :class:`<gsl-randist-logistic>`
- :class:`<gsl-randist-pareto>`
- :class:`<gsl-randist-dir-2d>`
- :class:`<gsl-randist-dir-3d>`
- :class:`<gsl-randist-dir-nd>`
- :class:`<gsl-randist-weibull>`
- :class:`<gsl-randist-gumbel1>`
- :class:`<gsl-randist-gumbel2>`
- :class:`<gsl-randist-dirichlet>`
- :class:`<gsl-randist-poisson>`
- :class:`<gsl-randist-binomial>`
- :class:`<gsl-randist-negative-binomial>`

The ``<gsl-randist>`` interface
===============================

.. class:: <gsl-randist>
   :abstract:
   :uninstantiable:

   Base class for all distributions.

   :keyword rng:

     Random number generator. Used
     to generate random variates from the distribution. If not provided
     a new instance of :class:`<gsl-rng>` is provided. This generator can be
     configured by environment variables (see :ref:`rng_environment_variables`)

   :operations:

     - :func:`gsl-randist-variate`
     - :func:`gsl-randist-pdf`

Operations
----------

.. generic-function:: gsl-randist-variate

   :signature:

     gsl-randist-variate distribution => (variate)

   Generates a random variate from the distribution.

   :parameter distribution:

     An instance of :class:`<gsl-randist>`.

   :result variate:

     A random variate from the distribution.  An instance of
     :drm:`<object>`.

.. generic-function:: gsl-randist-pdf

   Evaluates the probability density function (PDF) for the
   distribution.

   :signature:

     gsl-randist-pdf (distribution, x) => (pd)

   :parameter distribution:

     An instance of :class:`<gsl-randist>`.

   :parameter x:

     The value at which to evaluate the probability density function.
     An instance of :drm:`<float>`.

   :result pd:

     The probability density at x. An instance of :drm:`<float>`.


The Continuous Distribution
===========================

.. class:: <gsl-randist-continuous>
   :abstract:
   :uninstantiable:

   :supers:

     :class:`<gsl-randist>`

   Base class for all continuous distributions.

   :operations:

     - :func:`gsl-randist-variate`
     - :func:`gsl-randist-pdf`
     - :func:`gsl-randist-cdf-p`
     - :func:`gsl-randist-cdf-q`
     - :func:`gsl-randist-cdf-pinv`
     - :func:`gsl-randist-cdf-qinv`

.. generic-function:: gsl-randist-cdf-p

   Evaluates the cumulative distribution function (CDF) for the
   distribution.

   :signature:

     gsl-randist-cdf-p distribution x => (cd)

   :parameter distribution:

     An instance of :class:`<gsl-randist-continuous>`.

   :parameter x:

     The value at which to evaluate the cumulative distribution
     function.  An instance of :drm:`<float>`.

   :result cd:

     The cumulative probability at x. An instance of :drm:`<float>`.

.. generic-function:: gsl-randist-cdf-q

   :signature:

     gsl-randist-cdf-q distribution x => (cd)

   :parameter distribution:

     An instance of :class:`<gsl-randist-continuous>`.

   :parameter x:

     The value at which to evaluate the survival function.  An
     instance of :drm:`<float>`.

   :result cd:

     The survival function at x. An instance of :drm:`<float>`.

.. generic-function:: gsl-randist-cdf-pinv

   Evaluates the inverse cumulative distribution function (CDF) for
   the distribution.

   :signature:

     gsl-randist-cdf-pinv distribution x => (cd)

   :parameter distribution:

     An instance of :class:`<gsl-randist-continuous>`.

   :parameter x:

     The value at which to evaluate the inverse cumulative
     distribution function.  An instance of :drm:`<float>`.

   :result cd:

     The inverse cumulative distribution function at x. An instance of :drm:`<float>`.

.. generic-function:: gsl-randist-cdf-qinv

   Evaluates the inverse cumulative distribution function (CDF) for
   the distribution.

   :signature:

     gsl-randist-cdf-qinv distribution x => (cd)

   :parameter distribution:

     An instance of :class:`<gsl-randist-continuous>`.

   :parameter x:

     The value at which to evaluate the inverse survival function.  An
     instance of :drm:`<float>`.

   :result cd:

     The inverse survival function at x. An instance of
     :drm:`<float>`.

The Gaussian Distribution
=========================

.. class:: <gsl-randist-gaussian>
   :instantiable:
   :concrete:

   A Gaussian distribution. This returns random values of Gaussian
   probability density function.  See the original GSL documentation
   for more information at `Gaussian Distribution
   <https://www.gnu.org/software/gsl/doc/html_node/Gaussian-Distribution.html>`_.
   This distribution stores the type of algorithm used to generate
   random variates.

   :supers:

     :class:`<gsl-randist-continuous>`

   :keyword required sigma:

      Standard deviation. An instance of :drm:`<float>`.

   :keyword algorithm:

     The algorithm to use for generating random variates. See
     :ref:`gaussian-algorithms` for more information.

   :conditions:

     A :class:`<gsl-error-invalid-argument>` condition is raised if
     the algorithm is not one of ``<gaussian-algorithm>``.

   :example:

     .. code-block:: dylan

        let r = make(<gsl-rng>);
        let d = make(<gsl-randist-gaussian>, sigma: 0.5d0, rng: r);
        let k = d.gsl-randist-variate;

   :example:

     .. code-block:: dylan

        let d = make(<gsl-gaussian>,
                     rng: make(<gsl-rng>),
                     sigma: 0.5d0,
                     algorithm: #"ratio");

        let k = d.gsl-randist-variate;

    :seealso:

       https://www.gnu.org/software/gsl/doc/html/randist.html#the-gaussian-distribution

The following operations are defined for
:class:`<gsl-randist-gaussian>`. See operations in
:class:`<gsl-randist-continuous>` for more information.

.. method:: gsl-randist-variate
   :specializer: <gsl-randist-gaussian>
   :no-contents-entry:

.. method:: gsl-randist-pdf
   :specializer: <gsl-randist-gaussian>
   :no-contents-entry:

.. method:: gsl-randist-cdf-p
   :specializer: <gsl-randist-gaussian>
   :no-contents-entry:

.. method:: gsl-randist-cdf-q
   :specializer: <gsl-randist-gaussian>
   :no-contents-entry:

.. method:: gsl-randist-cdf-pinv
   :specializer: <gsl-randist-gaussian>
   :no-contents-entry:

.. method:: gsl-randist-cdf-qinv
   :specializer: <gsl-randist-gaussian>
   :no-contents-entry:

The Unit Gaussian distribution
==============================

.. class:: <gsl-randist-ugaussian>
   :instantiable:
   :concrete:

   Unit Gaussian is a Gaussian distribution with sigma = 1.0d0.

   :supers:

      :class:`<gsl-randist-gaussian>`

   :key algorithm:

     The algorithm to use for generating random variates.  See
     :ref:`gaussian-algorithms` for more information.

   :discussion:

     The keyword ``sigma:`` must not be used since it is initialized
     by the class.

   :example:

     .. code-block:: dylan

        let d = make(<gsl-randist-ugaussian>, rng: make(<gsl-rng>));
        let v = d.gsl-randist-variate;

   :seealso:

     - :class:`<gsl-randist-gaussian>`

.. _gaussian-algorithms:

Gaussian algorithms
-------------------

.. class:: <gaussian-algorithm>

   This are the algorithms to generate a Gaussian variate value. This
   algorithm is passed as an optional keyword ``algorithm:`` to
   :class:`<gsl-randist-gaussian>` class. The valid values are:

   ``#"box-muller``
     Box-Muller algorithm. This is the default value.

   ``#"ziggurat"``
    Computes a Gaussian random variate using the alternative
    Marsaglia-Tsang ziggurat method.  The Ziggurat algorithm is the
    fastest available algorithm in most cases.

   ``#"ratio-method"``
     Kinderman-Monahan-Leva ratio method.

The Gaussian tail distribution
==============================

.. class:: <gsl-randist-gaussian-tail>
   :instantiable:
   :concrete:

   :supers:

      :class:`<gsl-randist-gaussian>`

   :keyword required rng:

   :keyword required sigma:

   :keyword required a:

      An instance of :drm:`<float>`. The values returned are larger
      than this limit, which must be positive.

   :conditions:

      A :class:`<gsl-invalid-argument>` is signaled if ``a`` keyword
      is not positive.

   :summary:

      Provides random variates from the upper tail of a Gaussian
      distribution with standard deviation ``sigma``. The values returned
      are larger than the lower limit ``a``, which must be positive.

   :seealso:

      - https://www.gnu.org/software/gsl/doc/html/randist.html#the-gaussian-tail-distribution

The following operations are specialized for
:class:`<gsl-randist-gaussian-tail>`. See operations in
:class:`<gsl-randist-continuous>` for more information.

.. method:: gsl-randist-variate
   :specializer: <gsl-randist-gaussian-tail>
   :no-contents-entry:

.. method:: gsl-randist-pdf
   :specializer: <gsl-randist-gaussian-tail>
   :no-contents-entry:

The Ugaussian tail distribution
===============================

.. class:: <gsl-randist-ugaussian-tail>
   :instantiable:
   :concrete:

   :supers:

      :class:`<gsl-randist-gaussian-tail>`

   :keyword required rng:

   :keyword required a:

      An instance of :drm:`<float>`. The values returned are larger
      than this limit, which must be positive.

   :summary:

      Compute results for the tail of a unit Gaussian
      distribution. They are equivalent to the
      :class:`<gsl-randist-gaussian-tail>` with a standard deviation
      of one, ``sigma`` = 1.0d0.

The Exponential Distribution
============================

.. class:: <gsl-randist-exponential>
   :instantiable:
   :concrete:

   :supers:

      :class:`<gsl-randist-continuous>``

   :keyword required mu:

      Mean mu.

   :seealso:

      - https://www.gnu.org/software/gsl/doc/html/randist.html#the-exponential-distribution

The following operations are specialized for
:class:`<gsl-randist-exponential>`. See operations in
:class:`<gsl-randist-continuous>` for more information.

.. method:: gsl-randist-variate
   :specializer: <gsl-randist-exponential>
   :no-contents-entry:

.. method:: gsl-randist-pdf
   :specializer: <gsl-randist-exponential>
   :no-contents-entry:

.. method:: gsl-randist-cdf-p
   :specializer: <gsl-randist-exponential>
   :no-contents-entry:

.. method:: gsl-randist-cdf-q
   :specializer: <gsl-randist-exponential>
   :no-contents-entry:

.. method:: gsl-randist-cdf-pinv
   :specializer: <gsl-randist-exponential>
   :no-contents-entry:

.. method:: gsl-randist-cdf-qinv
   :specializer: <gsl-randist-exponential>
   :no-contents-entry:

The Laplace Distribution
========================

.. class:: <gsl-randist-laplace>
   :instantiable:
   :concrete:

   :supers:

      :class:`<gsl-randist-continuous>`

   :keyword required a:

      Width

   :seealso:

      - https://www.gnu.org/software/gsl/doc/html/randist.html#the-laplace-distribution

The following operations are specialized for
:class:`<gsl-randist-laplace>`. See operations in
:class:`<gsl-randist-continuous>` for more information.

.. method:: gsl-randist-variate
   :specializer: <gsl-randist-laplace>
   :no-contents-entry:

.. method:: gsl-randist-pdf
   :specializer: <gsl-randist-laplace>
   :no-contents-entry:

.. method:: gsl-randist-cdf-p
   :specializer: <gsl-randist-laplace>
   :no-contents-entry:

.. method:: gsl-randist-cdf-q
   :specializer: <gsl-randist-laplace>
   :no-contents-entry:

.. method:: gsl-randist-cdf-pinv
   :specializer: <gsl-randist-laplace>
   :no-contents-entry:

.. method:: gsl-randist-cdf-qinv
   :specializer: <gsl-randist-laplace>
   :no-contents-entry:

The Exponential Power Distribution
==================================

.. class:: <gsl-randist-exppow>
   :instantiable:
   :concrete:

   :supers:

      :class:`<gsl-randist-continuous>`

   :keyword required a:

     An instance of :drm:`<float>`

   :keyword required b:

     An instance of :drm:`<float>`

   :seealso:

      - https://www.gnu.org/software/gsl/doc/html/randist.html#the-exponential-power-distribution

The following operations are specialized for
:class:`<gsl-randist-exppow>`. See operations in
:class:`<gsl-randist-continuous>` for more information.

.. method:: gsl-randist-variate
   :specializer: <gsl-randist-exppow>
   :no-contents-entry:

.. method:: gsl-randist-pdf
   :specializer: <gsl-randist-exppow>
   :no-contents-entry:

.. method:: gsl-randist-cdf-p
   :specializer: <gsl-randist-exppow>
   :no-contents-entry:

.. method:: gsl-randist-cdf-q
   :specializer: <gsl-randist-exppow>
   :no-contents-entry:

The Cauchy Distribution
=======================

.. class:: <gsl-randist-cauchy>
   :instantiable:
   :concrete:

   :supers:

      :class:`<gsl-randist-continuous>`

   :keyword required a:

     Scale parameter. An instance of :drm:`<float>`

   :seealso:

      - https://www.gnu.org/software/gsl/doc/html/randist.html#the-cauchy-distribution

The following operations are specialized for
:class:`<gsl-randist-cauchy>`. See operations in
:class:`<gsl-randist-continous>` for more information.

.. method:: gsl-randist-variate
   :specializer: <gsl-randist-cauchy>
   :no-contents-entry:

.. method:: gsl-randist-pdf
   :specializer: <gsl-randist-cauchy>
   :no-contents-entry:

.. method:: gsl-randist-cdf-p
   :specializer: <gsl-randist-cauchy>
   :no-contents-entry:

.. method:: gsl-randist-cdf-q
   :specializer: <gsl-randist-cauchy>
   :no-contents-entry:

.. method:: gsl-randist-cdf-pinv
   :specializer: <gsl-randist-cauchy>
   :no-contents-entry:

.. method:: gsl-randist-cdf-qinv
   :specializer: <gsl-randist-cauchy>
   :no-contents-entry:

The Rayleigh Distribution
=========================

.. class:: <gsl-randist-rayleigh>
   :instantiable:
   :concrete:

   :supers:

      :class:`<gsl-randist-continuous>`

   :keyword required sigma:

     An instance of :drm:`<float>`

   :seealso:

      - https://www.gnu.org/software/gsl/doc/html/randist.html#the-rayleigh-distribution

The following operations are specialized for
:class:`<gsl-randist-rayleigh>`. See operations in
:class:`<gsl-randist-continuous>` for more information.

.. method:: gsl-randist-variate
   :specializer: <gsl-randist-rayleigh>
   :no-contents-entry:

.. method:: gsl-randist-pdf
   :specializer: <gsl-randist-rayleigh>
   :no-contents-entry:

.. method:: gsl-randist-cdf-p
   :specializer: <gsl-randist-rayleigh>
   :no-contents-entry:

.. method:: gsl-randist-cdf-q
   :specializer: <gsl-randist-rayleigh>
   :no-contents-entry:

The Rayleigh Tail distribution
==============================

.. class:: <gsl-randist-rayleigh-tail>

   :supers:

     :class:`<gsl-randist-rayleigh>`

   :keyword required rng:

   :keyword required sigma:

     Scale parameter. An instance of :drm:`<float>`.

   :keyword required a:

     An instance of :drm:`<float>`. Lower limit.

The following operations are specialized for
:class:`<gsl-randist-rayleigh-tail>`. See operations in
:class:`<gsl-randist-continuous>` for more information.

.. method:: gsl-randist-variate
   :specializer: <gsl-randist-rayleigh-tail>
   :no-contents-entry:

.. method:: gsl-randist-pdf
   :specializer: <gsl-randist-rayleigh-tail>
   :no-contents-entry:

The Landau distribution
=======================

.. class:: <gsl-randist-landau>
   :instantiable:
   :concrete:

   :supers:

     :class:`<gsl-randist-continuous>`

   :keyword required rng:

The following operations are specialized for
:class:`<gsl-randist-landau>`. See operations in
:class:`<gsl-randist-continuous>` for more information.

.. method:: gsl-randist-variate
   :specializer: <gsl-randist-landau>
   :no-contents-entry:

.. method:: gsl-randist-pdf
   :specializer: <gsl-randist-landau>
   :no-contents-entry:

The Levy alpha-Stable Distribution
==================================

.. class:: <gsl-randist-levy>
   :instantiable:
   :concrete:

   :supers:

     :class:`<gsl-randist-continuous>`

   :keyword required rng:

   :keyword required c:

      Scale. An instance of :class:`<float>`.

   :keyword required alpha:

      Scale. An instance of :class:`<float>`.

The following operations are specialized for
:class:`<gsl-randist-levy>`. See operations in
:class:`<gsl-randist-continuous>` for more information.

.. method:: gsl-randist-variate
   :specializer: <gsl-randist-levy>
   :no-contents-entry:

The Levy skew alpha-Stable Distribution
=======================================

.. class:: <gsl-randist-levy-skew>
   :instantiable:
   :concrete:

   :supers:

     :class:`<gsl-randist-levy>`

   :keyword required rng:

   :keyword required c:

      Scale. An instance of :class:`<float>`.

   :keyword required alpha:

      Scale. An instance of :class:`<float>`.

   :keyword required beta:

      Skew. An instance of :class:`<float>`.

The following operations are specialized for
:class:`<gsl-randist-levy-skew>`. See operations in
:class:`<gsl-randist-continuous>` for more information.

.. method:: gsl-randist-variate
   :specializer: <gsl-randist-levy-skew>
   :no-contents-entry:

The Gamma Distribution
======================

.. class:: <gsl-randist-gamma>
   :instantiable:
   :concrete:

   :supers:

      :class:`<gsl-randist-continuous>`

   :keyword algorithm:

     The algorithm to use for generating random variates.  See
     :ref:`gamma-algorithms` for more information.


   :keyword required a:

      a > 0

   :keyword required b:

      b > 0

   :seealso:

      - https://www.gnu.org/software/gsl/doc/html/randist.html#the-gamma-distribution

The following operations are specialized for
:class:`<gsl-randist-gamma>`. See operations in :class:`<gsl-randist-continuous>`
for more information.

.. method:: gsl-randist-variate
   :specializer: <gsl-randist-gamma>
   :no-contents-entry:

.. method:: gsl-randist-pdf
   :specializer: <gsl-randist-gamma>
   :no-contents-entry:

.. method:: gsl-randist-cdf-p
   :specializer: <gsl-randist-gamma>
   :no-contents-entry:

.. method:: gsl-randist-cdf-q
   :specializer: <gsl-randist-gamma>
   :no-contents-entry:

.. method:: gsl-randist-cdf-pinv
   :specializer: <gsl-randist-gamma>
   :no-contents-entry:

.. method:: gsl-randist-cdf-qinv
   :specializer: <gsl-randist-gamma>
   :no-contents-entry:

.. _gamma-algorithms:

Gamma algorithms
----------------

.. class:: <gsl-gamma-algorithm>

   This are the algorithms to generate a Gamma variate value. This
   algorithm is passed as an optional keyword ``algorithm:`` to
   :class:`<gsl-randist-gaussian>` class. The valid values are:

   ``#"default"``
     This is the default value.

   ``#"knuth"``
     This function returns a gamma variate using the
     algorithms from Knuth (vol 2).

The Flat Distribution
======================

.. class:: <gsl-randist-flat>
   :instantiable:
   :concrete:

   :supers:

      :class:`<gsl-randist-continuous>`

   :keyword required a:

      Lower limit. An instance of :drm:`<float>`

   :keyword required b:

      Upper limit. An instance of :drm:`<float>`

   :seealso:

      - https://www.gnu.org/software/gsl/doc/html/randist.html#the-flat-distribution

   :discussion:

      Returns a random variate from the flat (uniform) distribution from a to b

The following operations are specialized for
:class:`<gsl-randist-flat>`. See operations in :class:`<gsl-randist-continuous>`
for more information.

.. method:: gsl-randist-variate
   :specializer: <gsl-randist-flat>
   :no-contents-entry:

.. method:: gsl-randist-pdf
   :specializer: <gsl-randist-flat>
   :no-contents-entry:

.. method:: gsl-randist-cdf-p
   :specializer: <gsl-randist-flat>
   :no-contents-entry:

.. method:: gsl-randist-cdf-q
   :specializer: <gsl-randist-flat>
   :no-contents-entry:

.. method:: gsl-randist-cdf-pinv
   :specializer: <gsl-randist-flat>
   :no-contents-entry:

.. method:: gsl-randist-cdf-qinv
   :specializer: <gsl-randist-flat>
   :no-contents-entry:

The Lognormal Distribution
==========================

.. class:: <gsl-randist-lognormal>
   :instantiable:
   :concrete:

   :supers:

      :class:`<gsl-randist-continuous>`

   :keyword required zeta:

      An instance of :drm:`<float>`

   :keyword required sigma:

      An instance of :drm:`<float>`

   :seealso:

      - https://www.gnu.org/software/gsl/doc/html/randist.html#the-lognormal-distribution


The following operations are specialized for
:class:`<gsl-randist-lognormal>`. See operations in :class:`<gsl-randist-continuous>`
for more information.

.. method:: gsl-randist-variate
   :specializer: <gsl-randist-lognormal>
   :no-contents-entry:

.. method:: gsl-randist-pdf
   :specializer: <gsl-randist-lognormal>
   :no-contents-entry:

.. method:: gsl-randist-cdf-p
   :specializer: <gsl-randist-lognormal>
   :no-contents-entry:

.. method:: gsl-randist-cdf-q
   :specializer: <gsl-randist-lognormal>
   :no-contents-entry:

.. method:: gsl-randist-cdf-pinv
   :specializer: <gsl-randist-lognormal>
   :no-contents-entry:

.. method:: gsl-randist-cdf-qinv
   :specializer: <gsl-randist-lognormal>
   :no-contents-entry:

The Chi-Squared Distribution
============================

.. class:: <gsl-randist-chisq>
   :instantiable:
   :concrete:

   :supers:

      :class:`<gsl-randist-continuous>`

   :keyword required nu:

      Degrees of freedom. An instance of :drm:`<float>`

   :example:

     .. code-block:: dylan

        let r = make(<gsl-rng>);
        let d = make(<gsl-randist-chisq>, nu: 3.0d0, rng: r);
        let k = d.gsl-randist-variate;

   :seealso:

      - https://www.gnu.org/software/gsl/doc/html/randist.html#the-chi-squared-distribution

The following operations are specialized for
:class:`<gsl-randist-chisq>`. See operations in
:class:`<gsl-randist-continuous>` for more information.

.. method:: gsl-randist-variate
   :specializer: <gsl-randist-chisq>
   :no-contents-entry:

.. method:: gsl-randist-pdf
   :specializer: <gsl-randist-chisq>
   :no-contents-entry:

.. method:: gsl-randist-cdf-p
   :specializer: <gsl-randist-chisq>
   :no-contents-entry:

.. method:: gsl-randist-cdf-q
   :specializer: <gsl-randist-chisq>
   :no-contents-entry:

.. method:: gsl-randist-cdf-pinv
   :specializer: <gsl-randist-chisq>
   :no-contents-entry:

.. method:: gsl-randist-cdf-qinv
   :specializer: <gsl-randist-chisq>
   :no-contents-entry:

The F-Distribution
==================

.. class:: <gsl-randist-fdist>
   :instantiable:
   :concrete:

   :supers:

      :class:`<gsl-randist-continuous>`

   :keyword required nu1:

      Degrees of freedom. An instance of :drm:`<float>`

   :keyword required nu2:

      Degrees of freedom. An instance of :drm:`<float>`

   :example:

     .. code-block:: dylan

        let r = make(<gsl-rng>);
        let d = make(<gsl-randist-fdist>, nu1: 3.0d0, nu2: 4.0d0, rng: r);
        let k = d.gsl-randist-variate;

   :seealso:

      - https://www.gnu.org/software/gsl/doc/html/randist.html#the-f-distribution

The following operations are specialized for
:class:`<gsl-randist-fdist>`. See operations in
:class:`<gsl-randist-continuous>` for more information.

.. method:: gsl-randist-variate
   :specializer: <gsl-randist-fdist>
   :no-contents-entry:

.. method:: gsl-randist-pdf
   :specializer: <gsl-randist-fdist>
   :no-contents-entry:

.. method:: gsl-randist-cdf-p
   :specializer: <gsl-randist-fdist>
   :no-contents-entry:

.. method:: gsl-randist-cdf-q
   :specializer: <gsl-randist-fdist>
   :no-contents-entry:

.. method:: gsl-randist-cdf-pinv
   :specializer: <gsl-randist-fdist>
   :no-contents-entry:

.. method:: gsl-randist-cdf-qinv
   :specializer: <gsl-randist-fdist>
   :no-contents-entry:

The Student's T Distribution
============================

.. class:: <gsl-randist-tdist>
   :instantiable:
   :concrete:

   :supers:

      :class:`<gsl-randist-continuous>`

   :keyword required nu:

      Degrees of freedom. An instance of :drm:`<float>`

   :example:

     .. code-block:: dylan

        let d = make(<gsl-randist-tdist>, nu: 3.0d0);
        let k = d.gsl-randist-variate;

   :seealso:

      - https://www.gnu.org/software/gsl/doc/html/randist.html#the-student-tdist-distribution

The following operations are specialized for
:class:`<gsl-randist-tdist>`. See operations in
:class:`<gsl-randist-continuous>` for more information.

.. method:: gsl-randist-variate
   :specializer: <gsl-randist-tdist>
   :no-contents-entry:

.. method:: gsl-randist-pdf
   :specializer: <gsl-randist-tdist>
   :no-contents-entry:

.. method:: gsl-randist-cdf-p
   :specializer: <gsl-randist-tdist>
   :no-contents-entry:

.. method:: gsl-randist-cdf-q
   :specializer: <gsl-randist-tdist>
   :no-contents-entry:

.. method:: gsl-randist-cdf-pinv
   :specializer: <gsl-randist-tdist>
   :no-contents-entry:

.. method:: gsl-randist-cdf-qinv
   :specializer: <gsl-randist-tdist>
   :no-contents-entry:

The Beta Distribution
=====================

.. class:: <gsl-randist-beta>
   :instantiable:
   :concrete:

   :supers:

      :class:`<gsl-randist-continuous>`

   :keyword required a:

      Shape parameter. An instance of :drm:`<float>`

   :keyword required b:

      Shape parameter. An instance of :drm:`<float>`

   :example:

     .. code-block:: dylan

        let d = make(<gsl-randist-beta>, a: 1.0d0, b: 2.0d0);
        let k = d.gsl-randist-variate;

   :seealso:

      - https://www.gnu.org/software/gsl/doc/html/randist.html#the-beta-distribution

The following operations are specialized for
:class:`<gsl-randist-beta>`. See operations in
:class:`<gsl-randist-continuous>` for more information.

.. method:: gsl-randist-variate
   :specializer: <gsl-randist-beta>
   :no-contents-entry:

.. method:: gsl-randist-pdf
   :specializer: <gsl-randist-beta>
   :no-contents-entry:

.. method:: gsl-randist-cdf-p
   :specializer: <gsl-randist-beta>
   :no-contents-entry:

.. method:: gsl-randist-cdf-q
   :specializer: <gsl-randist-beta>
   :no-contents-entry:

.. method:: gsl-randist-cdf-pinv
   :specializer: <gsl-randist-beta>
   :no-contents-entry:

.. method:: gsl-randist-cdf-qinv
   :specializer: <gsl-randist-beta>
   :no-contents-entry:

The Logistic Distribution
=========================

.. class:: <gsl-randist-logistic>
   :instantiable:
   :concrete:

   :supers:

      :class:`<gsl-randist-continuous>`

   :keyword required a:

      Scale parameter. An instance of :drm:`<float>`

   :keyword required b:

      Shift parameter. An instance of :drm:`<float>`

   :example:

     .. code-block:: dylan

        let d = make(<gsl-randist-logistic>, a: 1.0d0, b: 2.0d0);
        let k = d.gsl-randist-variate;

   :seealso:

      - https://www.gnu.org/software/gsl/doc/html/randist.html#the-logistic-distribution

The following operations are specialized for
:class:`<gsl-randist-logistic>`. See operations in
:class:`<gsl-randist-continuous>` for more information.

.. method:: gsl-randist-variate
   :specializer: <gsl-randist-logistic>
   :no-contents-entry:

.. method:: gsl-randist-pdf
   :specializer: <gsl-randist-logistic>
   :no-contents-entry:

.. method:: gsl-randist-cdf-p
   :specializer: <gsl-randist-logistic>
   :no-contents-entry:

.. method:: gsl-randist-cdf-q
   :specializer: <gsl-randist-logistic>
   :no-contents-entry:

.. method:: gsl-randist-cdf-pinv
   :specializer: <gsl-randist-logistic>
   :no-contents-entry:

.. method:: gsl-randist-cdf-qinv
   :specializer: <gsl-randist-logistic>
   :no-contents-entry:

The Pareto Distribution
=======================

.. class:: <gsl-randist-pareto>
   :instantiable:
   :concrete:

   :supers:

      :class:`<gsl-randist-continuous>`

   :keyword required a:

      Scale parameter. An instance of :drm:`<float>`

   :keyword required b:

      Shift parameter. An instance of :drm:`<float>`

   :example:

     .. code-block:: dylan

        let d = make(<gsl-randist-pareto>, a: 1.0d0, b: 2.0d0);
        let k = d.gsl-randist-variate;

   :seealso:

      - https://www.gnu.org/software/gsl/doc/html/randist.html#the-pareto-distribution

The following operations are specialized for
:class:`<gsl-randist-pareto>`. See operations in
:class:`<gsl-randist-continuous>` for more information.

.. method:: gsl-randist-variate
   :specializer: <gsl-randist-pareto>
   :no-contents-entry:

.. method:: gsl-randist-pdf
   :specializer: <gsl-randist-pareto>
   :no-contents-entry:

.. method:: gsl-randist-cdf-p
   :specializer: <gsl-randist-pareto>
   :no-contents-entry:

.. method:: gsl-randist-cdf-q
   :specializer: <gsl-randist-pareto>
   :no-contents-entry:

.. method:: gsl-randist-cdf-pinv
   :specializer: <gsl-randist-pareto>
   :no-contents-entry:

.. method:: gsl-randist-cdf-qinv
   :specializer: <gsl-randist-pareto>
   :no-contents-entry:

The Special Vector Distributions
================================

.. class:: <gsl-randist-dir2d>

   :instantiable:
   :concrete:

   :supers:

      :class:`<gsl-randist-continuous>`

   :example:

     .. code-block:: dylan

        let d = make(<gsl-randist-dir2d>);
        let k = d.gsl-randist-variate;

   :seealso:

      - https://www.gnu.org/software/gsl/doc/html/randist.html#the-special-vector-distributions

The following operations are specialized for
:class:`<gsl-randist-dir2d>`. See operations in
:class:`<gsl-randist-continuous>` for more information.

.. method:: gsl-randist-variate
   :specializer: <gsl-randist-dir-2d>
   
   :signature: gsl-randist-variate distribution => (v2d)

   :param distribution:

      A :class:`<gsl-randist-dir-2d>` instance.

   :result v2d:

      A random variate from the distribution.  An instance of
      :drm:`<gsl-vector>` with 2 elements (x and y).

.. method:: gsl-randist-pdf
   :specializer: <gsl-randist-dir-2d>
   :no-contents-entry:

.. method:: gsl-randist-cdf-p
   :specializer: <gsl-randist-dir-2d>
   :no-contents-entry:

.. method:: gsl-randist-cdf-q
   :specializer: <gsl-randist-dir-2d>
   :no-contents-entry:

.. method:: gsl-randist-cdf-pinv
   :specializer: <gsl-randist-dir-2d>
   :no-contents-entry:

.. method:: gsl-randist-cdf-qinv
   :specializer: <gsl-randist-dir-2d>
   :no-contents-entry:

.. class:: <gsl-randist-dir-3d>

   :instantiable:
   :concrete:

   :supers:

      :class:`<gsl-randist-continuous>`

   :example:

     .. code-block:: dylan

        let d = make(<gsl-randist-dir3d>);
        let k = d.gsl-randist-variate;

   :seealso:

      - https://www.gnu.org/software/gsl/doc/html/randist.html#the-special-vector-distributions

The following operations are specialized for
:class:`<gsl-randist-dir3d>`. See operations in
:class:`<gsl-randist-continuous>` for more information.

.. method:: gsl-randist-variate
   :specializer: <gsl-randist-dir-3d>
   
   :signature: gsl-randist-variate distribution => (v3d)

   :param distribution:

      A :class:`<gsl-randist-dir-3d>` instance.

   :result v3d:

      A random variate from the distribution.  An instance of
      :drm:`<gsl-vector>` with 3 elements (x, y and z).

.. method:: gsl-randist-pdf
   :specializer: <gsl-randist-dir-3d>
   :no-contents-entry:

.. method:: gsl-randist-cdf-p
   :specializer: <gsl-randist-dir-3d>
   :no-contents-entry:

.. method:: gsl-randist-cdf-q
   :specializer: <gsl-randist-dir-3d>
   :no-contents-entry:

.. method:: gsl-randist-cdf-pinv
   :specializer: <gsl-randist-dir-3d>
   :no-contents-entry:

.. method:: gsl-randist-cdf-qinv
   :specializer: <gsl-randist-dir-3d>
   :no-contents-entry:

.. class:: <gsl-randist-dir-nd>

   :instantiable:
   :concrete:

   :supers:

      :class:`<gsl-randist-continuous>`

   :keyword required n:

      The dimension of the vector. An instance of :drm:`<integer>`.

   :example:

     .. code-block:: dylan

        let d = make(<gsl-randist-dir-nd>, n: 2);
        let k = d.gsl-randist-variate;

   :seealso:

      - https://www.gnu.org/software/gsl/doc/html/randist.html#the-special-vector-distributions

The following operations are specialized for
:class:`<gsl-randist-dir-nd>`.

.. method:: gsl-randist-variate
   :specializer: <gsl-randist-dir-nd>
   
   :signature: gsl-randist-variate distribution => (vnd)

   :param distribution:

      A :class:`<gsl-randist-dir-nd>` instance.

   :result vnd:

      A random variate from the distribution.  An instance of
      :drm:`<gsl-vector>` with n elements.

The Weibull Distribution
========================

.. class:: <gsl-randist-weibull>
   :instantiable:
   :concrete:

   :supers:

      :class:`<gsl-randist-continuous>`

   :keyword required a:

      Scale parameter. An instance of :drm:`<float>`

   :keyword required b:

      Shift parameter. An instance of :drm:`<float>`

   :example:

     .. code-block:: dylan

        let r = make(<gsl-rng>);
        let d = make(<gsl-randist-weibull>, a: 1.0d0, b: 2.0d0, rng: r);
        let k = d.gsl-randist-variate;

   :seealso:

      - https://www.gnu.org/software/gsl/doc/html/randist.html#the-weibull-distribution

The following operations are specialized for
:class:`<gsl-randist-weibull>`. See operations in
:class:`<gsl-randist-continuous>` for more information.

.. method:: gsl-randist-variate
   :specializer: <gsl-randist-weibull>
   :no-contents-entry:

.. method:: gsl-randist-pdf
   :specializer: <gsl-randist-weibull>
   :no-contents-entry:

.. method:: gsl-randist-cdf-p
   :specializer: <gsl-randist-weibull>
   :no-contents-entry:

.. method:: gsl-randist-cdf-q
   :specializer: <gsl-randist-weibull>
   :no-contents-entry:

.. method:: gsl-randist-cdf-pinv
   :specializer: <gsl-randist-weibull>
   :no-contents-entry:

.. method:: gsl-randist-cdf-qinv
   :specializer: <gsl-randist-weibull>
   :no-contents-entry:

The Type-1 Gumbel Distribution
==============================

.. class:: <gsl-randist-gumbel1>
   :instantiable:
   :concrete:

   :supers:

      :class:`<gsl-randist-continuous>`

   :keyword required a:

      Scale parameter. An instance of :drm:`<float>`

   :keyword required b:

      Shift parameter. An instance of :drm:`<float>`

   :example:

     .. code-block:: dylan

        let r = make(<gsl-rng>);
        let d = make(<gsl-randist-gumbel1>, a: 1.0d0, b: 2.0d0, rng: r);
        let k = d.gsl-randist-variate;

   :seealso:

      - https://www.gnu.org/software/gsl/doc/html/randist.html#the-gumbel-distribution 

The following operations are specialized for
:class:`<gsl-randist-gumbel1>`. See operations in
:class:`<gsl-randist-continuous>` for more information.

.. method:: gsl-randist-variate
   :specializer: <gsl-randist-gumbel1>
   :no-contents-entry:

.. method:: gsl-randist-pdf
   :specializer: <gsl-randist-gumbel1>
   :no-contents-entry:

.. method:: gsl-randist-cdf-p
   :specializer: <gsl-randist-gumbel1>
   :no-contents-entry:

.. method:: gsl-randist-cdf-q
   :specializer: <gsl-randist-gumbel1>
   :no-contents-entry:

.. method:: gsl-randist-cdf-pinv
   :specializer: <gsl-randist-gumbel1>
   :no-contents-entry:

.. method:: gsl-randist-cdf-qinv
   :specializer: <gsl-randist-gumbel1>
   :no-contents-entry:

The Type-2 Gumbel Distribution
==============================

.. class:: <gsl-randist-gumbel2>
   :instantiable:
   :concrete:

   :supers:

      :class:`<gsl-randist-continuous>`

   :keyword required a:

      Scale parameter. An instance of :drm:`<float>`

   :keyword required b:

      Shift parameter. An instance of :drm:`<float>`

   :example:

     .. code-block:: dylan

        let r = make(<gsl-rng>);
        let d = make(<gsl-randist-gumbel2>, a: 1.0d0, b: 2.0d0, rng: r);
        let k = d.gsl-randist-variate;

   :seealso:

      - https://www.gnu.org/software/gsl/doc/html/randist.html#the-gumbel-distribution

The following operations are specialized for
:class:`<gsl-randist-gumbel2>`. See operations in
:class:`<gsl-randist-continuous>` for more information.

.. method:: gsl-randist-variate
   :specializer: <gsl-randist-gumbel2>
   :no-contents-entry:

.. method:: gsl-randist-pdf
   :specializer: <gsl-randist-gumbel2>
   :no-contents-entry:

.. method:: gsl-randist-cdf-p
   :specializer: <gsl-randist-gumbel2>
   :no-contents-entry:

.. method:: gsl-randist-cdf-q
   :specializer: <gsl-randist-gumbel2>
   :no-contents-entry:

.. method:: gsl-randist-cdf-pinv
   :specializer: <gsl-randist-gumbel2>
   :no-contents-entry:

.. method:: gsl-randist-cdf-qinv
   :specializer: <gsl-randist-gumbel2>
   :no-contents-entry:

The Dirichlet Distribution
==========================

.. class:: <gsl-randist-dirichlet>
   :instantiable:
   :concrete:

   :supers:

      :class:`<gsl-randist-continuous>`

   :keyword required alpha:

      Shape parameter. An instance of :drm:`<float>`

   :keyword required theta:

      Shift parameter. An instance of :drm:`<float>`

   :example:

     .. code-block:: dylan

        let r = make(<gsl-rng>);
        let d = make(<gsl-randist-dirichlet>, a: 1.0d0, b: 2.0d0, rng: r);
        let k = d.gsl-randist-variate;

   :seealso:

      - https://www.gnu.org/software/gsl/doc/html/randist.html#the-dirichlet-distribution

The following operations are specialized for
:class:`<gsl-randist-dirichlet>`. See operations in
:class:`<gsl-randist-continuous>` for more information.

.. method:: gsl-randist-variate
   :specializer: <gsl-randist-dirichlet>
   :no-contents-entry:

.. method:: gsl-randist-pdf
   :specializer: <gsl-randist-dirichlet>
   :no-contents-entry:

.. function:: gsl-randist-ln-pdf

   This function computes the logarithm of the probability density
   p(θ1 , . . . , θK ) for a Dirichlet distribution with parameters
   alpha[K].

   :signature: gsl-randist-ln-pdf distribution => (lnpdf)

   :parameter distribution:

      An instance of :class:`<gsl-randist-dirichlet>`.

   :result lnpdf:

      An instance of :class:`<float>`. Logarithm of the probability
      density. 
   
The Binomial Distribution
=========================

.. class:: <gsl-randist-binomial>
   :instantiable:
   :concrete:

   :supers:

      :class:`<gsl-randist-continuous>`

   :keyword required n:

      Number of trials. An instance of :drm:`<integer>`

   :keyword required p:

      Probability of success. An instance of :drm:`<float>`

   :example:

     .. code-block:: dylan

        let d = make(<gsl-randist-binomial>, n: 10, p: 0.5d0);
        let k = d.gsl-randist-variate;

   :seealso:

      - https://www.gnu.org/software/gsl/doc/html/randist.html#the-binomial-distribution

The following operations are specialized for
:class:`<gsl-randist-binomial>`. See operations in
:class:`<gsl-randist-continuous>` for more information.

.. method:: gsl-randist-variate
   :specializer: <gsl-randist-binomial>
   :no-contents-entry:

.. method:: gsl-randist-pdf
   :specializer: <gsl-randist-binomial>
   :no-contents-entry:

.. method:: gsl-randist-cdf-p
   :specializer: <gsl-randist-binomial>
   :no-contents-entry:

.. method:: gsl-randist-cdf-q
   :specializer: <gsl-randist-binomial>
   :no-contents-entry:

The Negative Binomial Distribution
==================================

.. class:: <gsl-randist-negative-binomial>
   :instantiable:
   :concrete:

   :supers:

      :class:`<gsl-randist-continuous>`

   :keyword required n:

      Number of successes. An instance of :drm:`<integer>`

   :keyword required p:

      Probability of success. An instance of :drm:`<float>`

   :example:

     .. code-block:: dylan

        let r = make(<gsl-rng>);
        let d = make(<gsl-randist-negative-binomial>, n: 10, p: 0.5d0, rng: r);
        let k = d.gsl-randist-variate;

   :seealso:

      - https://www.gnu.org/software/gsl/doc/html/randist.html#the-negative-binomial-distribution

The following operations are specialized for
:class:`<gsl-randist-negative-binomial>`. See operations in
:class:`<gsl-randist-continuous>` for more information.

.. method:: gsl-randist-variate
   :specializer: <gsl-randist-negative-binomial>
   :no-contents-entry:

.. method:: gsl-randist-pdf
   :specializer: <gsl-randist-negative-binomial>
   :no-contents-entry:

.. method:: gsl-randist-cdf-p
   :specializer: <gsl-randist-negative-binomial>
   :no-contents-entry:

.. method:: gsl-randist-cdf-q
   :specializer: <gsl-randist-negative-binomial>
   :no-contents-entry:
