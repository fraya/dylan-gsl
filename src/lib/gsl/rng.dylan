Module: gsl-rng-impl
Synopsis: GSL Random numbers
Author: Fernando Raya
Copyright: Copyright (C) 2026, Dylan Hackers. All rights reserved.
License: See LICENSE in this distribution for details.

define enum gsl-rng-type ()
  $gsl-rng-borosh13 = 0;
  $gsl-rng-cmrg;
  $gsl-rng-coveyou;
  $gsl-rng-fishman18;
  $gsl-rng-fishman20;
  $gsl-rng-fishman2x;
  $gsl-rng-gfsr4;
  $gsl-rng-knuthran;
  $gsl-rng-knuthran2;
  $gsl-rng-knuthran2002;
  $gsl-rng-lecuyer21;
  $gsl-rng-minstd;
  $gsl-rng-mrg;
  $gsl-rng-mt19937;
  $gsl-rng-mt19937-1999;
  $gsl-rng-mt19937-1998;
  $gsl-rng-r250;
  $gsl-rng-ran0;
  $gsl-rng-ran1;
  $gsl-rng-ran2;
  $gsl-rng-ran3;
  $gsl-rng-rand;
  $gsl-rng-rand48;
  $gsl-rng-random128-bsd;
  $gsl-rng-random128-glibc2;
  $gsl-rng-random128-libc5;
  $gsl-rng-random256-bsd;
  $gsl-rng-random256-glibc2;
  $gsl-rng-random256-libc5;
  $gsl-rng-random32-bsd;
  $gsl-rng-random32-glibc2;
  $gsl-rng-random32-libc5;
  $gsl-rng-random64-bsd;
  $gsl-rng-random64-glibc2;
  $gsl-rng-random64-libc5;
  $gsl-rng-random8-bsd;
  $gsl-rng-random8-glibc2;
  $gsl-rng-random8-libc5;
  $gsl-rng-random-bsd;
  $gsl-rng-random-glibc2;
  $gsl-rng-random-libc5;
  $gsl-rng-randu;
  $gsl-rng-ranf;
  $gsl-rng-ranlux;
  $gsl-rng-ranlux389;
  $gsl-rng-ranlxd1;
  $gsl-rng-ranlxd2;
  $gsl-rng-ranlxs0;
  $gsl-rng-ranlxs1;
  $gsl-rng-ranlxs2;
  $gsl-rng-ranmar;
  $gsl-rng-slatec;
  $gsl-rng-taus;
  $gsl-rng-taus2;
  $gsl-rng-taus113;
  $gsl-rng-transputer;
  $gsl-rng-tt800;
  $gsl-rng-uni;
  $gsl-rng-uni32;
  $gsl-rng-vax;
  $gsl-rng-waterman14;
  $gsl-rng-zuf;
end enum;

define constant <gsl-rng-type>
  = limited(<integer>, min: $gsl-rng-borosh13, max: $gsl-rng-zuf);

define constant $gsl-rng-types :: ffi/<gsl-rng-type**>
  = ffi/gsl-rng-types-setup();

define constant gsl-rng-env-setup
  = ffi/gsl-rng-env-setup;

define class <gsl-rng> (<object>)
  constant slot gsl-rng-seed :: <integer>,
    init-keyword: seed:,
    init-value: ffi/gsl-rng-default-seed();
  slot gsl-rng-ffi :: ffi/<gsl-rng*>;
end;

define method initialize
    (r :: <gsl-rng>, #key type :: false-or(<gsl-rng-type>) = #f)
 => ()
  drain-finalization-queue();
  next-method();
  let rng-type :: ffi/<gsl-rng-type*>
    = if (type)
        $gsl-rng-types[type]
      else
        ffi/gsl-rng-default-type()
      end;
  r.gsl-rng-ffi := ffi/gsl-rng-alloc(rng-type);
  ffi/gsl-rng-set(r.gsl-rng-ffi, r.gsl-rng-seed);
  finalize-when-unreachable(r);
end;

define method finalize
    (r :: <gsl-rng>) => ()
  ffi/gsl-rng-free(r.gsl-rng-ffi)
end;

define method print-object
    (rng :: <gsl-rng>, stream :: <stream>) => ()
  printing-object(rng, stream)
    print(gsl-rng-name(rng), stream, escape?: #t)
  end;
end;

define function gsl-rng-name
    (r :: <gsl-rng>) => (_ :: <string>)
  ffi/gsl-rng-name(r.gsl-rng-ffi)
end;

define function gsl-rng-min
    (r :: <gsl-rng>) => (_ :: <integer>)
  ffi/gsl-rng-min(r.gsl-rng-ffi)
end;

define function gsl-rng-max
    (r :: <gsl-rng>) => (_ :: <integer>)
  ffi/gsl-rng-max(r.gsl-rng-ffi)
end;

define function gsl-rng-get
    (r :: <gsl-rng>) => (_ :: <integer>)
  ffi/gsl-rng-get(r.gsl-rng-ffi)
end;

define function gsl-rng-uniform
    (r :: <gsl-rng>) => (_ :: <float>)
  ffi/gsl-rng-uniform(r.gsl-rng-ffi)
end;

define function gsl-rng-uniform-positive
    (r :: <gsl-rng>) => (_ :: <float>)
  ffi/gsl-rng-uniform-pos(r.gsl-rng-ffi)
end;

define function gsl-rng-uniform-int
    (r :: <gsl-rng>, n :: <integer>) => (_ :: <integer>)
  ffi/gsl-rng-uniform-int(r.gsl-rng-ffi, n)
end;
