Library: dylan-gsl
Comment: Binding for GNU Scientific Library
Major-Version: 0
Minor-Version: 1
Files: library.dylan
       ffi/ffi-modules.dylan
       ffi/error.dylan
       ffi/math.dylan
       ffi/complex.dylan
       ffi/statistics.dylan
       ffi/running-statistics.dylan
       ffi/block.dylan
       ffi/vector.dylan
       gsl/gsl-modules.dylan
       gsl/common.dylan
       gsl/math.dylan
       gsl/complex.dylan
       gsl/vector.dylan
       gsl/statistics.dylan
       gsl/running-statistics.dylan
C-Source-Files: complex-shim.c
C-libraries: -lgsl -lgslcblas -lm
Target-Type: dll

