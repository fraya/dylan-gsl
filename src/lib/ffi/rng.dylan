Module: gsl-ffi-rng-impl
Synopsis: Random number generators
Author: Fernando Raya
Copyright: Copyright (C) 2026, Dylan Hackers. All rights reserved.
License: See LICENSE in this distribution for details.
Reference: https://www.gnu.org/software/gsl/doc/html/rng.html

define c-struct <gsl-rng-type>
  pointer-type-name: <gsl-rng-type*>;
end;

define c-pointer-type <gsl-rng-type**> => <gsl-rng-type*>;

define c-function gsl-rng-default-type
  result default :: <gsl-rng-type*>;
  c-name: "gsl_rng_default_shim";
end;

define c-function gsl-rng-default-seed
  result default :: <c-unsigned-long>;
  c-name: "gsl_rng_default_seed_shim";
end;

define c-function gsl-rng-types-setup
  result types :: <gsl-rng-type**>;
  c-name: "gsl_rng_types_setup";
end;

define c-function gsl-rng-env-setup
  result type :: <gsl-rng-type*>;
  c-name: "gsl_rng_env_setup";
end;

define c-struct <gsl-rng>
  pointer-type-name: <gsl-rng*>;
end;

define c-function gsl-rng-alloc
  parameter t :: <gsl-rng-type*>;
  result r :: <gsl-rng*>;
  c-name: "gsl_rng_alloc";
end;

define c-function gsl-rng-set
  parameter r :: <gsl-rng*>;
  parameter seed :: <c-unsigned-long>;
  c-name: "gsl_rng_set";
end;

define c-function gsl-rng-free
  parameter r :: <gsl-rng*>;
  c-name: "gsl_rng_free";
end;

define c-function gsl-rng-max
  parameter r :: <gsl-rng*>;
  result max :: <c-unsigned-long>;
  c-name: "gsl_rng_max";
end;

define c-function gsl-rng-min
  parameter r :: <gsl-rng*>;
  result min :: <c-unsigned-long>;
  c-name: "gsl_rng_min";
end;

define c-function gsl-rng-name
  parameter r :: <gsl-rng*>;
  result name :: <c-string>;
  c-name: "gsl_rng_name";
end;

define c-function gsl-rng-get
  parameter r :: <gsl-rng*>;
  result number :: <c-unsigned-long>;
  c-name: "gsl_rng_get";
end;

define c-function gsl-rng-uniform
  parameter r :: <gsl-rng*>;
  result number :: <c-double>;
  c-name: "gsl_rng_uniform";
end;

define c-function gsl-rng-uniform-pos
  parameter r :: <gsl-rng*>;
  result number :: <c-double>;
  c-name: "gsl_rng_uniform_pos";
end;

define c-function gsl-rng-uniform-int
  parameter r :: <gsl-rng*>;
  parameter n :: <c-unsigned-long>;
  result number :: <c-unsigned-long>;
  c-name: "gsl_rng_uniform_int";
end;
