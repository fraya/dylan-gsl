Module: gsl-ffi-statistics-impl
Synopsis: Correlation
Author: Fernando Raya
Copyright: Copyright (C) 2026, Dylan Hackers. All rights reserved.
License: See LICENSE in this distribution for details.
Reference: https://www.gnu.org/software/gsl/doc/html/statistics.html#correlation

define c-function gsl-stats-correlation
  input parameter data1 :: <c-double*>;
  input parameter stride1 :: <c-int>;
  input parameter data2 :: <c-double*>;
  input parameter stride2 :: <c-int>;
  input parameter n :: <c-int>;
  result correlation :: <c-double>;
  c-name: "gsl_stats_correlation";
end;

define c-function gsl-stats-spearman
  input parameter data1 :: <c-double*>;
  input parameter stride1 :: <c-int>;
  input parameter data2 :: <c-double*>;
  input parameter stride2 :: <c-int>;
  input parameter n :: <c-int>;
  input parameter work :: <c-double*>;
  result correlation-sd :: <c-double>;
  c-name: "gsl_stats_spearman";
end;
