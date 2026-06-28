Module: dylan-gsl-test-suite

define function test-randist-variate
   (distribution :: <gsl-randist>) => ()
  assert-no-errors(distribution.gsl-randist-variate);
end;

define test test-gsl-randist-gaussian ()
  let randist = make(<gsl-randist-gaussian>, sigma: 0.25d0);
  test-randist-variate(randist);
  assert-signals(<gsl-error-invalid-argument>, 
                 make(<gsl-randist-gaussian>, sigma: 0.5d0, algorithm: #"foo"),
                 "Error invalid argument creating gaussian with invalid algorithm");
end;

define test test-gsl-randist-ugaussian ()
  let randist = make(<gsl-randist-ugaussian>);
  test-randist-variate(randist);
  assert-equal(randist.gsl-randist-gaussian-sigma, 1.0d0,
               "Ugaussian sigma default value must be 1.0");
end;

define test test-gsl-randist-gaussian-tail ()
  let randist = make(<gsl-randist-gaussian-tail>, sigma: 0.25d0, a: 2.0d0);
  test-randist-variate(randist);
  assert-signals(<gsl-error-invalid-argument>,
                 make(<gsl-randist-gaussian-tail>, sigma: 0.2d0, a: -3.0d0),
                 "Error invalid argument creating gaussian tail with invalid a");
end;

define test test-gsl-randist-ugaussian-tail ()
  let randist = make(<gsl-randist-ugaussian-tail>, a: 2.0d0);
  test-randist-variate(randist);
  assert-signals(<gsl-error-invalid-argument>,
                 make(<gsl-randist-ugaussian-tail>, a: -3.0d0),
                 "Error invalid argument creating ugaussian tail with invalid a");

end;

define test test-gsl-randist-exponential ()
  let randist = make(<gsl-randist-exponential>, beta: 2.0d0, mu: 0.5d0);
  test-randist-variate(randist);
end;

define test test-gsl-randist-laplace ()
  let randist = make(<gsl-randist-laplace>, a: 1.5d0);
  test-randist-variate(randist);
end;

define test test-gsl-randist-exppow ()
  let randist = make(<gsl-randist-exppow>, a: 0.5d0, b: 1.0d0);
  test-randist-variate(randist);
end;

define test test-gsl-randist-cauchy ()
  let randist = make(<gsl-randist-cauchy>, a: 0.0d0, b: 1.0d0);
  test-randist-variate(randist);
end;

define test test-gsl-randist-rayleigh ()
  let randist = make(<gsl-randist-rayleigh>, sigma: 1.0d0);
  test-randist-variate(randist);
end;

define test test-gsl-randist-rayleigh-tail ()
  let randist = make(<gsl-randist-rayleigh-tail>, sigma: 1.0d0, a: 1.0d0);
  test-randist-variate(randist);
end;

define test test-gsl-randist-landau ()
  let randist = make(<gsl-randist-landau>);
  test-randist-variate(randist);
end;

define test test-gsl-randist-gamma ()
  let randist = make(<gsl-randist-gamma>, a: 1.0d0, b: 1.0d0);
  test-randist-variate(randist);
end;

define test test-gsl-randist-flat ()
  let randist = make(<gsl-randist-flat>, a: 0.0d0, b: 1.0d0);
  test-randist-variate(randist);
end;

define test test-gsl-randist-lognormal ()
  let randist = make(<gsl-randist-lognormal>, zeta: 0.0d0, sigma: 1.0d0);
  test-randist-variate(randist);
end;

define test test-gsl-randist-chisq ()
  let randist = make(<gsl-randist-chisq>, nu: 5.0d0);
  test-randist-variate(randist);
end;

define suite gsl-randist-suite ()
  test test-gsl-randist-ugaussian;
  test test-gsl-randist-gaussian;
  test test-gsl-randist-gaussian-tail;
  test test-gsl-randist-ugaussian-tail;
  test test-gsl-randist-exponential;
  test test-gsl-randist-laplace;
  test test-gsl-randist-exppow;
  test test-gsl-randist-cauchy;
  test test-gsl-randist-rayleigh;
  test test-gsl-randist-rayleigh-tail;
  test test-gsl-randist-landau;
  test test-gsl-randist-gamma;
  test test-gsl-randist-flat;
  test test-gsl-randist-lognormal;
  test test-gsl-randist-chisq;
end suite;
