Module: gsl-ffi-randist-impl
Synopsis: Random distributions
Author: Fernando Raya
Copyright: Copyright (C) 2026, Dylan Hackers. All rights reserved.
License: See LICENSE in this distribution for details.
Reference: https://www.gnu.org/software/gsl/doc/html/randist.html

///////////////////////////////////////////////////////////////////////////////
//
// Gaussian
//
///////////////////////////////////////////////////////////////////////////////

define c-function gsl-ran-gaussian
  parameter r :: <gsl-rng*>;
  parameter sigma :: <c-double>;
  result variate :: <c-double>;
  c-name: "gsl_ran_gaussian";
end;

define c-function gsl-ran-gaussian-pdf
  parameter x :: <c-double>;
  parameter sigma :: <c-double>;
  result pdf :: <c-double>;
  c-name: "gsl_ran_gaussian_pdf";
end;

define c-function gsl-ran-gaussian-ziggurat
  parameter r :: <gsl-rng*>;
  parameter sigma :: <c-double>;
  result sample :: <c-double>;
  c-name: "gsl_ran_gaussian_ziggurat";
end;

define c-function gsl-ran-gaussian-ratio-method
  parameter r :: <gsl-rng*>;
  parameter sigma :: <c-double>;
  result sample :: <c-double>;
  c-name: "gsl_ran_gaussian_ratio_method";
end;

define c-function gsl-cdf-gaussian-p
  parameter x :: <c-double>;
  parameter sigma :: <c-double>;
  result cd :: <c-double>;
  c-name: "gsl_cdf_gaussian_P";
end;

define c-function gsl-cdf-gaussian-q
  parameter x :: <c-double>;
  parameter sigma :: <c-double>;
  result cd :: <c-double>;
  c-name: "gsl_cdf_gaussian_Q";
end;

define c-function gsl-cdf-gaussian-pinv
  parameter x :: <c-double>;
  parameter sigma :: <c-double>;
  result cd :: <c-double>;
  c-name: "gsl_cdf_gaussian_Pinv";
end;

define c-function gsl-cdf-gaussian-qinv
  parameter x :: <c-double>;
  parameter sigma :: <c-double>;
  result cd :: <c-double>;
  c-name: "gsl_cdf_gaussian_Qinv";
end;

///////////////////////////////////////////////////////////////////////////////
//
// Ugaussian
//
///////////////////////////////////////////////////////////////////////////////

define c-function gsl-ran-ugaussian
  parameter r :: <gsl-rng*>;
  result sample :: <c-double>;
  c-name: "gsl_ran_ugaussian";
end;

define c-function gsl-ran-ugaussian-pdf
  parameter x :: <c-double>;
  result sample :: <c-double>;
  c-name: "gsl_ran_ugaussian_pdf";
end;

define c-function gsl-ran-ugaussian-ratio-method
  parameter r :: <gsl-rng*>;
  result v :: <c-double>;
  c-name: "gsl_ran_ugaussian_ratio_method";
end;

define c-function gsl-cdf-ugaussian-p
  parameter x :: <c-double>;
  result cd :: <c-double>;
  c-name: "gsl_cdf_ugaussian_P";
end;

define c-function gsl-cdf-ugaussian-q
  parameter x :: <c-double>;
  result cd :: <c-double>;
  c-name: "gsl_cdf_ugaussian_Q";
end;

define c-function gsl-cdf-ugaussian-pinv
  parameter x :: <c-double>;
  result cd :: <c-double>;
  c-name: "gsl_cdf_ugaussian_Pinv";
end;

define c-function gsl-cdf-ugaussian-qinv
  parameter x :: <c-double>;
  result cd :: <c-double>;
  c-name: "gsl_cdf_ugaussian_Qinv";
end;

///////////////////////////////////////////////////////////////////////////////
//
// Gaussian tail
//
///////////////////////////////////////////////////////////////////////////////

define c-function gsl-ran-gaussian-tail
  parameter rng :: <gsl-rng*>;
  parameter a :: <c-double>;
  parameter sigma :: <c-double>;
  result variate :: <c-double>;
  c-name: "gsl_ran_gaussian_tail";
end;

define c-function gsl-ran-gaussian-tail-pdf
  parameter x :: <c-double>;
  parameter a :: <c-double>;
  parameter sigma :: <c-double>;
  result pd :: <c-double>;
  c-name: "gsl_ran_gaussian_tail_pdf";
end;

///////////////////////////////////////////////////////////////////////////////
//
// Unit Gaussian tail
//
///////////////////////////////////////////////////////////////////////////////

define c-function gsl-ran-ugaussian-tail
  parameter r :: <gsl-rng*>;
  parameter a :: <c-double>;
  result variate :: <c-double>;
  c-name: "gsl_ran_ugaussian_tail";
end;

define c-function gsl-ran-ugaussian-tail-pdf
  parameter x :: <c-double>;
  parameter a :: <c-double>;
  result pd :: <c-double>;
  c-name: "gsl_ran_ugaussian_tail_pdf";
end;


