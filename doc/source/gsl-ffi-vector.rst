The GSL-FFI-VECTOR module
*************************

.. current-library:: dylan-gsl
.. current-module:: gsl-ffi-vector

The <gsl-vector*> type
======================

.. type:: <gsl-vector*>

   :superclasses: <c-struct>

   :description: A vector of double precision floating point numbers.

   :slots: 

Allocation functions
====================

.. function:: gsl-vector-alloc

   :signature: gsl-vector-alloc (n) => (vector)

   :parameter n: An instance of `<c-size-t>`.
   :value vector: An instance of `<gsl-vector*>`.

   :description: Allocate an array of n elements in a block of memory.

.. function:: gsl-vector-calloc

   :signature: gsl-vector-calloc (n) => (vector)

   :parameter n: An instance of `<c-size-t>`.
   :value vector: An instance of `<gsl-vector*>`.

   :description: Allocate an array of n elements in a block of memory and initialize all elements to zero. 

.. function:: gsl-vector-free

   :signature: gsl-vector-free (vector) => ()

   :parameter vector: An instance of `<gsl-vector*>`.

   :description: Free the memory allocated for the vector.

.. function:: gsl-vector-ptr

   :signature: gsl-vector-ptr (vector, i) => (value)

   :parameter vector: An instance of `<gsl-vector*>`.
   :parameter i: An instance of `<c-size-t>`.
   :value value: An instance of `<c-double>`.

   :description: Return a pointer to the i-th element of the vector.

.. function:: gsl-vector-const-ptr

   :signature: gsl-vector-const-ptr (vector, i) => (value)

   :parameter vector: An instance of `<gsl-vector*>`.
   :parameter i: An instance of `<c-size-t>`.
   :value value: An instance of `<c-double>`.

   :description: Return a pointer to the i-th element of the vector.

Initializing vector elements
============================

.. function:: gsl-vector-set-all

   :signature: gsl-vector-set-all (vector, value) => ()

   :parameter vector: An instance of `<gsl-vector*>`.
   :parameter value: An instance of `<c-double>`.

   :description: Set all elements of the vector to the given value.

.. function:: gsl-vector-set-zero

   :signature: gsl-vector-set-zero (vector) => ()

   :parameter vector: An instance of `<gsl-vector*>`.

   :description: Set all elements of the vector to zero.

.. function:: gsl-vector-set-basis

   :signature: gsl-vector-set-basis (vector, i) => ()

   :parameter vector: An instance of `<gsl-vector*>`.
   :parameter i: An instance of `<c-size-t>`.

   :description: Set all elements of the vector to zero except for the i-th element which is set to one.

Exchanging elements
===================

.. function:: gsl-vector-swap-elements

   :signature: gsl-vector-swap-elements (vector, i, j) => ()

   :parameter vector: An instance of `<gsl-vector*>`.
   :parameter i: An instance of `<c-size-t>`.
   :parameter j: An instance of `<c-size-t>`.

   :description: Swap the i-th and j-th elements of the vector.

.. function:: gsl-vector-reverse

   :signature: gsl-vector-reverse (vector) => ()

   :parameter vector: An instance of `<gsl-vector*>`.

   :description: Reverse the order of the elements in the vector.

Vector operations
=================

.. function:: gsl-vector-add

   :signature: gsl-vector-add (a, b) => (value)

   :parameter a: An instance of `<gsl-vector*>`.
   :parameter b: An instance of `<gsl-vector*>`.
   :value value: An instance of `<c-int>`.

   :description: Add the elements of the vector b to the elements of the vector a.

.. function:: gsl-vector-sub

   :signature: gsl-vector-sub (a, b) => (value)

   :parameter a: An instance of `<gsl-vector*>`.
   :parameter b: An instance of `<gsl-vector*>`.
   :value value: An instance of `<c-int>`.

   :description: Subtract the elements of the vector b from the elements of the vector a.

.. function:: gsl-vector-mul

   :signature: gsl-vector-mul (a, b) => (value)

   :parameter a: An instance of `<gsl-vector*>`.
   :parameter b: An instance of `<gsl-vector*>`.
   :value value: An instance of `<c-int>`.

   :description: Multiply the elements of the vector b by the elements of the vector a.

.. function:: gsl-vector-div

   :signature: gsl-vector-div (a, b) => (value)

   :parameter a: An instance of `<gsl-vector*>`.
   :parameter b: An instance of `<gsl-vector*>`.
   :value value: An instance of `<c-int>`.

   :description: Divide the elements of the vector b by the elements of the vector a.

