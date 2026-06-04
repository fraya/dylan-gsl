Module: dylan-gsl-test-suite

define function test-distribution
    (distribution :: <gsl-randist>, n :: <integer>) => ()
  format-out("Distribution: %=\n", distribution);
  for (i from 0 below n)
    let k = distribution.gsl-ran-variate;
    format-out("%d:\t%=\n", i, k);
  end;
end;

define test test-distributions ()
  gsl-rng-env-setup();
  let rng = make(<gsl-rng>);
  let n = 5;
  let sigma = 0.25d0;
  let a = 2.0d0;
  let gaussian = make(<gsl-gaussian>, rng: rng, sigma: sigma);
  let ugaussian = make(<gsl-ugaussian>, rng: rng);
  let gaussian-tail = make(<gsl-gaussian-tail>, rng: rng, sigma: sigma, a: a);
  let ugaussian-tail = make(<gsl-ugaussian-tail>, rng: rng, a: a);
  let distributions = vector(gaussian, ugaussian, gaussian-tail, ugaussian-tail);
  for (d in distributions)
    test-distribution(d, n);
  end;
end;

define suite gsl-randist-suite ()
  test test-distributions;
end suite;
