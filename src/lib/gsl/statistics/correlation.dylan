Module: gsl-statistics-impl
Synopsis: Correlation
Author: Fernando Raya
Copyright: Copyright (C) 2026, Dylan Hackers. All rights reserved.
License: See LICENSE in this distribution for details.
Reference: https://www.gnu.org/software/gsl/doc/html/statistics.html#correlation
           https://www.gnu.org/software/gsl/doc/html/statistics.html#c.gsl_stats_correlation
           https://www.gnu.org/software/gsl/doc/html/statistics.html#c.gsl_stats_spearman

define function correlation
   (data1 :: <gsl-vector>, data2 :: <gsl-vector>)
=> (correlation :: <double-float>)
  gsl-stats-correlation
    (data1.%gsl-vector-data, 
     data1.gsl-vector-stride, 
     data2.%gsl-vector-data, 
     data2.gsl-vector-stride, data1.size)
end;

define function spearman
    (data1 :: <gsl-vector>, data2 :: <gsl-vector>, work :: <gsl-vector>)
 => (correlation-sd :: <double-float>)
  gsl-stats-spearman
    (data1.%gsl-vector-data, 
     data1.gsl-vector-stride, 
     data2.%gsl-vector-data, 
     data2.gsl-vector-stride, 
     data1.size, 
     work.%gsl-vector-data)
end;
