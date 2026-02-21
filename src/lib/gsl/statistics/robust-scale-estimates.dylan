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
    (data :: <gsl-vector>)
 => (mad0 :: <double-float>)
  let n = data.size;
  with-stack-structure (work :: <c-double*>, element-count: n)
    gsl-stats-mad0(data.%gsl-vector-data, data.gsl-vector-stride, n, work)
  end
end;

define function mad
    (data :: <gsl-vector>)
 => (mad :: <double-float>)
  let n = data.size;
  with-stack-structure (work :: <c-double*>, element-count: n)
    gsl-stats-mad(data.%gsl-vector-data, data.gsl-vector-stride, n, work)
  end
end;