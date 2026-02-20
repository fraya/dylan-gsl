Module: dylan-user
Synopsis: Module for vector in dylan-gsl
Author: Fernando Raya
Copyright: Copyright (C) 2026, Dylan Hackers. All rights reserved.
License: See LICENSE in this distribution for details.

define module gsl-vector

   create 
     <gsl-vector>,
     gsl-vector-copy;

   create
     set-all!,
     set-zero!,
     set-basis!,
     swap!;

   create
     sum,
     axpby,
     axpby!,
     gsl-max,
     gsl-min,
     max-index,
     min-index,
     min-max,
     min-max-index;

  create
    null?,
    non-negative?;

end module;

define module gsl-vector-impl
   use common-dylan;
   use gsl-math,
     import: { *epsilon*,
               f= };
   use gsl-ffi-vector,
     prefix: "ffi/";

   use gsl-vector;
end module;