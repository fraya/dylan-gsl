Module: dylan-user
Synopsis: FFI bindings dylan-gsl
Author: Fernando Raya
Copyright: Copyright (C) 2026, Dylan Hackers. All rights reserved.
License: See License.txt in this distribution for details.

///////////////////////////////////////////////////////////////////////////////
//
// Module Error
// https://www.gnu.org/software/gsl/doc/html/err.html
//
///////////////////////////////////////////////////////////////////////////////

define module gsl-ffi-error

  create
    $gsl-failure,
    $gsl-continue,
    $gsl-success,
    $gsl-edom,
    $gsl-erange,
    $gsl-efault,
    $gsl-einval,
    $gsl-efailed,
    $gsl-efactor,
    $gsl-esanity,
    $gsl-enomem,
    $gsl-ebadfunc,
    $gsl-erunaway,
    $gsl-emaxiter,
    $gsl-ezero,
    $gsl-ebadtol,
    $gsl-etol,
    $gsl-eunderflow,
    $gsl-ovrflw,
    $gsl-eloss,
    $gsl-eround,
    $gsl-ebadlen,
    $gsl-enotsq,
    $gsl-esing,
    $gsl-ediv,
    $gsl-eunsupp,
    $gsl-eunimpl,
    $gsl-ecache,
    $gsl-etable,
    $gsl-enoprog,
    $gsl-enoprogjac,
    $gsl-etolf,
    $gsl-etolx,
    $gsl-etolg,
    $gsl-eof;

  create
    gsl-strerror,
    gsl-error-message;

  create
    gsl-set-error-handler,
    gsl-set-error-handler-off;

  create
    <gsl-error>,
    gsl-error-code,
    gsl-error-filename,
    gsl-error-line,
    gsl-error-reason,
    gsl-error-details;

  create
    *gsl-error-handler*,
    with-gsl-error-handler;

end module gsl-ffi-error;

define module gsl-ffi-error-impl

  use common-dylan;
  use c-ffi;
  use format,
    import: { format-to-string };
  use uncommon-utils,
    import: { enum-definer };

  use gsl-ffi-error;

end module gsl-ffi-error-impl;

///////////////////////////////////////////////////////////////////////////////
//
// Module Math
// https://www.gnu.org/software/gsl/doc/html/math.html
//
///////////////////////////////////////////////////////////////////////////////

define module gsl-ffi-math

  create
    $gsl-e,
    $gsl-log2e,
    $gsl-log10e,
    $gsl-sqrt2,
    $gsl-sqrt1/2,
    $gsl-sqrt3,
    $gsl-sqrt1/3,
    $gsl-pi,
    $gsl-pi/2,
    $gsl-pi/4;

  create
    gsl-fcmp,
    gsl-isnan,
    gsl-isinf;

  // Elementary functions
  create
    gsl-log1p,
    gsl-expm1,
    gsl-hypot,
    gsl-hypot3,
    gsl-acosh,
    gsl-asinh,
    gsl-atanh,
    gsl-ldexp,
    gsl-frexp;

end module gsl-ffi-math;

define module gsl-ffi-math-impl
  use common-dylan;
  use c-ffi;

  use gsl-ffi-math;
end module gsl-ffi-math-impl;

///////////////////////////////////////////////////////////////////////////////
//
// Module Complex
// https://www.gnu.org/software/gsl/doc/html/complex.html
//
///////////////////////////////////////////////////////////////////////////////

define module gsl-ffi-complex

  // Complex number

  create
    <gsl-complex*>,
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
    gsl-complex-add,
    gsl-complex-sub,
    gsl-complex-mul,
    gsl-complex-div,
    gsl-complex-add-real,
    gsl-complex-sub-real,
    gsl-complex-mul-real,
    gsl-complex-div-real,
    gsl-complex-add-imag,
    gsl-complex-sub-imag,
    gsl-complex-mul-imag,
    gsl-complex-div-imag,
    gsl-complex-conjugate,
    gsl-complex-inverse,
    gsl-complex-negative;

  // Elementary complex functions

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

end module gsl-ffi-complex;

define module gsl-ffi-complex-impl

  use common-dylan;
  use c-ffi;

  use gsl-ffi-complex;

end module gsl-ffi-complex-impl;

///////////////////////////////////////////////////////////////////////////////
//
// Module Statistics
// https://www.gnu.org/software/gsl/doc/html/statistics.html
//
///////////////////////////////////////////////////////////////////////////////

define module gsl-ffi-statistics

  // Mean, Standard Deviation and Variance

  create
    gsl-stats-mean,
    gsl-stats-variance,
    gsl-stats-variance-m,
    gsl-stats-sd,
    gsl-stats-sd-m,
    gsl-stats-tss,
    gsl-stats-tss-m,
    gsl-stats-variance-with-fixed-mean,
    gsl-stats-sd-with-fixed-mean;

  // Absolute deviation

  create
    gsl-stats-absdev,
    gsl-stats-absdev-m;

  // Higher moments

  create
    gsl-stats-skew,
    gsl-stats-skew-m-sd,
    gsl-stats-kurtosis,
    gsl-stats-kurtosis-m-sd;

  // Autocorrelation

  create
    gsl-stats-lag1-autocorrelation,
    gsl-stats-lag1-autocorrelation-m;

  // Covariance

  create
    gsl-stats-covariance,
    gsl-stats-covariance-m;

  // Maximum and Minimum

  create
    gsl-stats-max,
    gsl-stats-min,
    gsl-stats-minmax,
    gsl-stats-min-index,
    gsl-stats-max-index,
    gsl-stats-minmax-index;

  // Correlation

  create
    gsl-stats-correlation,
    gsl-stats-spearman;

  // Weighted samples

  create
    gsl-stats-wmean,
    gsl-stats-wvariance,
    gsl-stats-wvariance-m,
    gsl-stats-wsd,
    gsl-stats-wsd-m,
    gsl-stats-wvariance-with-fixed-mean,
    gsl-stats-wsd-with-fixed-mean,
    gsl-stats-wtss,
    gsl-stats-wtss-m,
    gsl-stats-wabsdev,
    gsl-stats-wabsdev-m,
    gsl-stats-wskew,
    gsl-stats-wkurtosis,
    gsl-stats-wkurtosis-m-sd;

  // Median and percentiles

  create
    gsl-stats-median-from-sorted-data,
    gsl-stats-median,
    gsl-stats-quantile-from-sorted-data;

  // Order statistics

  create
    gsl-stats-select;

  // Robust location estimates

  create
    gsl-stats-trmean-from-sorted-data,
    gsl-stats-gastwirth-from-sorted-data;

  // Robust scale estimates

  create
    gsl-stats-mad,
    gsl-stats-mad0;

  // S_n statistic

  create
    gsl-stats-sn0-from-sorted-data,
    gsl-stats-sn-from-sorted-data;

  // Q_n statistic

  create
    gsl-stats-qn0-from-sorted-data,
    gsl-stats-qn-from-sorted-data;

