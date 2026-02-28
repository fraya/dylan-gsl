Module: gsl-ffi-statistics-impl
Synopsis: Statistics functions
Author: Fernando Raya
Copyright: Copyright (C) 2026, Dylan Hackers. All rights reserved.
License: See LICENSE in this distribution for details.
Reference: https://www.gnu.org/software/gsl/doc/html/statistics.html

///////////////////////////////////////////////////////////////////////////////
//
// Mean, Standard deviation and Variance
//
// https://www.gnu.org/software/gsl/doc/html/statistics.html#mean-standard-deviation-and-variance
//
///////////////////////////////////////////////////////////////////////////////

// https://www.gnu.org/software/gsl/doc/html/statistics.html#c.gsl_stats_mean

define c-function gsl-stats-mean
  parameter data :: <c-double*>;
  parameter stride :: <c-size-t>;
  parameter n :: <c-size-t>;
  result mean :: <c-double>;
  c-name: "gsl_stats_mean";
end;

// https://www.gnu.org/software/gsl/doc/html/statistics.html#c.gsl_stats_variance

define c-function gsl-stats-variance
  parameter data :: <c-double*>;
  parameter stride :: <c-size-t>;
  parameter n :: <c-size-t>;
  result variance :: <c-double>;
  c-name: "gsl_stats_variance";
end;

// https://www.gnu.org/software/gsl/doc/html/statistics.html#c.gsl_stats_variance_m

define c-function gsl-stats-variance-m
  parameter data :: <c-double*>;
  parameter stride :: <c-size-t>;
  parameter n :: <c-size-t>;
  parameter mean :: <c-double>;
  result variance :: <c-double>;
  c-name: "gsl_stats_variance_m";
end;

// https://www.gnu.org/software/gsl/doc/html/statistics.html#c.gsl_stats_sd

define c-function gsl-stats-sd
  parameter data :: <c-double*>;
  parameter stride :: <c-size-t>;
  parameter n :: <c-size-t>;
  result sd :: <c-double>;
  c-name: "gsl_stats_sd";
end;

// https://www.gnu.org/software/gsl/doc/html/statistics.html#c.gsl_stats_sd_m

define c-function gsl-stats-sd-m
  parameter data :: <c-double*>;
  parameter stride :: <c-size-t>;
  parameter n :: <c-size-t>;
  parameter mean :: <c-double>;
  result sd :: <c-double>;
  c-name: "gsl_stats_sd_m";
end;

// https://www.gnu.org/software/gsl/doc/html/statistics.html#c.gsl_stats_tss

define c-function gsl-stats-tss
  parameter data :: <c-double*>;
  parameter stride :: <c-size-t>;
  parameter n :: <c-size-t>;
  result tss :: <c-double>;
  c-name: "gsl_stats_tss";
end;

// https://www.gnu.org/software/gsl/doc/html/statistics.html#c.gsl_stats_tss_m

define c-function gsl-stats-tss-m
  parameter data :: <c-double*>;
  parameter stride :: <c-size-t>;
  parameter n :: <c-size-t>;
  parameter mean :: <c-double>;
  result tss :: <c-double>;
  c-name: "gsl_stats_tss_m";
end;

// https://www.gnu.org/software/gsl/doc/html/statistics.html#c.gsl_stats_variance_with_fixed_mean

define c-function gsl-stats-variance-with-fixed-mean
  parameter data :: <c-double*>;
  parameter stride :: <c-size-t>;
  parameter n :: <c-size-t>;
  parameter mean :: <c-double>;
  result variance :: <c-double>;
  c-name: "gsl_stats_variance_with_fixed_mean";
end;

// https://www.gnu.org/software/gsl/doc/html/statistics.html#c.gsl_stats_sd_with_fixed_mean

define c-function gsl-stats-sd-with-fixed-mean
  parameter data :: <c-double*>;
  parameter stride :: <c-size-t>;
  parameter n :: <c-size-t>;
  parameter mean :: <c-double>;
  result sd :: <c-double>;
  c-name: "gsl_stats_sd_with_fixed_mean";
end;

///////////////////////////////////////////////////////////////////////////////
//
// Absolute deviation 
//
// https://www.gnu.org/software/gsl/doc/html/statistics.html#absolute-deviation
//
///////////////////////////////////////////////////////////////////////////////

// https://www.gnu.org/software/gsl/doc/html/statistics.html#c.gsl_stats_absdev

