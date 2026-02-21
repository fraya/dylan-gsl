Module: gsl-statistics-impl
Synopsis: Autocorrelation
Author: Fernando Raya
Copyright: Copyright (C) 2026, Dylan Hackers. All rights reserved.
License: See LICENSE in this distribution for details.
Reference: https://www.gnu.org/software/gsl/doc/html/statistics.html#autocorrelation
           https://www.gnu.org/software/gsl/doc/html/statistics.html#c.gsl_stats_lag1_autocorrelation
           https://www.gnu.org/software/gsl/doc/html/statistics.html#c.gsl_stats_lag1_autocorrelation_m

define function lag1-autocorrelation
    (data :: <gsl-vector>, 
    #key mean :: <double-float?> = #f) 
 => (autocorrelation :: <double-float>)
  if (mean)
    gsl-stats-lag1-autocorrelation-m(data.%gsl-vector-data, data.gsl-vector-stride, data.size, mean)
  else
    gsl-stats-lag1-autocorrelation(data.%gsl-vector-data, data.gsl-vector-stride, data.size)
  end if;
end;
