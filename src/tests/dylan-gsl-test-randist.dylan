Module: dylan-gsl-test-suite

define test test-gsl-randist-gaussian-tail-invalid-a ()
  assert-signals(<gsl-error-invalid-argument>,
                 make(<gsl-randist-gaussian-tail>,
                      rng: make(<gsl-rng>),
                      sigma: 0.2d0,
                      a: -3.0d0))
end;

define test test-gsl-randist-ugaussian-tail-invalid-a ()
  assert-signals(<gsl-error-invalid-argument>,
                 make(<gsl-randist-ugaussian-tail>,
                      rng: make(<gsl-rng>),
                      a: -3.0d0))
end;

// define function test-distribution
//     (distribution :: <gsl-randist>, n :: <integer>) => ()
//   // format-out("Distribution: %=\n", distribution);
//   for (i from 0 below n)
//     // let k = distribution.gsl-randist-variate;
//     // format-out("%d:\t%=\n", i, k);
//     assert-no-errors(distribution.gsl-randist-variate);
//   end;
// end;

define test test-distributions ()
  gsl-rng-env-setup();
  let rng = make(<gsl-rng>);
  let distributions
    = vector(make(<gsl-randist-gaussian>, rng: rng, sigma: 0.25d0),
             make(<gsl-randist-gaussian-tail>, rng: rng, sigma: 0.5d0, a: 2.0d0),
             make(<gsl-randist-ugaussian>, rng: rng),
             make(<gsl-randist-ugaussian-tail>, rng: rng, a: 3.0d0));
  for (distribution in distributions)
    assert-no-errors(distribution.gsl-randist-variate);
  end;
end;

define suite gsl-randist-suite ()
  test test-gsl-randist-gaussian-tail-invalid-a;
  test test-gsl-randist-ugaussian-tail-invalid-a;
  test test-distributions;
end suite;
