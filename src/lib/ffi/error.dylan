Module: gsl-ffi-error-impl
Synopsis: Module for error handling in GSL
Author: Fernando Raya
Copyright: Copyright (C) 2026, Dylan Hackers. All rights reserved.
License: See LICENSE in this distribution for details.

// GSL constant error codes

define enum gsl-error-codes ()
  $gsl-continue = -2;   /* iteration has not converged */
  $gsl-failure;
  $gsl-success;
  $gsl-edom;       /* input domain error, e.g sqrt(-1) */
  $gsl-erange;     /* output range error, e.g. exp(1e100) */
  $gsl-efault;     /* invalid pointer */
  $gsl-einval;     /* invalid argument supplied by user */
  $gsl-efailed;    /* generic failure */
  $gsl-efactor;    /* factorization failed */
  $gsl-esanity;    /* sanity check failed - shouldn't happen */
  $gsl-enomem;     /* malloc failed */
  $gsl-ebadfunc;   /* problem with user-supplied function */
  $gsl-erunaway;   /* iterative process is out of control */
  $gsl-emaxiter;   /* exceeded max number of iterations */
  $gsl-ezero;      /* tried to divide by zero */
  $gsl-ebadtol;    /* user specified an invalid tolerance */
  $gsl-etol;       /* failed to reach the specified tolerance */
  $gsl-eunderflow; /* underflow */
  $gsl-ovrflw;     /* overflow  */
  $gsl-eloss;      /* loss of accuracy */
  $gsl-eround;     /* failed because of roundoff error */
  $gsl-ebadlen;    /* matrix, vector lengths are not conformant */
  $gsl-enotsq;     /* matrix not square */
  $gsl-esing;      /* apparent singularity detected */
  $gsl-ediv;       /* integral or series is divergent */
  $gsl-eunsupp;    /* requested feature is not supported by the hardware */
  $gsl-eunimpl;    /* requested feature not (yet) implemented */
  $gsl-ecache;     /* cache limit exceeded */
  $gsl-etable;     /* table limit exceeded */
  $gsl-enoprog;    /* iteration is not making progress towards solution */
  $gsl-enoprogjac; /* jacobian evaluations are not improving the solution */
  $gsl-etolf;      /* cannot reach the specified tolerance in F */
  $gsl-etolx;      /* cannot reach the specified tolerance in X */
  $gsl-etolg;      /* cannot reach the specified tolerance in gradient */
  $gsl-eof;        /* end of file */
end enum;

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

define class <gsl-error> (<error>)
  constant slot gsl-error-code :: <integer>,
    required-init-keyword: code:;
  constant slot gsl-error-filename :: <string>,
    required-init-keyword: filename:;
  constant slot gsl-error-line :: <integer>,
    required-init-keyword: line:;
  constant slot gsl-error-reason :: <string>,
    required-init-keyword: reason:,
end;

define method gsl-error-message
  (err :: <gsl-error>) => (message :: <string>)
  gsl-strerror(err.gsl-error-code)
end;

define method gsl-error-details
    (err :: <gsl-error>) => (details :: <string>)
  format-to-string("gsl: %s:%d: %s",
                   err.gsl-error-filename,
                   err.gsl-error-line,
                   err.gsl-error-reason)
end;

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

define function default-gsl-error-handler
    (reason :: <string>, filename :: <string>, line :: <integer>, errno :: <integer>)
 => ()
  error(make(<gsl-error>, code: errno, filename: filename, line: line, reason: reason))
end;

define variable *gsl-error-handler* :: <function>
  = default-gsl-error-handler;

define macro with-gsl-error-handler
  { with-gsl-error-handler (?error-handler:expression) ?body:body end }
    => { let previous-handler :: false-or(<object>) = #f;
         block ()
           previous-handler := gsl-set-error-handler(?error-handler);
           ?body
         cleanup
           if (previous-handler)
             gsl-set-error-handler(previous-handler);
           end;
         end; }
end macro;

gsl-set-error-handler($gsl-error-handler);
