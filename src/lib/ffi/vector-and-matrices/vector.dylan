Module: gsl-ffi-vector-impl 
Synopsis: Vector and matrices
Author: Fernando Raya
Copyright: Copyright (C) 2026, Dylan Hackers. All rights reserved.
License: See LICENSE in this distribution for details.
Reference: https://www.gnu.org/software/gsl/doc/html/vector_matrix.html

// Vector 
// https://www.gnu.org/software/gsl/doc/html/vectors.html#c.gsl_vector

define c-struct <gsl-vector>
  slot gsl-vector-size :: <c-size-t>;
  slot gsl-vector-stride :: <c-size-t>;
  slot gsl-vector-data :: <c-double*>;
  slot gsl-vector-block :: <gsl-block*>;
  slot gsl-vector-owner :: <c-int>;
  pointer-type-name: <gsl-vector*>;
end;

// https://www.gnu.org/software/gsl/doc/html/vectors.html#c.gsl_vector_alloc

define c-function gsl-vector-alloc
  input parameter n :: <c-size-t>;
  result gsl-vector :: <gsl-vector*>;
  c-name: "gsl_vector_alloc";
end;

// https://www.gnu.org/software/gsl/doc/html/vectors.html#c.gsl_vector_calloc

define c-function gsl-vector-calloc
  input parameter n :: <c-size-t>;
  result gsl-vector :: <gsl-vector*>;
  c-name: "gsl_vector_calloc";
end;

// https://www.gnu.org/software/gsl/doc/html/vectors.html#c.gsl_vector_free

define c-function gsl-vector-free
  input parameter gsl-vector :: <gsl-vector*>;
  c-name: "gsl_vector_free";
end;

// https://www.gnu.org/software/gsl/doc/html/vectors.html#c.gsl_vector_get

define c-function gsl-vector-get
  input parameter gsl-vector :: <gsl-vector*>;
  input parameter i :: <c-size-t>;
  result value :: <c-double>;
  c-name: "gsl_vector_get";
end;

// https://www.gnu.org/software/gsl/doc/html/vectors.html#c.gsl_vector_set

define c-function gsl-vector-set
  input parameter gsl-vector :: <gsl-vector*>;
  input parameter i :: <c-size-t>;
  input parameter value :: <c-double>;
  c-name: "gsl_vector_set";
end;

// https://www.gnu.org/software/gsl/doc/html/vectors.html#c.gsl_vector_ptr

define c-function gsl-vector-ptr
  input parameter gsl-vector :: <gsl-vector*>;
  input parameter i :: <c-size-t>;
  result value :: <c-double*>;
  c-name: "gsl_vector_ptr";
end;

// https://www.gnu.org/software/gsl/doc/html/vectors.html#c.gsl_vector_const_ptr

define c-function gsl-vector-const-ptr
  input parameter gsl-vector :: <gsl-vector*>;
  input parameter i :: <c-size-t>;
  result value :: <c-double*>;
  c-name: "gsl_vector_const_ptr";
end;


// Initializing vector elements

// https://www.gnu.org/software/gsl/doc/html/vectors.html#c.gsl_vector_set_all

define c-function gsl-vector-set-all
  input parameter gsl-vector :: <gsl-vector*>;
  input parameter value :: <c-double>;
  c-name: "gsl_vector_set_all";
end;

// https://www.gnu.org/software/gsl/doc/html/vectors.html#c.gsl_vector_set_zero

define c-function gsl-vector-set-zero
  input parameter gsl-vector :: <gsl-vector*>;
  c-name: "gsl_vector_set_zero";
end;

// https://www.gnu.org/software/gsl/doc/html/vectors.html#c.gsl_vector_set_basis

define c-function gsl-vector-set-basis
  input parameter gsl-vector :: <gsl-vector*>;
  input parameter i :: <c-size-t>;
  c-name: "gsl_vector_set_basis";
end;

// TODO: Reading and writing vectors

// TODO: Vector views

// TODO: Copying vectors
// https://www.gnu.org/software/gsl/doc/html/vectors.html#copying-vectors

define c-function gsl-vector-memcpy
  input parameter dest :: <gsl-vector*>;
  input parameter src :: <gsl-vector*>;
  result value :: <c-int>;
  c-name: "gsl_vector_memcpy";
end;

// TODO:Exchanging elements

// https://www.gnu.org/software/gsl/doc/html/vectors.html#exchanging-elements

// https://www.gnu.org/software/gsl/doc/html/vectors.html#c.gsl_vector_swap_elements

define c-function gsl-vector-swap-elements
  input parameter gsl-vector :: <gsl-vector*>;
  input parameter i :: <c-size-t>;
  input parameter j :: <c-size-t>;
  result value :: <c-int>;
  c-name: "gsl_vector_swap_elements";
end;

// https://www.gnu.org/software/gsl/doc/html/vectors.html#c.gsl_vector_reverse

define c-function gsl-vector-reverse
  input parameter gsl-vector :: <gsl-vector*>;
  result value :: <c-int>;
  c-name: "gsl_vector_reverse";
end;

// Vector operations

// https://www.gnu.org/software/gsl/doc/html/vectors.html#c.gsl_vector_add

define c-function gsl-vector-add
  input parameter a :: <gsl-vector*>;
  input parameter b :: <gsl-vector*>;
  result value :: <c-int>;
  c-name: "gsl_vector_add";
end;

// https://www.gnu.org/software/gsl/doc/html/vectors.html#c.gsl_vector_sub

