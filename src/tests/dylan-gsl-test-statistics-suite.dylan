Module: dylan-gsl-test-suite

define constant $stats-dataset
  = vector-double-float(#[17.2d0, 18.1d0, 16.5d0, 18.3d0, 12.6d0]);

define test test-mean ()
  let m = mean($stats-dataset);
  assert-true(f=(m, 16.54d0));
end test;

define test test-variance ()
  let m = mean($stats-dataset);

  assert-true(f=(variance($stats-dataset),
                 variance($stats-dataset, mean: m)),
              "Variance of sample with and without mean are equal");

  assert-true(f=(4.2984d0,
                 variance($stats-dataset, mean: m, population?: #t))); 
end test;

define test test-maximum ()
  let m = maximum($stats-dataset);
  assert-true(f=(m, 18.3d0));
end test;

define test test-minimum ()
  let m = minimum($stats-dataset);
  assert-true(f=(m, 12.6d0));
end test;

define test test-minimum-maximum ()
  let (min, max) = minimum-maximum($stats-dataset);
  assert-true(f=(min, 12.6d0));
  assert-true(f=(max, 18.3d0));
end test;

define suite gsl-statistics-suite ()
  test test-mean;
  test test-variance;
  test test-maximum;
  test test-minimum;
  test test-minimum-maximum;
end suite;