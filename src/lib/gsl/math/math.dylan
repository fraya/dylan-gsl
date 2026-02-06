Module: gsl-math-impl
Synopsis: Implementation of the GSL mathematical functions and constants.
Author: Fernando Raya
Copyright: Copyright (C) 2026, Dylan Hackers. All rights reserved.
License: See LICENSE in this distribution for details.

define constant $default-epsilon :: <double-float>
  = 1.0d-6;

define variable *epsilon* :: <double-float>
  = $default-epsilon;
  
define function f=
  (x :: <double-float>, y :: <double-float>, #key epsilon :: <double-float> = *epsilon*)
 => (is-equal :: <boolean>)
  gsl-fcmp(x, y, epsilon) = 0
end;

define function f~=
  (x :: <double-float>, y :: <double-float>, #key epsilon :: <double-float> = *epsilon*)
 => (is-not-equal :: <boolean>)
  gsl-fcmp(x, y, epsilon) ~= 0
end;

define function f<
  (x :: <double-float>, y :: <double-float>, #key epsilon :: <double-float> = *epsilon*)
 => (is-less-than :: <boolean>)
  gsl-fcmp(x, y, epsilon) < 0
end;

define function f>
  (x :: <double-float>, y :: <double-float>, #key epsilon :: <double-float> = *epsilon*)
 => (is-greater-than :: <boolean>)
  gsl-fcmp(x, y, epsilon) > 0
end;

define function f<=
  (x :: <double-float>, y :: <double-float>, #key epsilon :: <double-float> = *epsilon*)
 => (is-less-than-or-equal-to :: <boolean>)
  gsl-fcmp(x, y, epsilon) <= 0
end;

define function f>=
  (x :: <double-float>, y :: <double-float>, #key epsilon :: <double-float> = *epsilon*)
 => (is-greater-than-or-equal-to :: <boolean>)
  gsl-fcmp(x, y, epsilon) >= 0
end;

define function nan?
    (x :: <double-float>)
 => (is-nan? :: <boolean>)
  gsl-isnan(x) = 1
end;

define function infinity?
    (x :: <double-float>)
 => (is-infinity? :: <boolean>)
  gsl-isinf(x) ~= 0
end;

define function positive-infinity?
    (x :: <double-float>)
 => (is-positive-infinity? :: <boolean>)
  gsl-isinf(x) = 1
end;

define function negative-infinity?
    (x :: <double-float>)
 => (is-negative-infinity? :: <boolean>)
  gsl-isinf(x) = -1
end;