define c-function gsl-stats-absdev
  parameter data :: <c-double*>;
  parameter stride :: <c-size-t>;
  parameter n :: <c-size-t>;
  result mean :: <c-double>;
  c-name: "gsl_stats_absdev";
end;


// https://www.gnu.org/software/gsl/doc/html/statistics.html#c.gsl_stats_absdev_m

define c-function gsl-stats-absdev-m
  parameter data :: <c-double*>;
  parameter stride :: <c-size-t>;
  parameter n :: <c-size-t>;
  parameter mean :: <c-double>;
  result mean :: <c-double>;
  c-name: "gsl_stats_absdev_m";
end;

///////////////////////////////////////////////////////////////////////////////
//
// Higher moments (skewness and kurtosis)
//
// https://www.gnu.org/software/gsl/doc/html/statistics.html#higher-moments-skewness-and-kurtosis
//
///////////////////////////////////////////////////////////////////////////////

// https://www.gnu.org/software/gsl/doc/html/statistics.html#c.gsl_stats_skew

define c-function gsl-stats-skew
  input parameter data :: <c-double*>;
  input parameter n :: <c-size-t>;
  input parameter stride :: <c-size-t>;
  result skewness :: <c-double>;
  c-name: "gsl_stats_skew";
end;

// https://www.gnu.org/software/gsl/doc/html/statistics.html#c.gsl_stats_skew_m

define c-function gsl-stats-skew-m-sd
  input parameter data :: <c-double*>;
  input parameter n :: <c-size-t>;
  input parameter stride :: <c-size-t>;
  input parameter mean :: <c-double>;
  input parameter sd :: <c-double>;
  result skewness :: <c-double>;
  c-name: "gsl_stats_skew_m_sd";
end;

// https://www.gnu.org/software/gsl/doc/html/statistics.html#c.gsl_stats_kurtosis

define c-function gsl-stats-kurtosis
  input parameter data :: <c-double*>;
  input parameter n :: <c-size-t>;
  input parameter stride :: <c-size-t>;
  result kurtosis :: <c-double>;
  c-name: "gsl_stats_kurtosis";
end;

// https://www.gnu.org/software/gsl/doc/html/statistics.html#c.gsl_stats_kurtosis_m

define c-function gsl-stats-kurtosis-m-sd
  input parameter data :: <c-double*>;
  input parameter n :: <c-size-t>;
  input parameter stride :: <c-size-t>;
  input parameter mean :: <c-double>;
  input parameter sd :: <c-double>;
  result kurtosis :: <c-double>;
  c-name: "gsl_stats_kurtosis_m_sd";
end;

///////////////////////////////////////////////////////////////////////////////
//
// Autocorrelation
//
// https://www.gnu.org/software/gsl/doc/html/statistics.html#autocorrelation
//
///////////////////////////////////////////////////////////////////////////////

// https://www.gnu.org/software/gsl/doc/html/statistics.html#c.gsl_stats_lag1_autocorrelation

define c-function gsl-stats-lag1-autocorrelation
  input parameter data :: <c-double*>;
  input parameter stride :: <c-size-t>;
  input parameter n :: <c-size-t>;
  result autocorrelation :: <c-double>;
  c-name: "gsl_stats_lag1_autocorrelation";
end;


// https://www.gnu.org/software/gsl/doc/html/statistics.html#c.gsl_stats_lag1_autocorrelation_m

define c-function gsl-stats-lag1-autocorrelation-m
  input parameter data :: <c-double*>;
  input parameter stride :: <c-size-t>;
  input parameter n :: <c-size-t>;
  input parameter mean :: <c-double>;
  result autocorrelation :: <c-double>;
  c-name: "gsl_stats_lag1_autocorrelation_m";
end;

///////////////////////////////////////////////////////////////////////////////
//
// Covariance
//
// https://www.gnu.org/software/gsl/doc/html/statistics.html#covariance
//
///////////////////////////////////////////////////////////////////////////////

// https://www.gnu.org/software/gsl/doc/html/statistics.html#c.gsl_stats_covariance

define c-function gsl-stats-covariance
  input parameter data1 :: <c-double*>;
  input parameter stride1 :: <c-size-t>;
  input parameter data2 :: <c-double*>;
  input parameter stride2 :: <c-size-t>;
  input parameter n :: <c-size-t>;
  result covariance :: <c-double>;
  c-name: "gsl_stats_covariance";
end;

// https://www.gnu.org/software/gsl/doc/html/statistics.html#c.gsl_stats_covariance_m

