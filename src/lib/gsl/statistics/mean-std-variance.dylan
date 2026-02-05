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
    (data :: <vector>, #key stride :: <integer> = 1) 
 => (mean :: <double-float>)
  with-c-double-array (c-data = data) 
    gsl-stats-mean(c-data, stride, data.size)
  end
end;

define function variance
    (data :: <vector>, 
     #key stride :: <integer> = 1,
          mean :: <double-float?> = #f,
          fixed-mean? :: <boolean> = #f) 
 => (variance :: <double-float>)
  with-c-double-array (c-data = data) 
    if (mean)
      if (fixed-mean?)
        gsl-stats-variance-with-fixed-mean(c-data, stride, data.size, mean)
      else
        gsl-stats-variance-m(c-data, stride, data.size, mean)
      end
    else
      gsl-stats-variance(c-data, stride, data.size)
    end
  end
end;

define function standard-deviation
    (data :: <vector>, 
     #key stride :: <integer> = 1,
          mean :: <double-float?> = #f,
          fixed-mean? :: <boolean> = #f) 
 => (sd :: <double-float>)
  with-c-double-array (c-data = data) 
    if (mean)
      if (fixed-mean?)
        gsl-stats-sd-with-fixed-mean(c-data, stride, data.size, mean)
      else
        gsl-stats-sd-m(c-data, stride, data.size, mean)
      end
    else
      gsl-stats-sd(c-data, stride, data.size)
    end
  end
end;

define function tss
    (data :: <vector>, 
     #key stride :: <integer> = 1,
          mean :: <double-float?> = #f) 
 => (tss :: <double-float>)
  with-c-double-array (c-data = data) 
    if (mean)
      gsl-stats-tss-m(c-data, stride, data.size, mean)
    else
      gsl-stats-tss(c-data, stride, data.size)
    end
  end
end;
