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
    (data :: <vector-double-float>, #key stride :: <integer> = 1)
 => (max :: <double-float>)
  with-c-double-array (c-data = data)
    gsl-stats-max(c-data, stride, data.size)
  end
end;

define function minimum
    (data :: <vector-double-float>, #key stride :: <integer> = 1)
 => (min :: <double-float>)
  with-c-double-array (c-data = data)
    gsl-stats-min(c-data, stride, data.size)
  end
end;

define function minimum-maximum
    (data :: <vector-double-float>, #key stride :: <integer> = 1)
 => (minimum :: <double-float>, maximum :: <double-float>)
  with-c-double-array (c-data = data)
    gsl-stats-minmax(c-data, stride, data.size)
  end
end;
