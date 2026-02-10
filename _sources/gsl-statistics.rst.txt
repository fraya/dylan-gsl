The GSL-STATISTICS module
*************************

.. current-library:: dylan-gsl
.. current-module:: gsl-statistics

Mean, Standard Deviation and Variance
=====================================

.. function:: mean

   :signature: mean (data #key stride) => (mean)

   :parameter data: An instance of :drm:`<vector>`.
   :parameter #key stride: An instance of :drm:`<integer>`.
   :value mean: An instance of :drm:`<double-float>`.

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

Absolute deviation
==================

.. function:: abs-dev

   :signature: abs-dev (data #key stride mean) => (mean)

   :parameter data: An instance of :drm:`<vector>`.
   :parameter #key stride: An instance of :drm:`<integer>`.
   :parameter #key mean: An instance of :const:`<double-float?>`.
   :value mean: An instance of :drm:`<double-float>`.

Covariance
==========

.. function:: covariance

   :signature: covariance (data1 data2 #key stride1 stride2 mean1 mean2) => (covariance)

   :parameter data1: An instance of :drm:`<vector>`.
   :parameter data2: An instance of :drm:`<vector>`.
   :parameter #key stride1: An instance of :drm:`<integer>`.
   :parameter #key stride2: An instance of :drm:`<integer>`.
   :parameter #key mean1: An instance of :const:`<double-float?>`.
   :parameter #key mean2: An instance of :const:`<double-float?>`.
   :value covariance: An instance of :drm:`<double-float>`.

Higher moments
==============

.. function:: skew

   :signature: skew (data #key stride mean sd) => (skewness)

   :parameter data: An instance of :drm:`<vector>`.
   :parameter #key stride: An instance of :drm:`<integer>`.
   :parameter #key mean: An instance of :const:`<double-float?>`.
   :parameter #key sd: An instance of :const:`<double-float?>`.
   :value skewness: An instance of :drm:`<double-float>`.

.. function:: kurtosis

   :signature: kurtosis (data #key stride mean sd) => (kurtosis)

   :parameter data: An instance of :drm:`<vector>`.
   :parameter #key stride: An instance of :drm:`<integer>`.
   :parameter #key mean: An instance of :const:`<double-float?>`.
   :parameter #key sd: An instance of :const:`<double-float?>`.
   :value kurtosis: An instance of :drm:`<double-float>`.

Autocorrelation
===============

.. function:: lag1-autocorrelation

   :signature: lag1-autocorrelation (data #key stride mean) => (autocorrelation)

   :parameter data: An instance of :drm:`<vector>`.
   :parameter #key stride: An instance of :drm:`<integer>`.
   :parameter #key mean: An instance of :const:`<double-float?>`.
   :value autocorrelation: An instance of :drm:`<double-float>`.

Maximum and Minimum
===================

.. function:: maximum

   :signature: maximum (data #key stride) => (max)

   :parameter data: An instance of :const:`<vector-double-float>`.
   :parameter #key stride: An instance of :drm:`<integer>`.
   :value max: An instance of :drm:`<double-float>`.

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

Correlation
===========

.. function:: correlation

   :signature: correlation (data1 data2 #key stride1 stride2) => (correlation)

   :parameter data1: An instance of :drm:`<vector>`.
   :parameter data2: An instance of :drm:`<vector>`.
   :parameter #key stride1: An instance of :drm:`<integer>`.
   :parameter #key stride2: An instance of :drm:`<integer>`.
   :value correlation: An instance of :drm:`<double-float>`.

.. function:: spearman

   :signature: spearman (data1 data2 work #key stride1 stride2) => (correlation-sd)

   :parameter data1: An instance of :drm:`<vector>`.
   :parameter data2: An instance of :drm:`<vector>`.
   :parameter work: An instance of :drm:`<vector>`.
   :parameter #key stride1: An instance of :drm:`<integer>`.
   :parameter #key stride2: An instance of :drm:`<integer>`.
   :value correlation-sd: An instance of :drm:`<double-float>`.

Weighted samples
================

.. function:: wmean

   :signature: wmean (weights data #key weights-stride data-stride) => (wmean)

   :parameter weights: An instance of :drm:`<vector-double-float>`.  
   :parameter data: An instance of :drm:`<vector-double-float>`.  
   :parameter #key weights-stride: An instance of :drm:`<integer>`.  
   :parameter #key data-stride: An instance of :drm:`<integer>`.  
   :value wmean: An instance of :drm:`<double-float>`.

.. function:: wvariance

   :signature: wvariance (weights data #key weights-stride data-stride mean fixed-mean? population?) => (wvariance)

   :parameter weights: An instance of :drm:`<vector-double-float>`.  
   :parameter data: An instance of :drm:`<vector-double-float>`.  
   :parameter #key weights-stride: An instance of :drm:`<integer>`.  
   :parameter #key data-stride: An instance of :drm:`<integer>`.  
   :parameter #key mean: An instance of :const:`<double-float?>`.  
   :parameter #key fixed-mean?: An instance of :drm:`<boolean>`.  
   :parameter #key population?: An instance of :drm:`<boolean>`.  
   :value wvariance: An instance of :drm:`<double-float>`.

.. function:: wsd

   :signature: wsd (weights data #key weights-stride data-stride mean) => (wsd)

   :parameter weights: An instance of :drm:`<vector-double-float>`.  
   :parameter data: An instance of :drm:`<vector-double-float>`.  
   :parameter #key weights-stride: An instance of :drm:`<integer>`.  
   :parameter #key data-stride: An instance of :drm:`<integer>`.  
   :parameter #key mean: An instance of :const:`<double-float?>`.  
   :value wsd: An instance of :drm:`<double-float>`.

.. function:: wtss

   :signature: wtss (weights data #key weights-stride data-stride mean) => (wtss)

   :parameter weights: An instance of :drm:`<vector-double-float>`.  
   :parameter data: An instance of :drm:`<vector-double-float>`.  
   :parameter #key weights-stride: An instance of :drm:`<integer>`.  
   :parameter #key data-stride: An instance of :drm:`<integer>`.  
   :parameter #key mean: An instance of :const:`<double-float?>`.  
   :value wtss: An instance of :drm:`<double-float>`.

.. function:: wabs-dev

   :signature: wabs-dev (weights data #key weights-stride data-stride mean) => (wabs-dev)

   :parameter weights: An instance of :drm:`<vector-double-float>`.  
   :parameter data: An instance of :drm:`<vector-double-float>`.  
   :parameter #key weights-stride: An instance of :drm:`<integer>`.  
   :parameter #key data-stride: An instance of :drm:`<integer>`.  
   :parameter #key mean: An instance of :const:`<double-float?>`.  
   :value wabs-dev: An instance of :drm:`<double-float>`.

.. function:: wskew

   :signature: wskew (weights data #key weights-stride data-stride) => (wskew)

   :parameter weights: An instance of :drm:`<vector-double-float>`.  
   :parameter data: An instance of :drm:`<vector-double-float>`.  
   :parameter #key weights-stride: An instance of :drm:`<integer>`.  
   :parameter #key data-stride: An instance of :drm:`<integer>`.  
   :value wskew: An instance of :drm:`<double-float>`.

.. function:: wkurtosis

   :signature: wkurtosis (weights data #key weights-stride data-stride mean sd) => (wkurtosis)

   :parameter weights: An instance of :drm:`<vector-double-float>`.  
   :parameter data: An instance of :drm:`<vector-double-float>`.  
   :parameter #key weights-stride: An instance of :drm:`<integer>`.  
   :parameter #key data-stride: An instance of :drm:`<integer>`.  
   :parameter #key mean: An instance of :const:`<double-float?>`.  
   :parameter #key sd: An instance of :const:`<double-float?>`.  
   :value wkurtosis: An instance of :drm:`<double-float>`.

Median and Percentiles
=====================

   .. function:: median

      :signature: median (data #key stride sorted?) => (median)

      :parameter data: An instance of :class:`<vector-double-float>`.
      :parameter #key stride: An instance of :drm:`<integer>`.
      :parameter #key sorted?: An instance of :drm:`<boolean>`.
      :value median: An instance of :drm:`<double-float>`.