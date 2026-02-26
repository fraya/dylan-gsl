Module: dylan-user
Synopsis: Module for statistics in dylan-gsl
Author: Fernando Raya
Copyright: Copyright (C) 2026, Dylan Hackers. All rights reserved.
License: See LICENSE in this distribution for details.
Reference: https://www.gnu.org/software/gsl/doc/html/statistics.html

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
