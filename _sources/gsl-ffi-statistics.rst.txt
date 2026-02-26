The GSL-FFI-STATISTICS module
*****************************
.. current-library:: dylan-gsl
.. current-module:: gsl-ffi-statistics

Absolute deviation
==================

.. function:: gsl-stats-abs-dev

   :signature: gsl-stats-abs-dev (data stride n) => (mean)

   :parameter data: An instance of `<c-double*>`.
   :parameter stride: An instance of `<c-size-t>`.
   :parameter n: An instance of `<c-size-t>`.
   :value mean: An instance of `<c-double>`.

.. function:: gsl-stats-abs-dev-m

   :signature: gsl-stats-abs-dev-m (data stride n mean) => (mean)

   :parameter data: An instance of `<c-double*>`.
   :parameter stride: An instance of `<c-size-t>`.
   :parameter n: An instance of `<c-size-t>`.
   :parameter mean: An instance of `<c-double>`.
   :value mean: An instance of `<c-double>`.

Covariance
==========

.. function:: gsl-stats-covariance

   :signature: gsl-stats-covariance (data1 stride1 data2 stride2 n) => (covariance)

   :parameter data1: An instance of `<c-double*>`.
   :parameter stride1: An instance of `<c-size-t>`.
   :parameter data2: An instance of `<c-double*>`.
   :parameter stride2: An instance of `<c-size-t>`.
   :parameter n: An instance of `<c-size-t>`.
   :value covariance: An instance of `<c-double>`.

.. function:: gsl-stats-covariance-m

   :signature: gsl-stats-covariance-m (data1 stride1 data2 stride2 n mean1 mean2) => (covariance)

   :parameter data1: An instance of `<c-double*>`.
   :parameter stride1: An instance of `<c-size-t>`.
   :parameter data2: An instance of `<c-double*>`.
   :parameter stride2: An instance of `<c-size-t>`.
   :parameter n: An instance of `<c-size-t>`.
   :parameter mean1: An instance of `<c-double>`.
   :parameter mean2: An instance of `<c-double>`.
   :value covariance: An instance of `<c-double>`.

Kurtosis
========

.. function:: gsl-stats-kurtosis

   :signature: gsl-stats-kurtosis (data n stride) => (kurtosis)

   :parameter data: An instance of `<c-double*>`.
   :parameter n: An instance of `<c-size-t>`.
   :parameter stride: An instance of `<c-size-t>`.
   :value kurtosis: An instance of `<c-double>`.

.. function:: gsl-stats-kurtosis-m-sd

   :signature: gsl-stats-kurtosis-m-sd (data n stride mean sd) => (kurtosis)

   :parameter data: An instance of `<c-double*>`.
   :parameter n: An instance of `<c-size-t>`.
   :parameter stride: An instance of `<c-size-t>`.
   :parameter mean: An instance of `<c-double>`.
   :parameter sd: An instance of `<c-double>`.
   :value kurtosis: An instance of `<c-double>`.

Autocorrelation
===============

.. function:: gsl-stats-lag1-autocorrelation

   :signature: gsl-stats-lag1-autocorrelation (data stride n) => (autocorrelation)

   :parameter data: An instance of `<c-double*>`.
   :parameter stride: An instance of `<c-size-t>`.
   :parameter n: An instance of `<c-size-t>`.
   :value autocorrelation: An instance of `<c-double>`.

.. function:: gsl-stats-lag1-autocorrelation-m

   :signature: gsl-stats-lag1-autocorrelation-m (data stride n mean) => (autocorrelation)

   :parameter data: An instance of `<c-double*>`.
   :parameter stride: An instance of `<c-size-t>`.
   :parameter n: An instance of `<c-size-t>`.
   :parameter mean: An instance of `<c-double>`.
   :value autocorrelation: An instance of `<c-double>`.

Max/Min
=======

.. function:: gsl-stats-max

   :signature: gsl-stats-max (data stride n) => (maximum)

   :parameter data: An instance of `<c-double*>`.
   :parameter stride: An instance of `<c-size-t>`.
   :parameter n: An instance of `<c-size-t>`.
   :value maximum: An instance of `<c-double>`.

