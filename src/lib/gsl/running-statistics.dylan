Module: gsl-running-statistics-impl
Synopsis: Running statistics functions
Author: Fernando Raya
Copyright: Copyright (C) 2026, Dylan Hackers. All rights reserved.
License: See LICENSE in this distribution for details.
Reference: https://www.gnu.org/software/gsl/doc/html/rstat.html#running-statistics

define class <rstat> (<object>)
  slot %rstat-workspace :: ffi/<gsl-rstat-workspace*>;
  constant virtual slot rstat-min :: <double-float>;
  constant virtual slot rstat-max :: <double-float>;
  constant virtual slot rstat-mean :: <double-float>;
  constant virtual slot rstat-variance :: <double-float>;
  constant virtual slot rstat-sd :: <double-float>;
  constant virtual slot rstat-sd-mean :: <double-float>;
  constant virtual slot rstat-rms :: <double-float>;
  constant virtual slot rstat-skew :: <double-float>;
  constant virtual slot rstat-kurtosis :: <double-float>;
  constant virtual slot rstat-median :: <double-float>;
  constant virtual slot rstat-norm :: <double-float>;
end;

define method initialize
  (instance :: <rstat>, #key) => (instance :: <rstat>)
  instance.%rstat-workspace := ffi/gsl-rstat-alloc();
  instance
end;

define function rstat-reset!
  (rstat :: <rstat>) => ()
  ffi/gsl-rstat-reset(rstat.%rstat-workspace)
end;

define method size
  (rstat :: <rstat>) => (n :: <integer>)
  ffi/gsl-rstat-n(rstat.%rstat-workspace)
end;

define generic rstat-add!
  (rstat :: <rstat>, x :: <object>) => ();

define method rstat-add!
   (rstat :: <rstat>, x :: <double-float>) 
=> ()
  ffi/gsl-rstat-add(rstat.%rstat-workspace, x)
end;

define method rstat-add!
  (rstat :: <rstat>, data :: <sequence>) => ()
  for (x in data) rstat-add!(rstat, x) end
end;

define method rstat-min
  (rstat :: <rstat>) => (min :: <double-float>)
  ffi/gsl-rstat-min(rstat.%rstat-workspace)
end;

define method rstat-max
  (rstat :: <rstat>) => (max :: <double-float>)
  ffi/gsl-rstat-max(rstat.%rstat-workspace)
end;

define method rstat-mean
  (rstat :: <rstat>) => (mean :: <double-float>)
  ffi/gsl-rstat-mean(rstat.%rstat-workspace)
end;

define method rstat-variance
  (rstat :: <rstat>) => (variance :: <double-float>)
  ffi/gsl-rstat-variance(rstat.%rstat-workspace)
end;

define method rstat-sd
  (rstat :: <rstat>) => (sd :: <double-float>)
  ffi/gsl-rstat-sd(rstat.%rstat-workspace)
end;

define method rstat-sd-mean
  (rstat :: <rstat>) => (sd-mean :: <double-float>)
  ffi/gsl-rstat-sd-mean(rstat.%rstat-workspace)
end;

define method rstat-rms
  (rstat :: <rstat>) => (rms :: <double-float>)
  ffi/gsl-rstat-rms(rstat.%rstat-workspace)
end;

define method rstat-skew
  (rstat :: <rstat>) => (skew :: <double-float>)
  ffi/gsl-rstat-skew(rstat.%rstat-workspace)
end;

define method rstat-kurtosis
  (rstat :: <rstat>) => (kurtosis :: <double-float>)
  ffi/gsl-rstat-kurtosis(rstat.%rstat-workspace)
end;

define method rstat-median
  (rstat :: <rstat>) => (median :: <double-float>)
  ffi/gsl-rstat-median(rstat.%rstat-workspace)
end;

define method rstat-norm
  (rstat :: <rstat>) => (norm :: <double-float>)
  ffi/gsl-rstat-norm(rstat.%rstat-workspace)
end;

//////////////////////////////////////////////////////////////////////////////
//
// Quantile
//
//////////////////////////////////////////////////////////////////////////////

define class <quantile-rstat> (<object>)
  constant slot quantile-rstat-p :: <double-float>,
    required-init-keyword: p:;
  slot %quantile-rstat-workspace :: ffi/<gsl-rstat-quantile-workspace*>;
end;

define method initialize
  (instance :: <quantile-rstat>, #key) => (instance :: <quantile-rstat>)
  next-method();
  instance.%quantile-rstat-workspace := ffi/gsl-rstat-quantile-alloc(instance.quantile-rstat-p);
  instance
end;

define function quantile-rstat-reset!
  (quantile-rstat :: <quantile-rstat>) => ()
  ffi/gsl-rstat-quantile-reset(quantile-rstat.%quantile-rstat-workspace)
end;

define generic quantile-rstat-add!
  (quantile-rstat :: <quantile-rstat>, x :: <object>) => ();

define method quantile-rstat-add!
  (quantile-rstat :: <quantile-rstat>, x :: <double-float>) => ()
  ffi/gsl-rstat-quantile-add(x, quantile-rstat.%quantile-rstat-workspace)
end;

define method quantile-rstat-add!
  (quantile-rstat :: <quantile-rstat>, data :: <sequence>) => ()
  for (x in data) quantile-rstat-add!(quantile-rstat, x) end
end;

define function quantile-rstat-get
  (quantile-rstat :: <quantile-rstat>) => (quantile :: <double-float>)
  ffi/gsl-rstat-quantile-get(quantile-rstat.%quantile-rstat-workspace)
end;
