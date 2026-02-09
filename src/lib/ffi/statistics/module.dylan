Module: dylan-user
Synopsis: Module for statistics in dylan-gsl
Author: Fernando Raya
Copyright: Copyright (C) 2026, Dylan Hackers. All rights reserved.
License: See LICENSE in this distribution for details.
Reference: https://www.gnu.org/software/gsl/doc/html/statistics.html

define module gsl-ffi-statistics

  // Mean, Standard Deviation and Variance (file:./mean-std-variance.dylan)

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

  // Absolute deviation (file:./absolute-deviation.dylan)

  create
    gsl-stats-abs-dev,
    gsl-stats-abs-dev-m;

  // Higher moments (file:./higher-moments.dylan)

  create
    gsl-stats-skew,
    gsl-stats-skew-m-sd,
    gsl-stats-kurtosis,
    gsl-stats-kurtosis-m-sd;

  // Autocorrelation (file:./autocorrelation.dylan)

  create
    gsl-stats-lag1-autocorrelation,
    gsl-stats-lag1-autocorrelation-m;

  // Covariance (file:./covariance.dylan)

  create
    gsl-stats-covariance,
    gsl-stats-covariance-m;

  // Maximum and Minimum (file:./maximum-minimum.dylan)

  create
    gsl-stats-max,
    gsl-stats-min,
    gsl-stats-minmax;

  // Correlation (file:./correlation.dylan)

  create
    gsl-stats-correlation,
    gsl-stats-spearman;

  // Weighted samples (file:./weighted-samples.dylan)

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

end module;

define module gsl-ffi-statistics-impl
  use common-dylan;
  use c-ffi;

  use gsl-ffi-statistics;
end module;