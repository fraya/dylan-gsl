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
// Unit gaussian
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

///////////////////////////////////////////////////////////////////////////////
//
// Exponential
//
///////////////////////////////////////////////////////////////////////////////

define c-function gsl-ran-exponential
  parameter r :: <gsl-rng*>;
  parameter mu :: <c-double>;
  result variate :: <c-double>;
  c-name: "gsl_ran_exponential";
end;

define c-function gsl-ran-exponential-pdf
  parameter x :: <c-double>;
  parameter mu :: <c-double>;
  result pdf :: <c-double>;
  c-name: "gsl_ran_exponential_pdf";
end;

define c-function gsl-cdf-exponential-p
  parameter x :: <c-double>;
  parameter mu :: <c-double>;
  result cd :: <c-double>;
  c-name: "gsl_cdf_exponential_P";
end;

define c-function gsl-cdf-exponential-q
  parameter x :: <c-double>;
  parameter mu :: <c-double>;
  result cd :: <c-double>;
  c-name: "gsl_cdf_exponential_Q";
end;

define c-function gsl-cdf-exponential-pinv
  parameter x :: <c-double>;
  parameter mu :: <c-double>;
  result cd :: <c-double>;
  c-name: "gsl_cdf_exponential_Pinv";
end;

define c-function gsl-cdf-exponential-qinv
  parameter x :: <c-double>;
  parameter mu :: <c-double>;
  result cd :: <c-double>;
  c-name: "gsl_cdf_exponential_Qinv";
end;

///////////////////////////////////////////////////////////////////////////////
//
// Laplace
//
///////////////////////////////////////////////////////////////////////////////

define c-function gsl-ran-laplace
  parameter r :: <gsl-rng*>;
  parameter a :: <c-double>;
  result variate :: <c-double>;
  c-name: "gsl_ran_laplace";
end;

define c-function gsl-ran-laplace-pdf
  parameter x :: <c-double>;
  parameter a :: <c-double>;
  result pdf :: <c-double>;
  c-name: "gsl_ran_laplace_pdf";
end;

define c-function gsl-cdf-laplace-p
  parameter x :: <c-double>;
  parameter a :: <c-double>;
  result cd :: <c-double>;
  c-name: "gsl_cdf_laplace_P";
end;

define c-function gsl-cdf-laplace-q
  parameter x :: <c-double>;
  parameter a :: <c-double>;
  result cd :: <c-double>;
  c-name: "gsl_cdf_laplace_Q";
end;

define c-function gsl-cdf-laplace-pinv
  parameter p :: <c-double>;
  parameter a :: <c-double>;
  result cd :: <c-double>;
  c-name: "gsl_cdf_laplace_Pinv";
end;

define c-function gsl-cdf-laplace-qinv
  parameter q :: <c-double>;
  parameter sigma :: <c-double>;
  result x :: <c-double>;
  c-name: "gsl_cdf_laplace_Qinv";
end;

///////////////////////////////////////////////////////////////////////////////
//
// Exponentiated Power
//
///////////////////////////////////////////////////////////////////////////////

define c-function gsl-ran-exppow
  parameter r :: <gsl-rng*>;
  parameter a :: <c-double>;
  parameter b :: <c-double>;
  result variate :: <c-double>;
  c-name: "gsl_ran_exppow";
end;

define c-function gsl-ran-exppow-pdf
  parameter x :: <c-double>;
  parameter a :: <c-double>;
  parameter b :: <c-double>;
  result pdf :: <c-double>;
  c-name: "gsl_ran_exppow_pdf";
end;

///////////////////////////////////////////////////////////////////////////////
//
// Cauchy
//
///////////////////////////////////////////////////////////////////////////////

define c-function gsl-ran-cauchy
  parameter r :: <gsl-rng*>;
  parameter a :: <c-double>;
  result variate :: <c-double>;
  c-name: "gsl_ran_cauchy";
end;

