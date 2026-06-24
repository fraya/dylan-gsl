GSL-FFI-RANDIST
***************

.. current-library:: dylan-gsl
.. current-module:: gsl-ffi-randist

Gaussian Distribution
=====================

.. function:: gsl-ran-gaussian

   :signature: (rng, sigma) => (variate)

   :parameter rng:

     Random number generator. An instance of <gsl-rng*>.

   :parameter sigma:

     Standard deviation. A ``<c-double>``.

   :result variate:

     Sample from a Gaussian distribution with mean = 0 and standard
     deviation = sigma.  A ``<c-double>``.

.. function:: gsl-ran-gaussian-pdf

   :signature: (x, sigma) => (pdf)

   :parameter x:

     Value. A ``<c-double>``.

   :parameter sigma:

     Standard deviation. A ``<c-double>``.

   :result pdf:

     Probability density function. A ``<c-double>``.

.. function:: gsl-ran-gaussian-ziggurat

   :signature: (rng, sigma) => (sample)

   :parameter rng:

     Random number generator. An instance of <gsl-rng*>.

   :parameter sigma:

     Standard deviation. A ``<c-double>``.

   :result sample:

     Sample from a Gaussian distribution with mean = 0 and standard
     deviation = sigma.  A ``<c-double>``.

.. function:: gsl-ran-gaussian-ratio-method

   :signature: (rng, sigma) => (sample)

   :parameter rng:

     Random number generator. An instance of <gsl-rng*>

   :parameter sigma:

     Standard deviation. A ``<c-double>``

   :result sample:

     Sample from a Gaussian distribution with mean = 0 and standard
     deviation = sigma.  A ``<c-double>``

.. function:: gsl-cdf-gaussian-p

   :signature: (x, sigma) => (cd)

   :parameter x:

     Value. A ``<c-double>``

   :parameter sigma:

     Standard deviation. A ``<c-double>``

   :result cd:

     Cumulative distribution function. A ``<c-double>``


.. function:: gsl-cdf-gaussian-q

   :signature: (x, sigma) => (cd)

   :parameter x:

     Value. A ``<c-double>``

   :parameter sigma:

     Standard deviation. A ``<c-double>``

   :result cd:

     Cumulative distribution function. A ``<c-double>``


.. function:: gsl-cdf-gaussian-pinv

   :signature: (p, sigma) => (x)

   :parameter p:

     Probability. A ``<c-double>``

   :parameter sigma:

     Standard deviation. A ``<c-double>``

   :result x:

     Value. A ``<c-double>``


.. function:: gsl-cdf-gaussian-qinv

   :signature: (p, sigma) => (x)

   :parameter p:

     Probability. A ``<c-double>``

   :parameter sigma:

     Standard deviation. A ``<c-double>``

   :result x:

     Value. A ``<c-double>``


Unit Gaussian Distribution
==========================

.. function:: gsl-ran-ugaussian

   :signature: (rng) => (sample)

   :parameter rng:

     Random number generator. An instance of <gsl-rng*>

   :result sample:

     Sample from a standard Gaussian distribution with mean = 0 and
     standard deviation = 1.  A ``<c-double>``


.. function:: gsl-ran-ugaussian-pdf

   :signature: (x) => (pdf)

   :parameter x:

     Value. A ``<c-double>``

   :result pdf:

     Probability density function. A ``<c-double>``

Tail distributions
==================

Gaussian tail
-------------

.. function:: gsl-ran-gaussian-tail

   :signature: (rng, a, sigma) => (variate)

   :parameter rng:

     Random number generator. An instance of <gsl-rng*>.

   :parameter a:

      An ``<c-double>``.

   :parameter sigma:

     Standard deviation. A ``<c-double>``.

   :result variate:

     A ``<c-double>``.

.. function:: gsl-ran-gaussian-tail-pdf

   :signature: (x, a, sigma) => (pd)

   :parameter rng:

     Random number generator. An instance of <gsl-rng*>.

   :parameter x:

      An ``<c-double>``.

   :parameter a:

      An ``<c-double>``.

   :parameter sigma:

     Standard deviation. A ``<c-double>``.

   :result pd:

     A ``<c-double>``.

Exponential
===========

.. function:: gsl-ran-exponential

   :signature: (rng, mu) => (variate)

   :parameter rng:

     Random number generator. An instance of <gsl-rng*>.

   :parameter mu:

     Mean. A ``<c-double>``.

   :result variate:

     Sample from an exponential distribution with mean = mu.  A ``<c-double>``.

