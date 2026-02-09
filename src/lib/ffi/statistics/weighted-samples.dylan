Module: gsl-ffi-statistics-impl
Synopsis: Weighted Samples
Author: Fernando Raya
Copyright: Copyright (C) 2026, Dylan Hackers. All rights reserved.
License: See LICENSE in this distribution for details.
Reference: https://www.gnu.org/software/gsl/doc/html/statistics.html#weighted-samples
           https://www.gnu.org/software/gsl/doc/html/statistics.html#c.gsl_stats_wmean
           https://www.gnu.org/software/gsl/doc/html/statistics.html#c.gsl_stats_wvariance
           https://www.gnu.org/software/gsl/doc/html/statistics.html#c.gsl_stats_wvariance_m
           https://www.gnu.org/software/gsl/doc/html/statistics.html#c.gsl_stats_wsd
           https://www.gnu.org/software/gsl/doc/html/statistics.html#c.gsl_stats_wsd_m
           https://www.gnu.org/software/gsl/doc/html/statistics.html#c.gsl_stats_wvariance_with_fixed_mean
           https://www.gnu.org/software/gsl/doc/html/statistics.html#c.gsl_stats_wsd_with_fixed_mean
           https://www.gnu.org/software/gsl/doc/html/statistics.html#c.gsl_stats_wtss
           https://www.gnu.org/software/gsl/doc/html/statistics.html#c.gsl_stats_wtss_m
           https://www.gnu.org/software/gsl/doc/html/statistics.html#c.gsl_stats_wabsdev
           https://www.gnu.org/software/gsl/doc/html/statistics.html#c.gsl_stats_wabsdev_m
           https://www.gnu.org/software/gsl/doc/html/statistics.html#c.gsl_stats_wskew
           https://www.gnu.org/software/gsl/doc/html/statistics.html#c.gsl_stats_wkurtosis
           https://www.gnu.org/software/gsl/doc/html/statistics.html#c.gsl_stats_wkurtosis_m_sd

define c-function gsl-stats-wmean
  parameter w :: <c-double*>;
  parameter wstride :: <c-size-t>;
  parameter data :: <c-double*>;
  parameter stride :: <c-size-t>;
  parameter n :: <c-size-t>;
  result wmean :: <c-double>;
  c-name: "gsl_stats_wmean";
end;

define c-function gsl-stats-wvariance
  parameter w :: <c-double*>;
  parameter wstride :: <c-size-t>;
  parameter data :: <c-double*>;
  parameter stride :: <c-size-t>;
  parameter n :: <c-size-t>;
  result wvariance :: <c-double>;
  c-name: "gsl_stats_wvariance";
end;

define c-function gsl-stats-wvariance-m
  parameter w :: <c-double*>;
  parameter wstride :: <c-size-t>;
  parameter data :: <c-double*>;
  parameter stride :: <c-size-t>;
  parameter n :: <c-size-t>;
  parameter mean :: <c-double>;
  result wvariance :: <c-double>;
  c-name: "gsl_stats_wvariance_m";
end;

define c-function gsl-stats-wsd
  parameter w :: <c-double*>;
  parameter wstride :: <c-size-t>;
  parameter data :: <c-double*>;
  parameter stride :: <c-size-t>;
  parameter n :: <c-size-t>;
  result wsd :: <c-double>;
  c-name: "gsl_stats_wsd";
end;

define c-function gsl-stats-wsd-m
  parameter w :: <c-double*>;
  parameter wstride :: <c-size-t>;
  parameter data :: <c-double*>;
  parameter stride :: <c-size-t>;
  parameter n :: <c-size-t>;
  parameter mean :: <c-double>;
  result wsd :: <c-double>;
  c-name: "gsl_stats_wsd_m";
end;

define c-function gsl-stats-wvariance-with-fixed-mean
  parameter w :: <c-double*>;
  parameter wstride :: <c-size-t>;
  parameter data :: <c-double*>;
  parameter stride :: <c-size-t>;
  parameter n :: <c-size-t>;
  parameter mean :: <c-double>;
  result wvariance :: <c-double>;
  c-name: "gsl_stats_wvariance_with_fixed_mean";
end;

define c-function gsl-stats-wsd-with-fixed-mean
  parameter w :: <c-double*>;
  parameter wstride :: <c-size-t>;
  parameter data :: <c-double*>;
  parameter stride :: <c-size-t>;
  parameter n :: <c-size-t>;
  parameter mean :: <c-double>;
  result wsd :: <c-double>;
  c-name: "gsl_stats_wsd_with_fixed_mean";
end;

define c-function gsl-stats-wtss
  parameter w :: <c-double*>;
  parameter wstride :: <c-size-t>;
  parameter data :: <c-double*>;
  parameter stride :: <c-size-t>;
  parameter n :: <c-size-t>;
  result wtss :: <c-double>;
  c-name: "gsl_stats_wtss";
end;

define c-function gsl-stats-wtss-m
  parameter w :: <c-double*>;
  parameter wstride :: <c-size-t>;
  parameter data :: <c-double*>;
  parameter stride :: <c-size-t>;
  parameter n :: <c-size-t>;
  parameter mean :: <c-double>;
  result wtss :: <c-double>;
  c-name: "gsl_stats_wtss_m";
end;

define c-function gsl-stats-wabsdev
  parameter w :: <c-double*>;
  parameter wstride :: <c-size-t>;
  parameter data :: <c-double*>;
  parameter stride :: <c-size-t>;
  parameter n :: <c-size-t>;
  result wabsdev :: <c-double>;
  c-name: "gsl_stats_wabsdev";
end;

define c-function gsl-stats-wabsdev-m
  parameter w :: <c-double*>;
  parameter wstride :: <c-size-t>;
  parameter data :: <c-double*>;
  parameter stride :: <c-size-t>;
  parameter n :: <c-size-t>;
  parameter mean :: <c-double>;
  result wabsdev :: <c-double>;
  c-name: "gsl_stats_wabsdev_m";
end;

define c-function gsl-stats-wskew
  parameter w :: <c-double*>;
  parameter wstride :: <c-size-t>;
  parameter data :: <c-double*>;
  parameter stride :: <c-size-t>;
  parameter n :: <c-size-t>;
  result wskew :: <c-double>;
  c-name: "gsl_stats_wskew";
end;

define c-function gsl-stats-wkurtosis
  parameter w :: <c-double*>;
  parameter wstride :: <c-size-t>;
  parameter data :: <c-double*>;
  parameter stride :: <c-size-t>;
  parameter n :: <c-size-t>;
  result wkurtosis :: <c-double>;
  c-name: "gsl_stats_wkurtosis";
end;

define c-function gsl-stats-wkurtosis-m-sd
  parameter w :: <c-double*>;
  parameter wstride :: <c-size-t>;
  parameter data :: <c-double*>;
  parameter stride :: <c-size-t>;
  parameter n :: <c-size-t>;
  parameter mean :: <c-double>;
  parameter sd :: <c-double>;
  result wkurtosis :: <c-double>;
  c-name: "gsl_stats_wkurtosis_m_sd";
end;
