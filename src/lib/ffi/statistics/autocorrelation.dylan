Module: gsl-ffi-statistics-impl
Synopsis: Autocorrelation
Author: Fernando Raya
Copyright: Copyright (C) 2026, Dylan Hackers. All rights reserved.
License: See LICENSE in this distribution for details.
Reference: https://www.gnu.org/software/gsl/doc/html/statistics.html#autocorrelation
           https://www.gnu.org/software/gsl/doc/html/statistics.html#c.gsl_stats_lag1_autocorrelation
           https://www.gnu.org/software/gsl/doc/html/statistics.html#c.gsl_stats_lag1_autocorrelation_m

define c-function gsl-stats-lag1-autocorrelation
  input parameter data :: <c-double*>;
  input parameter stride :: <c-size-t>;
  input parameter n :: <c-size-t>;
  result autocorrelation :: <c-double>;
  c-name: "gsl_stats_lag1_autocorrelation";
end;

define c-function gsl-stats-lag1-autocorrelation-m
  input parameter data :: <c-double*>;
  input parameter stride :: <c-size-t>;
  input parameter n :: <c-size-t>;
  input parameter mean :: <c-double>;
  result autocorrelation :: <c-double>;
  c-name: "gsl_stats_lag1_autocorrelation_m";
end;
