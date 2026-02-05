Module: gsl-statistics-impl
Synopsis: Autocorrelation
Author: Fernando Raya
Copyright: Copyright (C) 2026, Dylan Hackers. All rights reserved.
License: See LICENSE in this distribution for details.
Reference: https://www.gnu.org/software/gsl/doc/html/statistics.html#autocorrelation
           https://www.gnu.org/software/gsl/doc/html/statistics.html#c.gsl_stats_lag1_autocorrelation
           https://www.gnu.org/software/gsl/doc/html/statistics.html#c.gsl_stats_lag1_autocorrelation_m

define function lag1-autocorrelation
    (data :: <vector>, 
    #key stride :: <integer> = 1, 
         mean :: <double-float?> = #f) 
 => (autocorrelation :: <double-float>)
  with-c-double-array (c-data = data)
    if (mean)
      gsl-stats-lag1-autocorrelation-m(c-data, stride, data.size, mean)
    else
      gsl-stats-lag1-autocorrelation(c-data, stride, data.size)
    end
  end
end;