define c-function gsl-stats-covariance-m
  input parameter data1 :: <c-double*>;
  input parameter stride1 :: <c-size-t>;
  input parameter data2 :: <c-double*>;
  input parameter stride2 :: <c-size-t>;
  input parameter n :: <c-size-t>;
  input parameter mean1 :: <c-double>;
  input parameter mean2 :: <c-double>;
  result covariance :: <c-double>;
  c-name: "gsl_stats_covariance_m";
end;

///////////////////////////////////////////////////////////////////////////////
//
// Correlation
//
// https://www.gnu.org/software/gsl/doc/html/statistics.html#correlation
//
///////////////////////////////////////////////////////////////////////////////

// https://www.gnu.org/software/gsl/doc/html/statistics.html#c.gsl_stats_correlation

define c-function gsl-stats-correlation
  input parameter data1 :: <c-double*>;
  input parameter stride1 :: <c-size-t>;
  input parameter data2 :: <c-double*>;
  input parameter stride2 :: <c-size-t>;
  input parameter n :: <c-size-t>;
  result correlation :: <c-double>;
  c-name: "gsl_stats_correlation";
end;

// https://www.gnu.org/software/gsl/doc/html/statistics.html#c.gsl_stats_spearman

define c-function gsl-stats-spearman
  input parameter data1 :: <c-double*>;
  input parameter stride1 :: <c-size-t>;
  input parameter data2 :: <c-double*>;
  input parameter stride2 :: <c-size-t>;
  input parameter n :: <c-size-t>;
  input parameter work :: <c-double*>;
  result correlation-sd :: <c-double>;
  c-name: "gsl_stats_spearman";
end;

///////////////////////////////////////////////////////////////////////////////
//
// Weighted Samples
//
// https://www.gnu.org/software/gsl/doc/html/statistics.html#weighted-samples
//
///////////////////////////////////////////////////////////////////////////////

// https://www.gnu.org/software/gsl/doc/html/statistics.html#c.gsl_stats_wmean

define c-function gsl-stats-wmean
  parameter w :: <c-double*>;
  parameter wstride :: <c-size-t>;
  parameter data :: <c-double*>;
  parameter stride :: <c-size-t>;
  parameter n :: <c-size-t>;
  result wmean :: <c-double>;
  c-name: "gsl_stats_wmean";
end;

// https://www.gnu.org/software/gsl/doc/html/statistics.html#c.gsl_stats_wvariance

define c-function gsl-stats-wvariance
  parameter w :: <c-double*>;
  parameter wstride :: <c-size-t>;
  parameter data :: <c-double*>;
  parameter stride :: <c-size-t>;
  parameter n :: <c-size-t>;
  result wvariance :: <c-double>;
  c-name: "gsl_stats_wvariance";
end;

// https://www.gnu.org/software/gsl/doc/html/statistics.html#c.gsl_stats_wvariance_m

define c-function gsl-stats-wvariance-m
  parameter w :: <c-double*>;
  parameter wstride :: <c-size-t>;
  parameter data :: <c-double*>;
  parameter stride :: <c-size-t>;
  parameter n :: <c-size-t>;
  parameter mean :: <c-double>;
  result wvariance :: <c-double>;
  c-name: "gsl_stats_wvariance_m";
end;

// https://www.gnu.org/software/gsl/doc/html/statistics.html#c.gsl_stats_wsd

define c-function gsl-stats-wsd
  parameter w :: <c-double*>;
  parameter wstride :: <c-size-t>;
  parameter data :: <c-double*>;
  parameter stride :: <c-size-t>;
  parameter n :: <c-size-t>;
  result wsd :: <c-double>;
  c-name: "gsl_stats_wsd";
end;

// https://www.gnu.org/software/gsl/doc/html/statistics.html#c.gsl_stats_wsd_m

define c-function gsl-stats-wsd-m
  parameter w :: <c-double*>;
  parameter wstride :: <c-size-t>;
  parameter data :: <c-double*>;
  parameter stride :: <c-size-t>;
  parameter n :: <c-size-t>;
  parameter mean :: <c-double>;
  result wsd :: <c-double>;
  c-name: "gsl_stats_wsd_m";
end;

// https://www.gnu.org/software/gsl/doc/html/statistics.html#c.gsl_stats_wvariance_with_fixed_mean

