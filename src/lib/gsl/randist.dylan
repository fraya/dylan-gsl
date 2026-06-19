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

define method print-object
    (d :: <gsl-randist>, stream :: <stream>) => ()
  printing-object(d, stream)
    print(d.%gsl-randist-rng, stream);
  end
end;

define generic gsl-randist-variate
  (d :: <gsl-randist>) => (variate :: <float>);

define generic gsl-randist-pdf
  (d :: <gsl-randist>, x :: <float>) => (pd :: <float>);

define generic gsl-randist-cdf-p
  (d :: <gsl-randist>, x :: <float>) => (cd :: <float>);

define generic gsl-randist-cdf-q
  (d :: <gsl-randist>, x :: <float>) => (cd :: <float>);

define generic gsl-randist-cdf-pinv
  (d :: <gsl-randist>, x :: <float>) => (cd :: <float>);

define generic gsl-randist-cdf-qinv
  (d :: <gsl-randist>, x :: <float>) => (cd :: <float>);


// Default implementations for the generic functions.

define method gsl-randist-variate
    (d :: <gsl-randist>) => (variate :: <float>)
  error(make(<gsl-error-unsupported>))
end;

define method gsl-randist-pdf
    (d :: <gsl-randist>, x :: <float>) => (pd :: <float>)
  error(make(<gsl-error-unsupported>))
end;

define method gsl-randist-cdf-p
    (d :: <gsl-randist>, x :: <float>) => (cd :: <float>)
  error(make(<gsl-error-unsupported>))
end;

define method gsl-randist-cdf-q
    (d :: <gsl-randist>, x :: <float>) => (cd :: <float>)
  error(make(<gsl-error-unsupported>))
end;

define method gsl-randist-cdf-pinv
    (d :: <gsl-randist>, x :: <float>) => (cd :: <float>)
  error(make(<gsl-error-unsupported>))
end;

define method gsl-randist-cdf-qinv
    (d :: <gsl-randist>, x :: <float>) => (cd :: <float>)
  error(make(<gsl-error-unsupported>))
end;


///////////////////////////////////////////////////////////////////////////////
//
// The Gaussian distribution
//
///////////////////////////////////////////////////////////////////////////////

define constant $gaussian-box-muller-method
  = ffi/gsl-ran-gaussian;

define constant $gaussian-ziggurat-method
  = ffi/gsl-ran-gaussian-ziggurat;

define constant $gaussian-ratio-method
  = ffi/gsl-ran-gaussian-ratio-method;

define constant <gaussian-algorithm>
  = one-of($gaussian-box-muller-method,
           $gaussian-ziggurat-method,
           $gaussian-ratio-method);

define class <gsl-randist-gaussian> (<gsl-randist>)
  constant slot gsl-randist-gaussian-sigma :: <float>,
    required-init-keyword: sigma:;
  constant slot %gsl-randist-gaussian-algorithm :: <gaussian-algorithm>,
    init-keyword: algorithm:,
    init-value: $gaussian-box-muller-method;
end;

define method print-object
    (d :: <gsl-randist-gaussian>, stream :: <stream>) => ()
  printing-object(d, stream)
    format(stream, "%= sigma: %=",
           d.%gsl-randist-rng,
           d.gsl-randist-gaussian-sigma);
  end
end;

define method gsl-randist-variate
    (d :: <gsl-randist-gaussian>) => (variate :: <float>)
  let rng   = d.%gsl-randist-rng.gsl-rng-ffi;
  let sigma = d.gsl-randist-gaussian-sigma; 
  d.%gsl-randist-gaussian-algorithm(rng, sigma)
end;

define method gsl-randist-pdf
    (d :: <gsl-randist-gaussian>, x :: <float>) => (pd :: <float>)
  let sigma = d.gsl-randist-gaussian-sigma; 
  ffi/gsl-ran-gaussian-pdf(x, sigma)
end;

define method gsl-randist-cdf-p
    (d :: <gsl-randist-gaussian>, x :: <float>) => (cd :: <float>)
  let sigma = d.gsl-randist-gaussian-sigma; 
  ffi/gsl-cdf-gaussian-p(x, sigma)
end;

