Module: dylan-user
Synopsis: Module for error handling in dylan-gsl
Author: Fernando Raya
Copyright: Copyright (C) 2026, Dylan Hackers. All rights reserved.
License: See License.txt in this distribution for details.

define module gsl-error

  create
    <gsl-error>,
    gsl-error-code,
    gsl-error-filename,
    gsl-error-line,
    gsl-error-reason,
    gsl-error-details,
    gsl-error-message;

  create
    <gsl-error-failure>,
    <gsl-error-continue>,
    <gsl-error-domain>,
    <gsl-error-range>,
    <gsl-error-fault>,
    <gsl-error-invalid-argument>,
    <gsl-error-failed>,
    <gsl-error-factorization-failed>,
    <gsl-error-sanity-check-failed>,
    <gsl-error-no-memory>,
    <gsl-error-bad-function>,
    <gsl-error-runaway>,
    <gsl-error-max-iterations>,
    <gsl-error-zero-division>,
    <gsl-error-bad-tolerance>,
    <gsl-error-tolerance>,
    <gsl-error-underflow>,
    <gsl-error-overflow>,
    <gsl-error-loss-of-accuracy>,
    <gsl-error-roundoff>,
    <gsl-error-bad-length>,
    <gsl-error-not-square>,
    <gsl-error-singularity>,
    <gsl-error-divergence>,
    <gsl-error-unsupported>,
    <gsl-error-unimplemented>,
    <gsl-error-cache-limit-exceeded>,
    <gsl-error-table-limit-exceeded>,
    <gsl-error-no-progress>,
    <gsl-error-no-progress-jacobian>,
    <gsl-error-tolerance-f>,
    <gsl-error-tolerance-x>,
    <gsl-error-tolerance-gradient>,
    <gsl-error-end-of-file>;

  create
    with-gsl-error-handler;

end module;

define module gsl-error-impl
  use common-dylan;
  use c-ffi;
  use format;
  use uncommon-utils;
  use gsl-ffi-error;
  use gsl-error;
end module;

define module gsl-common
  create
    <double-float?>,
    <vector-double-float>,
    <vector-double-float?>,
    vector-double-float,
    <numeric-sequence>;

  create
    with-c-double-array;
end module;

define module gsl-common-impl
  use common-dylan;
  use c-ffi;
  use gsl-common;
end module;

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
end module;

define module gsl-math-impl
  use common-dylan;
  use c-ffi;
  use gsl-ffi-math;
  use gsl-math;
end module;

define module gsl-complex
  create
    <gsl-complex>,
    gsl-complex-real,
    gsl-complex-imag;

  // Assigning complex numbers

  create
    gsl-complex,
    gsl-complex-polar;

  // Properties of complex numbers

  create
    gsl-complex-arg,
    gsl-complex-abs,
    gsl-complex-abs2,
    gsl-complex-logabs;

  // Complex arithmetic operators

  create
    gsl-complex-add-imag,
    gsl-complex-sub-imag,
    gsl-complex-mul-imag,
    gsl-complex-div-imag,
    gsl-complex-conjugate,
    gsl-complex-inverse;

  // Elementary Complex Functions

  create
    gsl-complex-sqrt,
    gsl-complex-sqrt-real,
    gsl-complex-pow,
    gsl-complex-pow-real,
    gsl-complex-exp,
    gsl-complex-log,
    gsl-complex-log10,
    gsl-complex-log-b;

   // Complex trigonometric functions

  create
    gsl-complex-sin,
    gsl-complex-cos,
    gsl-complex-tan,
    gsl-complex-sec,
    gsl-complex-csc,
    gsl-complex-cot;

  // Inverse complex trigonometric functions

  create
    gsl-complex-arcsin,
    gsl-complex-arcsin-real,
    gsl-complex-arccos,
    gsl-complex-arccos-real,
    gsl-complex-arctan,
    gsl-complex-arcsec,
    gsl-complex-arcsec-real,
    gsl-complex-arccsc,
    gsl-complex-arccsc-real,
    gsl-complex-arccot;

  // Complex hyperbolic functions

  create
    gsl-complex-sinh,
    gsl-complex-cosh,
    gsl-complex-tanh,
    gsl-complex-sech,
    gsl-complex-csch,
    gsl-complex-coth;

  // Inverse complex hyperbolic functions

  create
    gsl-complex-arcsinh,
    gsl-complex-arccosh,
    gsl-complex-arccosh-real,
    gsl-complex-arctanh,
    gsl-complex-arctanh-real,
    gsl-complex-arcsech,
    gsl-complex-arccsch,
    gsl-complex-arccoth;
end module;

define module gsl-complex-impl
  use common-dylan;
  use c-ffi;
  use finalization;
  use gsl-ffi-complex,
    prefix: "ffi/";
  use gsl-complex;
end module;

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
    swap!,
    gsl-vector-memcpy;

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
  use c-ffi;
  use finalization;
  use gsl-math,
    import: { *epsilon*, f= };
  use gsl-ffi-vector,
    prefix: "ffi/";
  use gsl-vector;

  export
    %gsl-vector,
    %gsl-vector-data,
    %gsl-vector-data-setter;
end module;

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
end module;

