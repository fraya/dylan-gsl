Module: gsl-statistics-impl
Synopsis: Higher Moments
Author: Fernando Raya
Copyright: Copyright (C) 2026, Dylan Hackers. All rights reserved.
License: See LICENSE in this distribution for details.
Reference: https://www.gnu.org/software/gsl/doc/html/statistics.html#higher-moments-skewness-and-kurtosis
           https://www.gnu.org/software/gsl/doc/html/statistics.html#c.gsl_stats_skew
           https://www.gnu.org/software/gsl/doc/html/statistics.html#c.gsl_stats_kurtosis
           https://www.gnu.org/software/gsl/doc/html/statistics.html#c.gsl_stats_skew_m
           https://www.gnu.org/software/gsl/doc/html/statistics.html#c.gsl_stats_kurtosis_m

define function skew
    (data :: <vector>,
    #key stride :: <integer> = 1,
         mean :: <double-float?> = #f,
         sd :: <double-float?> = #f)
 => (skewness :: <double-float>)
  with-c-double-array (c-data = data)
    if (mean & sd)
      gsl-stats-skew-m-sd(c-data, data.size, stride, mean, sd)
    else
      gsl-stats-skew(c-data, data.size, stride)
    end
  end
end;

define function kurtosis
    (data :: <vector>,
    #key stride :: <integer> = 1,
         mean :: <double-float?> = #f,
         sd :: <double-float?> = #f)
 => (kurtosis :: <double-float>)
  with-c-double-array (c-data = data)
    if (mean & sd)
      gsl-stats-kurtosis-m-sd(c-data, data.size, stride, mean, sd)
    else
      gsl-stats-kurtosis(c-data, data.size, stride)
    end
  end
end;