define method gsl-randist-cdf-q
    (d :: <gsl-randist-gaussian>, x :: <float>) => (cd :: <float>)
  let sigma = d.gsl-randist-gaussian-sigma;
  ffi/gsl-cdf-gaussian-q(x, sigma)
end;

define method gsl-randist-cdf-pinv
    (d :: <gsl-randist-gaussian>, x :: <float>) => (cd :: <float>)
  let sigma = d.gsl-randist-gaussian-sigma;
  ffi/gsl-cdf-gaussian-pinv(x, sigma)
end;

define method gsl-randist-cdf-qinv
    (d :: <gsl-randist-gaussian>, x :: <float>) => (cd :: <float>)
  let sigma = d.gsl-randist-gaussian-sigma;
  ffi/gsl-cdf-gaussian-qinv(x, sigma)
end;

///////////////////////////////////////////////////////////////////////////////
//
// The Unit Gaussian distribution
//
///////////////////////////////////////////////////////////////////////////////

define constant $ugaussian-method
  = ffi/gsl-ran-ugaussian;

define constant $ugaussian-ratio-method
  = ffi/gsl-ran-ugaussian-ratio-method;

define constant <gsl-randist-ugaussian-algorithm>
  = one-of($ugaussian-method,
           $ugaussian-ratio-method);

define class <gsl-randist-ugaussian> (<gsl-randist>)
  constant slot %gsl-randist-ugaussian-algorithm :: <gsl-randist-ugaussian-algorithm>,
    init-keyword: algorithm:,
    init-value: $ugaussian-method;
end;

define method gsl-randist-variate
    (d :: <gsl-randist-ugaussian>) => (variate :: <float>)
  let rng = d.%gsl-randist-rng.gsl-rng-ffi;
  d.%gsl-randist-ugaussian-algorithm(rng)
end;

define method gsl-randist-pdf
    (d :: <gsl-randist-ugaussian>, x :: <float>) => (pd :: <float>)
  ffi/gsl-ran-ugaussian-pdf(x)
end;

define method gsl-randist-cdf-p
    (d :: <gsl-randist-ugaussian>, x :: <float>) => (cd :: <float>)
  ffi/gsl-cdf-ugaussian-p(x)
end;

define method gsl-randist-cdf-q
    (d :: <gsl-randist-ugaussian>, x :: <float>) => (cd :: <float>)
  ffi/gsl-cdf-ugaussian-q(x)
end;

define method gsl-randist-cdf-pinv
    (d :: <gsl-randist-ugaussian>, x :: <float>) => (cd :: <float>)
  ffi/gsl-cdf-ugaussian-pinv(x)
end;

define method gsl-randist-cdf-qinv
    (d :: <gsl-randist-ugaussian>, x :: <float>) => (cd :: <float>)
  ffi/gsl-cdf-ugaussian-qinv(x)
end;

///////////////////////////////////////////////////////////////////////////////
//
// The Gaussian tail distribution
//
///////////////////////////////////////////////////////////////////////////////

define class <gsl-randist-gaussian-tail> (<gsl-randist-gaussian>)
  constant slot gsl-randist-gaussian-a :: <float>,
    required-init-keyword: a:;
end;

