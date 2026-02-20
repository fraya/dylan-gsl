Module: dylan-gsl-test-suite

define constant $stats-dataset
  = gsl-vector(#[10.0d0, 15.0d0, 15.0d0, 17.0d0, 18.0d0, 21.0d0]);

define test test-abs-dev ()
  assert-true(f=(abs-dev($stats-dataset), 2.67d0, epsilon: 1d-2));
end test;

define test test-mean ()
  assert-true(f=(16d0, mean($stats-dataset)));
end test;

define test test-variance ()
  let m = mean($stats-dataset);

  assert-true(f=(variance($stats-dataset),
                 variance($stats-dataset, mean: m)),
              "Variance of sample with and without mean are equal");

  let variance-sample = variance($stats-dataset, mean: m);
  assert-true(f=(13.6d0, variance-sample));
  let variance-population = variance($stats-dataset, mean: m, population?: #t); 
  assert-true(f=(11.34d0, variance-population, epsilon: 1d-1)); 
end test;

define test test-maximum ()
  let m = maximum($stats-dataset);
  assert-true(f=(m, 21.0d0));
end test;

define test test-minimum ()
  let m = minimum($stats-dataset);
  assert-true(f=(m, 10.0d0));
end test;

define test test-minimum-maximum ()
  let (min, max) = minimum-maximum($stats-dataset);
  assert-true(min, 10.0d0);
  assert-true(max, 21.0d0);
end test;

define test test-median ()
  let m1 = median($stats-dataset);
  assert-true(f=(m1, 16.0d0));
  assert-equal($stats-dataset,
               gsl-vector(#[15d0, 17.0d0, 15.0d0, 18.0d0, 21.0d0]),
               "Dataset is not modified in sorting");
  let m2 = median($stats-dataset, sorted?: #t);
  assert-true(f=(m1, m2));
end test;

define test test-order-statistic! ()
  let kth = kth-order-statistic($stats-dataset, 0);
  assert-equal(kth, 10.0d0  );
end;

define suite gsl-statistics-suite ()
  test test-abs-dev;
  test test-mean;
  test test-variance;
  test test-maximum;
  test test-minimum;
  test test-minimum-maximum;
  test test-median;
  test test-order-statistic!;
end suite;
