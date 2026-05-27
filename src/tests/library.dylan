Module: dylan-user

define library dylan-gsl-test-suite
  use common-dylan;
  use c-ffi;
  use io;
  use system;
  use testworks;
  use dylan-gsl;
end library;

define module dylan-gsl-test-suite
  use common-dylan;
  use c-ffi;
  use format-out;
  use operating-system,
    import: { environment-variable };
  use testworks;
  use transcendentals;

  use gsl-error;
  use gsl-common;
  use gsl-math;
  use gsl-complex;
  use gsl-vector;
  use gsl-rng;
  use gsl-statistics,
    rename: { min-index => stats/min-index,
              max-index => stats/max-index,
              minmax-index => stats/minmax-index };
  use gsl-running-statistics;

  export
    gsl-test-suite,
    gsl-complex-suite,
    gsl-vector-suite,
    gsl-statistics-suite,
    gsl-running-statistics-suite,
    gsl-rng-suite;
end module;