define method initialize
    (d :: <gsl-randist-gaussian-tail>, #key) => ()
  next-method();
  let a = d.gsl-randist-gaussian-a;
  if (a.negative?)
    signal(make(<gsl-error-invalid-argument>))
  end;
end;

define method print-object
    (d :: <gsl-randist-gaussian-tail>, stream :: <stream>) => ()
  printing-object(d, stream)
    format(stream, "%= sigma: %= a: %=",
           d.%gsl-randist-rng,
           d.gsl-randist-gaussian-sigma,
           d.gsl-randist-gaussian-a);
  end
end;

define method gsl-randist-variate
    (d :: <gsl-randist-gaussian-tail>) => (variate :: <float>)
  let rng = d.%gsl-randist-rng.gsl-rng-ffi;
  let a = d.gsl-randist-gaussian-a;
  let sigma = d.gsl-randist-gaussian-sigma;
  ffi/gsl-ran-gaussian-tail(rng, a, sigma)                            
end;

define method gsl-randist-pdf
    (d :: <gsl-randist-gaussian-tail>, x :: <float>) => (pd :: <float>)
  let a = d.gsl-randist-gaussian-a;
  let sigma = d.gsl-randist-gaussian-sigma;
  ffi/gsl-ran-gaussian-tail-pdf(x, a, sigma)
end;

///////////////////////////////////////////////////////////////////////////////
//
// The Unit Gaussian tail distribution
//
///////////////////////////////////////////////////////////////////////////////

define class <gsl-randist-ugaussian-tail> (<gsl-randist>)
  constant slot gsl-randist-ugaussian-a :: <float>,
    required-init-keyword: a:;
end;

define method initialize
    (d :: <gsl-randist-ugaussian-tail>, #key) => ()
  next-method();
  let a = d.gsl-randist-ugaussian-a;
  if (a.negative?)
    signal(make(<gsl-error-invalid-argument>))
  end;
end;

define method print-object
    (d :: <gsl-randist-ugaussian-tail>, stream :: <stream>) => ()
  printing-object(d, stream)
    format(stream, "%= a: %=",
           d.%gsl-randist-rng,
           d.gsl-randist-ugaussian-a, stream);
  end
end;

define method gsl-randist-variate
    (d :: <gsl-randist-ugaussian-tail>) => (variate :: <float>)
  let rng = d.%gsl-randist-rng.gsl-rng-ffi;
  let a = d.gsl-randist-ugaussian-a;
  ffi/gsl-ran-ugaussian-tail(rng, a)
end;

define method gsl-randist-pdf
    (d :: <gsl-randist-ugaussian-tail>, x :: <float>) => (pd :: <float>)
  let a = d.gsl-randist-ugaussian-a;
  ffi/gsl-ran-ugaussian-tail-pdf(x, a)
end;
    
///////////////////////////////////////////////////////////////////////////////
//
// Exponential
//
///////////////////////////////////////////////////////////////////////////////

define class <gsl-randist-exponential> (<gsl-randist>) 
  constant slot gsl-randist-exponential-mu :: <float>,
    required-init-keyword: mu:;
end;

define method print-object
    (d :: <gsl-randist-exponential>, stream :: <stream>) => ()
  printing-object(d, stream)
    format(stream, "%= mu: %=",
           d.%gsl-randist-rng,
           d.gsl-randist-exponential-mu);
  end
end;

define method gsl-randist-variate
    (d :: <gsl-randist-exponential>) => (variate :: <float>)
  let rng = d.%gsl-randist-rng.gsl-rng-ffi;
  let mu = d.gsl-randist-exponential-mu;
  ffi/gsl-ran-exponential(rng, mu)
end;

define method gsl-randist-pdf
    (d :: <gsl-randist-exponential>, x :: <float>) => (pd :: <float>)
  let mu = d.gsl-randist-exponential-mu;
  ffi/gsl-ran-exponential-pdf(x, mu)
end;

define method gsl-randist-cdf-p
    (d :: <gsl-randist-exponential>, x :: <float>) => (cd :: <float>)
  let mu = d.gsl-randist-exponential-mu;
  ffi/gsl-cdf-exponential-p(x, mu)
end;

define method gsl-randist-cdf-q
    (d :: <gsl-randist-exponential>, x :: <float>) => (cd :: <float>)
  let mu = d.gsl-randist-exponential-mu;
  ffi/gsl-cdf-exponential-q(x, mu)
end;

define method gsl-randist-cdf-pinv
    (d :: <gsl-randist-exponential>, x :: <float>) => (cd :: <float>)
  let mu = d.gsl-randist-exponential-mu;
  ffi/gsl-cdf-exponential-pinv(x, mu)
end;

define method gsl-randist-cdf-qinv
    (d :: <gsl-randist-exponential>, x :: <float>) => (cd :: <float>)
  let mu = d.gsl-randist-exponential-mu;
  ffi/gsl-cdf-exponential-qinv(x, mu)
end;

///////////////////////////////////////////////////////////////////////////////
//
// Laplace
//
///////////////////////////////////////////////////////////////////////////////

define class <gsl-randist-laplace> (<gsl-randist>) 
  constant slot gsl-randist-laplace-a :: <float>,
    required-init-keyword: a:;
end;

define method print-object
    (d :: <gsl-randist-laplace>, stream :: <stream>) => ()
  printing-object(d, stream)
    format(stream, "%= a: %=",
           d.%gsl-randist-rng,
           d.gsl-randist-laplace-a);
  end
end;

define method gsl-randist-variate
    (d :: <gsl-randist-laplace>) => (variate :: <float>)
  let rng = d.%gsl-randist-rng.gsl-rng-ffi;
  let a = d.gsl-randist-laplace-a;
  ffi/gsl-ran-laplace(rng, a);
end;

define method gsl-randist-pdf
    (d :: <gsl-randist-laplace>, x :: <float>) => (pd :: <float>)
  let a = d.gsl-randist-laplace-a;
  ffi/gsl-ran-laplace-pdf(x, a);
end;

define method gsl-randist-cdf-p
    (d :: <gsl-randist-laplace>, x :: <float>) => (cd :: <float>)
  let a = d.gsl-randist-laplace-a;
  ffi/gsl-cdf-laplace-p(x, a)
end;

define method gsl-randist-cdf-q
    (d :: <gsl-randist-laplace>, x :: <float>) => (cd :: <float>)
  let a = d.gsl-randist-laplace-a;
  ffi/gsl-cdf-laplace-q(x, a)
end;

define method gsl-randist-cdf-pinv
    (d :: <gsl-randist-laplace>, x :: <float>) => (cd :: <float>)
  let a = d.gsl-randist-laplace-a;
  ffi/gsl-cdf-laplace-pinv(x, a)
end;

define method gsl-randist-cdf-qinv
    (d :: <gsl-randist-laplace>, x :: <float>) => (cd :: <float>)
  let a = d.gsl-randist-laplace-a;
  ffi/gsl-cdf-laplace-qinv(x, a)
end;

///////////////////////////////////////////////////////////////////////////////
//
// Exponentiated Power
//
///////////////////////////////////////////////////////////////////////////////

define class <gsl-randist-exppow> (<gsl-randist>) 
  constant slot gsl-randist-exppow-a :: <float>,
    required-init-keyword: a:;
  constant slot gsl-randist-exppow-b :: <float>,
    required-init-keyword: b:;
end;

define method print-object
    (d :: <gsl-randist-exppow>, stream :: <stream>) => ()
  printing-object(d, stream)
    format(stream, "%= a: %= b: %=",
           d.%gsl-randist-rng,
           d.gsl-randist-exppow-a,
           d.gsl-randist-exppow-b);
  end
end;

define method gsl-randist-variate
    (d :: <gsl-randist-exppow>) => (variate :: <float>)
  let rng = d.%gsl-randist-rng.gsl-rng-ffi;
  let a = d.gsl-randist-exppow-a;
  let b = d.gsl-randist-exppow-b;
  ffi/gsl-ran-exppow(rng, a, b);
end;

define method gsl-randist-pdf
    (d :: <gsl-randist-exppow>, x :: <float>) => (pd :: <float>)
  let a = d.gsl-randist-exppow-a;
  let b = d.gsl-randist-exppow-b;
  ffi/gsl-ran-exppow-pdf(x, a, b);
end;

define method gsl-randist-cdf-p
    (d :: <gsl-randist-exppow>, x :: <float>) => (pd :: <float>)
  let a = d.gsl-randist-exppow-a;
  let b = d.gsl-randist-exppow-b;
  ffi/gsl-cdf-exppow-p(x, a, b)
end;

define method gsl-randist-cdf-q
    (d :: <gsl-randist-exppow>, x :: <float>) => (pd :: <float>)
  let a = d.gsl-randist-exppow-a;
  let b = d.gsl-randist-exppow-b;
  ffi/gsl-cdf-exppow-q(x, a, b)
end;

///////////////////////////////////////////////////////////////////////////////
//
// Cauchy
//
///////////////////////////////////////////////////////////////////////////////

define class <gsl-randist-cauchy> (<gsl-randist>) 
  constant slot gsl-randist-cauchy-a :: <float>,
    required-init-keyword: a:;
end;

define method print-object
    (d :: <gsl-randist-cauchy>, stream :: <stream>) => ()
  printing-object(d, stream)
    format(stream, "%= a: %=",
           d.%gsl-randist-rng,
           d.gsl-randist-cauchy-a);
  end
end;

define method gsl-randist-variate
    (d :: <gsl-randist-cauchy>) => (variate :: <float>)
  let rng = d.%gsl-randist-rng.gsl-rng-ffi;
  let a = d.gsl-randist-cauchy-a;
  ffi/gsl-ran-cauchy(rng, a);
end;

define method gsl-randist-pdf
    (d :: <gsl-randist-cauchy>, x :: <float>) => (pd :: <float>)
  let a = d.gsl-randist-cauchy-a;
  ffi/gsl-ran-cauchy-pdf(x, a);
end;

define method gsl-randist-cdf-p
    (d :: <gsl-randist-cauchy>, x :: <float>) => (cd :: <float>)
  let a = d.gsl-randist-cauchy-a;
  ffi/gsl-cdf-cauchy-p(x, a)
end;

define method gsl-randist-cdf-q
    (d :: <gsl-randist-cauchy>, x :: <float>) => (cd :: <float>)
  let a = d.gsl-randist-cauchy-a;
  ffi/gsl-cdf-cauchy-q(x, a)
end;

define method gsl-randist-cdf-pinv
    (d :: <gsl-randist-cauchy>, x :: <float>) => (cd :: <float>)
  let a = d.gsl-randist-cauchy-a;
  ffi/gsl-cdf-cauchy-pinv(x, a)
end;

define method gsl-randist-cdf-qinv
    (d :: <gsl-randist-cauchy>, x :: <float>) => (cd :: <float>)
  let a = d.gsl-randist-cauchy-a;
  ffi/gsl-cdf-cauchy-qinv(x, a)
end;

///////////////////////////////////////////////////////////////////////////////
//
// Rayleigh
//
///////////////////////////////////////////////////////////////////////////////

define class <gsl-randist-rayleigh> (<gsl-randist>) 
  constant slot gsl-randist-rayleigh-sigma :: <float>,
    required-init-keyword: sigma:;
end;

define method print-object
    (d :: <gsl-randist-rayleigh>, stream :: <stream>) => ()
  printing-object(d, stream)
    format(stream, "%= sigma: %=",
           d.%gsl-randist-rng,
           d.gsl-randist-rayleigh-sigma);
  end
end;

define method gsl-randist-variate
    (d :: <gsl-randist-rayleigh>) => (variate :: <float>)
  let rng = d.%gsl-randist-rng.gsl-rng-ffi;
  let sigma = d.gsl-randist-rayleigh-sigma;
  ffi/gsl-ran-rayleigh(rng, sigma);
end;

define method gsl-randist-pdf
    (d :: <gsl-randist-rayleigh>, x :: <float>) => (pd :: <float>)
  let sigma = d.gsl-randist-rayleigh-sigma;
  ffi/gsl-ran-rayleigh-pdf(x, sigma)
end;

define method gsl-randist-cdf-p
    (d :: <gsl-randist-rayleigh>, x :: <float>) => (cd :: <float>)
  let sigma = d.gsl-randist-rayleigh-sigma;
  ffi/gsl-cdf-rayleigh-p(x, sigma)
end;

define method gsl-randist-cdf-q
    (d :: <gsl-randist-rayleigh>, x :: <float>) => (cd :: <float>)
  let sigma = d.gsl-randist-rayleigh-sigma;
  ffi/gsl-cdf-rayleigh-q(x, sigma)
end;

define method gsl-randist-cdf-pinv
    (d :: <gsl-randist-rayleigh>, x :: <float>) => (cd :: <float>)
  let sigma = d.gsl-randist-rayleigh-sigma;
  ffi/gsl-cdf-rayleigh-pinv(x, sigma)
end;

define method gsl-randist-cdf-qinv
    (d :: <gsl-randist-rayleigh>, x :: <float>) => (cd :: <float>)
  let sigma = d.gsl-randist-rayleigh-sigma;
  ffi/gsl-cdf-rayleigh-qinv(x, sigma)
end;

///////////////////////////////////////////////////////////////////////////////
//
// Tail Rayleigh
//
///////////////////////////////////////////////////////////////////////////////

define class <gsl-randist-rayleigh-tail> (<gsl-randist-rayleigh>)
  constant slot gsl-randist-rayleigh-a :: <float>,
    required-init-keyword: a:;
end;

define method print-object
    (d :: <gsl-randist-rayleigh-tail>, stream :: <stream>) => ()
  printing-object(d, stream)
    format(stream, "%= sigma: %= a: %=",
           d.%gsl-randist-rng,
           d.gsl-randist-rayleigh-sigma,
           d.gsl-randist-rayleigh-a);
  end
end;

define method gsl-randist-variate
    (d :: <gsl-randist-rayleigh-tail>) => (variate :: <float>)
  let rng = d.%gsl-randist-rng.gsl-rng-ffi;
  let a = d.gsl-randist-rayleigh-a;
  let sigma = d.gsl-randist-rayleigh-sigma;
  ffi/gsl-ran-rayleigh-tail(rng, a, sigma)
end;

define method gsl-randist-pdf
    (d :: <gsl-randist-rayleigh-tail>, x :: <float>) => (pd :: <float>)
  let a = d.gsl-randist-rayleigh-a;
  let sigma = d.gsl-randist-rayleigh-sigma;
  ffi/gsl-ran-rayleigh-tail-pdf(x, a, sigma)
end;

///////////////////////////////////////////////////////////////////////////////
//
// Gamma
//
///////////////////////////////////////////////////////////////////////////////

define constant $gsl-randist-gamma-default 
  = ffi/gsl-ran-gamma;

define constant $gsl-randist-gamma-knuth
  = ffi/gsl-ran-gamma-knuth;

define constant <gsl-randist-gamma-algorithm>
  = one-of($gsl-randist-gamma-default,
           $gsl-randist-gamma-knuth);
  
define class <gsl-randist-gamma> (<gsl-randist>)
  constant slot gsl-randist-gamma-a :: <float>,
    required-init-keyword: a:;
  constant slot gsl-randist-gamma-b :: <float>,
    required-init-keyword: b:;
  constant slot gsl-randist-gamma-algorithm :: <gsl-randist-gamma-algorithm>,
    init-keyword: algorithm:,
    init-value: $gsl-randist-gamma-default;
end;

define method print-object
    (d :: <gsl-randist-gamma>, stream :: <stream>) => ()
  printing-object(d, stream)
    format(stream, "%= a: %= b: %=",
           d.%gsl-randist-rng,
           d.gsl-randist-gamma-a,
           d.gsl-randist-gamma-b);
  end
end;

define method gsl-randist-variate
    (d :: <gsl-randist-gamma>) => (variate :: <float>)
  let rng = d.%gsl-randist-rng.gsl-rng-ffi;
  let a = d.gsl-randist-gamma-a;
  let b = d.gsl-randist-gamma-b;
  let algorithm = d.gsl-randist-gamma-algorithm;
  algorithm(rng, a, b)
end;

define method gsl-randist-pdf
    (d :: <gsl-randist-gamma>, x :: <float>) => (pd :: <float>)
  let a = d.gsl-randist-gamma-a;
  let b = d.gsl-randist-gamma-b;
  ffi/gsl-ran-gamma-pdf(x, a, b);
end;

define method gsl-randist-cdf-p
    (d :: <gsl-randist-gamma>, x :: <float>) => (p :: <float>)
  let a = d.gsl-randist-gamma-a;
  let b = d.gsl-randist-gamma-b;
  ffi/gsl-cdf-gamma-p(x, a, b)
end;

define method gsl-randist-cdf-q
    (d :: <gsl-randist-gamma>, x :: <float>) => (p :: <float>)
  let a = d.gsl-randist-gamma-a;
  let b = d.gsl-randist-gamma-b;
  ffi/gsl-cdf-gamma-q(x, a, b)
end;

define method gsl-randist-cdf-pinv
    (d :: <gsl-randist-gamma>, x :: <float>) => (p :: <float>)
  let a = d.gsl-randist-gamma-a;
  let b = d.gsl-randist-gamma-b;
  ffi/gsl-cdf-gamma-pinv(x, a, b)
end;

define method gsl-randist-cdf-qinv
    (d :: <gsl-randist-gamma>, x :: <float>) => (p :: <float>)
  let a = d.gsl-randist-gamma-a;
  let b = d.gsl-randist-gamma-b;
  ffi/gsl-cdf-gamma-qinv(x, a, b)
end;