define c-function gsl-ran-cauchy-pdf
  parameter x :: <c-double>;
  parameter a :: <c-double>;
  result pdf :: <c-double>;
  c-name: "gsl_ran_cauchy_pdf";
end;

///////////////////////////////////////////////////////////////////////////////
//
// Rayleigh
//
///////////////////////////////////////////////////////////////////////////////

define c-function gsl-ran-rayleigh
  parameter r :: <gsl-rng*>;
  parameter sigma :: <c-double>;
  result variate :: <c-double>;
  c-name: "gsl_ran_rayleigh";
end;

define c-function gsl-ran-rayleigh-pdf
  parameter x :: <c-double>;
  parameter sigma :: <c-double>;
  result pdf :: <c-double>;
  c-name: "gsl_ran_rayleigh_pdf";
end;

define c-function gsl-cdf-rayleigh-p
  parameter x :: <c-double>;
  parameter sigma :: <c-double>;
  result p :: <c-double>;
  c-name: "gsl_cdf_rayleigh_P";
end;

define c-function gsl-cdf-rayleigh-q
  parameter x :: <c-double>;
  parameter sigma :: <c-double>;
  result q :: <c-double>;
  c-name: "gsl_cdf_rayleigh_Q";
end;

define c-function gsl-cdf-rayleigh-pinv
  parameter p :: <c-double>;
  parameter sigma :: <c-double>;
  result x :: <c-double>;
  c-name: "gsl_cdf_rayleigh_Pinv";
end;

define c-function gsl-cdf-rayleigh-qinv
  parameter q :: <c-double>;
  parameter sigma :: <c-double>;
  result x :: <c-double>;
  c-name: "gsl_cdf_rayleigh_Qinv";
end;

///////////////////////////////////////////////////////////////////////////////
//
// Rayleigh Tail
//
///////////////////////////////////////////////////////////////////////////////

define c-function gsl-ran-rayleigh-tail
  parameter r :: <gsl-rng*>;
  parameter a :: <c-double>;
  parameter sigma :: <c-double>;
  result variate :: <c-double>;
  c-name: "gsl_ran_rayleigh_tail";
end;

define c-function gsl-ran-rayleigh-tail-pdf
  parameter x :: <c-double>;
  parameter a :: <c-double>;
  parameter sigma :: <c-double>;
  result pdf :: <c-double>;
  c-name: "gsl_ran_rayleigh_tail_pdf";
end;

///////////////////////////////////////////////////////////////////////////////
//
// Gamma
//
///////////////////////////////////////////////////////////////////////////////

define c-function gsl-ran-gamma
  parameter r :: <gsl-rng*>;
  parameter a :: <c-double>;
  parameter b :: <c-double>;
  result variate :: <c-double>;
  c-name: "gsl_ran_gamma";
end;

define c-function gsl-ran-gamma-knuth
  parameter r :: <gsl-rng*>;
  parameter a :: <c-double>;
  parameter b :: <c-double>;
  result variate :: <c-double>;
  c-name: "gsl_ran_gamma_knuth";
end;

define c-function gsl-ran-gamma-pdf
  parameter x :: <c-double>;
  parameter a :: <c-double>;
  parameter b :: <c-double>;
  result pdf :: <c-double>;
  c-name: "gsl_ran_gamma_pdf";
end;

define c-function gsl-cdf-gamma-p
  parameter x :: <c-double>;
  parameter a :: <c-double>;
  parameter b :: <c-double>;
  result p :: <c-double>;
  c-name: "gsl_cdf_gamma_P";
end;

define c-function gsl-cdf-gamma-q
  parameter x :: <c-double>;
  parameter a :: <c-double>;
  parameter b :: <c-double>;
  result q :: <c-double>;
  c-name: "gsl_cdf_gamma_Q";
end;

define c-function gsl-cdf-gamma-pinv
  parameter x :: <c-double>;
  parameter a :: <c-double>;
  parameter b :: <c-double>;
  result pinv :: <c-double>;
  c-name: "gsl_cdf_gamma_Pinv";
