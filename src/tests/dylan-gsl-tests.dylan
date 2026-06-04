Module: dylan-gsl-test-suite

define suite gsl-test-suite ()
  suite gsl-complex-suite;
  suite gsl-vector-suite;
  suite gsl-statistics-suite;
  suite gsl-randist-suite;
  suite gsl-running-statistics-suite;
  suite gsl-rng-suite;
end suite;

// Use `_build/bin/#f-test-suite --help` to see options.
run-test-application()