.. function:: gsl-ran-exponential-pdf

   :signature: (x, mu) => (pdf)

   :parameter x:

     Value. A ``<c-double>``.

   :parameter mu:

     Mean. A ``<c-double>``.

   :result pdf:

     Probability density function. A ``<c-double>``.

.. function:: gsl-cdf-exponential-p

   :signature: (x, mu) => (cd)

   :parameter x:

     Value. A ``<c-double>``.

   :parameter mu:

     Mean. A ``<c-double>``.

   :result cd:

     Cumulative distribution function. A ``<c-double>``

.. function:: gsl-cdf-exponential-q

   :signature: (x, mu) => (cd)

   :parameter x:

     Value. A ``<c-double>``.

   :parameter mu:

     Mean. A ``<c-double>``.

   :result cd:

     Cumulative distribution function. A ``<c-double>``

.. function:: gsl-cdf-exponential-pinv

   :signature: (p, mu) => (x)

   :parameter p:

     Probability. A ``<c-double>``.

   :parameter mu:

     Mean. A ``<c-double>``.

   :result x:

     Value. A ``<c-double>``

.. function:: gsl-cdf-exponential-qinv

    :signature: (p, mu) => (x)

    :parameter p:

      Probability. A ``<c-double>``.

    :parameter mu:

      Mean. A ``<c-double>``.

    :result x:

      Value. A ``<c-double>``

Laplace
=======

.. function:: gsl-ran-laplace

   :signature: (rng, a) => (variate)

   :parameter rng:

     Random number generator. An instance of <gsl-rng*>.

   :parameter a:

     Scale parameter. A ``<c-double>``.

   :result variate:

     Sample from a Laplace distribution. A ``<c-double>``.

.. function:: gsl-ran-laplace-pdf

   :signature: (x, a) => (pdf)

   :parameter x:

     Value. A ``<c-double>``.

   :parameter a:

     Scale parameter. A ``<c-double>``.

   :result pdf:

     Probability density function. A ``<c-double>``.


.. function:: gsl-cdf-laplace-p

   :signature: gsl-cdf-laplace-p(x, a) => (cd)

   :parameter x:

     Value. A ``<c-double>``.

   :parameter a:

     Scale parameter. A ``<c-double>``.

   :result cd:

     Cumulative distribution function. A ``<c-double>``.


.. function:: gsl-cdf-laplace-q

   :signature: gsl-cdf-laplace-q(x, a) => (cd)

   :parameter x:

     Value. A ``<c-double>``.

   :parameter a:

     Scale parameter. A ``<c-double>``.

   :result cd:

     Cumulative distribution function. A ``<c-double>``.


.. function:: gsl-cdf-laplace-pinv

   :signature: gsl-cdf-laplace-pinv(p, a) => (x)

   :parameter p:

     Probability. A ``<c-double>``.

   :parameter a:

     Scale parameter. A ``<c-double>``.

   :result x:

     Value. A ``<c-double>``.


.. function:: gsl-cdf-laplace-qinv

   :signature: gsl-cdf-laplace-qinv(p, a) => (x)

   :parameter p:

     Probability. A ``<c-double>``.

   :parameter a:

     Scale parameter. A ``<c-double>``.

   :result x:

     Value. A ``<c-double>``.

Exponentiated power
===================

.. function:: gsl-ran-exppow

   :signature: gsl-ran-exppow(rng, a, b) => (variate)

   :parameter rng:

     Random number generator. An instance of <gsl-rng*>.

   :parameter a:

     Scale parameter. A ``<c-double>``.

   :parameter b:

       Shape parameter. A ``<c-double>``.

     :result variate:

       Sample from an exponentiated power distribution with scale = a and shape = b.  A ``<c-double>``.

.. function:: gsl-ran-exppow-pdf

   :signature: gsl-ran-exppow(x, a, b) => (pdf)

   :parameter x:

     Value. A ``<c-double>``.

   :parameter a:

     Scale parameter. A ``<c-double>``.

   :parameter b:

     Shape parameter. A ``<c-double>``.

   :result pdf:

     Probability density function. A ``<c-double>``

.. function:: gsl-cdf-exppow-p

   :signature: gsl-cdf-exppow-p (x, a, b) => (cd)

   :parameter x:

     Value. A ``<c-double>``.

   :parameter a:

     A ``<c-double>``.

   :parameter b:

     A ``<c-double>``.

   :result cd:

     A ``<c-double>``

