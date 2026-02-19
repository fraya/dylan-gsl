Module: dylan-gsl-test-suite

define test test-vector-size ()
  let v = make(<gsl-vector>, size: 3);
  assert-equal(3, v.size);
end test;


define test test-vector-get-set ()

  let v = make(<gsl-vector>, size: 3, fill: 0.0d0);
  
  assert-equal(0.0d0, v[0]); 
  assert-equal(0.0d0, v[1]); 
  assert-equal(0.0d0, v[2]); 
                            
  v[0] := 1.0d0;             
  v[1] := 2.0d0;             
  v[2] := 3.0d0;             
                            
  assert-equal(1.0d0, v[0]); 
  assert-equal(2.0d0, v[1]); 
  assert-equal(3.0d0, v[2]); 
end test;

define test test-zero? ()
  let v = make(<gsl-vector>, size: 3, fill: 0.0d0);
  assert-true(v.zero?);
end;

define test test-addition ()
  let v1 = make(<gsl-vector>, size: 3, fill: 1.0d0);
  let v2 = make(<gsl-vector>, size: 3, fill: 2.0d0);
  let v3 = make(<gsl-vector>, size: 3, fill: 3.0d0);
  let z0 = make(<gsl-vector>, size: 3, fill: 0.0d0);

  expect-true(f=(v1 + v2, v3),
	       "Addition of vectors");
  expect-true(f=(v1 + v2, v2 + v1),
	       "Addition is commutative");
  expect-true(f=((v1 + v2) + v3, v1 + (v2 + v3)),
	       "Addition is associative");
  expect-true(f=(z0 + v1, v1),
	       "0 is and additive identity");
  expect-true(f=(z0, v1 + (-v1)),
	       "Additive inverses exists");
end;

define test test-minus ()
  let v1 = make(<gsl-vector>, size: 3, fill: 1.0d0);
  let v2 = make(<gsl-vector>, size: 3, fill: 2.0d0);
  expect-true(f=(v2 - v1, v1));
end;

define test test-scalar ()
  let v1 = make(<gsl-vector>, size: 3, fill: 2.0d0);
  let v2 = make(<gsl-vector>, size: 3, fill: 6.0d0);
  let a = 2.0d0;
  let b = 3.0d0;

  expect-true(f=(v1 * 3.0d0, v2),
	       "Scalar multiplication");
  expect-true(f=(v1 * 1.0d0, v1),
	       "1 is a multiplicative identity");
  expect-true(f=((a * b) * v1, a * (b * v1)),
	       "Scalar multiplication is associative");
  expect-true(f=(a * (v1 + v2), a * v1 + a * v2),
	       "Scalar multiplication distributes over vector addition");
  expect-true(f=((a + b) * v1, a * v1 + b * v1),
	       "Scalar multiplication distributes over scalar addition");
end;

define test test-div ()
  let v1 = make(<gsl-vector>, size: 3, fill: 6.0d0);
  let v2 = make(<gsl-vector>, size: 3, fill: 3.0d0);
  let r  = make(<gsl-vector>, size: 3, fill: 2.0d0);

  expect-true(f=(r, v1 / v2));
end;
  
define suite gsl-vector-suite ()
  test test-vector-size;
  test test-vector-get-set;
  test test-zero?;
  test test-addition;
  test test-minus;
  test test-scalar;
  test test-div;
end suite;