define c-function gsl-stats-wvariance-with-fixed-mean
  parameter w :: <c-double*>;
  parameter wstride :: <c-size-t>;
  parameter data :: <c-double*>;
  parameter stride :: <c-size-t>;
  parameter n :: <c-size-t>;
  parameter mean :: <c-double>;
  result wvariance :: <c-double>;
  c-name: "gsl_stats_wvariance_with_fixed_mean";
end;

// https://www.gnu.org/software/gsl/doc/html/statistics.html#c.gsl_stats_wsd_with_fixed_mean

define c-function gsl-stats-wsd-with-fixed-mean
  parameter w :: <c-double*>;
  parameter wstride :: <c-size-t>;
  parameter data :: <c-double*>;
  parameter stride :: <c-size-t>;
  parameter n :: <c-size-t>;
  parameter mean :: <c-double>;
  result wsd :: <c-double>;
  c-name: "gsl_stats_wsd_with_fixed_mean";
end;

// https://www.gnu.org/software/gsl/doc/html/statistics.html#c.gsl_stats_wtss

define c-function gsl-stats-wtss
  parameter w :: <c-double*>;
  parameter wstride :: <c-size-t>;
  parameter data :: <c-double*>;
  parameter stride :: <c-size-t>;
  parameter n :: <c-size-t>;
  result wtss :: <c-double>;
  c-name: "gsl_stats_wtss";
end;

// https://www.gnu.org/software/gsl/doc/html/statistics.html#c.gsl_stats_wtss_m

define c-function gsl-stats-wtss-m
  parameter w :: <c-double*>;
  parameter wstride :: <c-size-t>;
  parameter data :: <c-double*>;
  parameter stride :: <c-size-t>;
  parameter n :: <c-size-t>;
  parameter mean :: <c-double>;
  result wtss :: <c-double>;
  c-name: "gsl_stats_wtss_m";
end;

// https://www.gnu.org/software/gsl/doc/html/statistics.html#c.gsl_stats_wabsdev

define c-function gsl-stats-wabsdev
  parameter w :: <c-double*>;
  parameter wstride :: <c-size-t>;
  parameter data :: <c-double*>;
  parameter stride :: <c-size-t>;
  parameter n :: <c-size-t>;
  result wabsdev :: <c-double>;
  c-name: "gsl_stats_wabsdev";
end;

// https://www.gnu.org/software/gsl/doc/html/statistics.html#c.gsl_stats_wabsdev_m

define c-function gsl-stats-wabsdev-m
  parameter w :: <c-double*>;
  parameter wstride :: <c-size-t>;
  parameter data :: <c-double*>;
  parameter stride :: <c-size-t>;
  parameter n :: <c-size-t>;
  parameter mean :: <c-double>;
  result wabsdev :: <c-double>;
  c-name: "gsl_stats_wabsdev_m";
end;

// https://www.gnu.org/software/gsl/doc/html/statistics.html#c.gsl_stats_wskew

define c-function gsl-stats-wskew
  parameter w :: <c-double*>;
  parameter wstride :: <c-size-t>;
  parameter data :: <c-double*>;
  parameter stride :: <c-size-t>;
  parameter n :: <c-size-t>;
  result wskew :: <c-double>;
  c-name: "gsl_stats_wskew";
end;

// https://www.gnu.org/software/gsl/doc/html/statistics.html#c.gsl_stats_wkurtosis

define c-function gsl-stats-wkurtosis
  parameter w :: <c-double*>;
  parameter wstride :: <c-size-t>;
  parameter data :: <c-double*>;
  parameter stride :: <c-size-t>;
  parameter n :: <c-size-t>;
  result wkurtosis :: <c-double>;
  c-name: "gsl_stats_wkurtosis";
end;

// https://www.gnu.org/software/gsl/doc/html/statistics.html#c.gsl_stats_wkurtosis_m_sd

define c-function gsl-stats-wkurtosis-m-sd
  parameter w :: <c-double*>;
  parameter wstride :: <c-size-t>;
  parameter data :: <c-double*>;
  parameter stride :: <c-size-t>;
  parameter n :: <c-size-t>;
  parameter mean :: <c-double>;
  parameter sd :: <c-double>;
  result wkurtosis :: <c-double>;
  c-name: "gsl_stats_wkurtosis_m_sd";
end;

///////////////////////////////////////////////////////////////////////////////
//
// Maximum and minimum values
//
// https://www.gnu.org/software/gsl/doc/html/statistics.html#maximum-and-minimum-values
//
///////////////////////////////////////////////////////////////////////////////