.. function:: gsl-cdf-exppow-q

   :signature: gsl-cdf-exppow-q (x, a, b) => (cd)

   :parameter x:

     Value. A ``<c-double>``.

   :parameter a:

     A ``<c-double>``.

   :parameter b:

     A ``<c-double>``.

   :result cd:

     A ``<c-double>``

Cauchy
======

.. function:: gsl-ran-cauchy

   :signature: (rng, a) => (variate)

   :parameter rng:

     Random number generator. An instance of <gsl-rng*>.

   :parameter a:

     Location parameter. A ``<c-double>``.

   :result variate:

     Sample from a Cauchy distribution with location = x0 and scale = gamma.  A ``<c-double>``.

.. function:: gsl-ran-cauchy-pdf

    :signature: (x, a) => (pdf)

    :parameter x:

      Value. A ``<c-double>``.

    :parameter a:

      Location parameter. A ``<c-double>``.

    :result pdf:

      Probability density function. A ``<c-double>``

.. function:: gsl-cdf-cauchy-p

   :signature: gsl-cdf-cauchy-p(x, a) => (cd)

   :parameter x:

     Value. A ``<c-double>``.

   :parameter a:

     Scale parameter. A ``<c-double>``.

   :result cd:

     Cumulative distribution function. A ``<c-double>``.


.. function:: gsl-cdf-cauchy-q

   :signature: gsl-cdf-cauchy-q(x, a) => (cd)

   :parameter x:

     Value. A ``<c-double>``.

   :parameter a:

     Scale parameter. A ``<c-double>``.

   :result cd:

     Cumulative distribution function. A ``<c-double>``.


.. function:: gsl-cdf-cauchy-pinv

   :signature: gsl-cdf-cauchy-pinv(p, a) => (x)

   :parameter p:

     Probability. A ``<c-double>``.

   :parameter a:

     Scale parameter. A ``<c-double>``.

   :result x:

     Value. A ``<c-double>``.


.. function:: gsl-cdf-cauchy-qinv

   :signature: gsl-cdf-cauchy-qinv(p, a) => (x)

   :parameter p:

     Probability. A ``<c-double>``.

   :parameter a:

     Scale parameter. A ``<c-double>``.

   :result x:

     Value. A ``<c-double>``.

Rayleigh
========

  .. function:: gsl-ran-rayleigh

     :signature: gsl-ran-rayleigh(rng, sigma) => (variate)

     :parameter rng:

       Random number generator. An instance of <gsl-rng*>.

     :parameter sigma:

       Scale parameter. A ``<c-double>``.

     :result variate:

       Sample from a Rayleigh distribution with scale = sigma.  A ``<c-double>``.

.. function:: gsl-ran-rayleigh-pdf

   :signature: gsl-ran-rayleigh-pdf(x, sigma) => (pdf)

   :parameter x:

     Value. A ``<c-double>``.

   :parameter sigma:

     Scale parameter. A ``<c-double>``.

   :result pdf:

     Probability density function. A ``<c-double>``

.. function:: gsl-cdf-rayleigh-p

   :signature: gsl-ran-rayleigh-p(x, sigma) => (cd)

   :parameter x:

     Value. A ``<c-double>``.

   :parameter sigma:

     Scale parameter. A ``<c-double>``.

   :result cd:

     Cumulative distribution function. A ``<c-double>``

.. function:: gsl-cdf-rayleigh-q

   :signature: gsl-ran-rayleigh-q(x, sigma) => (cd)

   :parameter x:

     Value. A ``<c-double>``.

   :parameter sigma:

     Scale parameter. A ``<c-double>``.

   :result cd:

     Cumulative distribution function. A ``<c-double>``

.. function:: gsl-cdf-rayleigh-pinv

   :signature: gsl-ran-rayleigh-pinv(p, sigma) => (x)

   :parameter p:

     Probability. A ``<c-double>``.

   :parameter sigma:

     Scale parameter. A ``<c-double>``.

   :result x:

     Value. A ``<c-double>``

.. function:: gsl-cdf-rayleigh-qinv

   :signature: gsl-ran-rayleigh-qinv(p, sigma) => (x)

   :parameter p:

     Probability. A ``<c-double>``.

   :parameter sigma:

     Scale parameter. A ``<c-double>``.

   :result x:

     Value. A ``<c-double>``

Rayleigh tail
=============

.. function:: gsl-ran-rayleigh-tail

   :signature: gsl-ran-rayleigh-tail(rng, a, sigma) => (variate)

   :parameter rng:

     Random number generator. An instance of <gsl-rng*>.

   :parameter a:

      An ``<c-double>``.

   :parameter sigma:

     Scale parameter. A ``<c-double>``.

   :result variate:

     A ``<c-double>``.