end module gsl-ffi-statistics;

define module gsl-ffi-statistics-impl
  use common-dylan;
  use c-ffi;

  use gsl-ffi-statistics;
end module gsl-ffi-statistics-impl;

///////////////////////////////////////////////////////////////////////////////
//
// Module Running Statistics
// https://www.gnu.org/software/gsl/doc/html/statistics.html
//
///////////////////////////////////////////////////////////////////////////////

define module gsl-ffi-running-statistics

  create
    <gsl-rstat-workspace>,
    <gsl-rstat-workspace*>;

  create
    gsl-rstat-alloc,
    gsl-rstat-free,
    gsl-rstat-reset;

  create
    gsl-rstat-add;

  create
    gsl-rstat-min,
    gsl-rstat-max,
    gsl-rstat-mean,
    gsl-rstat-variance,
    gsl-rstat-sd,
    gsl-rstat-sd-mean,
    gsl-rstat-rms,
    gsl-rstat-skew,
    gsl-rstat-kurtosis,
    gsl-rstat-median,
    // gsl-rstat-norm,
    gsl-rstat-n;

  create
    <gsl-rstat-quantile-workspace>,
    <gsl-rstat-quantile-workspace*>;

  create
    gsl-rstat-quantile-alloc,
    gsl-rstat-quantile-free,
    gsl-rstat-quantile-reset;

  create
    gsl-rstat-quantile-add,
    gsl-rstat-quantile-get;

end module gsl-ffi-running-statistics;

define module gsl-ffi-running-statistics-impl
  use common-dylan;
  use c-ffi;

  use gsl-ffi-running-statistics;
end module gsl-ffi-running-statistics-impl;

///////////////////////////////////////////////////////////////////////////////
//
// Module Block
// https://www.gnu.org/software/gsl/doc/html/vector_matrix.html
//
///////////////////////////////////////////////////////////////////////////////

define module gsl-ffi-block

  create
    <gsl-block>,
    <gsl-block*>,
    gsl-block-size,
    gsl-block-size-setter,
    gsl-block-data,
    gsl-block-data-setter;
  
  create
    gsl-block-alloc,
    gsl-block-calloc,
    gsl-block-free;

end module gsl-ffi-block;

define module gsl-ffi-block-impl

  use common-dylan;
  use c-ffi;

  use gsl-ffi-block;

end module gsl-ffi-block-impl;

///////////////////////////////////////////////////////////////////////////////
//
// Module Vector
// https://www.gnu.org/software/gsl/doc/html/vectors.html
//
///////////////////////////////////////////////////////////////////////////////

define module gsl-ffi-vector

  create
    <gsl-vector>,
    <gsl-vector*>,
    gsl-vector-size,
    gsl-vector-size-setter,
    gsl-vector-data,
    gsl-vector-data-setter,
    gsl-vector-stride,
    gsl-vector-stride-setter,
    gsl-vector-block,
    gsl-vector-block-setter,
    gsl-vector-owner,
    gsl-vector-owner-setter;

  // Allocation and deallocation

  create
    gsl-vector-alloc,
    gsl-vector-calloc,
    gsl-vector-free;


  // Element access

  create
    gsl-vector-get,
    gsl-vector-set,
    gsl-vector-ptr,
    gsl-vector-const-ptr;

  // Initialization

  create
    gsl-vector-set-all,
    gsl-vector-set-zero,
    gsl-vector-set-basis;

  // Copying

  create
    gsl-vector-memcpy;

  // Exchanging elements

  create
    gsl-vector-swap-elements,
    gsl-vector-reverse;

  // Operations

  create
    gsl-vector-add,
    gsl-vector-sub,
    gsl-vector-mul,
    gsl-vector-div,
    gsl-vector-scale,
    gsl-vector-add-constant,
    gsl-vector-sum,
    gsl-vector-axpby;

  // Min and max

  create
    gsl-vector-max,
    gsl-vector-min,
    gsl-vector-minmax,
    gsl-vector-max-index,
    gsl-vector-min-index,
    gsl-vector-minmax-index;

  create
    gsl-vector-equal,
    gsl-vector-isnull,
    gsl-vector-ispos,
    gsl-vector-isneg,
    gsl-vector-isnonneg;

end module gsl-ffi-vector;

define module gsl-ffi-vector-impl

  use common-dylan;
  use c-ffi;
  use gsl-ffi-block;
  use gsl-ffi-vector;

end module gsl-ffi-vector-impl;
