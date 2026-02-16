Module: dylan-user
Synopsis: Module for blocks dylan-gsl
Author: Fernando Raya
Copyright: Copyright (C) 2026, Dylan Hackers. All rights reserved.
License: See LICENSE in this distribution for details.
Reference: https://www.gnu.org/software/gsl/doc/html/vector_matrix.html

define module gsl-ffi-block

  create
    <gsl-block>,
    <gsl-block*>,
    gsl-block-size,
    gsl-block-size-setter,
    gsl-block-data,
    gsl-block-data-setter;
  
  create
    gsl-block-alloc,
    gsl-block-calloc,
    gsl-block-free;

end module;

define module gsl-ffi-block-impl

  use common-dylan;
  use c-ffi;

  use gsl-ffi-block;

end module;