.. function:: gsl-stats-min

   :signature: gsl-stats-min (data stride n) => (minimum)

   :parameter data: An instance of `<c-double*>`.
   :parameter stride: An instance of `<c-size-t>`.
   :parameter n: An instance of `<c-size-t>`.
   :value minimum: An instance of `<c-double>`.

.. function:: gsl-stats-minmax

   :signature: gsl-stats-minmax (data stride n) => (minimum maximum)

   :parameter data: An instance of `<c-double*>`.
   :parameter stride: An instance of `<c-size-t>`.
   :parameter n: An instance of `<c-size-t>`.
   :value minimum: An instance of `<c-double*>`.
   :value maximum: An instance of `<c-double*>`.

Mean
====

.. function:: gsl-stats-mean

   :signature: gsl-stats-mean (data stride n) => (mean)

   :parameter data: An instance of `<c-double*>`.
   :parameter stride: An instance of `<c-size-t>`.
   :parameter n: An instance of `<c-size-t>`.
   :value mean: An instance of `<c-double>`.

Standard deviation
==================

.. function:: gsl-stats-sd

   :signature: gsl-stats-sd (data stride n) => (sd)

   :parameter data: An instance of `<c-double*>`.
   :parameter stride: An instance of `<c-size-t>`.
   :parameter n: An instance of `<c-size-t>`.
   :value sd: An instance of `<c-double>`.

.. function:: gsl-stats-sd-m

   :signature: gsl-stats-sd-m (data stride n mean) => (sd)

   :parameter data: An instance of `<c-double*>`.
   :parameter stride: An instance of `<c-size-t>`.
   :parameter n: An instance of `<c-size-t>`.
   :parameter mean: An instance of `<c-double>`.
   :value sd: An instance of `<c-double>`.

.. function:: gsl-stats-sd-with-fixed-mean

   :signature: gsl-stats-sd-with-fixed-mean (data stride n mean) => (sd)

   :parameter data: An instance of `<c-double*>`.
   :parameter stride: An instance of `<c-size-t>`.
   :parameter n: An instance of `<c-size-t>`.
   :parameter mean: An instance of `<c-double>`.
   :value sd: An instance of `<c-double>`.

Skewness
========

.. function:: gsl-stats-skew

   :signature: gsl-stats-skew (data n stride) => (skewness)

   :parameter data: An instance of `<c-double*>`.
   :parameter n: An instance of `<c-size-t>`.
   :parameter stride: An instance of `<c-size-t>`.
   :value skewness: An instance of `<c-double>`.

.. function:: gsl-stats-skew-m-sd

   :signature: gsl-stats-skew-m-sd (data n stride mean sd) => (skewness)

   :parameter data: An instance of `<c-double*>`.
   :parameter n: An instance of `<c-size-t>`.
   :parameter stride: An instance of `<c-size-t>`.
   :parameter mean: An instance of `<c-double>`.
   :parameter sd: An instance of `<c-double>`.
   :value skewness: An instance of `<c-double>`.

Total sum of squares
====================

.. function:: gsl-stats-tss

   :signature: gsl-stats-tss (data stride n) => (tss)

   :parameter data: An instance of `<c-double*>`.
   :parameter stride: An instance of `<c-size-t>`.
   :parameter n: An instance of `<c-size-t>`.
   :value tss: An instance of `<c-double>`.

.. function:: gsl-stats-tss-m

   :signature: gsl-stats-tss-m (data stride n mean) => (tss)

   :parameter data: An instance of `<c-double*>`.
   :parameter stride: An instance of `<c-size-t>`.
   :parameter n: An instance of `<c-size-t>`.
   :parameter mean: An instance of `<c-double>`.
   :value tss: An instance of `<c-double>`.

Variance
========

.. function:: gsl-stats-variance

   :signature: gsl-stats-variance (data stride n) => (variance)

   :parameter data: An instance of `<c-double*>`.
   :parameter stride: An instance of `<c-size-t>`.
   :parameter n: An instance of `<c-size-t>`.
   :value variance: An instance of `<c-double>`.

