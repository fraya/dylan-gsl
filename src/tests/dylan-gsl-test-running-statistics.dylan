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

define suite gsl-running-statistics-suite ()
  test test-rstat-add!;
end suite;
