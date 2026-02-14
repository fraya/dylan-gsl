Module: gsl-statistics-impl
Synopsis: Order statistics
Author: Fernando Raya
Copyright: Copyright (C) 2026, Dylan Hackers. All rights reserved.
License: See LICENSE in this distribution for details.
Reference: https://www.gnu.org/software/gsl/doc/html/statistics.html#order-statistics
           https://www.gnu.org/software/gsl/doc/html/statistics.html#c.gsl_stats_select

define function kth-order-statistic
    (data :: <vector-double-float>,
     k :: <integer>,
     #key stride :: <integer> = 1)
 => (kth-order-statistic :: <double-float>)
  with-c-double-array (c-data = data)
    gsl-stats-select(c-data, stride, data.size, k)
  end
end;