Module: gsl-error-impl
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

define abstract class <gsl-error> (<error>)
  constant slot gsl-error-code :: <integer>,
    required-init-keyword: code:;
  constant slot gsl-error-filename :: false-or(<string>) = #f,
    required-init-keyword: filename:;
  constant slot gsl-error-line :: false-or(<integer>) = #f,
    required-init-keyword: line:;
  constant slot gsl-error-reason :: false-or(<string>) = #f,
    required-init-keyword: reason:,
end;

define generic gsl-error-message
  (err :: <gsl-error>) => (message :: <string>);

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


define class <gsl-error-failure> (<gsl-error>)
  inherited slot gsl-error-code = $gsl-failure;
end;

define class <gsl-error-continue> (<gsl-error>)
  inherited slot gsl-error-code = $gsl-continue;
end;

define class <gsl-error-domain> (<gsl-error>)
  inherited slot gsl-error-code = $gsl-edom;
end;

define class <gsl-error-range> (<gsl-error>)
  inherited slot gsl-error-code = $gsl-erange;
end;

define class <gsl-error-fault> (<gsl-error>)
  inherited slot gsl-error-code = $gsl-efault;
end;

define class <gsl-error-invalid-argument> (<gsl-error>)
  inherited slot gsl-error-code = $gsl-einval;
end;

define class <gsl-error-failed> (<gsl-error>)
  inherited slot gsl-error-code = $gsl-efailed;
end;

define class <gsl-error-factorization-failed> (<gsl-error>)
  inherited slot gsl-error-code = $gsl-efactor;
end;

define class <gsl-error-sanity-check-failed> (<gsl-error>)
  inherited slot gsl-error-code = $gsl-esanity;
end;

define class <gsl-error-no-memory> (<gsl-error>)
  inherited slot gsl-error-code = $gsl-enomem;
end;

define class <gsl-error-bad-function> (<gsl-error>)
  inherited slot gsl-error-code = $gsl-ebadfunc;
end;

define class <gsl-error-runaway> (<gsl-error>)
  inherited slot gsl-error-code = $gsl-erunaway;
end;

define class <gsl-error-max-iterations> (<gsl-error>)
  inherited slot gsl-error-code = $gsl-emaxiter;
end;

define class <gsl-error-zero-division> (<gsl-error>)
  inherited slot gsl-error-code = $gsl-ezero;
end;

define class <gsl-error-bad-tolerance> (<gsl-error>)
  inherited slot gsl-error-code = $gsl-ebadtol;
end;

define class <gsl-error-tolerance> (<gsl-error>)
  inherited slot gsl-error-code = $gsl-etol;
end;

define class <gsl-error-underflow> (<gsl-error>)
  inherited slot gsl-error-code = $gsl-eunderflow;
end;

define class <gsl-error-overflow> (<gsl-error>)
  inherited slot gsl-error-code = $gsl-ovrflw;
end;

define class <gsl-error-loss-of-accuracy> (<gsl-error>)
  inherited slot gsl-error-code = $gsl-eloss;
end;

define class <gsl-error-roundoff> (<gsl-error>)
  inherited slot gsl-error-code = $gsl-eround;
end;

define class <gsl-error-bad-length> (<gsl-error>)
  inherited slot gsl-error-code = $gsl-ebadlen;
end;

define class <gsl-error-not-square> (<gsl-error>)
  inherited slot gsl-error-code = $gsl-enotsq;
end;

define class <gsl-error-singularity> (<gsl-error>)
  inherited slot gsl-error-code = $gsl-esing;
end;

define class <gsl-error-divergence> (<gsl-error>)
  inherited slot gsl-error-code = $gsl-ediv;
end;

define class <gsl-error-unsupported> (<gsl-error>)
  inherited slot gsl-error-code = $gsl-eunsupp;
end;

define class <gsl-error-unimplemented> (<gsl-error>)
  inherited slot gsl-error-code = $gsl-eunimpl;
end;

define class <gsl-error-cache-limit-exceeded> (<gsl-error>)
  inherited slot gsl-error-code = $gsl-ecache;
