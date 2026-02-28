Module: dylan-user

define library dylan-gsl-test-suite
  use common-dylan;
  use io;
  use testworks;
  use dylan-gsl;
end library;

define module dylan-gsl-test-suite
  use common-dylan;
  use format-out;
  use testworks;

  use gsl-error;
  use gsl-common;
  use gsl-math;
  use gsl-vector;
  use gsl-statistics,
    rename: { min-index => stats/min-index,
              max-index => stats/max-index,
              minmax-index => stats/minmax-index };
  use gsl-running-statistics;

  export
    gsl-test-suite,
    gsl-vector-suite,
    gsl-statistics-suite,
    gsl-running-statistics-suite;
end module;