.. function:: gsl-vector-scale

   :signature: gsl-vector-scale (a, value) => (value)

   :parameter a: An instance of `<gsl-vector*>`.
   :parameter value: An instance of `<c-double>`.
   :value value: An instance of `<c-int>`.

   :description: Scale the elements of the vector a by the given value.

.. function:: gsl-vector-add-constant

   :signature: gsl-vector-add-constant (a, value) => (value)

   :parameter a: An instance of `<gsl-vector*>`.
   :parameter value: An instance of `<c-double>`.
   :value value: An instance of `<c-int>`.

   :description: Add the given value to the elements of the vector a.

.. function:: gsl-vector-sum

   :signature: gsl-vector-sum (a) => (value)

   :parameter a: An instance of `<gsl-vector*>`.
   :value value: An instance of `<c-double>`.

   :description: Return the sum of the elements of the vector a.

.. function:: gsl-vector-axpby

   :signature: gsl-vector-axpby (alpha, x, beta, y) => (value)

   :parameter alpha: An instance of `<c-double>`.
   :parameter x: An instance of `<gsl-vector*>`.
   :parameter beta: An instance of `<c-double>`.
   :parameter y: An instance of `<gsl-vector*>`.
   :value value: An instance of `<c-int>`.

   :description: Compute the linear combination of the vectors x and y, i.e.

Finding maximum and minimum elements
====================================

.. function:: gsl-vector-max

   :signature: gsl-vector-max (a) => (value)

   :parameter a: An instance of `<gsl-vector*>`.
   :value value: An instance of `<c-double>`.

   :description: Return the maximum element of the vector a.

.. function:: gsl-vector-min

   :signature: gsl-vector-min (a) => (value)

   :parameter a: An instance of `<gsl-vector*>`.
   :value value: An instance of `<c-double>`.

   :description: Return the minimum element of the vector a.

.. function:: gsl-vector-max-index

   :signature: gsl-vector-max-index (a) => (value)

   :parameter a: An instance of `<gsl-vector*>`.
   :value value: An instance of `<c-size-t>`.

   :description: Return the index of the maximum element of the vector a.

.. function:: gsl-vector-min-index

   :signature: gsl-vector-min-index (a) => (value)

   :parameter a: An instance of `<gsl-vector*>`.
   :value value: An instance of `<c-size-t>`.

   :description: Return the index of the minimum element of the vector a.

.. function:: gsl-vector-max-index

   :signature: gsl-vector-max-index (a) => (value)

   :parameter a: An instance of `<gsl-vector*>`.
   :value value: An instance of `<c-size-t>`.

   :description: Return the index of the maximum element of the vector a.
   
.. function:: gsl-vector-min-index

   :signature: gsl-vector-min-index (a) => (value)

   :parameter a: An instance of `<gsl-vector*>`.
   :value value: An instance of `<c-size-t>`.

   :description: Return the index of the minimum element of the vector a.

Vector properties
=================

.. function:: gsl-vector-equal

   :signature: gsl-vector-equal (a, b) => (value)

   :parameter a: An instance of `<gsl-vector*>`.
   :parameter b: An instance of `<gsl-vector*>`.
   :value value: An instance of `<c-int>`.

   :description: Return true if the vectors a and b are equal.

.. function:: gsl-vector-isnull

   :signature: gsl-vector-isnull (a) => (value)

   :parameter a: An instance of `<gsl-vector*>`.
   :value value: An instance of `<c-int>`.

   :description: Return true if the vector a is null.

.. function:: gsl-vector-ispos

   :signature: gsl-vector-ispos (a) => (value)

   :parameter a: An instance of `<gsl-vector*>`.
   :value value: An instance of `<c-int>`.

   :description: Return true if the vector a is positive.

.. function:: gsl-vector-isneg

   :signature: gsl-vector-isneg (a) => (value)

   :parameter a: An instance of `<gsl-vector*>`.
   :value value: An instance of `<c-int>`.

   :description: Return true if the vector a is negative.

.. function:: gsl-vector-isnonneg

   :signature: gsl-vector-isnonneg (a) => (value)

   :parameter a: An instance of `<gsl-vector*>`.
   :value value: An instance of `<c-int>`.

   :description: Return true if the vector a is non-negative.