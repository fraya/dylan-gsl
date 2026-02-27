Module: dylan-user
Synopsis: Module for statistics in dylan-gsl
Author: Fernando Raya
Copyright: Copyright (C) 2026, Dylan Hackers. All rights reserved.
License: See LICENSE in this distribution for details.
Reference: https://www.gnu.org/software/gsl/doc/html/statistics.html

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
    rstat-median,
    rstat-norm;

end module;

define module gsl-running-statistics-impl

  use common-dylan;
  use c-ffi;

  use gsl-ffi-running-statistics,
    prefix: "ffi/";
  use gsl-running-statistics;

end module;
