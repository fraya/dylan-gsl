Module: dylan-user
Synopsis: Module for statistics in dylan-gsl
Author: Fernando Raya
Copyright: Copyright (C) 2026, Dylan Hackers. All rights reserved.
License: See LICENSE in this distribution for details.
Reference: https://www.gnu.org/software/gsl/doc/html/statistics.html

define module gsl-statistics

  create

    // file:./mean-std-variance.dylan

    mean,
    variance,
    standard-deviation,
    tss,    
    
    // file:./absolute-deviation.dylan

    abs-dev,
  
    // file:./higher-moments.dylan

    skew,
    kurtosis,
  
    // file:./autocorrelation.dylan

    lag1-autocorrelation,

    // file:./covariance.dylan

    covariance,
    
    // file:./maximum-minimum.dylan
    
    maximum,
    minimum,
    minimum-maximum;

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