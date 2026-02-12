Module: gsl-ffi-statistics-impl
Synopsis: Order statistics
Author: Fernando Raya
Copyright: Copyright (C) 2026, Dylan Hackers. All rights reserved.
License: See LICENSE in this distribution for details.
Reference: https://www.gnu.org/software/gsl/doc/html/statistics.html#order-statistics
           https://www.gnu.org/software/gsl/doc/html/statistics.html#c.gsl_stats_select
           https://www.gnu.org/software/gsl/doc/html/statistics.html#c.gsl_stats_trmean_from_sorted_data

define c-function gsl-stats-select
  parameter data :: <c-double*>;
  parameter stride :: <c-size-t>;
  parameter n :: <c-size-t>;
  parameter k :: <c-size-t>;
  result kth-order-statistic :: <c-double>;
  c-name: "gsl_stats_select";
end;

define c-function gsl-stats-trmean-from-sorted-data
  parameter alpha :: <c-double>;
  parameter sorted-data :: <c-double*>;
  parameter stride :: <c-size-t>;
  parameter n :: <c-size-t>;
  result trmean :: <c-double>;
  c-name: "gsl_stats_trmean_from_sorted_data";
end;
