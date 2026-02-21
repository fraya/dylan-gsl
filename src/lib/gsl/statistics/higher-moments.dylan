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
    (data :: <gsl-vector>,
    #key mean :: <double-float?> = #f,
         sd :: <double-float?> = #f)
 => (skewness :: <double-float>)
  if (mean & sd)
    gsl-stats-skew-m-sd
      (data.%gsl-vector-data, data.gsl-vector-stride, data.size, mean, sd)
  else
    gsl-stats-skew
      (data.%gsl-vector-data, data.gsl-vector-stride, data.size)
  end
end;

define function kurtosis
    (data :: <gsl-vector>,
    #key mean :: <double-float?> = #f,
         sd :: <double-float?> = #f)
 => (kurtosis :: <double-float>)
  if (mean & sd)
    gsl-stats-kurtosis-m-sd
      (data.%gsl-vector-data, data.gsl-vector-stride, data.size, mean, sd)
  else
    gsl-stats-kurtosis(
      data.%gsl-vector-data, data.gsl-vector-stride, data.size)
  end
end;
