Module: gsl-ffi-statistics-impl
Synopsis: Maximum and Minimum
Author: Fernando Raya
Copyright: Copyright (C) 2026, Dylan Hackers. All rights reserved.
License: See LICENSE in this distribution for details.
Reference: https://www.gnu.org/software/gsl/doc/html/statistics.html#maximum-and-minimum-values
           https://www.gnu.org/software/gsl/doc/html/statistics.html#c.gsl_stats_max
           https://www.gnu.org/software/gsl/doc/html/statistics.html#c.gsl_stats_min
           https://www.gnu.org/software/gsl/doc/html/statistics.html#c.gsl_stats_minmax

define c-function gsl-stats-max
  input parameter data :: <c-double*>;
  input parameter stride :: <c-size-t>;
  input parameter n :: <c-size-t>;
  result maximum :: <c-double>;
  c-name: "gsl_stats_max";
end;

define c-function gsl-stats-min
  input parameter data :: <c-double*>;
  input parameter stride :: <c-size-t>;
  input parameter n :: <c-size-t>;
  result minimum :: <c-double>;
  c-name: "gsl_stats_min";
end;

define c-function gsl-stats-minmax
  output parameter minimum :: <c-double*>;
  output parameter maximum :: <c-double*>;
  input parameter data :: <c-double*>;
  input parameter stride :: <c-size-t>;
  input parameter n :: <c-size-t>;
  c-name: "gsl_stats_minmax";
end;