end;

define c-function gsl-cdf-gamma-qinv
  parameter x :: <c-double>;
  parameter a :: <c-double>;
  parameter b :: <c-double>;
  result qinv :: <c-double>;
  c-name: "gsl_cdf_gamma_Qinv";
end;

///////////////////////////////////////////////////////////////////////////////
//
// Flat (Uniform)
//
///////////////////////////////////////////////////////////////////////////////

// define c-function gsl-ran-flat
//  parameter r :: <gsl-rng*>;
//  parameter a :: <c-double>;
//  parameter b :: <c-double>;
//  result variate :: <c-double>;
//  c-name: "gsl_ran_flat";
// end;

// define c-function gsl-ran-flat-pdf
//  parameter x :: <c-double>;
//  parameter a :: <c-double>;
//  parameter b :: <c-double>;
//  result pdf :: <c-double>;
//  c-name: "gsl_ran_flat_pdf";
// end;

///////////////////////////////////////////////////////////////////////////////
//
// Lognormal
//
///////////////////////////////////////////////////////////////////////////////

// define c-function gsl-ran-lognormal
//   parameter r :: <gsl-rng*>;
//   parameter zeta :: <c-double>;
//   parameter sigma :: <c-double>;
//   result variate :: <c-double>;
//   c-name: "gsl_ran_lognormal";
// end;

// define c-function gsl-ran-lognormal-pdf
//   parameter x :: <c-double>;
//   parameter zeta :: <c-double>;
//   parameter sigma :: <c-double>;
//   result pdf :: <c-double>;
//   c-name: "gsl_ran_lognormal_pdf";
// end;

///////////////////////////////////////////////////////////////////////////////
//
// Chi-squared
//
///////////////////////////////////////////////////////////////////////////////

// define c-function gsl-ran-chisq
//   parameter r :: <gsl-rng*>;
//   parameter nu :: <c-double>;
//   result variate :: <c-double>;
//   c-name: "gsl_ran_chisq";
// end;

// define c-function gsl-ran-chisq-pdf
//   parameter x :: <c-double>;
//   parameter nu :: <c-double>;
//   result pdf :: <c-double>;
//   c-name: "gsl_ran_chisq_pdf";
// end;

///////////////////////////////////////////////////////////////////////////////
//
// F of Snedecor
//
///////////////////////////////////////////////////////////////////////////////

// define c-function gsl-ran-fdist
//   parameter r :: <gsl-rng*>;
//   parameter nu1 :: <c-double>;
//   parameter nu2 :: <c-double>;
//   result variate :: <c-double>;
//   c-name: "gsl_ran_fdist";
// end;

// define c-function gsl-ran-fdist-pdf
//   parameter x :: <c-double>;
//   parameter nu1 :: <c-double>;
//   parameter nu2 :: <c-double>;
//   result pdf :: <c-double>;
//   c-name: "gsl_ran_fdist_pdf";
// end;

///////////////////////////////////////////////////////////////////////////////
//
// t de Student
//
///////////////////////////////////////////////////////////////////////////////

// define c-function gsl-ran-tdist
//   parameter r :: <gsl-rng*>;
//   parameter nu :: <c-double>;
//   result variate :: <c-double>;
//   c-name: "gsl_ran_tdist";
// end;

// define c-function gsl-ran-tdist-pdf
//   parameter x :: <c-double>;
//   parameter nu :: <c-double>;
//   result pdf :: <c-double>;
//   c-name: "gsl_ran_tdist_pdf";
// end;

///////////////////////////////////////////////////////////////////////////////
//
// Beta
//
///////////////////////////////////////////////////////////////////////////////

// define c-function gsl-ran-beta
//   parameter r :: <gsl-rng*>;
//   parameter a :: <c-double>;
//   parameter b :: <c-double>;
//   result variate :: <c-double>;
//   c-name: "gsl_ran_beta";
// end;

