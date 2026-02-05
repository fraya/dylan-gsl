Module: gsl-ffi-statistics-impl
Synopsis: Absolute Deviation
Author: Fernando Raya
Copyright: Copyright (C) 2026, Dylan Hackers. All rights reserved.
License: See LICENSE in this distribution for details.
Reference: https://www.gnu.org/software/gsl/doc/html/statistics.html
           https://www.gnu.org/software/gsl/doc/html/statistics.html#absolute-deviation
           https://www.gnu.org/software/gsl/doc/html/statistics.html#c.gsl_stats_absdev
           https://www.gnu.org/software/gsl/doc/html/statistics.html#c.gsl_stats_absdev_m

define c-function gsl-stats-abs-dev
  parameter data :: <c-double*>;
  parameter stride :: <c-size-t>;
  parameter n :: <c-size-t>;
  result mean :: <c-double>;
  c-name: "gsl_stats_absdev";
end;

define c-function gsl-stats-abs-dev-m
  parameter data :: <c-double*>;
  parameter stride :: <c-size-t>;
  parameter n :: <c-size-t>;
  parameter mean :: <c-double>;
  result mean :: <c-double>;
  c-name: "gsl_stats_absdev_m";
end;
