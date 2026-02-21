Module: gsl-statistics-impl
Synopsis: Maximum and Minimum
Author: Fernando Raya
Copyright: Copyright (C) 2026, Dylan Hackers. All rights reserved.
License: See LICENSE in this distribution for details.
Reference: https://www.gnu.org/software/gsl/doc/html/statistics.html#maximum-and-minimum-values
           https://www.gnu.org/software/gsl/doc/html/statistics.html#c.gsl_stats_max
           https://www.gnu.org/software/gsl/doc/html/statistics.html#c.gsl_stats_min
           https://www.gnu.org/software/gsl/doc/html/statistics.html#c.gsl_stats_minmax

define function maximum
    (data :: <gsl-vector>, #key stride :: <integer> = 1)
 => (max :: <double-float>)
  gsl-stats-max(data.%gsl-vector-data, data.gsl-vector-stride, data.size)
end;

define function minimum
    (data :: <gsl-vector>, #key stride :: <integer> = 1)
 => (min :: <double-float>)
  gsl-stats-min(data.%gsl-vector-data, data.gsl-vector-stride, data.size)
end;

define function minimum-maximum
    (data :: <gsl-vector>, #key stride :: <integer> = 1)
 => (minimum :: <double-float>, maximum :: <double-float>)
  gsl-stats-minmax(data.%gsl-vector-data, data.gsl-vector-stride, data.size)
end;
