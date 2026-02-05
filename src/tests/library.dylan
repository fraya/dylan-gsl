Module: dylan-user

define library dylan-gsl-test-suite
  use common-dylan;
  use testworks;
  use dylan-gsl;
end library;

define module dylan-gsl-test-suite
  use common-dylan;
  use testworks;

  use gsl-common;
  use gsl-math;
  use gsl-statistics;

  export
    gsl-test-suite,
    gsl-statistics-suite;
end module;
