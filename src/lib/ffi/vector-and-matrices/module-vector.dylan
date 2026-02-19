Module: dylan-user
Synopsis: Module for vectors in dylan-gsl
Author: Fernando Raya
Copyright: Copyright (C) 2026, Dylan Hackers. All rights reserved.
License: See LICENSE in this distribution for details.
Reference: https://www.gnu.org/software/gsl/doc/html/vector_matrix.html

define module gsl-ffi-vector

  create
    <gsl-vector>,
    <gsl-vector*>,
    gsl-vector-size,
    gsl-vector-size-setter,
    gsl-vector-data,
    gsl-vector-data-setter,
    gsl-vector-stride,
    gsl-vector-stride-setter,
    gsl-vector-block,
    gsl-vector-block-setter,
    gsl-vector-owner,
    gsl-vector-owner-setter;

  // Allocation and deallocation

  create
    gsl-vector-alloc,
    gsl-vector-calloc,
    gsl-vector-free;


  // Element access

  create
    gsl-vector-get,
    gsl-vector-set,
    gsl-vector-ptr,
    gsl-vector-const-ptr;

  // Initialization

  create
    gsl-vector-set-all,
    gsl-vector-set-zero,
    gsl-vector-set-basis;

  // Copying

  create
    gsl-vector-memcpy;

  // Exchanging elements

  create
    gsl-vector-swap-elements,
    gsl-vector-reverse;

  // Operations

  create
    gsl-vector-add,
    gsl-vector-sub,
    gsl-vector-mul,
    gsl-vector-div,
    gsl-vector-scale,
    gsl-vector-add-constant,
    gsl-vector-sum,
    gsl-vector-axpby;

  // Min and max

  create
    gsl-vector-max,
    gsl-vector-min,
    gsl-vector-minmax,
    gsl-vector-max-index,
    gsl-vector-min-index,
    gsl-vector-minmax-index;

end module;

define module gsl-ffi-vector-impl

  use common-dylan;
  use c-ffi;
  use gsl-ffi-block;
  use gsl-ffi-vector;

end module;