Module: gsl-statistics-impl
Synopsis: Robust location estimates
Author: Fernando Raya
Copyright: Copyright (C) 2026, Dylan Hackers. All rights reserved.
License: See LICENSE in this distribution for details.
Reference: https://www.gnu.org/software/gsl/doc/html/statistics.html#robust-location-estimates
           https://www.gnu.org/software/gsl/doc/html/statistics.html#c.gsl_stats_trmean_from_sorted_data

define function trimmed-mean
    (sorted-data :: <vector-double-float>,
     alpha :: <double-float>,
     #key stride :: <integer> = 1)
 => (trimmed-mean :: <double-float>)
  with-c-double-array (c-data = sorted-data)
    gsl-stats-trmean-from-sorted-data(alpha, c-data, stride, sorted-data.size)
  end
end;