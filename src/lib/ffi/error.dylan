Module: gsl-ffi-error-impl
Synopsis: Module for error handling in GSL
Author: Fernando Raya
Copyright: Copyright (C) 2026, Dylan Hackers. All rights reserved.
License: See LICENSE in this distribution for details.

define c-function gsl-strerror
  parameter status :: <c-int>;
  result message :: <c-string>;
  c-name: "gsl_strerror";
end;

define c-function gsl-set-error-handler
  parameter new-handler :: <c-void*>;
  result previous-handler :: <c-void*>;
  c-name: "gsl_set_error_handler";
end;

define c-function gsl-set-error-handler-off
  result previous-handler :: <c-void*>;
  c-name: "gsl_set_error_handler_off";
end;

define variable *gsl-error-handler* :: <function>
  = identity;

define function gsl-error-handler-callback
    (reason :: <string>, filename :: <string>, line :: <integer>, errno :: <integer>)
 => ()
  *gsl-error-handler*(reason, filename, line, errno)
end;

define c-callable-wrapper $gsl-error-handler of gsl-error-handler-callback
  parameter reason   :: <c-string>;
  parameter filename :: <c-string>;
  parameter line     :: <c-int>;
  parameter errno    :: <c-int>;
end c-callable-wrapper;

gsl-set-error-handler($gsl-error-handler);
