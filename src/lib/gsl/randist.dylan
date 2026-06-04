Module: gsl-randist-impl
Synopsis: Random number distributions
Author: Fernando Raya
Copyright: Copyright (C) 2026, Dylan Hackers. All rights reserved.
License: See LICENSE in this distribution for details.
Reference: https://www.gnu.org/software/gsl/doc/html/randist.html

///////////////////////////////////////////////////////////////////////////////
//
// The distribution interface
//
///////////////////////////////////////////////////////////////////////////////

define abstract class <gsl-randist> (<object>)
  constant slot %gsl-randist-rng :: <gsl-rng>,
    required-init-keyword: rng:;
end;

define generic gsl-ran-variate
  (d :: <gsl-randist>) => (variate :: <float>);

define generic gsl-ran-pdf
  (d :: <gsl-randist>, x :: <float>) => (pd :: <float>);

define generic gsl-cdf-p
  (d :: <gsl-randist>, x :: <float>) => (cd :: <float>);

define generic gsl-cdf-q
  (d :: <gsl-randist>, x :: <float>) => (cd :: <float>);

define generic gsl-cdf-pinv
  (d :: <gsl-randist>, x :: <float>) => (cd :: <float>);

define generic gsl-cdf-qinv
  (d :: <gsl-randist>, x :: <float>) => (cd :: <float>);

///////////////////////////////////////////////////////////////////////////////
//
// The Gaussian distribution
//
///////////////////////////////////////////////////////////////////////////////

define abstract class <gsl-randist-gaussian> (<gsl-randist>)
  constant slot gsl-randist-sigma :: <float>,
    required-init-keyword: sigma:;
end;

define enum-class <gsl-gaussian-algorithm> (<object>)
  constant slot %gsl-gaussian-algorithm :: <function>,
    required-init-keyword: fn:;
  $gaussian-box-muller (fn: ffi/gsl-ran-gaussian);
  $gaussian-ziggurat (fn: ffi/gsl-ran-gaussian-ziggurat);
  $gaussian-ratio-method (fn: ffi/gsl-ran-gaussian-ratio-method);
end;

define class <gsl-gaussian> (<gsl-randist-gaussian>)
  slot gsl-gaussian-algorithm :: <gsl-gaussian-algorithm>,
    init-keyword: algorithm:,
    init-value: $gaussian-box-muller;
end;

define method gsl-ran-variate
    (d :: <gsl-gaussian>) => (variate :: <float>)
  let rng = d.%gsl-randist-rng.gsl-rng-ffi;
  let sigma = d.gsl-randist-sigma;
  let algorithm = d.gsl-gaussian-algorithm.%gsl-gaussian-algorithm;
  algorithm(rng, sigma)
end;

define method gsl-ran-pdf
    (d :: <gsl-gaussian>, x :: <float>) => (pd :: <float>)
  ffi/gsl-ran-gaussian-pdf(x, d.gsl-randist-sigma)
end;

define method gsl-cdf-p
    (d :: <gsl-gaussian>, x :: <float>) => (cd :: <float>)
  ffi/gsl-cdf-gaussian-p(x, d.gsl-randist-sigma)
end;

define method gsl-cdf-q
    (d :: <gsl-gaussian>, x :: <float>) => (cd :: <float>)
  ffi/gsl-cdf-gaussian-q(x, d.gsl-randist-sigma)
end;

define method gsl-cdf-pinv
    (d :: <gsl-gaussian>, x :: <float>) => (cd :: <float>)
  ffi/gsl-cdf-gaussian-pinv(x, d.gsl-randist-sigma)
end;

define method gsl-cdf-qinv
    (d :: <gsl-gaussian>, x :: <float>) => (cd :: <float>)
  ffi/gsl-cdf-gaussian-qinv(x, d.gsl-randist-sigma)
end;

///////////////////////////////////////////////////////////////////////////////
//
// The Unit Gaussian distribution
//
///////////////////////////////////////////////////////////////////////////////