// define c-function gsl-ran-beta-pdf
//   parameter x :: <c-double>;
//   parameter a :: <c-double>;
//   parameter b :: <c-double>;
//   result pdf :: <c-double>;
//   c-name: "gsl_ran_beta_pdf";
// end;

///////////////////////////////////////////////////////////////////////////////
//
// Landau
//
///////////////////////////////////////////////////////////////////////////////

// define c-function gsl-ran-landau
//   parameter r :: <gsl-rng*>;
//   result variate :: <c-double>;
//   c-name: "gsl_ran_landau";
// end;

// define c-function gsl-ran-landau-pdf
//   parameter x :: <c-double>;
//   result pdf :: <c-double>;
//   c-name: "gsl_ran_landau_pdf";
// end;

///////////////////////////////////////////////////////////////////////////////
//
// Levy
//
///////////////////////////////////////////////////////////////////////////////

// define c-function gsl-ran-levy
//   parameter r :: <gsl-rng*>;
//   parameter c :: <c-double>;
//   parameter alpha :: <c-double>;
//   result variate :: <c-double>;
//   c-name: "gsl_ran_levy";
// end;

// define c-function gsl-ran-levy-skew
//   parameter r :: <gsl-rng*>;
//   parameter c :: <c-double>;
//   parameter alpha :: <c-double>;
//   parameter beta :: <c-double>;
//   result variate :: <c-double>;
//   c-name: "gsl_ran_levy_skew";
// end;

///////////////////////////////////////////////////////////////////////////////
//
// Logistic
//
///////////////////////////////////////////////////////////////////////////////

// define c-function gsl-ran-logistic
//   parameter r :: <gsl-rng*>;
//   parameter a :: <c-double>;
//   result variate :: <c-double>;
//   c-name: "gsl_ran_logistic";
// end;

// define c-function gsl-ran-logistic-pdf
//   parameter x :: <c-double>;
//   parameter a :: <c-double>;
//   result pdf :: <c-double>;
//   c-name: "gsl_ran_logistic_pdf";
// end;

///////////////////////////////////////////////////////////////////////////////
//
// Pareto
//
///////////////////////////////////////////////////////////////////////////////

// define c-function gsl-ran-pareto
//   parameter r :: <gsl-rng*>;
//   parameter a :: <c-double>;
//   parameter b :: <c-double>;
//   result variate :: <c-double>;
//   c-name: "gsl_ran_pareto";
// end;

// define c-function gsl-ran-pareto-pdf
//   parameter x :: <c-double>;
//   parameter a :: <c-double>;
//   parameter b :: <c-double>;
//   result pdf :: <c-double>;
//   c-name: "gsl_ran_pareto_pdf";
// end;

///////////////////////////////////////////////////////////////////////////////
//
// Weibull
//
///////////////////////////////////////////////////////////////////////////////

// define c-function gsl-ran-weibull
//   parameter r :: <gsl-rng*>;
//   parameter a :: <c-double>;
//   parameter b :: <c-double>;
//   result variate :: <c-double>;
//   c-name: "gsl_ran_weibull";
// end;

// define c-function gsl-ran-weibull-pdf
//   parameter x :: <c-double>;
//   parameter a :: <c-double>;
//   parameter b :: <c-double>;
//   result pdf :: <c-double>;
//   c-name: "gsl_ran_weibull_pdf";
// end;

///////////////////////////////////////////////////////////////////////////////
//
// Gumbel
//
///////////////////////////////////////////////////////////////////////////////

// define c-function gsl-ran-gumbel1
//   parameter r :: <gsl-rng*>;
//   parameter a :: <c-double>;
//   parameter b :: <c-double>;
//   result variate :: <c-double>;
//   c-name: "gsl_ran_gumbel1";
// end;

// define c-function gsl-ran-gumbel1-pdf
//   parameter x :: <c-double>;
//   parameter a :: <c-double>;
//   parameter b :: <c-double>;
//   result pdf :: <c-double>;
//   c-name: "gsl_ran_gumbel1_pdf";
// end;