// https://www.gnu.org/software/gsl/doc/html/statistics.html#c.gsl_stats_max

define c-function gsl-stats-max
  input parameter data :: <c-double*>;
  input parameter stride :: <c-size-t>;
  input parameter n :: <c-size-t>;
  result maximum :: <c-double>;
  c-name: "gsl_stats_max";
end;

// https://www.gnu.org/software/gsl/doc/html/statistics.html#c.gsl_stats_min

define c-function gsl-stats-min
  input parameter data :: <c-double*>;
  input parameter stride :: <c-size-t>;
  input parameter n :: <c-size-t>;
  result minimum :: <c-double>;
  c-name: "gsl_stats_min";
end;

// https://www.gnu.org/software/gsl/doc/html/statistics.html#c.gsl_stats_minmax

define c-function gsl-stats-minmax
  output parameter minimum :: <c-double*>;
  output parameter maximum :: <c-double*>;
  input parameter data :: <c-double*>;
  input parameter stride :: <c-size-t>;
  input parameter n :: <c-size-t>;
  c-name: "gsl_stats_minmax";
end;

// https://www.gnu.org/software/gsl/doc/html/statistics.html#c.gsl_stats_max_index

define c-function gsl-stats-max-index 
  input parameter data :: <c-double*>;
  input parameter stride :: <c-size-t>;
  input parameter n :: <c-size-t>;
  result max-index :: <c-size-t>;
  c-name: "gsl_stats_max_index";
end;

// https://www.gnu.org/software/gsl/doc/html/statistics.html#c.gsl_stats_min_index

define c-function gsl-stats-min-index 
  input parameter data :: <c-double*>;
  input parameter stride :: <c-size-t>;
  input parameter n :: <c-size-t>;
  result min-index :: <c-size-t>;
  c-name: "gsl_stats_min_index";
end;

// https://www.gnu.org/software/gsl/doc/html/statistics.html#c.gsl_stats_minmax_index

define c-function gsl-stats-minmax-index
  output parameter min-index :: <c-size-t*>;
  output parameter max-index :: <c-size-t*>; 
  input parameter data :: <c-double*>;
  input parameter stride :: <c-size-t>;
  input parameter n :: <c-size-t>;
  c-name: "gsl_stats_minmax_index";
end;

///////////////////////////////////////////////////////////////////////////////
//
// Median and Percentiles
//
// https://www.gnu.org/software/gsl/doc/html/statistics.html#median-and-percentiles
//
///////////////////////////////////////////////////////////////////////////////

define c-function gsl-stats-median-from-sorted-data
  input parameter sorted-data :: <c-double*>;
  input parameter stride :: <c-size-t>;
  input parameter n :: <c-size-t>;
  result median :: <c-double>;
  c-name: "gsl_stats_median_from_sorted_data";
end;

define c-function gsl-stats-median
  input parameter sorted-data :: <c-double*>;
  input parameter stride :: <c-size-t>;
  input parameter n :: <c-size-t>;
  result median :: <c-double>;
  c-name: "gsl_stats_median";
end;

// https://www.gnu.org/software/gsl/doc/html/statistics.html#c.gsl_stats_quantile_from_sorted_data

define c-function gsl-stats-quantile-from-sorted-data
  input parameter sorted-data :: <c-double*>;
  input parameter stride :: <c-size-t>;
  input parameter n :: <c-size-t>;
  input parameter f :: <c-double>;
  result quantile :: <c-double>;
  c-name: "gsl_stats_quantile_from_sorted_data";
end;

///////////////////////////////////////////////////////////////////////////////
//
// Order statistics
//
// https://www.gnu.org/software/gsl/doc/html/statistics.html#order-statistics
//
///////////////////////////////////////////////////////////////////////////////

// https://www.gnu.org/software/gsl/doc/html/statistics.html#c.gsl_stats_select

define c-function gsl-stats-select
  parameter data :: <c-double*>;
  parameter stride :: <c-size-t>;
  parameter n :: <c-size-t>;
  parameter k :: <c-size-t>;
  result kth-order-statistic :: <c-double>;
  c-name: "gsl_stats_select";
end;

///////////////////////////////////////////////////////////////////////////////
//
// Robust Location Estimates
//
// https://www.gnu.org/software/gsl/doc/html/statistics.html#robust-location-estimates
//
///////////////////////////////////////////////////////////////////////////////

// https://www.gnu.org/software/gsl/doc/html/statistics.html#c.gsl_stats_trmean_from_sorted_data

