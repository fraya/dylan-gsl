Module: gsl-ffi-statistics-impl
Synopsis: Robust location estimates
Author: Fernando Raya
Copyright: Copyright (C) 2026, Dylan Hackers. All rights reserved.
License: See LICENSE in this distribution for details.
Reference: https://www.gnu.org/software/gsl/doc/html/statistics.html#robust-location-estimates
           https://www.gnu.org/software/gsl/doc/html/statistics.html#c.gsl_stats_trmean_from_sorted_data

define c-function gsl-stats-trmean-from-sorted-data
  parameter alpha :: <c-double>;
  parameter sorted-data :: <c-double*>;
  parameter stride :: <c-size-t>;
  parameter n :: <c-size-t>;
  result trmean :: <c-double>;
  c-name: "gsl_stats_trmean_from_sorted_data";
end;