// define c-function gsl-ran-gumbel2
//   parameter r :: <gsl-rng*>;
//   parameter a :: <c-double>;
//   parameter b :: <c-double>;
//   result variate :: <c-double>;
//   c-name: "gsl_ran_gumbel2";
// end;

// define c-function gsl-ran-gumbel2-pdf
//   parameter x :: <c-double>;
//  parameter a :: <c-double>;
//  parameter b :: <c-double>;
//  result pdf :: <c-double>;
//  c-name: "gsl_ran_gumbel2_pdf";
// end;

///////////////////////////////////////////////////////////////////////////////
//
// Spherical Vector Distributions
//
///////////////////////////////////////////////////////////////////////////////

// define c-function gsl-ran-dir-2d
//   parameter r :: <gsl-rng*>;
//   output parameter x :: <c-double*>;
//   output parameter y :: <c-double*>;
//   c-name: "gsl_ran_dir_2d";
// end;

// define c-function gsl-ran-dir-2d-trig-method
//  parameter r :: <gsl-rng*>;
//  output parameter x :: <c-double*>;
//  output parameter y :: <c-double*>;
//  c-name: "gsl_ran_dir_2d_trig_method";
// end;

//define c-function gsl-ran-dir-3d
//  parameter r :: <gsl-rng*>;
//  output parameter x :: <c-double*>;
//  output parameter y :: <c-double*>;
//  output parameter z :: <c-double*>;
//  c-name: "gsl_ran_dir_3d";
// end;

// define c-function gsl-ran-dir-nd
//   parameter r :: <gsl-rng*>;
//   parameter n :: <c-size-t>;
//   parameter x :: <c-double*>;
//   c-name: "gsl_ran_dir_nd";
// end;

///////////////////////////////////////////////////////////////////////////////
//
// Discrete Distributions
//
///////////////////////////////////////////////////////////////////////////////

// define c-struct <gsl-ran-discrete>
//  pointer-type-name: <gsl-ran-discrete*>;
// end;

// define c-function gsl-ran-discrete-preproc
//  parameter K :: <c-size-t>;
//  parameter P :: <c-double*>;
//  result g :: <gsl-ran-discrete*>;
//  c-name: "gsl_ran_discrete_preproc";
// end;

// define c-function gsl-ran-discrete
//  parameter r :: <gsl-rng*>;
//  parameter g :: <gsl-ran-discrete*>;
//  result k :: <c-size-t>;
//  c-name: "gsl_ran_discrete";
// end;

// define c-function gsl-ran-discrete-pdf
//  parameter k :: <c-size-t>;
//  parameter g :: <gsl-ran-discrete*>;
//  result pdf :: <c-double>;
//  c-name: "gsl_ran_discrete_pdf";
// end;

// define c-function gsl-ran-discrete-free
//  parameter g :: <gsl-ran-discrete*>;
//  c-name: "gsl_ran_discrete_free";
// end;

///////////////////////////////////////////////////////////////////////////////
//
// Poisson
//
///////////////////////////////////////////////////////////////////////////////

//define c-function gsl-ran-poisson
//  parameter r :: <gsl-rng*>;
//  parameter mu :: <c-double>;
//  result variate :: <c-unsigned-int>;
//  c-name: "gsl_ran_poisson";
// end;

// define c-function gsl-ran-poisson-pdf
//  parameter k :: <c-unsigned-int>;
//  parameter mu :: <c-double>;
//  result pdf :: <c-double>;
//  c-name: "gsl_ran_poisson_pdf";
// end;

///////////////////////////////////////////////////////////////////////////////
//
// Bernoulli
//
///////////////////////////////////////////////////////////////////////////////

// define c-function gsl-ran-bernoulli
//  parameter r :: <gsl-rng*>;
//  parameter p :: <c-double>;
//  result variate :: <c-unsigned-int>;
//  c-name: "gsl_ran_bernoulli";
// end;

