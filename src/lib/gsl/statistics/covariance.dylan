Module: gsl-statistics-impl
Synopsis: Covariance
Author: Fernando Raya
Copyright: Copyright (C) 2026, Dylan Hackers. All rights reserved.
License: See LICENSE in this distribution for details.
Reference: https://www.gnu.org/software/gsl/doc/html/statistics.html#covariance
           https://www.gnu.org/software/gsl/doc/html/statistics.html#c.gsl_stats_covariance
           https://www.gnu.org/software/gsl/doc/html/statistics.html#c.gsl_stats_covariance_m

define function covariance
    (data1 :: <gsl-vector>, data2 :: <gsl-vector>,
    #key mean1 :: <double-float?> = #f,
         mean2 :: <double-float?> = #f)
 => (covariance :: <double-float>)
  if (mean1 & mean2)
    gsl-stats-covariance-m
      (data1.%gsl-vector-data, 
       data1.gsl-vector-stride, 
       data2.%gsl-vector-data, 
       data2.gsl-vector-stride, 
       data1.size, 
       mean1, 
       mean2)
  else
    gsl-stats-covariance
      (data1.%gsl-vector-data, 
       data1.gsl-vector-stride, 
       data2.%gsl-vector-data, 
       data2.gsl-vector-stride, 
       data1.size)
  end if;
end;
