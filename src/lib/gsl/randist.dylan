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
    init-keyword: rng:,
    init-value: make(<gsl-rng>);
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

define constant <gsl-gaussian-algorithm>
  = one-of(#"default", #"ziggurat", #"ratio");

define class <gsl-randist-gaussian> (<gsl-randist>)
  constant slot gsl-randist-gaussian-sigma :: <float>,
    required-init-keyword: sigma:;
  slot %gsl-randist-gaussian-algorithm :: <function>;
end;

define method initialize
    (d :: <gsl-randist-gaussian>,
     #key algorithm = #"default")
 => ()
  next-method();
  d.%gsl-randist-gaussian-algorithm
    := select (algorithm)
         #"default"
           => ffi/gsl-ran-gaussian;
         #"ziggurat"
           => ffi/gsl-ran-gaussian-ziggurat;
         #"ratio"
           => ffi/gsl-ran-gaussian-ratio-method;
         otherwise
           => signal(make(<gsl-error-invalid-argument>));
       end;
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

define class <gsl-randist-ugaussian> (<gsl-randist-gaussian>)
  inherited slot gsl-randist-gaussian-sigma = 1.0d0;
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

define class <gsl-randist-ugaussian-tail> 
    (<gsl-randist-gaussian-tail>)
  inherited slot gsl-randist-gaussian-sigma = 1.0d0;  
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
// The Rayleigh Tail Distribution
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
// The Landau distribution
//
///////////////////////////////////////////////////////////////////////////////

define class <gsl-randist-landau> (<gsl-randist>)
end;

define method gsl-randist-variate
    (d :: <gsl-randist-landau>) => (variate :: <float>)
  let rng = d.%gsl-randist-rng.gsl-rng-ffi;
  ffi/gsl-ran-landau(rng)
end;

define method gsl-randist-pdf
    (d :: <gsl-randist-landau>, x :: <float>) => (pd :: <float>)
  ffi/gsl-ran-landau-pdf(x)
end;

///////////////////////////////////////////////////////////////////////////////
//
// The Levy alpha-Stable Distribution
//
///////////////////////////////////////////////////////////////////////////////

define class <gsl-randist-levy> (<gsl-randist>)
  constant slot gsl-randist-levy-c :: <float>,
    required-init-keyword: c:;
  constant slot gsl-randist-levy-alpha :: <float>,
    required-init-keyword: alpha:;
end;

define method gsl-randist-variate
    (d :: <gsl-randist-levy>) => (variate :: <float>)
  let rng = d.%gsl-randist-rng.gsl-rng-ffi;
  let c = d.gsl-randist-levy-c;
  let alpha = d.gsl-randist-levy-alpha;
  ffi/gsl-ran-levy(rng, c, alpha)
end;

///////////////////////////////////////////////////////////////////////////////
//
// The Levy skew alpha-Stable Distribution
//
///////////////////////////////////////////////////////////////////////////////

define class <gsl-randist-levy-skew> (<gsl-randist-levy>)
  constant slot gsl-randist-levy-beta :: <float>,
    required-init-keyword: beta:;
end;

define method gsl-randist-variate
    (d :: <gsl-randist-levy-skew>) => (variate :: <float>)
  let rng = d.%gsl-randist-rng.gsl-rng-ffi;
  let c = d.gsl-randist-levy-c;
  let alpha = d.gsl-randist-levy-alpha;
  let beta = d.gsl-randist-levy-beta;
  ffi/gsl-ran-levy-skew(rng, c, alpha, beta)
end;

///////////////////////////////////////////////////////////////////////////////
//
// Gamma
//
///////////////////////////////////////////////////////////////////////////////

define constant <gsl-gamma-algorithm>
  = one-of(#"default", #"knuth");
  
define class <gsl-randist-gamma> (<gsl-randist>)
  constant slot gsl-randist-gamma-a :: <float>,
    required-init-keyword: a:;
  constant slot gsl-randist-gamma-b :: <float>,
    required-init-keyword: b:;
  slot %gsl-randist-gamma-algorithm :: <function>;
end;

define method initialize
    (d :: <gsl-randist-gamma>,
     #key algorithm = #"default")
 => ()
  next-method();
  d.%gsl-randist-gamma-algorithm
    := select (algorithm)
         #"default"
           => ffi/gsl-ran-gamma;
         #"knuth"
           => ffi/gsl-ran-gamma-knuth;
         otherwise
           => signal(make(<gsl-error-invalid-argument>));
       end;  
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
  let algorithm = d.%gsl-randist-gamma-algorithm;
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

///////////////////////////////////////////////////////////////////////////////
//
// The Flat Distribution
//
///////////////////////////////////////////////////////////////////////////////

define class <gsl-randist-flat> (<gsl-randist>)
  constant slot gsl-randist-flat-a :: <float>,
    required-init-keyword: a:;
  constant slot gsl-randist-flat-b :: <float>,
    required-init-keyword: b:;
end;

define method print-object
    (d :: <gsl-randist-flat>, stream :: <stream>) => ()
  printing-object(d, stream)
    format(stream, "%= a: %= b: %=",
           d.%gsl-randist-rng,
           d.gsl-randist-flat-a,
           d.gsl-randist-flat-b);
  end
end;

define method gsl-randist-variate
    (d :: <gsl-randist-flat>) => (variate :: <float>)
  let rng = d.%gsl-randist-rng.gsl-rng-ffi;
  let a = d.gsl-randist-flat-a;
  let b = d.gsl-randist-flat-b;
  ffi/gsl-ran-flat(rng, a, b)
end;

define method gsl-randist-pdf
    (d :: <gsl-randist-flat>, x :: <float>) => (pd :: <float>)
  let a = d.gsl-randist-flat-a;
  let b = d.gsl-randist-flat-b;
  ffi/gsl-ran-flat-pdf(x, a, b);
end;

define method gsl-randist-cdf-p
    (d :: <gsl-randist-flat>, x :: <float>) => (p :: <float>)
  let a = d.gsl-randist-flat-a;
  let b = d.gsl-randist-flat-b;
  ffi/gsl-cdf-flat-p(x, a, b)
end;

define method gsl-randist-cdf-q
    (d :: <gsl-randist-flat>, x :: <float>) => (p :: <float>)
  let a = d.gsl-randist-flat-a;
  let b = d.gsl-randist-flat-b;
  ffi/gsl-cdf-flat-q(x, a, b)
end;

define method gsl-randist-cdf-pinv
    (d :: <gsl-randist-flat>, x :: <float>) => (p :: <float>)
  let a = d.gsl-randist-flat-a;
  let b = d.gsl-randist-flat-b;
  ffi/gsl-cdf-flat-pinv(x, a, b)
end;

define method gsl-randist-cdf-qinv
    (d :: <gsl-randist-flat>, x :: <float>) => (p :: <float>)
  let a = d.gsl-randist-flat-a;
  let b = d.gsl-randist-flat-b;
  ffi/gsl-cdf-flat-qinv(x, a, b)
end;

///////////////////////////////////////////////////////////////////////////////
//
// The Lognormal Distribution
//
///////////////////////////////////////////////////////////////////////////////

define class <gsl-randist-lognormal> (<gsl-randist>)
  constant slot gsl-randist-lognormal-zeta :: <float>,
    required-init-keyword: zeta:;
  constant slot gsl-randist-lognormal-sigma :: <float>,
    required-init-keyword: sigma:;
end;

define method print-object
    (d :: <gsl-randist-lognormal>, stream :: <stream>) => ()
  printing-object(d, stream)
    format(stream, "%= zeta: %= sigma: %=",
           d.%gsl-randist-rng,
           d.gsl-randist-lognormal-zeta,
           d.gsl-randist-lognormal-sigma);
  end
end;

define method gsl-randist-variate
    (d :: <gsl-randist-lognormal>) => (variate :: <float>)
  let rng = d.%gsl-randist-rng.gsl-rng-ffi;
  let zeta = d.gsl-randist-lognormal-zeta;
  let sigma = d.gsl-randist-lognormal-sigma;
  ffi/gsl-ran-lognormal(rng, zeta, sigma)
end;

define method gsl-randist-pdf
    (d :: <gsl-randist-lognormal>, x :: <float>) => (pd :: <float>)
  let zeta = d.gsl-randist-lognormal-zeta;
  let sigma = d.gsl-randist-lognormal-sigma;
  ffi/gsl-ran-lognormal-pdf(x, zeta, sigma);
end;

define method gsl-randist-cdf-p
    (d :: <gsl-randist-lognormal>, x :: <float>) => (p :: <float>)
  let zeta = d.gsl-randist-lognormal-zeta;
  let sigma = d.gsl-randist-lognormal-sigma;
  ffi/gsl-cdf-lognormal-p(x, zeta, sigma)
end;

define method gsl-randist-cdf-q
    (d :: <gsl-randist-lognormal>, x :: <float>) => (p :: <float>)
  let zeta = d.gsl-randist-lognormal-zeta;
  let sigma = d.gsl-randist-lognormal-sigma;
  ffi/gsl-cdf-lognormal-q(x, zeta, sigma)
end;

define method gsl-randist-cdf-pinv
    (d :: <gsl-randist-lognormal>, p :: <float>) => (p :: <float>)
  let zeta = d.gsl-randist-lognormal-zeta;
  let sigma = d.gsl-randist-lognormal-sigma;
  ffi/gsl-cdf-lognormal-pinv(p, zeta, sigma)
end;

define method gsl-randist-cdf-qinv
    (d :: <gsl-randist-lognormal>, q :: <float>) => (p :: <float>)
  let zeta = d.gsl-randist-lognormal-zeta;
  let sigma = d.gsl-randist-lognormal-sigma;
  ffi/gsl-cdf-lognormal-qinv(q, zeta, sigma)
end;

///////////////////////////////////////////////////////////////////////////////
//
// The Chi-Square Distribution
//
///////////////////////////////////////////////////////////////////////////////

define class <gsl-randist-chisq> (<gsl-randist>) 
  constant slot gsl-randist-chisq-nu :: <float>,
    required-init-keyword: nu:;
end;

define method print-object
    (d :: <gsl-randist-chisq>, stream :: <stream>) => ()
  printing-object(d, stream)
    format(stream, "%= nu: %=",
           d.%gsl-randist-rng,
           d.gsl-randist-chisq-nu);
  end
end;

define method gsl-randist-variate
    (d :: <gsl-randist-chisq>) => (variate :: <float>)
  let rng = d.%gsl-randist-rng.gsl-rng-ffi;
  let nu = d.gsl-randist-chisq-nu;
  ffi/gsl-ran-chisq(rng, nu)
end;

define method gsl-randist-pdf
    (d :: <gsl-randist-chisq>, x :: <float>) => (pd :: <float>)
  let nu = d.gsl-randist-chisq-nu;
  ffi/gsl-ran-chisq-pdf(x, nu)
end;

define method gsl-randist-cdf-p
    (d :: <gsl-randist-chisq>, x :: <float>) => (p :: <float>)
  let nu = d.gsl-randist-chisq-nu;
  ffi/gsl-cdf-chisq-p(x, nu)
end;

define method gsl-randist-cdf-q
    (d :: <gsl-randist-chisq>, x :: <float>) => (p :: <float>)
  let nu = d.gsl-randist-chisq-nu;
  ffi/gsl-cdf-chisq-q(x, nu)
end;

define method gsl-randist-cdf-pinv
    (d :: <gsl-randist-chisq>, p :: <float>) => (p :: <float>)
  let nu = d.gsl-randist-chisq-nu;
  ffi/gsl-cdf-chisq-pinv(p, nu)
end;

define method gsl-randist-cdf-qinv
    (d :: <gsl-randist-chisq>, q :: <float>) => (p :: <float>)
  let nu = d.gsl-randist-chisq-nu;
  ffi/gsl-cdf-chisq-qinv(q, nu)
end;
