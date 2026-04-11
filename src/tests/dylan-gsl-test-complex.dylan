Module: dylan-gsl-test-suite

define test test-create-complex ()
  let c = gsl-complex(1.0d0, 3.0d0);
  expect-equal(1.0d0, c.gsl-complex-real);
  expect-equal(3.0d0, c.gsl-complex-imag);
end;

define test test-complex-number-from-polar-to-rectangular ()
  let r = 4.0d0;
  let theta = $gsl-pi / 3;
  let c = gsl-complex-polar(r, theta);
  expect-true(2.0d0, c.gsl-complex-real);
  expect-true(4 * sin(theta), c.gsl-complex-imag);
end;

define test test-complex-arg ()
  let theta = $gsl-pi / 3;
  let c = gsl-complex(2.0d0, 4 * sin(theta));
  let a = c.gsl-complex-arg;
  assert-true(-$gsl-pi < a);
  assert-true(a <= $gsl-pi);
  assert-true(f=(a, theta));
end;

define test test-complex-abs ()
  let c = gsl-complex(3.0d0, 4.0d0);
  let a = c.gsl-complex-abs;
  assert-true(f=(5.0d0, a));
end;

define test test-complex-abs2 ()
  let c = gsl-complex(3.0d0, 4.0d0);
  let a = c.gsl-complex-abs2;
  assert-true(f=(25.0d0, a));
end;

define test test-complex-logabs ()
  let c = gsl-complex(1.0000000001d0, 0.0000000001d0);
  let l = gsl-complex-logabs(c);
  assert-true(f=(0.1000000d-9, l));
end;

define test test-complex-add ()
  let a = gsl-complex(1.0d0, 1.0d0);
  let b = gsl-complex(2.0d0, 2.0d0);
  let c = a + b;
  assert-equal(3.0d0, c.gsl-complex-real);
  assert-equal(3.0d0, c.gsl-complex-imag);
end;

define suite gsl-complex-suite ()
  test test-create-complex;
  test test-complex-number-from-polar-to-rectangular;
  test test-complex-abs;
  test test-complex-abs2;
  test test-complex-logabs;
  test test-complex-add;
end suite;