.. function:: gsl-stats-variance-m

   :signature: gsl-stats-variance-m (data stride n mean) => (variance)

   :parameter data: An instance of `<c-double*>`.
   :parameter stride: An instance of `<c-size-t>`.
   :parameter n: An instance of `<c-size-t>`.
   :parameter mean: An instance of `<c-double>`.
   :value variance: An instance of `<c-double>`.

.. function:: gsl-stats-variance-with-fixed-mean

   :signature: gsl-stats-variance-with-fixed-mean (data stride n mean) => (variance)

   :parameter data: An instance of `<c-double*>`.
   :parameter stride: An instance of `<c-size-t>`.
   :parameter n: An instance of `<c-size-t>`.
   :parameter mean: An instance of `<c-double>`.
   :value variance: An instance of `<c-double>`.

Correlation
===========

.. function:: gsl-stats-correlation

   :signature: gsl-stats-correlation (data1 stride1 data2 stride2 n) => (correlation)

   :parameter data1: An instance of `<c-double*>`.
   :parameter stride1: An instance of `<c-size-t>`.
   :parameter data2: An instance of `<c-double*>`.
   :parameter stride2: An instance of `<c-size-t>`.
   :parameter n: An instance of `<c-size-t>`.
   :value correlation: An instance of `<c-double>`.

.. function:: gsl-stats-spearman

   :signature: gsl-stats-spearman (data1 stride1 data2 stride2 n work) => (correlation-sd)

   :parameter data1: An instance of `<c-double*>`.
   :parameter stride1: An instance of `<c-size-t>`.
   :parameter data2: An instance of `<c-double*>`.
   :parameter stride2: An instance of `<c-size-t>`.
   :parameter n: An instance of `<c-size-t>`.
   :parameter work: An instance of `<c-double*>`.
   :value correlation-sd: An instance of `<c-double>`.

Weighted samples
================

.. function:: gsl-stats-wmean

   :signature: gsl-stats-wmean (w wstride data stride n) => (wmean)

   :parameter w: An instance of `<c-double*>`.
   :parameter wstride: An instance of `<c-size-t>`.
   :parameter data: An instance of `<c-double*>`.
   :parameter stride: An instance of `<c-size-t>`.
   :parameter n: An instance of `<c-size-t>`.
   :value wmean: An instance of `<c-double>`.

.. function:: gsl-stats-wvariance

   :signature: gsl-stats-wvariance (w wstride data stride n) => (wvariance)

   :parameter w: An instance of `<c-double*>`.
   :parameter wstride: An instance of `<c-size-t>`.
   :parameter data: An instance of `<c-double*>`.  
   :parameter stride: An instance of `<c-size-t>`.  
   :parameter n: An instance of `<c-size-t>`.  
   :value wvariance: An instance of `<c-double>`.  

.. function:: gsl-stats-wvariance-m

   :signature: gsl-stats-wvariance-m (w wstride data stride n mean) => (wvariance)

   :parameter w: An instance of `<c-double*>`.
   :parameter wstride: An instance of `<c-size-t>`.
   :parameter data: An instance of `<c-double*>`.
   :parameter stride: An instance of `<c-size-t>`.
   :parameter n: An instance of `<c-size-t>`.
   :parameter mean: An instance of `<c-double>`.
   :value wvariance: An instance of `<c-double>`.  

.. function:: gsl-stats-wsd

   :signature: gsl-stats-wsd (w wstride data stride n) => (wsd)

   :parameter w: An instance of `<c-double*>`.
   :parameter wstride: An instance of `<c-size-t>`.
   :parameter data: An instance of `<c-double*>`.
   :parameter stride: An instance of `<c-size-t>`.
   :parameter n: An instance of `<c-size-t>`.
   :value wsd: An instance of `<c-double>`.

