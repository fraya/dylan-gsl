Module: dylan-gsl-test-suite

define function test-gsl-rng
    (r :: <gsl-rng>) => ()

  // gsl-rng-get

  let sample = r.gsl-rng-get;
  assert-true(sample >= r.gsl-rng-min & sample <= r.gsl-rng-max,
              "Random number is between minimum and maximun of RNG");

  // gsl-rng-uniform

  let sample = r.gsl-rng-uniform;
  assert-true(sample > 0.0 & sample <= 1.0,
              "Random number is in range [0,1)");

  // gsl-rng-uniform-int

  let sample = gsl-rng-uniform-int(r, 1);
  assert-equal(0, sample,
               "gsl-rng-uniform-int: sample of n = 0 is 0");

  let n      = r.gsl-rng-max - 2;
  let sample = gsl-rng-uniform-int(r, n);

  assert-true(sample > 0 & sample < n,
              "gsl-rng-uniform-int: Random number between 0 and n");

  assert-signals(<gsl-error>, gsl-rng-uniform-int(r, 0),
                 "gsl-rng-uniform-int: n must be > 0");

  assert-signals(<gsl-error>, gsl-rng-uniform-int(r, r.gsl-rng-max + 2),
                 "gsl-rng-uniform-int: n must be less than or equal to rng max value");

  // gsl-rng-uniform-positive

  let sample = r.gsl-rng-uniform-positive;
  assert-true(sample > 0.0 & sample < 1.0,
              "Random number is in range (0,1), excluding both endpoints");
end;

define test test-rng-mt19937 ()
  let r = make(<gsl-rng>, type: $gsl-rng-mt19937);
  assert-equal("mt19937", r.gsl-rng-name);
  assert-equal(0, r.gsl-rng-min);
  assert-equal(4294967295, r.gsl-rng-max);
end;

define test test-rng-cmrg ()
  let r = make(<gsl-rng>, type: $gsl-rng-cmrg);
  assert-equal("cmrg", r.gsl-rng-name);
  assert-equal(0, r.gsl-rng-min);
  assert-equal(2147483646, r.gsl-rng-max);
end;

define benchmark rng-sample-benchmark ()
  for (algorithm from $gsl-rng-borosh13 to $gsl-rng-zuf)
    let r = make(<gsl-rng>, type: algorithm);
    block ()
      test-gsl-rng(r);
    exception (e :: <gsl-error>)
      format-err("%s: %s\n", r.gsl-rng-name, e.gsl-error-message);
      format-err("%s\n", e.gsl-error-details);
      force-out();
    end;
  end for;
end;

//
// Pass GSL_RNG_TYPE, GLS_RNG_SEED and GSL_RNG_ITERATIONS as environment
// parameters to test different algorithms
//

define constant $rng-iterations-default = 500;

define function rng-iterations
    () => (_ :: <integer>)
  let rng-env-var = environment-variable("GSL_RNG_ITERATIONS");
  if (rng-env-var)
    string-to-integer(rng-env-var, default: $rng-iterations-default)
  else
    $rng-iterations-default
  end
end;

define benchmark rng-integer-performance-benchmark ()
  gsl-rng-env-setup();
  let r = make(<gsl-rng>);
  format-out("%s\n", r.gsl-rng-name);
  benchmark-repeat (iterations: rng-iterations())
    let sample = r.gsl-rng-get;
    format-out("%d\n", sample);
  end;
end;

define benchmark rng-double-performance-benchmark ()
  gsl-rng-env-setup();
  let r = make(<gsl-rng>);
  benchmark-repeat (iterations: rng-iterations())
    let sample = r.gsl-rng-uniform;
  end;
end;

define suite gsl-rng-suite ()
  test test-rng-mt19937;
  test test-rng-cmrg;
end suite;
