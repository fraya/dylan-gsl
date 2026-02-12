Module: dylan-user
Synopsis: Module for statistics in dylan-gsl
Author: Fernando Raya
Copyright: Copyright (C) 2026, Dylan Hackers. All rights reserved.
License: See LICENSE in this distribution for details.
Reference: https://www.gnu.org/software/gsl/doc/html/statistics.html

define module gsl-statistics

  // file:./mean-std-variance.dylan

  create
    mean,
    variance,
    standard-deviation,
    tss;

  // file:./absolute-deviation.dylan

  create
    abs-dev;

  // file:./higher-moments.dylan

  create
    skew,
    kurtosis;

  // file:./autocorrelation.dylan

  create
    lag1-autocorrelation;

  // file:./covariance.dylan

  create
    covariance;

  // file:./maximum-minimum.dylan

  create
    maximum,
    minimum,
    minimum-maximum;

  // file:./correlation.dylan

  create
    correlation,
    spearman;

  // file:./weighted-samples.dylan

  create
    wmean,
    wvariance,
    wsd,
    wtss,
    wabs-dev,
    wskew,
    wkurtosis;

  // file:./median-percentiles.dylan

  create
    median;

  // file:./order-statistic.dylan

  create
    kth-order-statistic,
    trimmed-mean;

end module;

define module gsl-statistics-impl

  use common-dylan;
  use c-ffi;
  use gsl-common,
    import: { <double-float?>,
              <vector-double-float>,
              with-c-double-array };
  use gsl-ffi-statistics;

  use gsl-statistics;

end module;
