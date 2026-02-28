Module: gsl-ffi-running-statistics-impl
Synopsis: Module for running statistics in dylan-gsl
Author: Fernando Raya
Copyright: Copyright (C) 2026, Dylan Hackers. All rights reserved.
License: See LICENSE in this distribution for details.
Reference: https://www.gnu.org/software/gsl/doc/html/rstat.html

define c-struct <gsl-rstat-workspace>
  pointer-type-name: <gsl-rstat-workspace*>;
end;

//////////////////////////////////////////////////////////////////////////////
//
// Initializing the Accumulator
//
//////////////////////////////////////////////////////////////////////////////

// https://www.gnu.org/software/gsl/doc/html/rstat.html#c.gsl_rstat_alloc

define c-function gsl-rstat-alloc
  result workspace :: <gsl-rstat-workspace*>;
  c-name: "gsl_rstat_alloc";
end;

// https://www.gnu.org/software/gsl/doc/html/rstat.html#c.gsl_rstat_free

define c-function gsl-rstat-free
  input parameter workspace :: <gsl-rstat-workspace*>;
  c-name: "gsl_rstat_free";
end;

// https://www.gnu.org/software/gsl/doc/html/rstat.html#c.gsl_rstat_reset

define c-function gsl-rstat-reset
  input parameter workspace :: <gsl-rstat-workspace*>;
  c-name: "gsl_rstat_reset";
end;

//////////////////////////////////////////////////////////////////////////////
//
// Adding Data to the Accumulator
//
//////////////////////////////////////////////////////////////////////////////

// https://www.gnu.org/software/gsl/doc/html/rstat.html#c.gsl_rstat_add

define c-function gsl-rstat-add
  input parameter workspace :: <gsl-rstat-workspace*>;
  input parameter x :: <c-double>;
  c-name: "gsl_rstat_add";
end;

// https://www.gnu.org/software/gsl/doc/html/rstat.html#c.gsl_rstat_n

define c-function gsl-rstat-n
  input parameter workspace :: <gsl-rstat-workspace*>;
  result n :: <c-size-t>;
  c-name: "gsl_rstat_n";
end;

//////////////////////////////////////////////////////////////////////////////
//
// Current Statistics
//
//////////////////////////////////////////////////////////////////////////////

// https://www.gnu.org/software/gsl/doc/html/rstat.html#c.gsl_rstat_min

define c-function gsl-rstat-min
  input parameter workspace :: <gsl-rstat-workspace*>;
  result min :: <c-double>;
  c-name: "gsl_rstat_min";
end;

// https://www.gnu.org/software/gsl/doc/html/rstat.html#c.gsl_rstat_max

define c-function gsl-rstat-max
  input parameter workspace :: <gsl-rstat-workspace*>;
  result max :: <c-double>;
  c-name: "gsl_rstat_max";
end;

// https://www.gnu.org/software/gsl/doc/html/rstat.html#c.gsl_rstat_max

define c-function gsl-rstat-mean
  input parameter workspace :: <gsl-rstat-workspace*>;
  result mean :: <c-double>;
  c-name: "gsl_rstat_mean";
end;

// https://www.gnu.org/software/gsl/doc/html/rstat.html#c.gsl_rstat_variance

define c-function gsl-rstat-variance
  input parameter workspace :: <gsl-rstat-workspace*>;
  result variance :: <c-double>;
  c-name: "gsl_rstat_variance";
end;

// https://www.gnu.org/software/gsl/doc/html/rstat.html#c.gsl_rstat_sd

define c-function gsl-rstat-sd
  input parameter workspace :: <gsl-rstat-workspace*>;
  result sd :: <c-double>;
  c-name: "gsl_rstat_sd";
end;

// https://www.gnu.org/software/gsl/doc/html/rstat.html#c.gsl_rstat_sd_mean

define c-function gsl-rstat-sd-mean
  input parameter workspace :: <gsl-rstat-workspace*>;
  result sd-mean :: <c-double>;
  c-name: "gsl_rstat_sd_mean";
end;

// https://www.gnu.org/software/gsl/doc/html/rstat.html#c.gsl_rstat_rms

define c-function gsl-rstat-rms
  input parameter workspace :: <gsl-rstat-workspace*>;
  result rms :: <c-double>;
  c-name: "gsl_rstat_rms";
end;

// https://www.gnu.org/software/gsl/doc/html/rstat.html#c.gsl_rstat_skew

define c-function gsl-rstat-skew
  input parameter workspace :: <gsl-rstat-workspace*>;
  result skew :: <c-double>;
  c-name: "gsl_rstat_skew";
end;

// https://www.gnu.org/software/gsl/doc/html/rstat.html#c.gsl_rstat_kurtosis

define c-function gsl-rstat-kurtosis
  input parameter workspace :: <gsl-rstat-workspace*>;
  result kurtosis :: <c-double>;
  c-name: "gsl_rstat_kurtosis";
end;

// https://www.gnu.org/software/gsl/doc/html/rstat.html#c.gsl_rstat_median

define c-function gsl-rstat-median
  input parameter workspace :: <gsl-rstat-workspace*>;
  result median :: <c-double>;
  c-name: "gsl_rstat_median";
end;

// https://www.gnu.org/software/gsl/doc/html/rstat.html#c.gsl_rstat_norm

define c-function gsl-rstat-norm
  input parameter workspace :: <gsl-rstat-workspace*>;
  result norm :: <c-double>;
  c-name: "gsl_rstat_norm";
end;

//////////////////////////////////////////////////////////////////////////////
//
// Quantiles
//
//////////////////////////////////////////////////////////////////////////////

// https://www.gnu.org/software/gsl/doc/html/rstat.html#c.gsl_rstat_quantile

define c-struct <gsl-rstat-quantile-workspace>
  pointer-type-name: <gsl-rstat-quantile-workspace*>;
end;

// https://www.gnu.org/software/gsl/doc/html/rstat.html#c.gsl_rstat_quantile_alloc

define c-function gsl-rstat-quantile-alloc
  input parameter p :: <c-double>;
  result workspace :: <gsl-rstat-quantile-workspace*>;
  c-name: "gsl_rstat_quantile_alloc";
end;

// https://www.gnu.org/software/gsl/doc/html/rstat.html#c.gsl_rstat_quantile_free

define c-function gsl-rstat-quantile-free
  input parameter workspace :: <gsl-rstat-quantile-workspace*>;
  c-name: "gsl_rstat_quantile_free";
end;

// https://www.gnu.org/software/gsl/doc/html/rstat.html#c.gsl_rstat_quantile_reset

define c-function gsl-rstat-quantile-reset
  input parameter workspace :: <gsl-rstat-quantile-workspace*>;
  result reset :: <c-int>;
  c-name: "gsl_rstat_quantile_reset";
end;

// https://www.gnu.org/software/gsl/doc/html/rstat.html#c.gsl_rstat_quantile_add

define c-function gsl-rstat-quantile-add
  input parameter x :: <c-double>;
  input parameter workspace :: <gsl-rstat-quantile-workspace*>;
  result add :: <c-int>;
  c-name: "gsl_rstat_quantile_add";
end;

// https://www.gnu.org/software/gsl/doc/html/rstat.html#c.gsl_rstat_quantile_get

define c-function gsl-rstat-quantile-get
  input parameter workspace :: <gsl-rstat-quantile-workspace*>;
  result quantile :: <c-double>;
  c-name: "gsl_rstat_quantile_get";
end;