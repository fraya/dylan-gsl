The GSL-FFI-RUNNING-STATISTICS module
*************************************

.. current-library:: dylan-gsl
.. current-module:: gsl-ffi-running-statistics

Classes
=======

.. class:: <gsl-rstat-workspace>

  Accumulator used to store the running statistics.

Initializing the Accumulator
============================

.. function:: gsl-rstat-alloc

   :signature: gsl-rstat-alloc () => (workspace)

   :value workspace: An instance of :class:`<gsl-rstat-workspace>`.

   :description: 

     Allocate a new :class:`<gsl-rstat-workspace>`.

.. function:: gsl-rstat-free

   :signature: gsl-rstat-free (workspace) => ()

   :parameter workspace: An instance of :class:`<gsl-rstat-workspace*>`.

   :description: 

     Free a :class:`<gsl-rstat-workspace>`.

.. function:: gsl-rstat-reset

   :signature: gsl-rstat-reset (workspace) => ()

   :parameter workspace: An instance of :class:`<gsl-rstat-workspace*>`.

   :description: 

     Reset a :class:`<gsl-rstat-workspace>`.

Adding Data to the Accumulator
==============================

.. function:: gsl-rstat-add

   :signature: gsl-rstat-add (workspace x) => (status)

   :parameter workspace: An instance of :class:`<gsl-rstat-workspace*>`.
   :parameter x: An instance of :class:`<double-float>`. 

   :description: 

     Add a new value to the :class:`<gsl-rstat-workspace*>`.

.. function:: gsl-rstat-n

   :signature: gsl-rstat-n (workspace) => (n)

   :parameter workspace: An instance of :class:`<gsl-rstat-workspace*>`.
   :value n: The number of values in the accumulator.

   :description: 

     Get the number of values so far added to the :class:`<gsl-rstat-workspace>`.

Current Statistics
==================

.. function:: gsl-rstat-min

   :signature: gsl-rstat-min (workspace) => (min)

   :parameter workspace: An instance of :class:`<gsl-rstat-workspace*>`.
   :value min: The minimum value in the accumulator.

   :description: 

     Get the minimum value so far added to the :class:`<gsl-rstat-workspace>`.

.. function:: gsl-rstat-max

   :signature: gsl-rstat-max (workspace) => (max)

   :parameter workspace: An instance of :class:`<gsl-rstat-workspace*>`. 
   :value max: The maximum value in the accumulator.

   :description: 

     Get the maximum value so far added to the :class:`<gsl-rstat-workspace>`.

.. function:: gsl-rstat-mean

   :signature: gsl-rstat-mean (workspace) => (mean)

   :parameter workspace: An instance of :class:`<gsl-rstat-workspace*>`. 
   :value mean: The mean value in the accumulator.

   :description: 

     Get the mean value so far added to the :class:`<gsl-rstat-workspace>`.

.. function:: gsl-rstat-variance

   :signature: gsl-rstat-variance (workspace) => (variance)

   :parameter workspace: An instance of :class:`<gsl-rstat-workspace*>`. 
   :value variance: The variance value in the accumulator.

   :description: 

     Get the variance value so far added to the :class:`<gsl-rstat-workspace>`.

.. function:: gsl-rstat-sd

   :signature: gsl-rstat-sd (workspace) => (sd)

   :parameter workspace: An instance of :class:`<gsl-rstat-workspace*>`. 
   :value sd: The standard deviation value in the accumulator.

   :description: 

     Get the standard deviation value so far added to the :class:`<gsl-rstat-workspace>`.

.. function:: gsl-rstat-rms

   :signature: gsl-rstat-rms (workspace) => (rms)

   :parameter workspace: An instance of :class:`<gsl-rstat-workspace*>`. 
   :value rms: The root mean square value in the accumulator.

   :description: 

     Get the root mean square value so far added to the :class:`<gsl-rstat-workspace>`.

.. function:: gsl-rstat-skew

   :signature: gsl-rstat-skew (workspace) => (skew)

   :parameter workspace: An instance of :class:`<gsl-rstat-workspace*>`. 
   :value skew: The skewness value in the accumulator.

   :description: 

     Get the skewness value so far added to the :class:`<gsl-rstat-workspace>`.

.. function:: gsl-rstat-kurtosis

   :signature: gsl-rstat-kurtosis (workspace) => (kurtosis)

   :parameter workspace: An instance of :class:`<gsl-rstat-workspace*>`. 
   :value kurtosis: The kurtosis value in the accumulator.

   :description: 

     Get the kurtosis value so far added to the :class:`<gsl-rstat-workspace>`.

.. function:: gsl-rstat-median

   :signature: gsl-rstat-median (workspace) => (median)

   :parameter workspace: An instance of :class:`<gsl-rstat-workspace*>`. 
   :value median: The median value in the accumulator.

   :description: 

     Get the median value so far added to the :class:`<gsl-rstat-workspace>`.

.. function:: gsl-rstat-norm

   :signature: gsl-rstat-norm (workspace) => (norm)

   :parameter workspace: An instance of :class:`<gsl-rstat-workspace*>`. 
   :value norm: The norm value in the accumulator.

   :description: 

     Get the norm value so far added to the :class:`<gsl-rstat-workspace>`.