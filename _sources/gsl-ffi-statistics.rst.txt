The GSL-FFI-STATISTICS module
*****************************
.. current-library:: dylan-gsl
.. current-module:: gsl-ffi-statistics


.. function:: gsl-stats-abs-dev

   :signature: gsl-stats-abs-dev (data stride n) => (mean)

   :parameter data: An instance of ``export-type-for(<c-double*>)``.
   :parameter stride: An instance of ``export-type-for(<c-size-t>)``.
   :parameter n: An instance of ``export-type-for(<c-size-t>)``.
   :value mean: An instance of ``import-type-for(<c-double>)``.

.. function:: gsl-stats-abs-dev-m

   :signature: gsl-stats-abs-dev-m (data stride n mean) => (mean)

   :parameter data: An instance of ``export-type-for(<c-double*>)``.
   :parameter stride: An instance of ``export-type-for(<c-size-t>)``.
   :parameter n: An instance of ``export-type-for(<c-size-t>)``.
   :parameter mean: An instance of ``export-type-for(<c-double>)``.
   :value mean: An instance of ``import-type-for(<c-double>)``.

.. function:: gsl-stats-covariance

   :signature: gsl-stats-covariance (data1 stride1 data2 stride2 n) => (covariance)

   :parameter data1: An instance of ``export-type-for(<c-double*>)``.
   :parameter stride1: An instance of ``export-type-for(<c-size-t>)``.
   :parameter data2: An instance of ``export-type-for(<c-double*>)``.
   :parameter stride2: An instance of ``export-type-for(<c-size-t>)``.
   :parameter n: An instance of ``export-type-for(<c-size-t>)``.
   :value covariance: An instance of ``import-type-for(<c-double>)``.

.. function:: gsl-stats-covariance-m

   :signature: gsl-stats-covariance-m (data1 stride1 data2 stride2 n mean1 mean2) => (covariance)

   :parameter data1: An instance of ``export-type-for(<c-double*>)``.
   :parameter stride1: An instance of ``export-type-for(<c-size-t>)``.
   :parameter data2: An instance of ``export-type-for(<c-double*>)``.
   :parameter stride2: An instance of ``export-type-for(<c-size-t>)``.
   :parameter n: An instance of ``export-type-for(<c-size-t>)``.
   :parameter mean1: An instance of ``export-type-for(<c-double>)``.
   :parameter mean2: An instance of ``export-type-for(<c-double>)``.
   :value covariance: An instance of ``import-type-for(<c-double>)``.

.. function:: gsl-stats-kurtosis

   :signature: gsl-stats-kurtosis (data n stride) => (kurtosis)

   :parameter data: An instance of ``export-type-for(<c-double*>)``.
   :parameter n: An instance of ``export-type-for(<c-size-t>)``.
   :parameter stride: An instance of ``export-type-for(<c-size-t>)``.
   :value kurtosis: An instance of ``import-type-for(<c-double>)``.

.. function:: gsl-stats-kurtosis-m-sd

   :signature: gsl-stats-kurtosis-m-sd (data n stride mean sd) => (kurtosis)

   :parameter data: An instance of ``export-type-for(<c-double*>)``.
   :parameter n: An instance of ``export-type-for(<c-size-t>)``.
   :parameter stride: An instance of ``export-type-for(<c-size-t>)``.
   :parameter mean: An instance of ``export-type-for(<c-double>)``.
   :parameter sd: An instance of ``export-type-for(<c-double>)``.
   :value kurtosis: An instance of ``import-type-for(<c-double>)``.

.. function:: gsl-stats-lag1-autocorrelation

   :signature: gsl-stats-lag1-autocorrelation (data stride n) => (autocorrelation)

   :parameter data: An instance of ``export-type-for(<c-double*>)``.
   :parameter stride: An instance of ``export-type-for(<c-size-t>)``.
   :parameter n: An instance of ``export-type-for(<c-size-t>)``.
   :value autocorrelation: An instance of ``import-type-for(<c-double>)``.

.. function:: gsl-stats-lag1-autocorrelation-m

   :signature: gsl-stats-lag1-autocorrelation-m (data stride n mean) => (autocorrelation)

   :parameter data: An instance of ``export-type-for(<c-double*>)``.
   :parameter stride: An instance of ``export-type-for(<c-size-t>)``.
   :parameter n: An instance of ``export-type-for(<c-size-t>)``.
   :parameter mean: An instance of ``export-type-for(<c-double>)``.
   :value autocorrelation: An instance of ``import-type-for(<c-double>)``.

.. function:: gsl-stats-max

   :signature: gsl-stats-max (data stride n) => (maximum)

   :parameter data: An instance of ``export-type-for(<c-double*>)``.
   :parameter stride: An instance of ``export-type-for(<c-size-t>)``.
   :parameter n: An instance of ``export-type-for(<c-size-t>)``.
   :value maximum: An instance of ``import-type-for(<c-double>)``.

.. function:: gsl-stats-mean

   :signature: gsl-stats-mean (data stride n) => (mean)

   :parameter data: An instance of ``export-type-for(<c-double*>)``.
   :parameter stride: An instance of ``export-type-for(<c-size-t>)``.
   :parameter n: An instance of ``export-type-for(<c-size-t>)``.
   :value mean: An instance of ``import-type-for(<c-double>)``.

