Module: dylan-user
Synopsis: Module for statistics in dylan-gsl
Author: Fernando Raya
Copyright: Copyright (C) 2026, Dylan Hackers. All rights reserved.
License: See LICENSE in this distribution for details.
Reference: https://www.gnu.org/software/gsl/doc/html/statistics.html

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
    gsl-stats-minmax;

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
    gsl-stats-median;

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

end module;

define module gsl-ffi-statistics-impl
  use common-dylan;
  use c-ffi;

  use gsl-ffi-statistics;
end module;
