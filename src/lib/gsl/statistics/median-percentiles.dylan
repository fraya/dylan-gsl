Module: gsl-statistics-impl
Synopsis: Median and Percentiles
Author: Fernando Raya
Copyright: Copyright (C) 2026, Dylan Hackers. All rights reserved.
License: See LICENSE in this distribution for details.
Reference: https://www.gnu.org/software/gsl/doc/html/statistics.html#median-and-percentiles
           https://www.gnu.org/software/gsl/doc/html/statistics.html#c.gsl_stats_median_from_sorted_data
           https://www.gnu.org/software/gsl/doc/html/statistics.html#c.gsl_stats_median

define function median
    (data :: <vector-double-float>,
      #key stride :: <integer> = 1,
      sorted? :: <boolean> = #f) 
 => (median :: <double-float>)
  with-c-double-array (c-data = data)
    if (sorted?)
      gsl-stats-median-from-sorted-data(c-data, stride, data.size)
    else
      gsl-stats-median(c-data, stride, data.size)
    end;
  end;
end;