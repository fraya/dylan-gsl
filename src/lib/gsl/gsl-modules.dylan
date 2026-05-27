Module: dylan-user
Synopsis: Module for error handling in dylan-gsl
Author: Fernando Raya
Copyright: Copyright (C) 2026, Dylan Hackers. All rights reserved.
License: See License.txt in this distribution for details.

define module gsl-error

  use gsl-ffi-error,
    export: all;

end module gsl-error;

define module gsl-error-impl

  use common-dylan;
  use gsl-ffi-error;
  use gsl-error;

end module gsl-error-impl;

define module gsl-common

  create
    <double-float?>,
    <vector-double-float>,
    <vector-double-float?>,
    vector-double-float,
    <numeric-sequence>;

  create
    with-c-double-array;

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

end module gsl-complex;

define module gsl-complex-impl

  use common-dylan;
  use c-ffi;
  use finalization;
  use gsl-ffi-complex,
    prefix: "ffi/";
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

end module gsl-vector;

define module gsl-vector-impl
  use common-dylan;
  use c-ffi;
  use finalization;
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
  use finalization;
  use gsl-ffi-rng,
    prefix: "ffi/";
  use uncommon-utils;
  use gsl-rng;
end module gsl-rng-impl;
