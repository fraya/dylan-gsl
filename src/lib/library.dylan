Module: dylan-user

define library dylan-gsl

  use common-dylan;
  use c-ffi;
  use io,
    import: { format-out };
  use uncommon-dylan,
    import: { uncommon-utils };

  // gsl ffi modules

  export
    gsl-ffi-error,          // file:ffi/error/module.dylan
    gsl-ffi-math,           // file:ffi/math/module.dylan
    gsl-ffi-vector,         // file:ffi/vector-and-matrices/module-vector.dylan
    gsl-ffi-statistics,     // file:ffi/statistics/module.dylan
    gsl-ffi-running-statistics; // file:ffi/running-statistics/module.dylan

  // gsl dylan idiomatic modules

  export
    gsl-common,             // file:gsl/common/module.dylan
    gsl-error,              // file:gsl/error/module.dylan
    gsl-math,               // file:gsl/math/module.dylan
    gsl-vector,             // file:gsl/vector-and-matrices/module-vector.dylan
    gsl-statistics,         // file:gsl/statistics/module.dylan
    gsl-running-statistics; // file:gsl/running-statistics/module.dylan

end library;
