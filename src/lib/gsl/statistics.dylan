Module: gsl-statistics-impl
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
// https://www.gnu.org/software/gsl/doc/html/statistics.html#mean-standard-deviation-and-variance
// https://www.gnu.org/software/gsl/doc/html/statistics.html#c.gsl_stats_mean
// https://www.gnu.org/software/gsl/doc/html/statistics.html#c.gsl_stats_variance
// https://www.gnu.org/software/gsl/doc/html/statistics.html#c.gsl_stats_variance_m
// https://www.gnu.org/software/gsl/doc/html/statistics.html#c.gsl_stats_sd
// https://www.gnu.org/software/gsl/doc/html/statistics.html#c.gsl_stats_sd_m
// https://www.gnu.org/software/gsl/doc/html/statistics.html#c.gsl_stats_tss
// https://www.gnu.org/software/gsl/doc/html/statistics.html#c.gsl_stats_tss_m
// https://www.gnu.org/software/gsl/doc/html/statistics.html#c.gsl_stats_variance_with_fixed_mean
// https://www.gnu.org/software/gsl/doc/html/statistics.html#c.gsl_stats_sd_with_fixed_mean
//
///////////////////////////////////////////////////////////////////////////////

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

///////////////////////////////////////////////////////////////////////////////
//
// Absolute deviation 
//
// https://www.gnu.org/software/gsl/doc/html/statistics.html#absolute-deviation
//
// https://www.gnu.org/software/gsl/doc/html/statistics.html#absolute-deviation
// https://www.gnu.org/software/gsl/doc/html/statistics.html#c.gsl_stats_absdev
// https://www.gnu.org/software/gsl/doc/html/statistics.html#c.gsl_stats_absdev_m
//
///////////////////////////////////////////////////////////////////////////////

