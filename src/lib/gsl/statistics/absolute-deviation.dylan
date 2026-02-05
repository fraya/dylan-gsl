Module: gsl-statistics-impl
Synopsis: Absolute Deviation
Author: Fernando Raya
Copyright: Copyright (C) 2026, Dylan Hackers. All rights reserved.
License: See LICENSE in this distribution for details.
Reference: https://www.gnu.org/software/gsl/doc/html/statistics.html
           https://www.gnu.org/software/gsl/doc/html/statistics.html#absolute-deviation
           https://www.gnu.org/software/gsl/doc/html/statistics.html#c.gsl_stats_absdev
           https://www.gnu.org/software/gsl/doc/html/statistics.html#c.gsl_stats_absdev_m

define function abs-dev
    (data :: <vector>, 
    #key stride :: <integer> = 1, 
         mean :: <double-float?> = #f) 
 => (mean :: <double-float>)
  with-c-double-array (c-data = data)
    if (mean)
      gsl-stats-abs-dev-m(c-data, stride, data.size, mean)
    else
      gsl-stats-abs-dev(c-data, stride, data.size)
    end
  end
end;