// define c-function gsl-ran-bernoulli-pdf
//  parameter k :: <c-unsigned-int>;
//  parameter p :: <c-double>;
//  result pdf :: <c-double>;
//  c-name: "gsl_ran_bernoulli_pdf";
// end;

///////////////////////////////////////////////////////////////////////////////
//
// Binomial
//
///////////////////////////////////////////////////////////////////////////////

// define c-function gsl-ran-binomial
//  parameter r :: <gsl-rng*>;
//  parameter p :: <c-double>;
//  parameter n :: <c-unsigned-int>;
//  result variate :: <c-unsigned-int>;
//  c-name: "gsl_ran_binomial";
// end;

// define c-function gsl-ran-binomial-pdf
//  parameter k :: <c-unsigned-int>;
//  parameter p :: <c-double>;
//  parameter n :: <c-unsigned-int>;
//  result pdf :: <c-double>;
//  c-name: "gsl_ran_binomial_pdf";
// end;

///////////////////////////////////////////////////////////////////////////////
//
// Multinomial
//
///////////////////////////////////////////////////////////////////////////////

// define c-function gsl-ran-multinomial
//  parameter r :: <gsl-rng*>;
//  parameter K :: <c-size-t>;
//  parameter N :: <c-unsigned-int>;
//  parameter p :: <c-double*>;
//  parameter n :: <c-unsigned-int*>;
//  c-name: "gsl_ran_multinomial";
// end;

// define c-function gsl-ran-multinomial-pdf
//  parameter K :: <c-size-t>;
//  parameter p :: <c-double*>;
//  parameter n :: <c-unsigned-int*>;
//  result pdf :: <c-double>;
//  c-name: "gsl_ran_multinomial_pdf";
// end;

// define c-function gsl-ran-multinomial-lnpdf
//  parameter K :: <c-size-t>;
//  parameter p :: <c-double*>;
//  parameter n :: <c-unsigned-int*>;
//  result lnpdf :: <c-double>;
//  c-name: "gsl_ran_multinomial_lnpdf";
// end;

///////////////////////////////////////////////////////////////////////////////
//
// Discrete additional distributions
//
///////////////////////////////////////////////////////////////////////////////

// define c-function gsl-ran-negative-binomial
//  parameter r :: <gsl-rng*>;
//  parameter p :: <c-double>;
//  parameter n :: <c-double>;
//  result variate :: <c-unsigned-int>;
//  c-name: "gsl_ran_negative_binomial";
// end;

//define c-function gsl-ran-pascal
//  parameter r :: <gsl-rng*>;
//  parameter p :: <c-double>;
//  parameter n :: <c-unsigned-int>;
//  result variate :: <c-unsigned-int>;
//  c-name: "gsl_ran_pascal";
// end;

//define c-function gsl-ran-geometric
//  parameter r :: <gsl-rng*>;
//  parameter p :: <c-double>;
//  result variate :: <c-unsigned-int>;
//  c-name: "gsl_ran_geometric";
// end;

//define c-function gsl-ran-hypergeometric
//  parameter r :: <gsl-rng*>;
//  parameter n1 :: <c-unsigned-int>;
//  parameter n2 :: <c-unsigned-int>;
//  parameter t :: <c-unsigned-int>;
//  result variate :: <c-unsigned-int>;
//  c-name: "gsl_ran_hypergeometric";
// end;

//define c-function gsl-ran-logarithmic
//  parameter r :: <gsl-rng*>;
//  parameter p :: <c-double>;
//  result variate :: <c-unsigned-int>;
//  c-name: "gsl_ran_logarithmic";
// end;

///////////////////////////////////////////////////////////////////////////////
//
// Additional multivariate distributions
//
///////////////////////////////////////////////////////////////////////////////

///////////////////////////////////////////////////////////////////////////////
//
// Dirichlet
//
///////////////////////////////////////////////////////////////////////////////

// define c-function gsl-ran-dirichlet
//  parameter r :: <gsl-rng*>;
//  parameter K :: <c-size-t>;
//  parameter alpha :: <c-double*>;
//  parameter theta :: <c-double*>;
//  c-name: "gsl_ran_dirichlet";
// end;

