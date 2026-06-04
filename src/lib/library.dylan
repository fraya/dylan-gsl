Module: dylan-user

define library dylan-gsl

  use common-dylan;
  use c-ffi;
  use io,
    import: { format,
              format-out };
  use uncommon-dylan,
    import: { uncommon-utils };

  // gsl ffi modules

  export
    gsl-ffi-error,
    gsl-ffi-math,
    gsl-ffi-complex,
    gsl-ffi-vector,
    gsl-ffi-statistics,
    gsl-ffi-randist,
    gsl-ffi-running-statistics,
    gsl-ffi-rng;

  // gsl dylan idiomatic modules

  export
    gsl-common,
    gsl-error,
    gsl-math,
    gsl-complex,
    gsl-vector,
    gsl-statistics,
    gsl-randist,
    gsl-running-statistics,
    gsl-rng;

end library;
