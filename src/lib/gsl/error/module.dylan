Module: dylan-user
Synopsis: Module for error handling in dylan-gsl
Author: Fernando Raya
Copyright: Copyright (C) 2026, Dylan Hackers. All rights reserved.
License: See License.txt in this distribution for details.

define module gsl-error

  create
    <gsl-error>,
    gsl-error-code,
    gsl-error-message;

  create
    <gsl-failure>,
    <gsl-continue>,
    <gsl-domain-error>,
    <gsl-range-error>,
    <gsl-fault>,
    <gsl-invalid-argument>,
    <gsl-failed>,
    <gsl-factorization-failed>,
    <gsl-sanity-check-failed>,
    <gsl-no-memory>,
    <gsl-bad-function>,
    <gsl-runaway>,
    <gsl-max-iterations>,
    <gsl-zero-division>,
    <gsl-bad-tolerance>,
    <gsl-tolerance>,
    <gsl-underflow>,
    <gsl-overflow>,
    <gsl-loss-of-accuracy>,
    <gsl-roundoff-error>,
    <gsl-bad-length>,
    <gsl-not-square>,
    <gsl-singularity>,
    <gsl-divergence>,
    <gsl-unsupported>,
    <gsl-unimplemented>,
    <gsl-cache-limit-exceeded>,
    <gsl-table-limit-exceeded>,
    <gsl-no-progress>,
    <gsl-no-progress-jacobian>,
    <gsl-tolerance-f>,
    <gsl-tolerance-x>,
    <gsl-tolerance-gradient>,
    <gsl-end-of-file>;

end module;

define module gsl-error-impl

  use common-dylan;
  use c-ffi;
  use gsl-ffi-error;

  use gsl-error;

end module;