Module: gsl-statistics-impl
Synopsis: Absolute Deviation
Author: Fernando Raya
Copyright: Copyright (C) 2026, Dylan Hackers. All rights reserved.
License: See LICENSE in this distribution for details.
Reference: https://www.gnu.org/software/gsl/doc/html/statistics.html
           https://www.gnu.org/software/gsl/doc/html/statistics.html#absolute-deviation
           https://www.gnu.org/software/gsl/doc/html/statistics.html#c.gsl_stats_absdev
           https://www.gnu.org/software/gsl/doc/html/statistics.html#c.gsl_stats_absdev_m

define function absdev
    (data :: <gsl-vector>,
    #key mean :: <double-float?> = #f)
 => (abs-dev :: <double-float>) 
  if (mean)
    gsl-stats-absdev-m(data.%gsl-vector-data, data.gsl-vector-stride, data.size, mean)
  else
    gsl-stats-absdev(data.%gsl-vector-data, data.gsl-vector-stride, data.size)
  end
end;
