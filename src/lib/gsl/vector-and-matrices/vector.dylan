Module: gsl-vector-impl
Synopsis: GSL Vector
Author: Fernando Raya
Copyright: Copyright (C) 2026, Dylan Hackers. All rights reserved.
License: See LICENSE in this distribution for details

define class <gsl-vector> (<mutable-sequence>)
  slot %gsl-vector :: ffi/<gsl-vector*>;
end;

define method initialize
  (v :: <gsl-vector>, 
   #key size   :: <integer> = 0,
        fill   :: false-or(<double-float>) = #f)
  if (fill)
    v.%gsl-vector := ffi/gsl-vector-alloc(size);
    ffi/gsl-vector-set-all(v.%gsl-vector, fill);
  else
    v.%gsl-vector := ffi/gsl-vector-alloc(size);
  end;
end;

define method size
    (v :: <gsl-vector>) => (_ :: <integer>)
  ffi/gsl-vector-size(v.%gsl-vector)
end;

define method copy-gsl-vector
    (a :: <gsl-vector>) => (b :: <gsl-vector>)
  let b = make(<gsl-vector>, size: a.size);
  ffi/gsl-vector-memcpy(b.%gsl-vector, a.%gsl-vector);
  b
end;

define method element
    (v :: <gsl-vector>, index :: <integer>, #key default)
 => (e :: <double-float>)
  ffi/gsl-vector-get(v.%gsl-vector, index)
end;

define method element-setter
    (value :: <double-float>, v :: <gsl-vector>, index :: <integer>)
 => (value :: <double-float>)
  ffi/gsl-vector-set(v.%gsl-vector, index, value);
  value
end;

define function set-all!
   (v :: <gsl-vector>, value :: <double-float>) 
=> (value :: <double-float>)
  ffi/gsl-vector-set-all(v.%gsl-vector, value);
  value
end;

define function set-zero!
   (v :: <gsl-vector>) 
=> (v :: <gsl-vector>)
  ffi/gsl-vector-set-zero(v.%gsl-vector);
  v
end;

define function set-basis!
   (v :: <gsl-vector>, i :: <integer>) 
=> (v :: <gsl-vector>)
  ffi/gsl-vector-set-basis(v.%gsl-vector, i);
  v
end;

define function swap!
   (v :: <gsl-vector>, i :: <integer>, j :: <integer>) 
=> (v :: <gsl-vector>)
  ffi/gsl-vector-swap-elements(v.%gsl-vector, i, j);
  v
end;

define method reverse
   (v :: <gsl-vector>) 
=> (reversed :: <gsl-vector>)
  let reversed = copy-gsl-vector(v);
  ffi/gsl-vector-reverse(reversed.%gsl-vector);
  reversed
end;

define method reverse!
   (v :: <gsl-vector>) 
=> (v :: <gsl-vector>)
  ffi/gsl-vector-reverse(v.%gsl-vector);
  v
end;

// Vector operations

define method \+
   (a :: <gsl-vector>, b :: <gsl-vector>) 
=> (sum :: <gsl-vector>)
  let sum = copy-gsl-vector(a);
  ffi/gsl-vector-add(sum.%gsl-vector, b.%gsl-vector);
  sum
end;

define method \-
   (a :: <gsl-vector>, b :: <gsl-vector>) 
=> (diff :: <gsl-vector>)
  let diff = copy-gsl-vector(a);
  ffi/gsl-vector-sub(diff.%gsl-vector, b.%gsl-vector);
  diff
end;

define method \* 
   (a :: <gsl-vector>, b :: <gsl-vector>) 
=> (product :: <gsl-vector>)
  let product = copy-gsl-vector(a);
  ffi/gsl-vector-mul(product.%gsl-vector, b.%gsl-vector);
  product
end;

define method \/
   (a :: <gsl-vector>, b :: <gsl-vector>) 
=> (division :: <gsl-vector>)
  let dividend = copy-gsl-vector(a);
  ffi/gsl-vector-div(dividend.%gsl-vector, b.%gsl-vector);
  dividend
end;

define method \* 
   (a :: <gsl-vector>, value :: <double-float>) 
=> (scaled :: <gsl-vector>)
  let scaled = copy-gsl-vector(a);
  ffi/gsl-vector-scale(scaled.%gsl-vector, value);
  scaled
end;

define method \* 
   (value :: <double-float>, a :: <gsl-vector>) 
=> (scaled :: <gsl-vector>)
  a * value
end;

define method \+
   (a :: <gsl-vector>, value :: <double-float>)
=> (v :: <gsl-vector>)
  let v = copy-gsl-vector(a);
  ffi/gsl-vector-add-constant(v.%gsl-vector, value);
  v
end;

define function sum
   (a :: <gsl-vector>)
=> (sum :: <double-float>)
  ffi/gsl-vector-sum(a.%gsl-vector)
end;

define function axpby
   (alpha :: <double-float>, x :: <gsl-vector>, beta :: <double-float>, y :: <gsl-vector>)
=> (v :: <gsl-vector>)
  let v = copy-gsl-vector(y);
  ffi/gsl-vector-axpby(alpha, x.%gsl-vector, beta, v.%gsl-vector);
  v
end;

define function axpby!
   (alpha :: <double-float>, x :: <gsl-vector>, beta :: <double-float>, y :: <gsl-vector>)
=> (v :: <gsl-vector>)
  ffi/gsl-vector-axpby(alpha, x.%gsl-vector, beta, y.%gsl-vector);
  y
end;

// Finding maximum and minimum elements of vectors

define function gsl-max
   (v :: <gsl-vector>) => (max :: <double-float>)
  ffi/gsl-vector-max(v.%gsl-vector)
end;

define function gsl-min
   (v :: <gsl-vector>) => (min :: <double-float>)
  ffi/gsl-vector-min(v.%gsl-vector)
end;

define function max-index
   (v :: <gsl-vector>) => (max-index :: <integer>)
  ffi/gsl-vector-max-index(v.%gsl-vector)
end;

define function min-index
   (v :: <gsl-vector>) => (min-index :: <integer>)
  ffi/gsl-vector-min-index(v.%gsl-vector)
end;

define function min-max
   (v :: <gsl-vector>) => (min :: <double-float>, max :: <double-float>)
  ffi/gsl-vector-minmax(v.%gsl-vector)
end;

define function min-max-index
   (v :: <gsl-vector>) => (min-index :: <integer>, max-index :: <integer>)
  ffi/gsl-vector-minmax-index(v.%gsl-vector)
end;

// Vector properties

define method \=
   (a :: <gsl-vector>, b :: <gsl-vector>) 
=> (equal :: <boolean>)
  ffi/gsl-vector-equal(a.%gsl-vector, b.%gsl-vector) = 0
end;

define function null?
   (a :: <gsl-vector>) 
=> (_ :: <boolean>)
  ffi/gsl-vector-isnull(a.%gsl-vector) = 1
end;

define method zero?
   (a :: <gsl-vector>) 
=> (zero? :: <boolean>)
  a.null?
end;

define method positive?
   (a :: <gsl-vector>) 
=> (positive? :: <boolean>)
  ffi/gsl-vector-ispos(a.%gsl-vector) = 1
end;

define method negative
   (a :: <gsl-vector>)
=> (negative :: <gsl-vector>)
  let negative = make(<gsl-vector>, size: a.size, fill: 0.0d0);
  ffi/gsl-vector-sub(negative.%gsl-vector, a.%gsl-vector);
  negative
end;

define method negative?
   (a :: <gsl-vector>) 
=> (negative? :: <boolean>)
  ffi/gsl-vector-isneg(a.%gsl-vector) = 1
end;

define method non-negative?
   (a :: <gsl-vector>) 
=> (non-negative? :: <boolean>)
  ffi/gsl-vector-isnonneg(a.%gsl-vector) = 1
end;

define method f=
   (a :: <gsl-vector>, b :: <gsl-vector>, 
    #key epsilon :: <double-float> = *epsilon*) 
=> (aprox-equal? :: <boolean>)
  block (equal?)
    if (a.size ~= b.size)
      equal?(#f)
    end;
    for (i from 0 below a.size)
      let comparison = f=(a[i], b[i], epsilon: epsilon);
      if (~comparison)
        equal?(#f)
      end;
    end for;
    #t
  end block;
end;