// define c-function gsl-ran-dirichlet-pdf
//  parameter K :: <c-size-t>;
//  parameter alpha :: <c-double*>;
//  parameter theta :: <c-double*>;
//  result pdf :: <c-double>;
//  c-name: "gsl_ran_dirichlet_pdf";
// end;

// define c-function gsl-ran-dirichlet-lnpdf
//  parameter K :: <c-size-t>;
//  parameter alpha :: <c-double*>;
//  parameter theta :: <c-double*>;
//  result lnpdf :: <c-double>;
//  c-name: "gsl_ran_dirichlet_lnpdf";
// end;

///////////////////////////////////////////////////////////////////////////////
//
// Wishart
//
///////////////////////////////////////////////////////////////////////////////

// define c-struct <gsl-matrix>
//   pointer-type-name: <gsl-matrix*>;
// end;

// define c-function gsl-ran-wishart
//   parameter r :: <gsl-rng*>;
//   parameter n :: <c-double>;
//   parameter L :: <gsl-matrix*>;
//   parameter result-matrix :: <gsl-matrix*>;
//   parameter work :: <gsl-matrix*>;
//   result status :: <c-int>;
//   c-name: "gsl_ran_wishart";
// end;

// define c-function gsl-ran-wishart
//   parameter r :: <gsl-rng*>;
//   parameter n :: <c-double>;
//   parameter L :: <gsl-matrix*>;
//   parameter result-matrix :: <gsl-matrix*>;
//   parameter work :: <gsl-matrix*>;
//   result status :: <c-int>;
//   c-name: "gsl_ran_wishart";
// end;

// define c-function gsl-ran-wishart-pdf
//   parameter X :: <gsl-matrix*>;
//   parameter L_X :: <gsl-matrix*>;
//   parameter n :: <c-double>;
//   parameter L :: <gsl-matrix*>;
//   output parameter result-val :: <c-double*>;
//   parameter work :: <gsl-matrix*>;
//   result status :: <c-int>;
//   c-name: "gsl_ran_wishart_pdf";
// end;

// define c-function gsl-ran-wishart-log-pdf
//   parameter X :: <gsl-matrix*>;
//   parameter L_X :: <gsl-matrix*>;
//   parameter n :: <c-double>;
//   parameter L :: <gsl-matrix*>;
//   output parameter result-val :: <c-double*>;
//   parameter work :: <gsl-matrix*>;
//   result status :: <c-int>;
//   c-name: "gsl_ran_wishart_log_pdf";
// end;

// define c-function gsl-ran-wishart-pdf
//   parameter X :: <gsl-matrix*>;
//   parameter L_X :: <gsl-matrix*>;
//   parameter n :: <c-double>;
//   parameter L :: <gsl-matrix*>;
//   output parameter result-val :: <c-double*>;
//   parameter work :: <gsl-matrix*>;
//   result status :: <c-int>;
//   c-name: "gsl_ran_wishart_pdf";
// end;

// define c-function gsl-ran-wishart-log-pdf
//   parameter X :: <gsl-matrix*>;
//   parameter L_X :: <gsl-matrix*>;
//   parameter n :: <c-double>;
//   parameter L :: <gsl-matrix*>;
//   output parameter result-val :: <c-double*>;
//   parameter work :: <gsl-matrix*>;
//   result status :: <c-int>;
//   c-name: "gsl_ran_wishart_pdf";
// end;

// define c-function gsl-ran-wishart-log-pdf
//   parameter X :: <gsl-matrix*>;
//   parameter L_X :: <gsl-matrix*>;
//   parameter n :: <c-double>;
//   parameter L :: <gsl-matrix*>;
//   output parameter result-val :: <c-double*>;
//   parameter work :: <gsl-matrix*>;
//   result status :: <c-int>;
//   c-name: "gsl_ran_wishart_log_pdf";
// end;

