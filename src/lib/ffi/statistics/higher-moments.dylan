Module: gsl-ffi-statistics-impl
Synopsis: Higher Moments
Author: Fernando Raya
Copyright: Copyright (C) 2026, Dylan Hackers. All rights reserved.
License: See LICENSE in this distribution for details.
Reference: https://www.gnu.org/software/gsl/doc/html/statistics.html#higher-moments-skewness-and-kurtosis
           https://www.gnu.org/software/gsl/doc/html/statistics.html#c.gsl_stats_skew
           https://www.gnu.org/software/gsl/doc/html/statistics.html#c.gsl_stats_kurtosis
           https://www.gnu.org/software/gsl/doc/html/statistics.html#c.gsl_stats_skew_m
           https://www.gnu.org/software/gsl/doc/html/statistics.html#c.gsl_stats_kurtosis_m

define c-function gsl-stats-skew
  input parameter data :: <c-double*>;
  input parameter n :: <c-size-t>;
  input parameter stride :: <c-size-t>;
  result skewness :: <c-double>;
  c-name: "gsl_stats_skew";
end;

define c-function gsl-stats-skew-m-sd
  input parameter data :: <c-double*>;
  input parameter n :: <c-size-t>;
  input parameter stride :: <c-size-t>;
  input parameter mean :: <c-double>;
  input parameter sd :: <c-double>;
  result skewness :: <c-double>;
  c-name: "gsl_stats_skew_m_sd";
end;

define c-function gsl-stats-kurtosis
  input parameter data :: <c-double*>;
  input parameter n :: <c-size-t>;
  input parameter stride :: <c-size-t>;
  result kurtosis :: <c-double>;
  c-name: "gsl_stats_kurtosis";
end;

define c-function gsl-stats-kurtosis-m-sd
  input parameter data :: <c-double*>;
  input parameter n :: <c-size-t>;
  input parameter stride :: <c-size-t>;
  input parameter mean :: <c-double>;
  input parameter sd :: <c-double>;
  result kurtosis :: <c-double>;
  c-name: "gsl_stats_kurtosis_m_sd";
end;
