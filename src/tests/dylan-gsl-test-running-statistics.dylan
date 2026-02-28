Module: dylan-gsl-test-suite

define test test-rstat-add! ()
  let data = #[17.2d0, 18.1d0, 16.5d0, 18.3d0, 12.6d0];
  let rstat = make(<rstat>);
  rstat-add!(rstat, data);

  expect-true(f=(16.54d0, rstat.rstat-mean));
  expect-true(f=(5.373d0, rstat.rstat-variance));
  expect-true(f=(12.6d0, rstat.rstat-min));
  expect-true(f=(18.3d0, rstat.rstat-max));
  expect-true(f=(17.2d0, rstat.rstat-median));
  expect-true(f=(2.31797d0, rstat.rstat-sd));
  expect-true(f=(1.03663d0, rstat.rstat-sd-mean));
  expect-true(f=(16.6694d0, rstat.rstat-rms, epsilon: 1d-4));
  expect-true(f=(-0.829058d0, rstat.rstat-skew));
  expect-true(f=(-1.2217d0, rstat.rstat-kurtosis, epsilon: 1d-4));
  expect-equal(5, rstat.size);

  rstat-reset!(rstat);
  assert-equal(0, rstat.size);
end test;

define test test-quantile-rstat-add! ()
  let data = #[1.3d0, 2.2d0, 2.7d0, 3.1d0, 3.3d0, 3.7d0];
  let sorted-data = gsl-vector(data);
  let work-25 = make(<quantile-rstat>, p: 0.25d0);
  let work-50 = make(<quantile-rstat>, p: 0.5d0);
  let work-75 = make(<quantile-rstat>, p: 0.75d0);

  for (x in data)
    quantile-rstat-add!(work-25, x);
    quantile-rstat-add!(work-50, x);
    quantile-rstat-add!(work-75, x);
  end;

  // exact values

  let exact-p25 = quantile-from-sorted-data(sorted-data, 0.25d0);
  let exact-p50 = quantile-from-sorted-data(sorted-data, 0.5d0);
  let exact-p75 = quantile-from-sorted-data(sorted-data, 0.75d0);

  assert-true(f=(2.3250000d0, exact-p25));
  assert-true(f=(2.9000000d0, exact-p50));
  assert-true(f=(3.2500000d0, exact-p75));

  // estimated values

  let val-p25 = quantile-rstat-get(work-25);
  let val-p50 = quantile-rstat-get(work-50);
  let val-p75 = quantile-rstat-get(work-75);

  assert-true(f=(2.7000000d0, val-p25));
  assert-true(f=(2.7000000d0, val-p50));
  assert-true(f=(2.7000000d0, val-p75));

  // format-out("%d quantile: exact = %.5d, estimated = %d, error = %d\n",
  //            work-25.quantile-rstat-p, exact-p25, val-p25, (val-p25 - exact-p25) / exact-p25);
  // format-out("%d quantile: exact = %d, estimated = %d, error = %d\n",
  //            work-50.quantile-rstat-p, exact-p50, val-p50, (val-p50 - exact-p50) / exact-p50);
  // format-out("%d quantile: exact = %d, estimated = %d, error = %d\n",
  //            work-75.quantile-rstat-p, exact-p75, val-p75, (val-p75 - exact-p75) / exact-p75);
end test;

define suite gsl-running-statistics-suite ()
  test test-rstat-add!;
  test test-quantile-rstat-add!;
end suite;
