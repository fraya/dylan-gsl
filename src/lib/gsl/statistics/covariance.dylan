Module: gsl-statistics-impl
Synopsis: Covariance
Author: Fernando Raya
Copyright: Copyright (C) 2026, Dylan Hackers. All rights reserved.
License: See LICENSE in this distribution for details.
Reference: https://www.gnu.org/software/gsl/doc/html/statistics.html#covariance
           https://www.gnu.org/software/gsl/doc/html/statistics.html#c.gsl_stats_covariance
           https://www.gnu.org/software/gsl/doc/html/statistics.html#c.gsl_stats_covariance_m

define function covariance
    (data1 :: <vector>,
     data2 :: <vector>,
    #key stride1 :: <integer> = 1,
         stride2 :: <integer> = 1,
         mean1 :: <double-float?> = #f,
         mean2 :: <double-float?> = #f)
 => (covariance :: <double-float>)
  with-c-double-array (c-data1 = data1)
    with-c-double-array (c-data2 = data2)
      if (mean1 & mean2)
        gsl-stats-covariance-m(c-data1, stride1, c-data2, stride2, data1.size, mean1, mean2)
      else
        gsl-stats-covariance(c-data1, stride1, c-data2, stride2, data1.size)
      end;
    end;
  end;
end;