define c-function gsl-stats-trmean-from-sorted-data
  parameter alpha :: <c-double>;
  parameter sorted-data :: <c-double*>;
  parameter stride :: <c-size-t>;
  parameter n :: <c-size-t>;
  result trmean :: <c-double>;
  c-name: "gsl_stats_trmean_from_sorted_data";
end;

// https://www.gnu.org/software/gsl/doc/html/statistics.html#c.gsl_stats_gastwirth_from_sorted_data

define c-function gsl-stats-gastwirth-from-sorted-data
  parameter sorted-data :: <c-double*>;
  parameter stride :: <c-size-t>;
  parameter n :: <c-size-t>;
  result gastwirth :: <c-double>;
  c-name: "gsl_stats_gastwirth_from_sorted_data";
end;

///////////////////////////////////////////////////////////////////////////////
//
// Robust Scale Estimates
//
// https://www.gnu.org/software/gsl/doc/html/statistics.html#robust-scale-estimates
//
///////////////////////////////////////////////////////////////////////////////

///////////////////////////////////////////////////////////////////////////////
//
// Median Absolute Deviation (MAD)
//
// https://www.gnu.org/software/gsl/doc/html/statistics.html#median-absolute-deviation-mad
//
///////////////////////////////////////////////////////////////////////////////

// https://www.gnu.org/software/gsl/doc/html/statistics.html#c.gsl_stats_mad0

define c-function gsl-stats-mad0
  parameter data :: <c-double*>;
  parameter stride :: <c-size-t>;
  parameter n :: <c-size-t>;
  parameter work :: <c-double*>;
  result mad :: <c-double>;
  c-name: "gsl_stats_mad0";
end;

// https://www.gnu.org/software/gsl/doc/html/statistics.html#c.gsl_stats_mad

define c-function gsl-stats-mad
   parameter data :: <c-double*>;
   parameter stride :: <c-size-t>;
   parameter n :: <c-size-t>;
   parameter work :: <c-double*>;
   result mad :: <c-double>;
   c-name: "gsl_stats_mad";
end;

//////////////////////////////////////////////////////////////////////////////
//
// S_n Statistic
//
// https://www.gnu.org/software/gsl/doc/html/statistics.html#s-n-statistic
//
// https://www.gnu.org/software/gsl/doc/html/statistics.html#c.gsl_stats_Sn0_from_sorted_data
// https://www.gnu.org/software/gsl/doc/html/statistics.html#c.gsl_stats_Sn_from_sorted_data
//
//////////////////////////////////////////////////////////////////////////////

define c-function gsl-stats-sn0-from-sorted-data
   parameter sorted-data :: <c-double*>;
   parameter stride :: <c-size-t>;
   parameter n :: <c-size-t>;
   parameter work :: <c-double*>;
   result sn0 :: <c-double>;
   c-name: "gsl_stats_Sn0_from_sorted_data";
end;

define c-function gsl-stats-sn-from-sorted-data
   parameter sorted-data :: <c-double*>;
   parameter stride :: <c-size-t>;
   parameter n :: <c-size-t>;
   parameter work :: <c-double*>;
   result sn :: <c-double>;
   c-name: "gsl_stats_Sn_from_sorted_data";
end;

//////////////////////////////////////////////////////////////////////////////
//
// Q_n Statistic
//
// https://www.gnu.org/software/gsl/doc/html/statistics.html#q-n-statistic
//
// https://www.gnu.org/software/gsl/doc/html/statistics.html#c.gsl_stats_Qn0_from_sorted_data
// https://www.gnu.org/software/gsl/doc/html/statistics.html#c.gsl_stats_Qn_from_sorted_data
//
//////////////////////////////////////////////////////////////////////////////

define c-function gsl-stats-qn0-from-sorted-data
   parameter sorted-data :: <c-double*>;
   parameter stride :: <c-size-t>;
   parameter n :: <c-size-t>;
   parameter work :: <c-double*>;
   parameter work-int :: <c-int*>;
   result qn0 :: <c-double>;
   c-name: "gsl_stats_Qn0_from_sorted_data";
end;

define c-function gsl-stats-qn-from-sorted-data
   parameter sorted-data :: <c-double*>;
   parameter stride :: <c-size-t>;
   parameter n :: <c-size-t>;
   parameter work :: <c-double*>;
   parameter work-int :: <c-int*>;
   result qn :: <c-double>;
   c-name: "gsl_stats_Qn_from_sorted_data";
end;
