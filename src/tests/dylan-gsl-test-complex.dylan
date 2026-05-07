Module: dylan-gsl-test-suite

define test test-complex-create ()
  let c = make(<gsl-complex>, r: 3.0d0, i: 1.0d0);
  expect-equal(3.0d0, c.gsl-complex-real);
  expect-equal(1.0d0, c.gsl-complex-imag);
end;
  
define test test-complex-polar ()
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
  let c = make(<gsl-complex>, r: 3.0d0, i: 4.0d0);
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
  expect-equal(1.0d0, a.gsl-complex-real);
  expect-equal(1.0d0, a.gsl-complex-imag);
  let b = gsl-complex(2.0d0, 2.0d0);
  expect-equal(2.0d0, b.gsl-complex-real);
  expect-equal(2.0d0, b.gsl-complex-imag);
  let c = a + b;
  assert-equal(3.0d0, c.gsl-complex-real);
  assert-equal(3.0d0, c.gsl-complex-imag);
end;

define test test-complex-example-from-book ()
  let z = gsl-complex(4.0d0, 3.0d0);
  expect-equal(4.0d0, z.gsl-complex-real);
  expect-equal(3.0d0, z.gsl-complex-imag);
  expect-equal(5.0d0, z.gsl-complex-abs);
  expect-equal(atan(3.0d0 / 4.0d0), z.gsl-complex-arg);
  let c = z.gsl-complex-conjugate;
  expect-equal(4.0d0, c.gsl-complex-real);
  expect-equal(-3.0d0, c.gsl-complex-imag);
end;

define benchmark test-complex-leak ()
  benchmark-repeat (iterations: 100)
    for (i from 0 below 10)
      let c = gsl-complex(0.0d0, 0.0d0);
    end;
  end;
end benchmark;

define suite gsl-complex-suite ()
  test test-complex-create;
  test test-complex-leak;
  test test-complex-polar;
  test test-complex-abs;
  test test-complex-abs2;
  test test-complex-logabs;
  test test-complex-add;
  test test-complex-example-from-book;
end suite;
