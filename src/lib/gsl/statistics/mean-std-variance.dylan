Module: gsl-statistics-impl
Synopsis: Mean, Standard Deviation and Variance
Author: Fernando Raya
Copyright: Copyright (C) 2026, Dylan Hackers. All rights reserved.
License: See LICENSE in this distribution for details.
Reference: https://www.gnu.org/software/gsl/doc/html/statistics.html
           https://www.gnu.org/software/gsl/doc/html/statistics.html#mean-standard-deviation-and-variance
           https://www.gnu.org/software/gsl/doc/html/statistics.html#c.gsl_stats_mean
           https://www.gnu.org/software/gsl/doc/html/statistics.html#c.gsl_stats_variance
           https://www.gnu.org/software/gsl/doc/html/statistics.html#c.gsl_stats_variance_m
           https://www.gnu.org/software/gsl/doc/html/statistics.html#c.gsl_stats_sd
           https://www.gnu.org/software/gsl/doc/html/statistics.html#c.gsl_stats_sd_m
           https://www.gnu.org/software/gsl/doc/html/statistics.html#c.gsl_stats_tss
           https://www.gnu.org/software/gsl/doc/html/statistics.html#c.gsl_stats_tss_m
           https://www.gnu.org/software/gsl/doc/html/statistics.html#c.gsl_stats_variance_with_fixed_mean
           https://www.gnu.org/software/gsl/doc/html/statistics.html#c.gsl_stats_sd_with_fixed_mean

define function mean
    (data :: <gsl-vector>) 
 => (mean :: <double-float>)
  gsl-stats-mean
    (data.%gsl-vector-data, data.gsl-vector-stride, data.size)
end;

define function variance
    (data :: <gsl-vector>, 
     #key mean :: <double-float?> = #f,
          population? :: <boolean> = #f) 
 => (variance :: <double-float>)
  if (mean)
    if (population?)
      gsl-stats-variance-with-fixed-mean
        (data.%gsl-vector-data, data.gsl-vector-stride, data.size, mean)
    else
      gsl-stats-variance-m
        (data.%gsl-vector-data, data.gsl-vector-stride, data.size, mean)
    end if;
  else
    gsl-stats-variance
      (data.%gsl-vector-data, data.gsl-vector-stride, data.size)
  end
end;

define function standard-deviation
    (data :: <gsl-vector>, 
     #key mean :: <double-float?> = #f,
          fixed-mean? :: <boolean> = #f) 
 => (sd :: <double-float>)
  if (mean)
    if (fixed-mean?)
      gsl-stats-sd-with-fixed-mean
        (data.%gsl-vector-data, data.gsl-vector-stride, data.size, mean)
    else
      gsl-stats-sd-m
        (data.%gsl-vector-data, data.gsl-vector-stride, data.size, mean)
    end if;
  else
    gsl-stats-sd
      (data.%gsl-vector-data, data.gsl-vector-stride, data.size)
  end if;
end;

define function tss
    (data :: <gsl-vector>, 
     #key mean :: <double-float?> = #f) 
 => (tss :: <double-float>)
  if (mean)
    gsl-stats-tss-m
      (data.%gsl-vector-data, data.gsl-vector-stride, data.size, mean)
  else
    gsl-stats-tss
      (data.%gsl-vector-data, data.gsl-vector-stride, data.size)
  end if;
end;