define enum-class <gsl-ugaussian-algorithm> (<object>)
  constant slot %gsl-ugaussian-algorithm :: <function>,
    required-init-keyword: fn:;
  $ugaussian-default (fn: ffi/gsl-ran-ugaussian);
  $ugaussian-ratio-method (fn: ffi/gsl-ran-ugaussian-ratio-method);
end;

define class <gsl-ugaussian> (<gsl-randist>)
  slot gsl-ugaussian-algorithm :: <gsl-ugaussian-algorithm>,
    init-keyword: algorithm:,
    init-value: $ugaussian-default;
end;

define method gsl-ran-variate
    (d :: <gsl-ugaussian>) => (variate :: <float>)
  let algorithm = d.gsl-ugaussian-algorithm.%gsl-ugaussian-algorithm;
  algorithm(d.%gsl-randist-rng.gsl-rng-ffi)
end;

define method gsl-ran-pdf
    (d :: <gsl-ugaussian>, x :: <float>) => (pd :: <float>)
  ffi/gsl-ran-ugaussian-pdf(x)
end;

define method gsl-cdf-p
    (d :: <gsl-ugaussian>, x :: <float>) => (cd :: <float>)
  ffi/gsl-cdf-ugaussian-p(x)
end;

define method gsl-cdf-q
    (d :: <gsl-ugaussian>, x :: <float>) => (cd :: <float>)
  ffi/gsl-cdf-ugaussian-q(x)
end;

define method gsl-cdf-pinv
    (d :: <gsl-ugaussian>, x :: <float>) => (cd :: <float>)
  ffi/gsl-cdf-ugaussian-pinv(x)
end;

define method gsl-cdf-qinv
    (d :: <gsl-ugaussian>, x :: <float>) => (cd :: <float>)
  ffi/gsl-cdf-ugaussian-qinv(x)
end;

///////////////////////////////////////////////////////////////////////////////
//
// The Tail distribution
//
///////////////////////////////////////////////////////////////////////////////

define abstract class <gsl-randist-tail> (<object>)
  constant slot gsl-randist-a :: <float>,
    required-init-keyword: a:;
end;

///////////////////////////////////////////////////////////////////////////////
//
// The Gaussian tail distribution
//
///////////////////////////////////////////////////////////////////////////////

define class <gsl-gaussian-tail>
    (<gsl-randist-gaussian>, <gsl-randist-tail>)
end;

define method gsl-ran-variate
    (d :: <gsl-gaussian-tail>) => (variate :: <float>)
  let rng = d.%gsl-randist-rng.gsl-rng-ffi;
  let sigma = d.gsl-randist-sigma;
  let a = d.gsl-randist-a;
  ffi/gsl-ran-gaussian-tail(rng, a, sigma);
end;

define method gsl-ran-pdf
    (d :: <gsl-gaussian-tail>, x :: <float>) => (pd :: <float>)
  let sigma = d.gsl-randist-sigma;
  let a = d.gsl-randist-a;
  ffi/gsl-ran-gaussian-tail-pdf(x, a, sigma);
end;

///////////////////////////////////////////////////////////////////////////////
//
// The Unit Gaussian tail distribution
//
///////////////////////////////////////////////////////////////////////////////

define class <gsl-ugaussian-tail>
    (<gsl-ugaussian>, <gsl-randist-tail>)
end;

define method gsl-ran-variate
    (d :: <gsl-ugaussian-tail>) => (variate :: <float>)
  let rng = d.%gsl-randist-rng.gsl-rng-ffi;
  let a = d.gsl-randist-a;
  ffi/gsl-ran-ugaussian-tail(rng, a);
end;

define method gsl-ran-pdf
    (d :: <gsl-ugaussian-tail>, x :: <float>) => (pd :: <float>)
  let a = d.gsl-randist-a;
  ffi/gsl-ran-ugaussian-tail-pdf(x, a);
end;
    
