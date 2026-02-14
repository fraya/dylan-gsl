Module: gsl-ffi-statistics-impl
Synopsis: Robust scale estimates
Author: Fernando Raya
Copyright: Copyright (C) 2026, Dylan Hackers. All rights reserved.
License: See LICENSE in this distribution for details.
Reference: https://www.gnu.org/software/gsl/doc/html/statistics.html#robust-scale-estimates
           https://www.gnu.org/software/gsl/doc/html/statistics.html#median-absolute-deviation-mad
           https://www.gnu.org/software/gsl/doc/html/statistics.html#c.gsl_stats_mad0
           https://www.gnu.org/software/gsl/doc/html/statistics.html#c.gsl_stats_mad

define c-function gsl-stats-mad0
  parameter data :: <c-double*>;
  parameter stride :: <c-size-t>;
  parameter n :: <c-size-t>;
  parameter work :: <c-double*>;
  result mad :: <c-double>;
  c-name: "gsl_stats_mad0";
end;

define c-function gsl-stats-mad
   parameter data :: <c-double*>;
   parameter stride :: <c-size-t>;
   parameter n :: <c-size-t>;
   parameter work :: <c-double*>;
   result mad :: <c-double>;
   c-name: "gsl_stats_mad";
end;