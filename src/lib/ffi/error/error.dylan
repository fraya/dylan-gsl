Module: gsl-ffi-error-impl
Synopsis: Module for error handling in GSL
Author: Fernando Raya
Copyright: Copyright (C) 2026, Dylan Hackers. All rights reserved.
License: See LICENSE in this distribution for details.

define enum gsl-error-codes ()
  $gsl-failure  = -1;
  $gsl-continue;   /* iteration has not converged */
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
