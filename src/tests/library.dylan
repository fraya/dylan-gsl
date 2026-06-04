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

  use gsl-common;
  use gsl-complex;
  use gsl-error;
  use gsl-math;
  use gsl-rng;
  use gsl-randist;
  use gsl-running-statistics;
  use gsl-statistics,
    rename: { min-index => stats/min-index,
              max-index => stats/max-index,
              minmax-index => stats/minmax-index };
  use gsl-vector;

  export
    gsl-test-suite,
    gsl-complex-suite,
    gsl-rng-suite,
    gsl-running-statistics-suite,
    gsl-statistics-suite,
    gsl-vector-suite;
end module;
