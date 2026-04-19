Module: dylan-user
Synopsis: Module for error handling in dylan-gsl
Author: Fernando Raya
Copyright: Copyright (C) 2026, Dylan Hackers. All rights reserved.
License: See License.txt in this distribution for details.

define module gsl-error

  use gsl-ffi-error,
    export: { $gsl-success };

  create
    <gsl-error>,
    gsl-error-code,
    gsl-error-filename,
    gsl-error-line,
    gsl-error-reason,
    gsl-error-message,
    gsl-error-details;

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

  create
    *gsl-error-handler*,
    with-gsl-error-handler;

end module gsl-error;

define module gsl-error-impl

  use common-dylan;
  use c-ffi;
  use format,
    import: { format-to-string };
  use gsl-ffi-error;

  use gsl-error;

end module gsl-error-impl;

define module gsl-common

  use gsl-error,
    export: { $gsl-success,
              <gsl-error> };

  create
    <double-float?>,
    <vector-double-float>,
    <vector-double-float?>,
    vector-double-float,
    <numeric-sequence>;

  create
    with-c-double-array,
    with-gsl-check-success;

end module gsl-common;

define module gsl-common-impl

  use common-dylan;
  use c-ffi;
  use gsl-common;

end module gsl-common-impl;

define module gsl-math

  use gsl-ffi-math,
    export: all;


  // double float comparison

  create
    $default-epsilon,
    *epsilon*,
    f=,
    nan?;

  // Infinity numbers

  create
    infinity?,
    positive-infinity?,
    negative-infinity?;

end module gsl-math;

define module gsl-math-impl
  use common-dylan;
  use c-ffi;
  use gsl-ffi-math;

  use gsl-math;
end module gsl-math-impl;

define module gsl-complex

  use gsl-ffi-complex,
    rename: { <gsl-complex*> => <gsl-complex> },
    export: all;

end module gsl-complex;

define module gsl-complex-impl

  use common-dylan;
  use c-ffi;
  use gsl-ffi-complex;
  use gsl-complex;
  
end module gsl-complex-impl;

define module gsl-vector

   create 
     <gsl-vector>,
     gsl-vector,
     gsl-vector-copy,
     gsl-vector-stride,
     gsl-vector-stride-setter;

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

end module gsl-vector;

define module gsl-vector-impl
  use common-dylan;
  use c-ffi;
  use gsl-common,
    import: { with-gsl-check-success };
  use gsl-math,
    import: { *epsilon*,
              f= };
  use gsl-ffi-vector,
    prefix: "ffi/";

  use gsl-vector;
  export
    %gsl-vector,
    %gsl-vector-data,
    %gsl-vector-data-setter;
end module gsl-vector-impl;

define module gsl-statistics

  create
    mean,
    variance,
    standard-deviation,
    tss,
    absdev,
    skew,
    kurtosis,
    lag1-autocorrelation,
    covariance,
    maximum,
    minimum,
    minimum-maximum,
    max-index,
    min-index,
    minmax-index,
    correlation,
    spearman,
    wmean,
    wvariance,
    wsd,
    wtss,
    wabs-dev,
    wskew,
    wkurtosis,
    median,
    quantile-from-sorted-data,
    kth-order-statistic,
    trimmed-mean,
    gastwirth-estimator,
    mad,
    mad0,
    sn0,
    sn,
    qn0,
    qn;

end module gsl-statistics;

define module gsl-statistics-impl

  use common-dylan;
  use c-ffi;

  use gsl-common,
    import: { <double-float?>,
              <vector-double-float>,
              with-c-double-array };

  use gsl-vector,
    import: { <gsl-vector>,
              gsl-vector-stride },
    rename: { min-index => vector-min-index,
              max-index => vector-max-index, 
              minmax-index => vector-minmax-index };
  use gsl-vector-impl,
    import: { %gsl-vector,
              %gsl-vector-data,
              %gsl-vector-data-setter };

  use gsl-ffi-statistics;
  use gsl-statistics;

end module;

define module gsl-running-statistics

  create
    <rstat>;

  create
    rstat-add!;

  create
    rstat-reset!;

  create
    rstat-min,
    rstat-max,
    rstat-mean,
    rstat-variance,
    rstat-sd,
    rstat-sd-mean,
    rstat-rms,
    rstat-skew,
    rstat-kurtosis,
    rstat-median;
    // rstat-norm;

  create
    <quantile-rstat>,
    quantile-rstat-p;

  create
    quantile-rstat-add!,
    quantile-rstat-reset!,
    quantile-rstat-get;

end module gsl-running-statistics;

define module gsl-running-statistics-impl

  use common-dylan;
  use c-ffi;
  use gsl-common;

  use gsl-ffi-running-statistics,
    prefix: "ffi/";
  use gsl-running-statistics;

end module gsl-running-statistics-impl;