.. function:: gsl-ran-rayleigh-tail-pdf

   :signature: gsl-ran-rayleigh-tail-pdf(x, a, sigma) => (pd)

   :parameter rng:

     Random number generator. An instance of <gsl-rng*>.

   :parameter x:

      An ``<c-double>``.

   :parameter a:

      An ``<c-double>``.

   :parameter sigma:

     Scale parameter. A ``<c-double>``.

   :result pd:

     A ``<c-double>``

The Landau distribution
=======================

.. function:: gsl-ran-landau

   :signature: gsl-ran-landau(rng) => (variate)

   :parameter rng:

     Random number generator. An instance of <gsl-rng*>.

   :result variate:

     A ``<c-double>``

.. function:: gsl-ran-landau-pdf

   :signature: gsl-ran-landau-pdf(x) => (pd)

   :parameter x:

      An ``<c-double>``.

   :result pd:

     A ``<c-double>``

The Levy alpha-Stable distribution
==================================

.. function:: gsl-ran-levy

   :signature: gsl-ran-levy(rng, c, alpha) => (variate)

   :parameter rng:

     Random number generator. An instance of <gsl-rng*>.

   :parameter c:

      Scale. An instance of ``<gsl-rng*>``.

   :parameter alpha:

      Exponent. An instance of ``<c-double>``.

   :result variate:

     A ``<c-double>``

The Levy alpha-Stable distribution
==================================

.. function:: gsl-ran-levy-skew

   :signature: gsl-ran-levy-skew(rng, c, alpha, beta) => (variate)

   :parameter rng:

     Random number generator. An instance of <gsl-rng*>.

   :parameter c:

      Scale. An instance of ``<gsl-rng*>``.

   :parameter alpha:

      Exponent. An instance of ``<c-double>``.

   :parameter beta:

      Skew. An instance of ``<c-double>``.

   :result variate:

     A ``<c-double>``


Gamma Distribution
==================

.. function:: gsl-ran-gamma

   :signature: (rng, a, b) => (variate)

   :parameter rng:

     Random number generator. An instance of <gsl-rng*>.

   :parameter a:

     Shape parameter. A ``<c-double>``.

   :parameter b:

     Scale parameter. A ``<c-double>``.

   :result variate:

     Sample from a gamma distribution with shape = a and scale = b.  A ``<c-double>``.

.. function:: gsl-ran-gamma-knuth

   :signature: (rng, a, b) => (variate)

   :parameter rng:

     Random number generator. An instance of <gsl-rng*>.

   :parameter a:

     Shape parameter. A ``<c-double>``.

   :parameter b:

     Scale parameter. A ``<c-double>``.

   :result variate:

     Sample from a gamma distribution with shape = a and scale = b.  A ``<c-double>``.

.. function:: gsl-ran-gamma-pdf

   :signature: (x, a, b) => (pdf)

   :parameter x:

     Value. A ``<c-double>``.

   :parameter a:

     Shape parameter. A ``<c-double>``.

   :parameter b:

     Scale parameter. A ``<c-double>``.

   :result pdf:

     Probability density function. A ``<c-double>``

.. function:: gsl-cdf-gamma-p

   :signature: (x, a, b) => (cd)

   :parameter x:

     Value. A ``<c-double>``.

   :parameter a:

     Scale parameter. A ``<c-double>``.

   :parameter b:

     Scale parameter. A ``<c-double>``.

   :result cd:

     Cumulative distribution function. A ``<c-double>``

.. function:: gsl-cdf-gamma-q

   :signature: (x, a, b) => (cd)

   :parameter x:

     Value. A ``<c-double>``.

   :parameter a:

     Scale parameter. A ``<c-double>``.

   :parameter b:

     Scale parameter. A ``<c-double>``.

   :result cd:

     A ``<c-double>``

.. function:: gsl-cdf-gamma-pinv

   :signature: (x, a, b) => (cd)

   :parameter x:

     Value. A ``<c-double>``.

   :parameter a:

     Scale parameter. A ``<c-double>``.

   :parameter b:

     Scale parameter. A ``<c-double>``.

   :result cd:

     A ``<c-double>``

.. function:: gsl-cdf-gamma-qinv

   :signature: (x, a, b) => (cd)

   :parameter x:

     Value. A ``<c-double>``.

   :parameter a:

     Scale parameter. A ``<c-double>``.

   :parameter b:

     Scale parameter. A ``<c-double>``.

   :result cd:

     A ``<c-double>``