define function absdev
    (data :: <gsl-vector>,
    #key mean :: <double-float?> = #f)
 => (abs-dev :: <double-float>) 
  if (mean)
    gsl-stats-absdev-m
      (data.%gsl-vector-data, data.gsl-vector-stride, data.size, mean)
  else
    gsl-stats-absdev
      (data.%gsl-vector-data, data.gsl-vector-stride, data.size)
  end
end;

///////////////////////////////////////////////////////////////////////////////
//
// Higher moments (skewness and kurtosis)
//
// https://www.gnu.org/software/gsl/doc/html/statistics.html#higher-moments-skewness-and-kurtosis
//
// https://www.gnu.org/software/gsl/doc/html/statistics.html#c.gsl_stats_skew
// https://www.gnu.org/software/gsl/doc/html/statistics.html#c.gsl_stats_kurtosis
// https://www.gnu.org/software/gsl/doc/html/statistics.html#c.gsl_stats_skew_m
// https://www.gnu.org/software/gsl/doc/html/statistics.html#c.gsl_stats_kurtosis_m
//
///////////////////////////////////////////////////////////////////////////////

define function skew
    (data :: <gsl-vector>,
    #key mean :: <double-float?> = #f,
         sd :: <double-float?> = #f)
 => (skewness :: <double-float>)
  if (mean & sd)
    gsl-stats-skew-m-sd
      (data.%gsl-vector-data, data.gsl-vector-stride, data.size, mean, sd)
  else
    gsl-stats-skew
      (data.%gsl-vector-data, data.gsl-vector-stride, data.size)
  end
end;

define function kurtosis
    (data :: <gsl-vector>,
    #key mean :: <double-float?> = #f,
         sd :: <double-float?> = #f)
 => (kurtosis :: <double-float>)
  if (mean & sd)
    gsl-stats-kurtosis-m-sd
      (data.%gsl-vector-data, data.gsl-vector-stride, data.size, mean, sd)
  else
    gsl-stats-kurtosis(
      data.%gsl-vector-data, data.gsl-vector-stride, data.size)
  end
end;

///////////////////////////////////////////////////////////////////////////////
//
// Autocorrelation
//
// https://www.gnu.org/software/gsl/doc/html/statistics.html#autocorrelation
//
// https://www.gnu.org/software/gsl/doc/html/statistics.html#c.gsl_stats_lag1_autocorrelation
// https://www.gnu.org/software/gsl/doc/html/statistics.html#c.gsl_stats_lag1_autocorrelation_m
//
///////////////////////////////////////////////////////////////////////////////

define function lag1-autocorrelation
    (data :: <gsl-vector>, 
    #key mean :: <double-float?> = #f) 
 => (autocorrelation :: <double-float>)
  if (mean)
    gsl-stats-lag1-autocorrelation-m
      (data.%gsl-vector-data, data.gsl-vector-stride, data.size, mean)
  else
    gsl-stats-lag1-autocorrelation
      (data.%gsl-vector-data, data.gsl-vector-stride, data.size)
  end if;
end;

///////////////////////////////////////////////////////////////////////////////
//
// Covariance
//
// https://www.gnu.org/software/gsl/doc/html/statistics.html#covariance
//
// https://www.gnu.org/software/gsl/doc/html/statistics.html#c.gsl_stats_covariance
// https://www.gnu.org/software/gsl/doc/html/statistics.html#c.gsl_stats_covariance_m
//
///////////////////////////////////////////////////////////////////////////////

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

///////////////////////////////////////////////////////////////////////////////
//
// Correlation
//
// https://www.gnu.org/software/gsl/doc/html/statistics.html#correlation
//
// https://www.gnu.org/software/gsl/doc/html/statistics.html#c.gsl_stats_correlation
// https://www.gnu.org/software/gsl/doc/html/statistics.html#c.gsl_stats_spearman
//
///////////////////////////////////////////////////////////////////////////////

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

///////////////////////////////////////////////////////////////////////////////
//
// Weighted Samples
//
// https://www.gnu.org/software/gsl/doc/html/statistics.html#weighted-samples
//
// https://www.gnu.org/software/gsl/doc/html/statistics.html#c.gsl_stats_wmean
// https://www.gnu.org/software/gsl/doc/html/statistics.html#c.gsl_stats_wvariance
// https://www.gnu.org/software/gsl/doc/html/statistics.html#c.gsl_stats_wvariance_m
// https://www.gnu.org/software/gsl/doc/html/statistics.html#c.gsl_stats_wsd
// https://www.gnu.org/software/gsl/doc/html/statistics.html#c.gsl_stats_wsd_m
// https://www.gnu.org/software/gsl/doc/html/statistics.html#c.gsl_stats_wvariance_with_fixed_mean
// https://www.gnu.org/software/gsl/doc/html/statistics.html#c.gsl_stats_wsd_with_fixed_mean
// https://www.gnu.org/software/gsl/doc/html/statistics.html#c.gsl_stats_wtss
// https://www.gnu.org/software/gsl/doc/html/statistics.html#c.gsl_stats_wtss_m
// https://www.gnu.org/software/gsl/doc/html/statistics.html#c.gsl_stats_wabsdev
// https://www.gnu.org/software/gsl/doc/html/statistics.html#c.gsl_stats_wabsdev_m
// https://www.gnu.org/software/gsl/doc/html/statistics.html#c.gsl_stats_wskew
// https://www.gnu.org/software/gsl/doc/html/statistics.html#c.gsl_stats_wkurtosis
// https://www.gnu.org/software/gsl/doc/html/statistics.html#c.gsl_stats_wkurtosis_m_sd
//
///////////////////////////////////////////////////////////////////////////////

define function wmean
    (weights :: <gsl-vector>, data :: <gsl-vector>)
 => (wmean :: <double-float>)
  gsl-stats-wmean
    (weights.%gsl-vector-data, 
     weights.gsl-vector-stride, 
     data.%gsl-vector-data, 
     data.gsl-vector-stride, 
     data.size)
end;

define function wvariance
    (weights :: <gsl-vector>, data :: <gsl-vector>,
     #key mean :: <double-float?> = #f,
          population? :: <boolean> = #f)
 => (wvariance :: <double-float>)
  if (mean)
    if (population?)
      gsl-stats-wvariance-with-fixed-mean(
        weights.%gsl-vector-data, 
        weights.gsl-vector-stride,
        data.%gsl-vector-data, 
        data.gsl-vector-stride, 
        data.size, 
        mean)
    else
      gsl-stats-wvariance-m(
        weights.%gsl-vector-data, 
        weights.gsl-vector-stride,
        data.%gsl-vector-data, 
        data.gsl-vector-stride, 
        data.size, 
        mean)
    end if;
  else
    gsl-stats-wvariance(
      weights.%gsl-vector-data, 
      weights.gsl-vector-stride,
      data.%gsl-vector-data, 
      data.gsl-vector-stride, 
      data.size)
  end if;
end;

define function wsd
    (weights :: <gsl-vector>, data :: <gsl-vector>,
     #key mean :: <double-float?> = #f)
 => (wsd :: <double-float>)
  if (mean)
    gsl-stats-wsd-m(
      weights.%gsl-vector-data, 
      weights.gsl-vector-stride,
      data.%gsl-vector-data, 
      data.gsl-vector-stride, 
      data.size, 
      mean)
  else
    gsl-stats-wsd(
      weights.%gsl-vector-data, 
      weights.gsl-vector-stride,
      data.%gsl-vector-data, 
      data.gsl-vector-stride, 
      data.size)
  end if;
end;

define function wtss
    (weights :: <gsl-vector>, data :: <gsl-vector>,
     #key mean :: <double-float?> = #f)
 => (wtss :: <double-float>)
  if (mean)
    gsl-stats-wtss-m(
      weights.%gsl-vector-data, 
      weights.gsl-vector-stride,
      data.%gsl-vector-data, 
      data.gsl-vector-stride, 
      data.size, 
      mean)
  else
    gsl-stats-wtss(
      weights.%gsl-vector-data, 
      weights.gsl-vector-stride,
      data.%gsl-vector-data, 
      data.gsl-vector-stride, 
      data.size)
  end if;
end;

define function wabs-dev
    (weights :: <gsl-vector>, data :: <gsl-vector>,
     #key mean :: <double-float?> = #f)
 => (wabsdev :: <double-float>)
  if (mean)
    gsl-stats-wabsdev-m(
      weights.%gsl-vector-data, 
      weights.gsl-vector-stride,
      data.%gsl-vector-data, 
      data.gsl-vector-stride, 
      data.size, 
      mean)
  else
    gsl-stats-wabsdev(
      weights.%gsl-vector-data, 
      weights.gsl-vector-stride,
      data.%gsl-vector-data, 
      data.gsl-vector-stride, 
      data.size)
  end if;
end;

define function wskew
    (weights :: <gsl-vector>, data :: <gsl-vector>)
 => (wskew :: <double-float>)
  gsl-stats-wskew(
    weights.%gsl-vector-data, 
    weights.gsl-vector-stride,
    data.%gsl-vector-data, 
    data.gsl-vector-stride, 
    data.size)
end;

define function wkurtosis
    (weights :: <gsl-vector>, data :: <gsl-vector>,
     #key mean :: <double-float?> = #f,
          sd :: <double-float?> = #f)
 => (wkurtosis :: <double-float>)
  case
    mean & sd
      => gsl-stats-wkurtosis-m-sd(
           weights.%gsl-vector-data, 
           weights.gsl-vector-stride,
           data.%gsl-vector-data, 
           data.gsl-vector-stride, 
           data.size, 
           mean, 
           sd);
    ~mean & ~sd
      => gsl-stats-wkurtosis(
           weights.%gsl-vector-data, 
           weights.gsl-vector-stride,
           data.%gsl-vector-data, 
           data.gsl-vector-stride, 
           data.size);
    otherwise
      => error("mean and sd must be provided both or none");
  end case;
end;

///////////////////////////////////////////////////////////////////////////////
//
// Maximum and minimum values
//
// https://www.gnu.org/software/gsl/doc/html/statistics.html#maximum-and-minimum-values
//
// https://www.gnu.org/software/gsl/doc/html/statistics.html#c.gsl_stats_max
// https://www.gnu.org/software/gsl/doc/html/statistics.html#c.gsl_stats_min
// https://www.gnu.org/software/gsl/doc/html/statistics.html#c.gsl_stats_minmax
//
///////////////////////////////////////////////////////////////////////////////

define function maximum
    (data :: <gsl-vector>, #key stride :: <integer> = 1)
 => (max :: <double-float>)
  gsl-stats-max(data.%gsl-vector-data, data.gsl-vector-stride, data.size)
end;

define function minimum
    (data :: <gsl-vector>, #key stride :: <integer> = 1)
 => (min :: <double-float>)
  gsl-stats-min(data.%gsl-vector-data, data.gsl-vector-stride, data.size)
end;

define function minimum-maximum
    (data :: <gsl-vector>, #key stride :: <integer> = 1)
 => (minimum :: <double-float>, maximum :: <double-float>)
  gsl-stats-minmax(data.%gsl-vector-data, data.gsl-vector-stride, data.size)
end;

// TODO: https://www.gnu.org/software/gsl/doc/html/statistics.html#c.gsl_stats_max_index
// TODO: https://www.gnu.org/software/gsl/doc/html/statistics.html#c.gsl_stats_min_index
// TODO: https://www.gnu.org/software/gsl/doc/html/statistics.html#c.gsl_stats_minmax_index

///////////////////////////////////////////////////////////////////////////////
//
// Median and Percentiles
//
// https://www.gnu.org/software/gsl/doc/html/statistics.html#median-and-percentiles
//
// https://www.gnu.org/software/gsl/doc/html/statistics.html#c.gsl_stats_median_from_sorted_data
// https://www.gnu.org/software/gsl/doc/html/statistics.html#c.gsl_stats_median
//
///////////////////////////////////////////////////////////////////////////////

define function median
    (data :: <gsl-vector>,
     #key sorted? :: <boolean> = #f) 
 => (median :: <double-float>)
  if (sorted?)
    gsl-stats-median-from-sorted-data
      (data.%gsl-vector-data, data.gsl-vector-stride, data.size)
  else
    gsl-stats-median
      (data.%gsl-vector-data, data.gsl-vector-stride, data.size)
  end if;
end;

///////////////////////////////////////////////////////////////////////////////
//
// Order statistics
//
// https://www.gnu.org/software/gsl/doc/html/statistics.html#order-statistics
//
// https://www.gnu.org/software/gsl/doc/html/statistics.html#c.gsl_stats_select
//
///////////////////////////////////////////////////////////////////////////////

define function kth-order-statistic
    (data :: <gsl-vector>, k :: <integer>)
 => (kth-order-statistic :: <double-float>)
  gsl-stats-select
    (data.%gsl-vector-data, data.gsl-vector-stride, data.size, k)
end;

///////////////////////////////////////////////////////////////////////////////
//
// Robust Location Estimates
//
// https://www.gnu.org/software/gsl/doc/html/statistics.html#robust-location-estimates
//
// https://www.gnu.org/software/gsl/doc/html/statistics.html#c.gsl_stats_trmean_from_sorted_data
// https://www.gnu.org/software/gsl/doc/html/statistics.html#gastwirth-estimator
// https://www.gnu.org/software/gsl/doc/html/statistics.html#c.gsl_stats_gastwirth_from_sorted_data
//
///////////////////////////////////////////////////////////////////////////////

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
// https://www.gnu.org/software/gsl/doc/html/statistics.html#c.gsl_stats_trmean_from_sorted_data
// https://www.gnu.org/software/gsl/doc/html/statistics.html#gastwirth-estimator
// https://www.gnu.org/software/gsl/doc/html/statistics.html#c.gsl_stats_gastwirth_from_sorted_data
//
///////////////////////////////////////////////////////////////////////////////

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

define function sn0
    (sorted-data :: <gsl-vector>)
 => (sn0 :: <double-float>)
 let n = sorted-data.size;
 with-stack-structure (work :: <c-double*>, element-count: n)
   gsl-stats-sn0-from-sorted-data
     (sorted-data.%gsl-vector-data, sorted-data.gsl-vector-stride, n, work)
 end
end;

define function sn
    (sorted-data :: <gsl-vector>)
 => (sn :: <double-float>)
 let n = sorted-data.size;
 with-stack-structure (work :: <c-double*>, element-count: n)
   gsl-stats-sn-from-sorted-data
     (sorted-data.%gsl-vector-data, sorted-data.gsl-vector-stride, n, work)
 end
end;

// TODO: Q_n Statistics
