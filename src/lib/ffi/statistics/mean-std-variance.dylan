Module: gsl-ffi-statistics-impl
Synopsis: Mean, Standard Deviation and Variance
Author: Fernando Raya
Copyright: Copyright (C) 2026, Dylan Hackers. All rights reserved.
License: See LICENSE in this distribution for details.
Reference: https://www.gnu.org/software/gsl/doc/html/statistics.html
           https://www.gnu.org/software/gsl/doc/html/statistics.html#mean-standard-deviation-and-variance
           https://www.gnu.org/software/gsl/doc/html/statistics.html#c.gsl_stats_mean
           https://www.gnu.org/software/gsl/doc/html/statistics.html#c.gsl_stats_variance
           https://www.gnu.org/software/gsl/doc/html/statistics.html#c.gsl_stats_variance_m
           https://www.gnu.org/software/gsl/doc/html/statistics.html#c.gsl_stats_sd
           https://www.gnu.org/software/gsl/doc/html/statistics.html#c.gsl_stats_sd_m
           https://www.gnu.org/software/gsl/doc/html/statistics.html#c.gsl_stats_tss
           https://www.gnu.org/software/gsl/doc/html/statistics.html#c.gsl_stats_tss_m
           https://www.gnu.org/software/gsl/doc/html/statistics.html#c.gsl_stats_variance_with_fixed_mean
           https://www.gnu.org/software/gsl/doc/html/statistics.html#c.gsl_stats_sd_with_fixed_mean

define c-function gsl-stats-mean
  parameter data :: <c-double*>;
  parameter stride :: <c-size-t>;
  parameter n :: <c-size-t>;
  result mean :: <c-double>;
  c-name: "gsl_stats_mean";
end;

define c-function gsl-stats-variance
  parameter data :: <c-double*>;
  parameter stride :: <c-size-t>;
  parameter n :: <c-size-t>;
  result variance :: <c-double>;
  c-name: "gsl_stats_variance";
end;

define c-function gsl-stats-variance-m
  parameter data :: <c-double*>;
  parameter stride :: <c-size-t>;
  parameter n :: <c-size-t>;
  parameter mean :: <c-double>;
  result variance :: <c-double>;
  c-name: "gsl_stats_variance_m";
end;

define c-function gsl-stats-sd
  parameter data :: <c-double*>;
  parameter stride :: <c-size-t>;
  parameter n :: <c-size-t>;
  result sd :: <c-double>;
  c-name: "gsl_stats_sd";
end;

define c-function gsl-stats-sd-m
  parameter data :: <c-double*>;
  parameter stride :: <c-size-t>;
  parameter n :: <c-size-t>;
  parameter mean :: <c-double>;
  result sd :: <c-double>;
  c-name: "gsl_stats_sd_m";
end;

define c-function gsl-stats-tss
  parameter data :: <c-double*>;
  parameter stride :: <c-size-t>;
  parameter n :: <c-size-t>;
  result tss :: <c-double>;
  c-name: "gsl_stats_tss";
end;

define c-function gsl-stats-tss-m
  parameter data :: <c-double*>;
  parameter stride :: <c-size-t>;
  parameter n :: <c-size-t>;
  parameter mean :: <c-double>;
  result tss :: <c-double>;
  c-name: "gsl_stats_tss_m";
end;

define c-function gsl-stats-variance-with-fixed-mean
  parameter data :: <c-double*>;
  parameter stride :: <c-size-t>;
  parameter n :: <c-size-t>;
  parameter mean :: <c-double>;
  result variance :: <c-double>;
  c-name: "gsl_stats_variance_with_fixed_mean";
end;

define c-function gsl-stats-sd-with-fixed-mean
  parameter data :: <c-double*>;
  parameter stride :: <c-size-t>;
  parameter n :: <c-size-t>;
  parameter mean :: <c-double>;
  result sd :: <c-double>;
  c-name: "gsl_stats_sd_with_fixed_mean";
end;