define module gsl-statistics-impl
  use common-dylan;
  use c-ffi;
  use gsl-common,
    import: { <double-float?>, <vector-double-float>, with-c-double-array };
  use gsl-vector,
    import: { <gsl-vector>, gsl-vector-stride },
    rename: { min-index => vector-min-index,
              max-index => vector-max-index,
              minmax-index => vector-minmax-index };
  use gsl-vector-impl,
    import: { %gsl-vector, %gsl-vector-data, %gsl-vector-data-setter };
  use gsl-ffi-statistics;
  use gsl-statistics;
end module;

define module gsl-running-statistics
  create
    <rstat>,
    rstat-add!,
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
end module;

define module gsl-running-statistics-impl
  use common-dylan;
  use c-ffi;
  use gsl-common;
  use gsl-ffi-running-statistics,
    prefix: "ffi/";
  use gsl-running-statistics;
end module;

define module gsl-rng
  create
    gsl-rng-env-setup;

  create
    <gsl-rng>,
    gsl-rng-seed,
    gsl-rng-name,
    gsl-rng-min,
    gsl-rng-max;

  create
    gsl-rng-get,
    gsl-rng-uniform,
    gsl-rng-uniform-int,
    gsl-rng-uniform-positive;

  create
    $gsl-rng-borosh13,
    $gsl-rng-coveyou,
    $gsl-rng-cmrg,
    $gsl-rng-fishman18,
    $gsl-rng-fishman20,
    $gsl-rng-fishman2x,
    $gsl-rng-gfsr4,
    $gsl-rng-knuthran,
    $gsl-rng-knuthran2,
    $gsl-rng-knuthran2002,
    $gsl-rng-lecuyer21,
    $gsl-rng-minstd,
    $gsl-rng-mrg,
    $gsl-rng-mt19937,
    $gsl-rng-mt19937-1999,
    $gsl-rng-mt19937-1998,
    $gsl-rng-r250,
    $gsl-rng-ran0,
    $gsl-rng-ran1,
    $gsl-rng-ran2,
    $gsl-rng-ran3,
    $gsl-rng-rand,
    $gsl-rng-rand48,
    $gsl-rng-random128-bsd,
    $gsl-rng-random128-glibc2,
    $gsl-rng-random128-libc5,
    $gsl-rng-random256-bsd,
    $gsl-rng-random256-glibc2,
    $gsl-rng-random256-libc5,
    $gsl-rng-random32-bsd,
    $gsl-rng-random32-glibc2,
    $gsl-rng-random32-libc5,
    $gsl-rng-random64-bsd,
    $gsl-rng-random64-glibc2,
    $gsl-rng-random64-libc5,
    $gsl-rng-random8-bsd,
    $gsl-rng-random8-glibc2,
    $gsl-rng-random8-libc5,
    $gsl-rng-random-bsd,
    $gsl-rng-random-glibc2,
    $gsl-rng-random-libc5,
    $gsl-rng-randu,
    $gsl-rng-ranf,
    $gsl-rng-ranlux,
    $gsl-rng-ranlux389,
    $gsl-rng-ranlxd1,
    $gsl-rng-ranlxd2,
    $gsl-rng-ranlxs0,
    $gsl-rng-ranlxs1,
    $gsl-rng-ranlxs2,
    $gsl-rng-ranmar,
    $gsl-rng-slatec,
    $gsl-rng-taus,
    $gsl-rng-taus2,
    $gsl-rng-taus113,
    $gsl-rng-transputer,
    $gsl-rng-tt800,
    $gsl-rng-uni,
    $gsl-rng-uni32,
    $gsl-rng-vax,
    $gsl-rng-waterman14,
    $gsl-rng-zuf;
end module;

define module gsl-rng-impl
  use common-dylan;
  use format-out;
  use finalization;
  use print;
  use uncommon-utils;
  use gsl-ffi-rng,
    prefix: "ffi/";
  use gsl-rng;

  export
    gsl-rng-ffi;
end module;

define module gsl-randist
  create
    <gsl-randist>,
    gsl-randist-variate,
    gsl-randist-pdf,
    gsl-randist-cdf-p,
    gsl-randist-cdf-q,
    gsl-randist-cdf-pinv,
    gsl-randist-cdf-qinv;


  create
    <gsl-gaussian-algorithm>,
    <gsl-randist-gaussian>,
    gsl-randist-gaussian-sigma,
    <gsl-randist-ugaussian>,
    <gsl-randist-gaussian-tail>,
    <gsl-randist-ugaussian-tail>,
    <gsl-randist-exponential>,
    <gsl-randist-laplace>,
    <gsl-randist-exppow>,
    <gsl-randist-cauchy>,
    <gsl-randist-rayleigh>,
    <gsl-randist-rayleigh-tail>,
    <gsl-gamma-algorithm>,
    <gsl-randist-landau>,
    <gsl-randist-gamma>,
    <gsl-randist-flat>;

end module;

define module gsl-randist-impl
  use common-dylan;
  use uncommon-utils;
  use print;
  use format;
  use gsl-error;
  use gsl-rng;
  use gsl-rng-impl,
    import: { gsl-rng-ffi };
  use gsl-ffi-randist,
    prefix: "ffi/";
  use gsl-randist;
end module;