define c-function gsl-vector-sub
  input parameter a :: <gsl-vector*>;
  input parameter b :: <gsl-vector*>;
  result value :: <c-int>;
  c-name: "gsl_vector_sub";
end;

// https://www.gnu.org/software/gsl/doc/html/vectors.html#c.gsl_vector_mul

define c-function gsl-vector-mul
  input parameter a :: <gsl-vector*>;
  input parameter b :: <gsl-vector*>;
  result value :: <c-int>;
  c-name: "gsl_vector_mul";
end;

// https://www.gnu.org/software/gsl/doc/html/vectors.html#c.gsl_vector_div

define c-function gsl-vector-div
  input parameter a :: <gsl-vector*>;
  input parameter b :: <gsl-vector*>;
  result value :: <c-int>;
  c-name: "gsl_vector_div";
end;

// https://www.gnu.org/software/gsl/doc/html/vectors.html#c.gsl_vector_scale

define c-function gsl-vector-scale
  input parameter a :: <gsl-vector*>;
  input parameter value :: <c-double>;
  result value :: <c-int>;
  c-name: "gsl_vector_scale";
end;

// https://www.gnu.org/software/gsl/doc/html/vectors.html#c.gsl_vector_add_constant

define c-function gsl-vector-add-constant
  input parameter a :: <gsl-vector*>;
  input parameter value :: <c-double>;
  result value :: <c-int>;
  c-name: "gsl_vector_add_constant";
end;

// https://www.gnu.org/software/gsl/doc/html/vectors.html#c.gsl_vector_sum

define c-function gsl-vector-sum
  input parameter a :: <gsl-vector*>;
  result value :: <c-double>;
  c-name: "gsl_vector_sum";
end;

// https://www.gnu.org/software/gsl/doc/html/vectors.html#c.gsl_vector_axpby

define c-function gsl-vector-axpby
  input parameter alpha :: <c-double>;
  input parameter x :: <gsl-vector*>;
  input parameter beta :: <c-double>;
  input parameter y :: <gsl-vector*>;
  result value :: <c-int>;
  c-name: "gsl_vector_axpby";
end;

// TODO: Complex vector operations

// Finding maximum and minimum elements of vectors

// https://www.gnu.org/software/gsl/doc/html/vectors.html#finding-maximum-and-minimum-elements-of-vectors

// https://www.gnu.org/software/gsl/doc/html/vectors.html#c.gsl_vector_max

define c-function gsl-vector-max
  input parameter v :: <gsl-vector*>;
  result value :: <c-double>;
  c-name: "gsl_vector_max";
end;

// https://www.gnu.org/software/gsl/doc/html/vectors.html#c.gsl_vector_min

define c-function gsl-vector-min
  input parameter v :: <gsl-vector*>;
  result value :: <c-double>;
  c-name: "gsl_vector_min";
end;

// https://www.gnu.org/software/gsl/doc/html/vectors.html#c.gsl_vector_minmax

define c-function gsl-vector-minmax
  input parameter v :: <gsl-vector*>;
  output parameter min-out :: <c-double*>;
  output parameter max-out :: <c-double*>;
  c-name: "gsl_vector_minmax";
end;

// https://www.gnu.org/software/gsl/doc/html/vectors.html#c.gsl_vector_max_index

define c-function gsl-vector-max-index
  input parameter v :: <gsl-vector*>;
  result value :: <c-size-t>;
  c-name: "gsl_vector_max_index";
end;

// https://www.gnu.org/software/gsl/doc/html/vectors.html#c.gsl_vector_min_index

define c-function gsl-vector-min-index
  input parameter v :: <gsl-vector*>;
  result value :: <c-size-t>;
  c-name: "gsl_vector_min_index";
end;

// https://www.gnu.org/software/gsl/doc/html/vectors.html#c.gsl_vector_minmax_index

define c-function gsl-vector-minmax-index
  input parameter v :: <gsl-vector*>;
  output parameter min-index :: <c-size-t*>;
  output parameter max-index :: <c-size-t*>;
  c-name: "gsl_vector_minmax_index";
end;

// Vector properties

// https://www.gnu.org/software/gsl/doc/html/vectors.html#c.gsl_vector_equal

define c-function gsl-vector-equal
  input parameter a :: <gsl-vector*>;
  input parameter b :: <gsl-vector*>;
  result value :: <c-int>;
  c-name: "gsl_vector_equal";
end;

// https://www.gnu.org/software/gsl/doc/html/vectors.html#c.gsl_vector_isnull

define c-function gsl-vector-isnull
  input parameter v :: <gsl-vector*>;
  result value :: <c-int>;
  c-name: "gsl_vector_isnull";
end;

// https://www.gnu.org/software/gsl/doc/html/vectors.html#c.gsl_vector_ispos

define c-function gsl-vector-ispos
  input parameter v :: <gsl-vector*>;
  result value :: <c-int>;
  c-name: "gsl_vector_ispos";
end;

// https://www.gnu.org/software/gsl/doc/html/vectors.html#c.gsl_vector_isneg

define c-function gsl-vector-isneg
  input parameter v :: <gsl-vector*>;
  result value :: <c-int>;
  c-name: "gsl_vector_isneg";
end;

// https://www.gnu.org/software/gsl/doc/html/vectors.html#c.gsl_vector_isnonneg

define c-function gsl-vector-isnonneg
  input parameter v :: <gsl-vector*>;
  result value :: <c-int>;
  c-name: "gsl_vector_isnonneg";
end;