end;

define class <gsl-error-table-limit-exceeded> (<gsl-error>)
  inherited slot gsl-error-code = $gsl-etable;
end;

define class <gsl-error-no-progress> (<gsl-error>)
  inherited slot gsl-error-code = $gsl-enoprog;
end;

define class <gsl-error-no-progress-jacobian> (<gsl-error>)
  inherited slot gsl-error-code = $gsl-enoprogjac;
end;

define class <gsl-error-tolerance-f> (<gsl-error>)
  inherited slot gsl-error-code = $gsl-etolf;
end;

define class <gsl-error-tolerance-x> (<gsl-error>)
  inherited slot gsl-error-code = $gsl-etolx;
end;

define class <gsl-error-tolerance-gradient> (<gsl-error>)
  inherited slot gsl-error-code = $gsl-etolg;
end;

define class <gsl-error-end-of-file> (<gsl-error>)
  inherited slot gsl-error-code = $gsl-eof;
end;

//
// This abstract class is instantiable so when the FFI GSL library
// raises an error we can trapped it with a handler and create the
// <gsl-error> subclass with the code error.
//

define method make
    (class == <gsl-error>, #rest all-keys, #key code :: <integer>) 
 => (error :: <gsl-error>)
  let type = select (code)
    $gsl-failure      => <gsl-error-failure>;
    $gsl-continue     => <gsl-error-continue>;
    $gsl-edom         => <gsl-error-domain>;
    $gsl-erange       => <gsl-error-range>;
    $gsl-efault       => <gsl-error-fault>;
    $gsl-einval       => <gsl-error-invalid-argument>;
    $gsl-efailed      => <gsl-error-failed>;
    $gsl-efactor      => <gsl-error-factorization-failed>;
    $gsl-esanity      => <gsl-error-sanity-check-failed>;
    $gsl-enomem       => <gsl-error-no-memory>;
    $gsl-ebadfunc     => <gsl-error-bad-function>;
    $gsl-erunaway     => <gsl-error-runaway>;
    $gsl-emaxiter     => <gsl-error-max-iterations>;
    $gsl-ezero        => <gsl-error-zero-division>;
    $gsl-ebadtol      => <gsl-error-bad-tolerance>;
    $gsl-etol         => <gsl-error-tolerance>;
    $gsl-eunderflow   => <gsl-error-underflow>;
    $gsl-ovrflw       => <gsl-error-overflow>;
    $gsl-eloss        => <gsl-error-loss-of-accuracy>;
    $gsl-eround       => <gsl-error-roundoff>;
    $gsl-ebadlen      => <gsl-error-bad-length>;
    $gsl-enotsq       => <gsl-error-not-square>;
    $gsl-esing        => <gsl-error-singularity>;
    $gsl-ediv         => <gsl-error-divergence>;
    $gsl-eunsupp      => <gsl-error-unsupported>;
    $gsl-eunimpl      => <gsl-error-unimplemented>;
    $gsl-ecache       => <gsl-error-cache-limit-exceeded>;
    $gsl-etable       => <gsl-error-table-limit-exceeded>;
    $gsl-enoprog      => <gsl-error-no-progress>;
    $gsl-enoprogjac   => <gsl-error-no-progress-jacobian>;
    $gsl-etolf        => <gsl-error-tolerance-f>;
    $gsl-etolx        => <gsl-error-tolerance-x>;
    $gsl-etolg        => <gsl-error-tolerance-gradient>;
    $gsl-eof          => <gsl-error-end-of-file>;
    otherwise         => error("Unknown GSL error code: %d", code);
  end select;
  apply(make, type, all-keys)
end;

define function default-gsl-error-handler
    (reason   :: <string>,
     filename :: <string>,
     line     :: <integer>,
     errno    :: <integer>)
 => ()
  error(make(<gsl-error>,
             code: errno,
             filename: filename,
             line: line,
             reason: reason))
end;

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

*gsl-error-handler* := default-gsl-error-handler;

