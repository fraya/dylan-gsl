Module: gsl-statistics-impl
Synopsis: Robust location estimates
Author: Fernando Raya
Copyright: Copyright (C) 2026, Dylan Hackers. All rights reserved.
License: See LICENSE in this distribution for details.
Reference: https://www.gnu.org/software/gsl/doc/html/statistics.html#robust-location-estimates
           https://www.gnu.org/software/gsl/doc/html/statistics.html#c.gsl_stats_trmean_from_sorted_data
           https://www.gnu.org/software/gsl/doc/html/statistics.html#gastwirth-estimator
           https://www.gnu.org/software/gsl/doc/html/statistics.html#c.gsl_stats_gastwirth_from_sorted_data

define function trimmed-mean
    (sorted-data :: <gsl-vector>, alpha :: <double-float>)
 => (trimmed-mean :: <double-float>)
  gsl-stats-trmean-from-sorted-data
    (alpha, sorted-data.%gsl-vector-data, sorted-data.gsl-vector-stride, sorted-data.size)
end;

define function gastwirth-estimator
    (sorted-data :: <gsl-vector>)
 => (gastwirth-estimator :: <double-float>)
  gsl-stats-gastwirth-from-sorted-data
    (sorted-data.%gsl-vector-data, sorted-data.gsl-vector-stride, sorted-data.size)
end;