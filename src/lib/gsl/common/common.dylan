Module: gsl-common-impl
Synopsis: Implementation of the common support functions, macros and constants.
Author: Fernando Raya
Copyright: Copyright (C) 2026, Dylan Hackers. All rights reserved.
License: See LICENSE in this distribution for details.

define constant <double-float?>
  = false-or(<double-float>);

define constant <vector-double-float>
  = limited(<vector>, of: <double-float>);

define constant <vector-double-float?>
  = limited(<vector>, of: <double-float?>);

define constant <numeric-sequence>
  = type-union(<vector-double-float>, <vector-double-float?>);

define inline function vector-double-float
    (seq :: <sequence>)
 => (vec :: <vector-double-float>)
  as(<vector-double-float>, seq)
end;

// Pass a Dylan vector to a C function as a C array.

define macro with-c-double-array
  { with-c-double-array (?c-data:name = ?data:variable) ?body:body end }
    => { let n :: <integer> = ?data.size;
         with-stack-structure (temp-c-data :: <c-double*>, element-count: n) 
           for (i from 0 below n) 
             temp-c-data[i] := ?data[i]
           end;
           let ?c-data :: <c-double*> = temp-c-data;
           ?body
         end }
end macro;
