The GSL-STATISTICS module
*************************

.. current-library:: dylan-gsl
.. current-module:: gsl-statistics


.. function:: abs-dev

   :signature: abs-dev (data #key stride mean) => (mean)

   :parameter data: An instance of :drm:`<vector>`.
   :parameter #key stride: An instance of :drm:`<integer>`.
   :parameter #key mean: An instance of :const:`<double-float?>`.
   :value mean: An instance of :drm:`<double-float>`.

.. function:: covariance

   :signature: covariance (data1 data2 #key stride1 stride2 mean1 mean2) => (covariance)

   :parameter data1: An instance of :drm:`<vector>`.
   :parameter data2: An instance of :drm:`<vector>`.
   :parameter #key stride1: An instance of :drm:`<integer>`.
   :parameter #key stride2: An instance of :drm:`<integer>`.
   :parameter #key mean1: An instance of :const:`<double-float?>`.
   :parameter #key mean2: An instance of :const:`<double-float?>`.
   :value covariance: An instance of :drm:`<double-float>`.

.. function:: kurtosis

   :signature: kurtosis (data #key stride mean sd) => (kurtosis)

   :parameter data: An instance of :drm:`<vector>`.
   :parameter #key stride: An instance of :drm:`<integer>`.
   :parameter #key mean: An instance of :const:`<double-float?>`.
   :parameter #key sd: An instance of :const:`<double-float?>`.
   :value kurtosis: An instance of :drm:`<double-float>`.

.. function:: lag1-autocorrelation

   :signature: lag1-autocorrelation (data #key stride mean) => (autocorrelation)

   :parameter data: An instance of :drm:`<vector>`.
   :parameter #key stride: An instance of :drm:`<integer>`.
   :parameter #key mean: An instance of :const:`<double-float?>`.
   :value autocorrelation: An instance of :drm:`<double-float>`.

.. function:: maximum

   :signature: maximum (data #key stride) => (max)

   :parameter data: An instance of :const:`<vector-double-float>`.
   :parameter #key stride: An instance of :drm:`<integer>`.
   :value max: An instance of :drm:`<double-float>`.

.. function:: mean

   :signature: mean (data #key stride) => (mean)

   :parameter data: An instance of :drm:`<vector>`.
   :parameter #key stride: An instance of :drm:`<integer>`.
   :value mean: An instance of :drm:`<double-float>`.

.. function:: minimum

   :signature: minimum (data #key stride) => (min)

   :parameter data: An instance of :const:`<vector-double-float>`.
   :parameter #key stride: An instance of :drm:`<integer>`.
   :value min: An instance of :drm:`<double-float>`.

.. function:: minimum-maximum

   :signature: minimum-maximum (data #key stride) => (minimum maximum)

   :parameter data: An instance of :const:`<vector-double-float>`.
   :parameter #key stride: An instance of :drm:`<integer>`.
   :value minimum: An instance of :drm:`<double-float>`.
   :value maximum: An instance of :drm:`<double-float>`.

.. function:: skew

   :signature: skew (data #key stride mean sd) => (skewness)

   :parameter data: An instance of :drm:`<vector>`.
   :parameter #key stride: An instance of :drm:`<integer>`.
   :parameter #key mean: An instance of :const:`<double-float?>`.
   :parameter #key sd: An instance of :const:`<double-float?>`.
   :value skewness: An instance of :drm:`<double-float>`.

.. function:: standard-deviation

   :signature: standard-deviation (data #key stride mean fixed-mean?) => (sd)

   :parameter data: An instance of :drm:`<vector>`.
   :parameter #key stride: An instance of :drm:`<integer>`.
   :parameter #key mean: An instance of :const:`<double-float?>`.
   :parameter #key fixed-mean?: An instance of :drm:`<boolean>`.
   :value sd: An instance of :drm:`<double-float>`.

.. function:: tss

   :signature: tss (data #key stride mean) => (tss)

   :parameter data: An instance of :drm:`<vector>`.
   :parameter #key stride: An instance of :drm:`<integer>`.
   :parameter #key mean: An instance of :const:`<double-float?>`.
   :value tss: An instance of :drm:`<double-float>`.

.. function:: variance

   :signature: variance (data #key stride mean population?) => (variance)

   :parameter data: An instance of :drm:`<vector>`.
   :parameter #key stride: An instance of :drm:`<integer>`.
   :parameter #key mean: An instance of :const:`<double-float?>`.
   :parameter #key population?: An instance of :drm:`<boolean>`.
   :value variance: An instance of :drm:`<double-float>`.
