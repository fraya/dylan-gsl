Module: gsl-ffi-statistics-impl
Synopsis: Median and Percentiles
Author: Fernando Raya
Copyright: Copyright (C) 2026, Dylan Hackers. All rights reserved.
License: See LICENSE in this distribution for details.
Reference: https://www.gnu.org/software/gsl/doc/html/statistics.html#median-and-percentiles

define c-function gsl-stats-median-from-sorted-data
  input parameter sorted-data :: <c-double*>;
  input parameter stride :: <c-size-t>;
  input parameter n :: <c-size-t>;
  result median :: <c-double>;
  c-name: "gsl_stats_median_from_sorted_data";
end;

define c-function gsl-stats-median
  input parameter sorted-data :: <c-double*>;
  input parameter stride :: <c-size-t>;
  input parameter n :: <c-size-t>;
  result median :: <c-double>;
  c-name: "gsl_stats_median";
end;
