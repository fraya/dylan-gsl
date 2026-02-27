Module: dylan-user
Synopsis: Module for statistics in dylan-gsl
Author: Fernando Raya
Copyright: Copyright (C) 2026, Dylan Hackers. All rights reserved.
License: See LICENSE in this distribution for details.
Reference: https://www.gnu.org/software/gsl/doc/html/statistics.html

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
    gsl-rstat-norm,
    gsl-rstat-n;

end module;

define module gsl-ffi-running-statistics-impl
  use common-dylan;
  use c-ffi;

  use gsl-ffi-running-statistics;
end module;
