Module: gsl-ffi-block-impl 
Synopsis: Block
Author: Fernando Raya
Copyright: Copyright (C) 2026, Dylan Hackers. All rights reserved.
License: See LICENSE in this distribution for details.
Reference: https://www.gnu.org/software/gsl/doc/html/vector_matrix.html

define c-struct <gsl-block>
  slot gsl-block-size :: <c-size-t>;
  slot gsl-block-data :: <c-double*>;
  pointer-type-name: <gsl-block*>;
end c-struct;

// https://www.gnu.org/software/gsl/doc/html/vectors.html#c.gsl_block_alloc

define c-function gsl-block-alloc
  input parameter n :: <c-size-t>;
  result new-block :: <gsl-block*>;
  c-name: "gsl_block_alloc";
end;

// https://www.gnu.org/software/gsl/doc/html/vectors.html#c.gsl_block_calloc

define c-function gsl-block-calloc
  input parameter n :: <c-size-t>;
  result new-block :: <gsl-block*>;
  c-name: "gsl_block_calloc";
end;

// https://www.gnu.org/software/gsl/doc/html/vectors.html#c.gsl_block_free

define c-function gsl-block-free
  input parameter the-block :: <gsl-block*>;
  c-name: "gsl_block_free";
end;

// TODO: Reading and writing from block
