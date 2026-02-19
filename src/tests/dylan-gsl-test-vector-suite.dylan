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

define test test-vector-add ()
  let v1 = make(<gsl-vector>, size: 3, fill: 1.0d0);
  let v2 = make(<gsl-vector>, size: 3, fill: 2.0d0);
  let v3 = v1 + v2;
  assert-equal(3.0d0, v3[0]); 
  assert-equal(3.0d0, v3[1]); 
  assert-equal(3.0d0, v3[2]); 
end test;

  
define suite gsl-vector-suite ()
  test test-vector-size;
  test test-vector-get-set;
  test test-vector-add;
end suite;
