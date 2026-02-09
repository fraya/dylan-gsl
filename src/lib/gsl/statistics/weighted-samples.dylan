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
    (weights :: <vector-double-float>,
     data    :: <vector-double-float>,
     #key weights-stride :: <integer> = 1,
          data-stride    :: <integer> = 1)
 => (wmean :: <double-float>)
  with-c-double-array (w-data = weights)
    with-c-double-array (c-data = data)
      gsl-stats-wmean(w-data, weights-stride, c-data, data-stride, data.size)
    end;
  end;
end;

define function wvariance
    (weights :: <vector-double-float>,
     data    :: <vector-double-float>,
     #key weights-stride :: <integer> = 1,
          data-stride    :: <integer> = 1,
          mean           :: <double-float?> = #f,
          population?    :: <boolean> = #f)
 => (wvariance :: <double-float>)
  with-c-double-array (w-data = weights)
    with-c-double-array (c-data = data)
      if (mean)
        if (population?)
          gsl-stats-wvariance-with-fixed-mean(w-data, weights-stride, c-data, data-stride, data.size, mean)
        else
          gsl-stats-wvariance-m(w-data, weights-stride, c-data, data-stride, data.size, mean)
        end
      else
        gsl-stats-wvariance(w-data, weights-stride, c-data, data-stride, data.size)
      end
    end
  end
end;

define function wsd
    (weights :: <vector-double-float>,
     data    :: <vector-double-float>,
     #key weights-stride :: <integer> = 1,
          data-stride    :: <integer> = 1,
          mean           :: <double-float?> = #f)
 => (wsd :: <double-float>)
  with-c-double-array (w-data = weights)
    with-c-double-array (c-data = data)
      if (mean)
        gsl-stats-wsd-m(w-data, weights-stride, c-data, data-stride, data.size, mean)
      else
        gsl-stats-wsd(w-data, weights-stride, c-data, data-stride, data.size)
      end
    end
  end
end;

define function wtss
    (weights :: <vector-double-float>,
     data    :: <vector-double-float>,
     #key weights-stride :: <integer> = 1,
          data-stride    :: <integer> = 1,
          mean           :: <double-float?> = #f)
 => (wtss :: <double-float>)
  with-c-double-array (w-data = weights)
    with-c-double-array (c-data = data)
      if (mean)
        gsl-stats-wtss-m(w-data, weights-stride, c-data, data-stride, data.size, mean)
      else
        gsl-stats-wtss(w-data, weights-stride, c-data, data-stride, data.size)
      end
    end
  end
end;

define function wabs-dev
    (weights :: <vector-double-float>,
     data    :: <vector-double-float>,
     #key weights-stride :: <integer> = 1,
          data-stride    :: <integer> = 1,
          mean           :: <double-float?> = #f)
 => (wabsdev :: <double-float>)
  with-c-double-array (w-data = weights)
    with-c-double-array (c-data = data)
      if (mean)
        gsl-stats-wabsdev-m(w-data, weights-stride, c-data, data-stride, data.size, mean)
      else
        gsl-stats-wabsdev(w-data, weights-stride, c-data, data-stride, data.size)
      end
    end
  end
end;

define function wskew
    (weights :: <vector-double-float>,
     data    :: <vector-double-float>,
     #key weights-stride :: <integer> = 1,
          data-stride    :: <integer> = 1)
 => (wskew :: <double-float>)
  with-c-double-array (w-data = weights)
    with-c-double-array (c-data = data)
      gsl-stats-wskew(w-data, weights-stride, c-data, data-stride, data.size)
    end
  end
end;

define function wkurtosis
    (weights :: <vector-double-float>,
     data    :: <vector-double-float>,
     #key weights-stride :: <integer> = 1,
          data-stride    :: <integer> = 1,
          mean           :: <double-float?> = #f,
          sd             :: <double-float?> = #f)
 => (wkurtosis :: <double-float>)
  with-c-double-array (w-data = weights)
    with-c-double-array (c-data = data)
      case
        mean & sd
          => gsl-stats-wkurtosis-m-sd(w-data, weights-stride, c-data, data-stride, data.size, mean, sd);
        ~mean & ~sd
          => gsl-stats-wkurtosis(w-data, weights-stride, c-data, data-stride, data.size);
        otherwise
          => error("mean and sd must be provided both or none");
      end case;
    end with-c-double-array;
  end with-c-double-array;
end;