.. function:: gsl-stats-wsd-m

   :signature: gsl-stats-wsd-m (w wstride data stride n mean) => (wsd)

   :parameter w: An instance of `<c-double*>`.
   :parameter wstride: An instance of `<c-size-t>`.
   :parameter data: An instance of `<c-double*>`.
   :parameter stride: An instance of `<c-size-t>`.
   :parameter n: An instance of `<c-size-t>`.
   :parameter mean: An instance of `<c-double>`.
   :value wsd: An instance of `<c-double>`.

.. function:: gsl-stats-wsd-with-fixed-mean

   :signature: gsl-stats-wsd-with-fixed-mean (w wstride data stride n mean) => (wsd)

   :parameter w: An instance of `<c-double*>`.
   :parameter wstride: An instance of `<c-size-t>`.
   :parameter data: An instance of `<c-double*>`.
   :parameter stride: An instance of `<c-size-t>`.
   :parameter n: An instance of `<c-size-t>`.
   :parameter mean: An instance of `<c-double>`.
   :value wsd: An instance of `<c-double>`.

.. function:: gsl-stats-wtss

   :signature: gsl-stats-wtss (w wstride data stride n) => (wtss)

   :parameter w: An instance of `<c-double*>`.
   :parameter wstride: An instance of `<c-size-t>`.
   :parameter data: An instance of `<c-double*>`.
   :parameter stride: An instance of `<c-size-t>`.
   :parameter n: An instance of `<c-size-t>`.
   :value wtss: An instance of `<c-double>`.

.. function:: gsl-stats-wtss-m

   :signature: gsl-stats-wtss-m (w wstride data stride n mean) => (wtss)

   :parameter w: An instance of `<c-double*>`.
   :parameter wstride: An instance of `<c-size-t>`.
   :parameter data: An instance of `<c-double*>`.
   :parameter stride: An instance of `<c-size-t>`.
   :parameter n: An instance of `<c-size-t>`.
   :parameter mean: An instance of `<c-double>`.
   :value wtss: An instance of `<c-double>`.

.. function:: gsl-stats-wabsdev

   :signature: gsl-stats-wabsdev (w wstride data stride n) => (wabsdev)

   :parameter w: An instance of `<c-double*>`.
   :parameter wstride: An instance of `<c-size-t>`.
   :parameter data: An instance of `<c-double*>`.
   :parameter stride: An instance of `<c-size-t>`.
   :parameter n: An instance of `<c-size-t>`.
   :value wabsdev: An instance of `<c-double>`.

.. function:: gsl-stats-wabsdev-m

   :signature: gsl-stats-wabsdev-m (w wstride data stride n mean) => (wabsdev)

   :parameter w: An instance of `<c-double*>`.
   :parameter wstride: An instance of `<c-size-t>`.
   :parameter data: An instance of `<c-double*>`.
   :parameter stride: An instance of `<c-size-t>`.
   :parameter n: An instance of `<c-size-t>`.
   :parameter mean: An instance of `<c-double>`.
   :value wabsdev: An instance of `<c-double>`.

.. function:: gsl-stats-wskew

   :signature: gsl-stats-wskew (w wstride data stride n) => (wskew)

   :parameter w: An instance of `<c-double*>`.
   :parameter wstride: An instance of `<c-size-t>`.
   :parameter data: An instance of `<c-double*>`.
   :parameter stride: An instance of `<c-size-t>`.
   :parameter n: An instance of `<c-size-t>`.
   :value wskew: An instance of `<c-double>`.

.. function:: gsl-stats-wkurtosis

   :signature: gsl-stats-wkurtosis (w wstride data stride n) => (wkurtosis)

   :parameter w: An instance of `<c-double*>`.
   :parameter wstride: An instance of `<c-size-t>`.
   :parameter data: An instance of `<c-double*>`.
   :parameter stride: An instance of `<c-size-t>`.
   :parameter n: An instance of `<c-size-t>`.
   :value wkurtosis: An instance of `<c-double>`.

