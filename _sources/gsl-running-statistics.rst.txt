The GSL-RUNNING-STATISTICS module
*********************************

.. current-library:: dylan-gsl
.. current-module:: gsl-running-statistics

The ``gsl-running-statistics`` module provides routines for computing running
statistics. These routines process data in a single pass, making them
suitable for large datasets where storing all points in memory is impractical.
The module supports exact calculations for mean, variance, and higher-order
moments, as well as approximate calculations for medians and quantiles.

Statistical summary
===================

Here is a basic example of how to use the statistical functions:

.. code-block:: dylan

   let data = #[17.2d0, 18.1d0, 16.5d0, 18.3d0, 12.6d0];

   let rstat = make(<rstat>);

   // for (x in data) rstat-add!(rstat, x) end 
   rstat-add!(rstat, data); 
   
   format-out("The dataset is %=\n", data);

   format-out("The sample mean is %=\n", rstat.rstat-mean);
   format-out("The estimated variance is %=\n", rstat.rstat-variance);
   format-out("The largest value is %=\n", rstat.rstat-max);
   format-out("The smallest value is %=\n", rstat.rstat-min);
   format-out("The median is %=\n", rstat.rstat-median);
   format-out("The standard deviation is %=\n", rstat.rstat-sd);
   format-out("The root mean square is %=\n", rstat.rstat-rms);
   format-out("The standard devation of the mean is %=\n", rstat.rstat-sd-mean);
   format-out("The skew is %=\n", rstat.rstat-skew);
   format-out("The kurtosis %=\n", rstat.rstat-kurtosis);
   format-out("There are %d items in the accumulator\n", rstat.rstat-n);

   rstat.rstat-reset!;
   format-out("There are %d items in the accumulator\n", rstat.size);

Class and current statistics
----------------------------

.. class:: <rstat>

   :supers: :drm:`<object>`

   :slot rstat-min:
      An instance of :class:`<double-float>`. Minimal value seen so far.
   :slot rstat-max:
      An instance of :class:`<double-float>`. Maximal value seen so far.
   :slot rstat-mean:
      An instance of :class:`<double-float>`. Mean of the values seen so far.
   :slot rstat-variance:
      An instance of :class:`<double-float>`. Variance of the values seen so far.
   :slot rstat-sd:
      An instance of :class:`<double-float>`. Standard deviation of the values seen so far.
   :slot rstat-sd-mean:
      An instance of :class:`<double-float>`. Standard deviation of the mean of the values seen so far.
   :slot rstat-rms:
      An instance of :class:`<double-float>`. Root mean square of the values seen so far.
   :slot rstat-skew:
      An instance of :class:`<double-float>`. Skewness of the values seen so far.
   :slot rstat-kurtosis:
      An instance of :class:`<double-float>`. Kurtosis of the values seen so far.
   :slot rstat-median:
      An instance of :class:`<double-float>`. Median of the values seen so far.
   :slot rstat-norm:
      An instance of :class:`<double-float>`. Norm of the values seen so far.

.. method:: size
   :specializer: <rstat>
   
   :signature: size (rstat) => (n :: <integer>)

   :parameter rstat: An instance of :class:`<rstat>`.

Adding values to the accumulator
--------------------------------

.. generic-function:: rstat-add!

   :signature: rstat-add! (rstat, x) => ()

   :parameter rstat: An instance of :class:`<rstat>`.
   :parameter x: A :drm:`<object>`.

.. method:: rstat-add! 
   :specializer: <double-float>
   
   :signature: rstat-add! (rstat, x) => ()

   :parameter rstat: An instance of :class:`<rstat>`.
   :parameter x: A :class:`<double-float>`.

.. method:: rstat-add! 
   :specializer: <sequence>
   
   :signature: rstat-add! (rstat, x) => ()

   :parameter rstat: An instance of :class:`<rstat>`.
   :parameter x: A :drm:`<sequence>`.

Resetting the accumulator
-------------------------

.. function:: rstat-reset! 
   
   :signature: rstat-reset! (rstat) => ()

   :parameter rstat: An instance of :class:`<rstat>`.

Quantiles
=========

.. class:: <quantile-rstat>

   :supers: :drm:`<object>`

   :slot quantile-rstat-p:
      An instance of :class:`<double-float>`. The probability of the quantile.

.. generic-function:: quantile-rstat-add!

   :signature: quantile-rstat-add! (quantile-rstat, x) => ()

   :parameter quantile-rstat: An instance of :class:`<quantile-rstat>`.
   :parameter x: A :drm:`<object>`.

.. method:: quantile-rstat-add!
   :specializer: <double-float>
   
   :signature: quantile-rstat-add! (quantile-rstat, x) => ()

   :parameter quantile-rstat: An instance of :class:`<quantile-rstat>`.
   :parameter x: A :class:`<double-float>`.

.. method:: quantile-rstat-add!
   :specializer: <sequence>
   
   :signature: quantile-rstat-add! (quantile-rstat, x) => ()

   :parameter quantile-rstat: An instance of :class:`<quantile-rstat>`.
   :parameter x: A :drm:`<sequence>`.

.. function:: quantile-rstat-get

   :signature: quantile-rstat-get (quantile-rstat) => (quantile :: <double-float>)

   :parameter quantile-rstat: An instance of :class:`<quantile-rstat>`.

.. function:: quantile-rstat-reset!
   
   :signature: quantile-rstat-reset! (quantile-rstat) => ()

   :parameter quantile-rstat: An instance of :class:`<quantile-rstat>`.