.. function:: gsl-stats-min

   :signature: gsl-stats-min (data stride n) => (minimum)

   :parameter data: An instance of ``export-type-for(<c-double*>)``.
   :parameter stride: An instance of ``export-type-for(<c-size-t>)``.
   :parameter n: An instance of ``export-type-for(<c-size-t>)``.
   :value minimum: An instance of ``import-type-for(<c-double>)``.

.. function:: gsl-stats-minmax

   :signature: gsl-stats-minmax (data stride n) => (minimum maximum)

   :parameter data: An instance of ``export-type-for(<c-double*>)``.
   :parameter stride: An instance of ``export-type-for(<c-size-t>)``.
   :parameter n: An instance of ``export-type-for(<c-size-t>)``.
   :value minimum: An instance of ``import-type-for-reference(<c-double*>)``.
   :value maximum: An instance of ``import-type-for-reference(<c-double*>)``.

.. function:: gsl-stats-sd

   :signature: gsl-stats-sd (data stride n) => (sd)

   :parameter data: An instance of ``export-type-for(<c-double*>)``.
   :parameter stride: An instance of ``export-type-for(<c-size-t>)``.
   :parameter n: An instance of ``export-type-for(<c-size-t>)``.
   :value sd: An instance of ``import-type-for(<c-double>)``.

.. function:: gsl-stats-sd-m

   :signature: gsl-stats-sd-m (data stride n mean) => (sd)

   :parameter data: An instance of ``export-type-for(<c-double*>)``.
   :parameter stride: An instance of ``export-type-for(<c-size-t>)``.
   :parameter n: An instance of ``export-type-for(<c-size-t>)``.
   :parameter mean: An instance of ``export-type-for(<c-double>)``.
   :value sd: An instance of ``import-type-for(<c-double>)``.

.. function:: gsl-stats-sd-with-fixed-mean

   :signature: gsl-stats-sd-with-fixed-mean (data stride n mean) => (sd)

   :parameter data: An instance of ``export-type-for(<c-double*>)``.
   :parameter stride: An instance of ``export-type-for(<c-size-t>)``.
   :parameter n: An instance of ``export-type-for(<c-size-t>)``.
   :parameter mean: An instance of ``export-type-for(<c-double>)``.
   :value sd: An instance of ``import-type-for(<c-double>)``.

.. function:: gsl-stats-skew

   :signature: gsl-stats-skew (data n stride) => (skewness)

   :parameter data: An instance of ``export-type-for(<c-double*>)``.
   :parameter n: An instance of ``export-type-for(<c-size-t>)``.
   :parameter stride: An instance of ``export-type-for(<c-size-t>)``.
   :value skewness: An instance of ``import-type-for(<c-double>)``.

.. function:: gsl-stats-skew-m-sd

   :signature: gsl-stats-skew-m-sd (data n stride mean sd) => (skewness)

   :parameter data: An instance of ``export-type-for(<c-double*>)``.
   :parameter n: An instance of ``export-type-for(<c-size-t>)``.
   :parameter stride: An instance of ``export-type-for(<c-size-t>)``.
   :parameter mean: An instance of ``export-type-for(<c-double>)``.
   :parameter sd: An instance of ``export-type-for(<c-double>)``.
   :value skewness: An instance of ``import-type-for(<c-double>)``.

.. function:: gsl-stats-tss

   :signature: gsl-stats-tss (data stride n) => (tss)

   :parameter data: An instance of ``export-type-for(<c-double*>)``.
   :parameter stride: An instance of ``export-type-for(<c-size-t>)``.
   :parameter n: An instance of ``export-type-for(<c-size-t>)``.
   :value tss: An instance of ``import-type-for(<c-double>)``.

.. function:: gsl-stats-tss-m

   :signature: gsl-stats-tss-m (data stride n mean) => (tss)

   :parameter data: An instance of ``export-type-for(<c-double*>)``.
   :parameter stride: An instance of ``export-type-for(<c-size-t>)``.
   :parameter n: An instance of ``export-type-for(<c-size-t>)``.
   :parameter mean: An instance of ``export-type-for(<c-double>)``.
   :value tss: An instance of ``import-type-for(<c-double>)``.

.. function:: gsl-stats-variance

   :signature: gsl-stats-variance (data stride n) => (variance)

   :parameter data: An instance of ``export-type-for(<c-double*>)``.
   :parameter stride: An instance of ``export-type-for(<c-size-t>)``.
   :parameter n: An instance of ``export-type-for(<c-size-t>)``.
   :value variance: An instance of ``import-type-for(<c-double>)``.

.. function:: gsl-stats-variance-m

   :signature: gsl-stats-variance-m (data stride n mean) => (variance)

   :parameter data: An instance of ``export-type-for(<c-double*>)``.
   :parameter stride: An instance of ``export-type-for(<c-size-t>)``.
   :parameter n: An instance of ``export-type-for(<c-size-t>)``.
   :parameter mean: An instance of ``export-type-for(<c-double>)``.
   :value variance: An instance of ``import-type-for(<c-double>)``.

.. function:: gsl-stats-variance-with-fixed-mean

   :signature: gsl-stats-variance-with-fixed-mean (data stride n mean) => (variance)

   :parameter data: An instance of ``export-type-for(<c-double*>)``.
   :parameter stride: An instance of ``export-type-for(<c-size-t>)``.
   :parameter n: An instance of ``export-type-for(<c-size-t>)``.
   :parameter mean: An instance of ``export-type-for(<c-double>)``.
   :value variance: An instance of ``import-type-for(<c-double>)``.
