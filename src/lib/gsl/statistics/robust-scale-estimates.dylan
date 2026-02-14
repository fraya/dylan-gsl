Module: gsl-statistics-impl
Synopsis: Robust location estimates
Author: Fernando Raya
Copyright: Copyright (C) 2026, Dylan Hackers. All rights reserved.
License: See LICENSE in this distribution for details.
Reference: https://www.gnu.org/software/gsl/doc/html/statistics.html#robust-location-estimates
           https://www.gnu.org/software/gsl/doc/html/statistics.html#c.gsl_stats_trmean_from_sorted_data
           https://www.gnu.org/software/gsl/doc/html/statistics.html#gastwirth-estimator
           https://www.gnu.org/software/gsl/doc/html/statistics.html#c.gsl_stats_gastwirth_from_sorted_data

define function mad0
    (data :: <vector-double-float>,
     #key stride :: <integer> = 1)
 => (mad0 :: <double-float>)
  let n = data.size;
  with-c-double-array (c-data = data)
    with-stack-structure (work :: <c-double*>, element-count: n)
      gsl-stats-mad0(c-data, stride, n, work)
    end;
  end
end;

define function mad
    (data :: <vector-double-float>,
     #key stride :: <integer> = 1)
 => (mad :: <double-float>)
  let n = data.size;
  with-c-double-array (c-data = data)
    with-stack-structure (work :: <c-double*>, element-count: n)
      gsl-stats-mad(c-data, stride, n, work)
    end;
  end
end;