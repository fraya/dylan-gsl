Module: gsl-ffi-statistics-impl
Synopsis: Covariance
Author: Fernando Raya
Copyright: Copyright (C) 2026, Dylan Hackers. All rights reserved.
License: See LICENSE in this distribution for details.
Reference: https://www.gnu.org/software/gsl/doc/html/statistics.html#covariance
           https://www.gnu.org/software/gsl/doc/html/statistics.html#c.gsl_stats_covariance
           https://www.gnu.org/software/gsl/doc/html/statistics.html#c.gsl_stats_covariance_m

define c-function gsl-stats-covariance
  input parameter data1 :: <c-double*>;
  input parameter stride1 :: <c-size-t>;
  input parameter data2 :: <c-double*>;
  input parameter stride2 :: <c-size-t>;
  input parameter n :: <c-size-t>;
  result covariance :: <c-double>;
  c-name: "gsl_stats_covariance";
end;

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
