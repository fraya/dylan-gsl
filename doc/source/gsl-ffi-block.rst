The GSL-FFI-BLOCK module
*****************************
.. current-library:: dylan-gsl
.. current-module:: gsl-ffi-block

The <gsl-block> type
====================

.. type:: <gsl-block>

   :superclasses: <c-struct>

   :description: A block of memory allocated by the GSL.

   :slots: 

Allocation functions
====================

.. function:: gsl-block-alloc

   :signature: gsl-block-alloc (n) => (block)

   :parameter n: An instance of `<c-size-t>`.
   :value block: An instance of `<gsl-block*>`.

   :description: Allocate an array of n elements in a block of memory.

.. function:: gsl-block-calloc

   :signature: gsl-block-calloc (n) => (block)

   :parameter n: An instance of `<c-size-t>`.
   :value block: An instance of `<gsl-block*>`.

   :description: Allocate an array of n elements in a block of memory and initialize all elements to zero.  

.. function:: gsl-block-free

   :signature: gsl-block-free (block) => ()

   :parameter block: An instance of `<gsl-block*>`. 