.. function:: gsl-stats-wkurtosis-m-sd

   :signature: gsl-stats-wkurtosis-m-sd (w wstride data stride n mean sd) => (wkurtosis)

   :parameter w: An instance of `<c-double*>`.
   :parameter wstride: An instance of `<c-size-t>`.
   :parameter data: An instance of `<c-double*>`.
   :parameter stride: An instance of `<c-size-t>`.
   :parameter n: An instance of `<c-size-t>`.
   :parameter mean: An instance of `<c-double>`.
   :parameter sd: An instance of `<c-double>`.
   :value wkurtosis: An instance of `<c-double>`.

Median and Percentiles
======================

.. function:: gsl-stats-median-from-sorted-data

   :signature: gsl-stats-median-from-sorted-data (sorted-data stride n) => (median)

   :parameter sorted-data: An instance of `<c-double*>`.
   :parameter stride: An instance of `<c-size-t>`.
   :parameter n: An instance of `<c-size-t>`.
   :value median: An instance of `<c-double>`.

.. function:: gsl-stats-median

   :signature: gsl-stats-median (data stride n) => (median)

   :parameter data: An instance of `<c-double*>`.
   :parameter stride: An instance of `<c-size-t>`.
   :parameter n: An instance of `<c-size-t>`.
   :value median: An instance of `<c-double>`.

Order Statistics
================

.. function:: gsl-stats-select

   :signature: gsl-stats-select (data stride n k) => (kth-order-statistic)

   :parameter data: An instance of `<c-double*>`.
   :parameter stride: An instance of `<c-size-t>`.
   :parameter n: An instance of `<c-size-t>`.
   :parameter k: An instance of `<c-size-t>`.
   :value kth-order-statistic: An instance of `<c-double>`.

Robust Location Estimates
=========================

.. function:: gsl-stats-trmean-from-sorted-data

   :signature: gsl-stats-trmean-from-sorted-data (alpha sorted-data stride n) => (trmean)

   :parameter alpha: An instance of `<c-double>`.
   :parameter sorted-data: An instance of `<c-double*>`.
   :parameter stride: An instance of `<c-size-t>`.
   :parameter n: An instance of `<c-size-t>`.
   :value trmean: An instance of `<c-double>`.

.. function:: gsl-stats-gastwirth-from-sorted-data

   :signature: gsl-stats-gastwirth-from-sorted-data (sorted-data stride n) => (gastwirth)

   :parameter sorted-data: An instance of `<c-double*>`.
   :parameter stride: An instance of `<c-size-t>`.
   :parameter n: An instance of `<c-size-t>`.
   :value gastwirth: An instance of `<c-double>`.

Robust Scale Estimates
======================

.. function:: gsl-stats-mad0

   :signature: gsl-stats-mad0 (data stride n work) => (mad)

   :parameter data: An instance of `<c-double*>`.
   :parameter stride: An instance of `<c-size-t>`.
   :parameter n: An instance of `<c-size-t>`.
   :parameter work: An instance of `<c-double*>`.
   :value mad: An instance of `<c-double>`.

.. function:: gsl-stats-mad

   :signature: gsl-stats-mad (data stride n work) => (mad)

   :parameter data: An instance of `<c-double*>`.
   :parameter stride: An instance of `<c-size-t>`.
   :parameter n: An instance of `<c-size-t>`.
   :parameter work: An instance of `<c-double*>`.
   :value mad: An instance of `<c-double>`.

:math:`S_n` Statistic
=====================

.. function:: gsl-stats-sn0-from-sorted-data

   :signature: gsl-stats-sn0-from-sorted-data (sorted-data stride n work) => (sn0)

   :parameter sorted-data: An instance of `<c-double*>`.
   :parameter stride: An instance of `<c-size-t>`.
   :parameter n: An instance of `<c-size-t>`.
   :parameter work: An instance of `<c-double*>`.
   :value sn0: An instance of `<c-double>`.

.. function:: gsl-stats-sn-from-sorted-data

   :signature: gsl-stats-sn-from-sorted-data (sorted-data stride n work) => (sn)

   :parameter sorted-data: An instance of `<c-double*>`.
   :parameter stride: An instance of `<c-size-t>`.
   :parameter n: An instance of `<c-size-t>`.
   :parameter work: An instance of `<c-double*>`.
   :value sn: An instance of `<c-double>`.