The Flat Distribution
=====================

.. function:: gsl-ran-flat

   :signature: (rng, a, b) => (variate)

   :parameter rng:

     Random number generator. An instance of <gsl-rng*>.

   :parameter a:

     Shape parameter. A ``<c-double>``.

   :parameter b:

     Scale parameter. A ``<c-double>``.

   :result variate:

     A ``<c-double>``.

.. function:: gsl-ran-flat-pdf

   :signature: (x, a, b) => (pdf)

   :parameter x:

     Value. A ``<c-double>``.

   :parameter a:

     A ``<c-double>``.

   :parameter b:

     A ``<c-double>``.

   :result pdf:

     A ``<c-double>``

.. function:: gsl-cdf-flat-q

   :signature: (x, sigma) => (cd)

   :parameter x:

     Value. A ``<c-double>``.

   :parameter sigma:

     Scale parameter. A ``<c-double>``.

   :result cd:

     Cumulative distribution function. A ``<c-double>``

.. function:: gsl-cdf-flat-p

   :signature: (x, a, b) => (cd)

   :parameter x:

     Value. A ``<c-double>``.

   :parameter a:

     A ``<c-double>``.

   :parameter b:

     A ``<c-double>``.

   :result cd:

     Cumulative distribution function. A ``<c-double>``

.. function:: gsl-cdf-flat-q

   :signature: (x, a, b) => (cd)

   :parameter x:

     Value. A ``<c-double>``.

   :parameter a:

     A ``<c-double>``.

   :parameter b:

     A ``<c-double>``.

   :result cd:

     A ``<c-double>``

.. function:: gsl-cdf-flat-pinv

   :signature: (x, a, b) => (cd)

   :parameter x:

     Value. A ``<c-double>``.

   :parameter a:

     A ``<c-double>``.

   :parameter b:

     A ``<c-double>``.

   :result cd:

     A ``<c-double>``

.. function:: gsl-cdf-flat-qinv

   :signature: (x, a, b) => (cd)

   :parameter x:

     Value. A ``<c-double>``.

   :parameter a:

     Scale parameter. A ``<c-double>``.

   :parameter b:

     Scale parameter. A ``<c-double>``.

   :result cd:

     A ``<c-double>``

The Lognormal Distribution
==========================

.. function:: gsl-ran-lognormal

   :signature: gsl-ran-lognormal rng zeta sigma => (variate)

   :parameter rng:

     Random number generator. An instance of <gsl-rng*>.

   :parameter zeta:

     A ``<c-double>``.

   :parameter sigma:

     A ``<c-double>``.

   :result variate:

     A ``<c-double>``.

.. function:: gsl-ran-lognormal-pdf

   :signature: gsl-ran-lognormal-pdf x zeta sigma => (pdf)

   :parameter x:

     Value. A ``<c-double>``.

   :parameter zeta:

     A ``<c-double>``.

   :parameter sigma:

     A ``<c-double>``.

   :result pdf:

     A ``<c-double>``

.. function:: gsl-cdf-lognormal-p

   :signature: gsl-cdf-lognormal-p x zeta sigma => (cd)

   :parameter x:

     A ``<c-double>``.

   :parameter zeta:

     A ``<c-double>``.

   :parameter sigma:

     A ``<c-double>``.

   :result cd:

     A ``<c-double>``

.. function:: gsl-cdf-lognormal-q

   :signature: gsl-cdf-lognormal-q x zeta sigma => (cd)

   :parameter x:

     Value. A ``<c-double>``.

   :parameter zeta:

     A ``<c-double>``.

   :parameter sigma:

     A ``<c-double>``.

   :result cd:

     A ``<c-double>``

.. function:: gsl-cdf-lognormal-pinv

   :signature: gsl-cdf-lognormal-pinv p zeta sigma => (cd)

   :parameter p:

     A ``<c-double>``.

   :parameter zeta:

     A ``<c-double>``.

   :parameter sigma:

     A ``<c-double>``.

   :result cd:

     A ``<c-double>``

.. function:: gsl-cdf-lognormal-qinv

   :signature: gsl-cdf-lognormal-qinv q zeta sigma => (cd)

   :parameter q:

     A ``<c-double>``.

   :parameter zeta:

     A ``<c-double>``.

   :parameter sigma:

     A ``<c-double>``.

   :result cd:

     A ``<c-double>``
