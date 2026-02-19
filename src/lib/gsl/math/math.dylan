Module: gsl-math-impl
Synopsis: Implementation of the GSL mathematical functions and constants.
Author: Fernando Raya
Copyright: Copyright (C) 2026, Dylan Hackers. All rights reserved.
License: See LICENSE in this distribution for details.

define constant $default-epsilon :: <double-float>
  = 1.0d-6;

define variable *epsilon* :: <double-float>
  = $default-epsilon;
  
define generic f=
    (x :: <object>, y :: <object>, #key epsilon :: <double-float> = *epsilon*)
 => (aprox-equal? :: <boolean>);

define method f=
    (x :: <double-float>, y :: <double-float>, #key epsilon :: <double-float> = *epsilon*)
 => (aprox-equal :: <boolean>)
  gsl-fcmp(x, y, epsilon) = 0
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


