The GSL-VECTOR module
*************************

.. current-library:: dylan-gsl
.. current-module:: gsl-vector

The <gsl-vector> type
=====================

.. type:: <gsl-vector>

   :superclasses: <mutable-sequence>

   :description: A vector of double precision floating point numbers.

   :slots: 

Allocation functions
====================

.. function:: make-gsl-vector

   :signature: make-gsl-vector (#key size fill) => (vector)

   :parameter size: An instance of `<integer>`.
   :parameter fill: An instance of `<double-float>`.
   :value vector: An instance of `<gsl-vector>`.

   :description: Allocate an array of size elements in a block of memory.

   :examples:

      make(<gsl-vector>, size: 10, fill: 1.0d0);
      

.. method:: size
   :specializer: <gsl-vector>

   :signature: size (vector) => (size)

   :parameter vector: An instance of `<gsl-vector>`.
   :value size: An instance of `<integer>`.

   :description: Return the size of the vector.


Copying vectors
===============

.. function:: copy-gsl-vector

   :signature: copy-gsl-vector (vector) => (copy)

   :parameter vector: An instance of `<gsl-vector>`.
   :value copy: An instance of `<gsl-vector>`.

   :description: Return a copy of the vector.

   :examples:

      let v = make(<gsl-vector>, size: 10, fill: 1.0d0);
      let w = copy-gsl-vector(v);

Accessing elements
==================

.. method:: element
   :specializer: <gsl-vector>

   :signature: element (vector index) => (element)

   :parameter vector: An instance of `<gsl-vector>`.
   :parameter index: An instance of `<integer>`.
   :value element: An instance of `<double-float>`.

   :description: Return the element at the given index.

   :examples:

      let v = make(<gsl-vector>, size: 10, fill: 1.0d0);
      element(v, 0);


.. method:: element-setter
   :specializer: <gsl-vector>

   :signature: element-setter (value vector index) => (value)

   :parameter value: An instance of `<double-float>`.
   :parameter vector: An instance of `<gsl-vector>`.
   :parameter index: An instance of `<integer>`.
   :value value: An instance of `<double-float>`.

   :description: Set the element at the given index to the given value.

   :examples:

      let v = make(<gsl-vector>, size: 10, fill: 1.0d0);
      element-setter(v, 0, 2.0d0);

Initializing vector elements
============================

.. function:: set-all!

   :signature: set-all! (vector value) => (vector)

   :parameter vector: An instance of `<gsl-vector>`.
   :parameter value: An instance of `<double-float>`.
   :value vector: An instance of `<gsl-vector>`.

   :description: Set all elements of the vector to the given value.

   :examples:

      let v = make(<gsl-vector>, size: 10, fill: 1.0d0);
      set-all!(v, 2.0d0);

.. function:: set-zero!

   :signature: set-zero! (vector) => (vector)

   :parameter vector: An instance of `<gsl-vector>`.
   :value vector: An instance of `<gsl-vector>`.

   :description: Set all elements of the vector to zero.

   :examples:

      let v = make(<gsl-vector>, size: 10, fill: 1.0d0);
      set-zero!(v);

.. function:: set-basis!

   :signature: set-basis! (vector index) => (vector)

   :parameter vector: An instance of `<gsl-vector>`.
   :parameter index: An instance of `<integer>`.
   :value vector: An instance of `<gsl-vector>`.

   :description: Set all elements of the vector to zero except for the element at the given index.

   :examples:

      let v = make(<gsl-vector>, size: 10, fill: 1.0d0);
      set-basis!(v, 0);

Exchanging elements
===================

.. function:: swap!

   :signature: swap! (vector index) => (vector)

   :parameter vector: An instance of `<gsl-vector>`.
   :parameter index: An instance of `<integer>`.
   :value vector: An instance of `<gsl-vector>`.

   :description: Swap the elements at the given index with the element at the given index.

   :examples:

      let v = make(<gsl-vector>, size: 10, fill: 1.0d0);
      swap!(v, 0, 1);

.. method:: reverse
   :specializer: <gsl-vector>

   :signature: reverse (vector) => (reversed)

   :parameter vector: An instance of `<gsl-vector>`.
   :value reversed: An instance of `<gsl-vector>`.

   :description: Return a reversed copy of the vector.

   :examples:

      let v = make(<gsl-vector>, size: 10, fill: 1.0d0);
      let reversed = reverse(v);

.. method:: reverse!
   :specializer: <gsl-vector>

   :signature: reverse! (vector) => (vector)

   :parameter vector: An instance of `<gsl-vector>`.
   :value vector: An instance of `<gsl-vector>`.

   :description: Reverse the vector in place.

   :examples:

      let v = make(<gsl-vector>, size: 10, fill: 1.0d0);
      reverse!(v);  

Vector operations
=================

.. function:: sum

   :signature: sum (vector) => (sum)

   :parameter vector: An instance of `<gsl-vector>`.
   :value sum: An instance of `<double-float>`.

   :description: Return the sum of the elements of the vector.

   :examples:

      let v = make(<gsl-vector>, size: 10, fill: 1.0d0);
      sum(v);

.. method:: +
   :specializer: <gsl-vector>, <gsl-vector>

   :signature: \+ (v w) => (sum)

   :parameter v: An instance of `<gsl-vector>`.
   :parameter w: An instance of `<gsl-vector>`
   :value sum: An instance of `<gsl-vector>`.

   :description: Return the sum of the elements of the vector.

   :examples:

      let v = make(<gsl-vector>, size: 10, fill: 1.0d0);
      let w = make(<gsl-vector>, size: 10, fill: 2.0d0);
      let z = v + w;

.. method:: -
   :specializer: <gsl-vector>, <gsl-vector>

   :signature: \- (v w) => (difference)

   :parameter v: An instance of `<gsl-vector>`.
   :parameter w: An instance of `<gsl-vector>`
   :value difference: An instance of `<gsl-vector>`.

   :description: Return the sum of the elements of the vector.

   :examples:

      let v = make(<gsl-vector>, size: 10, fill: 1.0d0);
      let w = make(<gsl-vector>, size: 10, fill: 2.0d0);
      let z = v - w;

.. method:: *
   :specializer: <gsl-vector>, <gsl-vector>

   :signature: \* (v w) => (product)

   :parameter v: An instance of `<gsl-vector>`.
   :parameter w: An instance of `<gsl-vector>`
   :value product: An instance of `<gsl-vector>`.

   :description: Return the sum of the elements of the vector.

   :examples:

      let v = make(<gsl-vector>, size: 10, fill: 1.0d0);
      let w = make(<gsl-vector>, size: 10, fill: 2.0d0);
      let z = v * w;

.. method:: /
   :specializer: <gsl-vector>, <gsl-vector>

   :signature: \/ (v w) => (division)

   :parameter v: An instance of `<gsl-vector>`.
   :parameter w: An instance of `<gsl-vector>`.
   :value division: An instance of `<gsl-vector>`.

   :description: Return the division of the elements of the vector.

   :examples:

      let v = make(<gsl-vector>, size: 10, fill: 10.0d0);
      let w = make(<gsl-vector>, size: 10, fill: 2.0d0);
      let q = v / w;

.. method:: *
   :specializer: <gsl-vector>, <double-float>

   :signature: \* (vector value) => (scaled)

   :parameter vector: An instance of `<gsl-vector>`.
   :parameter value: An instance of `<double-float>`.
   :value scaled: An instance of `<gsl-vector>`.

   :description: Return the scaled version of the vector.

   :examples:

      let v = make(<gsl-vector>, size: 10, fill: 1.0d0);
      let scaled = v * 2.0d0; 

.. method:: +
   :specializer: <gsl-vector>, <double-float>

   :signature: \+ (vector addend) => (sum)

   :parameter vector: An instance of `<gsl-vector>`.
   :parameter addend: An instance of `<double-float>`.
   :value sum: An instance of `<gsl-vector>`.

   :description: Adds a constant value to the elements of the vector.

   :examples:

      let v = make(<gsl-vector>, size: 10, fill: 1.0d0);
      let sum = v + 2.0d0; 


.. function:: sum

   :signature: sum (vector) => (sum)

   :parameter vector: An instance of `<gsl-vector>`.
   :value sum: An instance of `<double-float>`.

   :description: Return the sum of the elements of the vector.

   :examples:

      let v = make(<gsl-vector>, size: 10, fill: 1.0d0);
      sum(v);

.. function:: axpby

   :signature: axpby (alpha x beta y) => (v)

   :parameter alpha: An instance of `<double-float>`.
   :parameter x: An instance of `<gsl-vector>`.
   :parameter beta: An instance of `<double-float>`.
   :parameter y: An instance of `<gsl-vector>`.
   :value v: An instance of `<gsl-vector>`.

   :description: Return the result of the operation alpha * x + beta * y.

   :examples:
 
      let alpha = 1.0d0;
      let beta = 2.0d0;
      let v = make(<gsl-vector>, size: 10, fill: 1.0d0);
      let w = make(<gsl-vector>, size: 10, fill: 2.0d0);
      let v = axpby(alpha, v, beta, w);
   
.. function:: axpby!

   :signature: axpby! (alpha x beta y) => (v)

   :parameter alpha: An instance of `<double-float>`.
   :parameter x: An instance of `<gsl-vector>`.
   :parameter beta: An instance of `<double-float>`.
   :parameter y: An instance of `<gsl-vector>`.
   :value v: An instance of `<gsl-vector>`.

   :description: Return the result of the operation alpha * x + beta * y in place.

   :examples:
 
      let alpha = 1.0d0;
      let beta = 2.0d0;
      let v = make(<gsl-vector>, size: 10, fill: 1.0d0);
      let w = make(<gsl-vector>, size: 10, fill: 2.0d0);
      axpby!(alpha, v, beta, w);

Finding maximum and minimum elements of vectors
===============================================

.. function:: gsl-max

   :signature: gsl-max (vector) => (max)

   :parameter vector: An instance of `<gsl-vector>`.
   :value max: An instance of `<double-float>`.

   :description: Return the maximum element of the vector.

   :examples:

      let v = make(<gsl-vector>, size: 10, fill: 1.0d0);
      gsl-max(v);

.. function:: gsl-min

   :signature: gsl-min (vector) => (min)

   :parameter vector: An instance of `<gsl-vector>`.
   :value min: An instance of `<double-float>`.

   :description: Return the minimum element of the vector.

   :examples:

      let v = make(<gsl-vector>, size: 10, fill: 1.0d0);
      gsl-min(v);

.. function:: max-index

   :signature: max-index (vector) => (max-index)

   :parameter vector: An instance of `<gsl-vector>`.
   :value max-index: An instance of `<integer>`.

   :description: Return the index of the maximum element of the vector.

   :examples:

      let v = make(<gsl-vector>, size: 10, fill: 1.0d0);
      max-index(v);

.. function:: min-index

   :signature: min-index (vector) => (min-index)

   :parameter vector: An instance of `<gsl-vector>`.
   :value min-index: An instance of `<integer>`.

   :description: Return the index of the minimum element of the vector.

   :examples:

      let v = make(<gsl-vector>, size: 10, fill: 1.0d0);
      min-index(v);

.. function:: min-max

   :signature: min-max (vector) => (min max)

   :parameter vector: An instance of `<gsl-vector>`.
   :value min: An instance of `<double-float>`.
   :value max: An instance of `<double-float>`.

   :description: Return the minimum and maximum elements of the vector.

   :examples:

      let v = make(<gsl-vector>, size: 10, fill: 1.0d0);
      min-max(v);

.. function:: min-max-index

   :signature: min-max-index (vector) => (min-index max-index)

   :parameter vector: An instance of `<gsl-vector>`.
   :value min-index: An instance of `<integer>`.
   :value max-index: An instance of `<integer>`.

   :description: Return the indices of the minimum and maximum elements of the vector.

   :examples:

      let v = make(<gsl-vector>, size: 10, fill: 1.0d0);
      min-max-index(v);

Vector properties
=================

.. function:: null?

   :signature: null? (vector) => (null?)

   :parameter vector: An instance of `<gsl-vector>`.
   :value null?: An instance of `<boolean>`.

   :description: Return true if the vector is null.

   :examples:

      let v = make(<gsl-vector>, size: 10, fill: 1.0d0);
      null?(v);

.. method:: zero?
   :specializer: <gsl-vector>

   :signature: zero? (vector) => (zero?)

   :parameter vector: An instance of `<gsl-vector>`.
   :value zero?: An instance of `<boolean>`.

   :description: Return true if the vector is zero.

   :examples:

      let v = make(<gsl-vector>, size: 10, fill: 1.0d0);
      v.zero?;

.. method:: positive?
   :specializer: <gsl-vector>

   :signature: positive? (vector) => (positive?)

   :parameter vector: An instance of `<gsl-vector>`.
   :value positive?: An instance of `<boolean>`.

   :description: Return true if the vector is positive.

   :examples:

      let v = make(<gsl-vector>, size: 10, fill: 1.0d0);
      v.positive?;

.. method:: negative?
   :specializer: <gsl-vector>

   :signature: negative? (vector) => (negative?)

   :parameter vector: An instance of `<gsl-vector>`.
   :value negative?: An instance of `<boolean>`.

   :description: Return true if the vector is negative.

   :examples:

      let v = make(<gsl-vector>, size: 10, fill: -1.0d0);
      v.negative?;

.. function:: non-negative?

   :signature: non-negative? (vector) => (non-negative?)

   :parameter vector: An instance of `<gsl-vector>`.
   :value non-negative?: An instance of `<boolean>`.

   :description: Return true if the vector is non-negative.

   :examples:

      let v = make(<gsl-vector>, size: 10, fill: 1.0d0);
      v.non-negative?;