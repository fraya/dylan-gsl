Module: gsl-statistics-impl
Synopsis: Weighted samples
Author: Fernando Raya
Copyright: Copyright (C) 2026, Dylan Hackers. All rights reserved.
License: See LICENSE in this distribution for details.
Reference: https://www.gnu.org/software/gsl/doc/html/statistics.html#weighted-samples
           https://www.gnu.org/software/gsl/doc/html/statistics.html#c.gsl_stats_wmean
           https://www.gnu.org/software/gsl/doc/html/statistics.html#c.gsl_stats_wvariance
           https://www.gnu.org/software/gsl/doc/html/statistics.html#c.gsl_stats_wvariance_m
           https://www.gnu.org/software/gsl/doc/html/statistics.html#c.gsl_stats_wsd
           https://www.gnu.org/software/gsl/doc/html/statistics.html#c.gsl_stats_wsd_m
           https://www.gnu.org/software/gsl/doc/html/statistics.html#c.gsl_stats_wvariance_with_fixed_mean
           https://www.gnu.org/software/gsl/doc/html/statistics.html#c.gsl_stats_wsd_with_fixed_mean
           https://www.gnu.org/software/gsl/doc/html/statistics.html#c.gsl_stats_wtss
           https://www.gnu.org/software/gsl/doc/html/statistics.html#c.gsl_stats_wtss_m
           https://www.gnu.org/software/gsl/doc/html/statistics.html#c.gsl_stats_wabsdev
           https://www.gnu.org/software/gsl/doc/html/statistics.html#c.gsl_stats_wabsdev_m
           https://www.gnu.org/software/gsl/doc/html/statistics.html#c.gsl_stats_wskew
           https://www.gnu.org/software/gsl/doc/html/statistics.html#c.gsl_stats_wkurtosis
           https://www.gnu.org/software/gsl/doc/html/statistics.html#c.gsl_stats_wkurtosis_m_sd

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