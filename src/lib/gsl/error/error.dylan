Module: gsl-error-impl
Synopsis: Module for error handling in GSL
Author: Fernando Raya
Copyright: Copyright (C) 2026, Dylan Hackers. All rights reserved.
License: See LICENSE in this distribution for details.

define class <gsl-error> (<error>)
  constant slot gsl-error-code :: <integer>,
    required-init-keyword: code:;
end;

define class <gsl-failure> (<gsl-error>) end;
define class <gsl-continue> (<gsl-error>) end;
define class <gsl-domain-error> (<gsl-error>) end;
define class <gsl-range-error> (<gsl-error>) end;
define class <gsl-fault> (<gsl-error>) end;
define class <gsl-invalid-argument> (<gsl-error>) end;
define class <gsl-failed> (<gsl-error>) end;
define class <gsl-factorization-failed> (<gsl-error>) end;
define class <gsl-sanity-check-failed> (<gsl-error>) end;
define class <gsl-no-memory> (<gsl-error>) end;
define class <gsl-bad-function> (<gsl-error>) end;
define class <gsl-runaway> (<gsl-error>) end;
define class <gsl-max-iterations> (<gsl-error>) end;
define class <gsl-zero-division> (<gsl-error>) end;
define class <gsl-bad-tolerance> (<gsl-error>) end;
define class <gsl-tolerance> (<gsl-error>) end;
define class <gsl-underflow> (<gsl-error>) end;
define class <gsl-overflow> (<gsl-error>) end;
define class <gsl-loss-of-accuracy> (<gsl-error>) end;
define class <gsl-roundoff-error> (<gsl-error>) end;
define class <gsl-bad-length> (<gsl-error>) end;
define class <gsl-not-square> (<gsl-error>) end;
define class <gsl-singularity> (<gsl-error>) end;
define class <gsl-divergence> (<gsl-error>) end;
define class <gsl-unsupported> (<gsl-error>) end;
define class <gsl-unimplemented> (<gsl-error>) end;
define class <gsl-cache-limit-exceeded> (<gsl-error>) end;
define class <gsl-table-limit-exceeded> (<gsl-error>) end;
define class <gsl-no-progress> (<gsl-error>) end;
define class <gsl-no-progress-jacobian> (<gsl-error>) end;
define class <gsl-tolerance-f> (<gsl-error>) end;
define class <gsl-tolerance-x> (<gsl-error>) end;
define class <gsl-tolerance-gradient> (<gsl-error>) end;
define class <gsl-end-of-file> (<gsl-error>) end;

define method make
    (class == <gsl-error>, #rest all-keys, #key code :: <integer>) 
 => (error :: <gsl-error>)
  let type = select (code)
    $gsl-failure      => <gsl-failure>;
    $gsl-continue     => <gsl-continue>;
    $gsl-edom         => <gsl-domain-error>;
    $gsl-erange       => <gsl-range-error>;
    $gsl-efault       => <gsl-fault>;
    $gsl-einval       => <gsl-invalid-argument>;
    $gsl-efailed      => <gsl-failed>;
    $gsl-efactor      => <gsl-factorization-failed>;
    $gsl-esanity      => <gsl-sanity-check-failed>;
    $gsl-enomem       => <gsl-no-memory>;
    $gsl-ebadfunc     => <gsl-bad-function>;
    $gsl-erunaway     => <gsl-runaway>;
    $gsl-emaxiter     => <gsl-max-iterations>;
    $gsl-ezero        => <gsl-zero-division>;
    $gsl-ebadtol      => <gsl-bad-tolerance>;
    $gsl-etol         => <gsl-tolerance>;
    $gsl-eunderflow   => <gsl-underflow>;
    $gsl-ovrflw       => <gsl-overflow>;
    $gsl-eloss        => <gsl-loss-of-accuracy>;
    $gsl-eround       => <gsl-roundoff-error>;
    $gsl-ebadlen      => <gsl-bad-length>;
    $gsl-enotsq       => <gsl-not-square>;
    $gsl-esing        => <gsl-singularity>;
    $gsl-ediv         => <gsl-divergence>;
    $gsl-eunsupp      => <gsl-unsupported>;
    $gsl-eunimpl      => <gsl-unimplemented>;
    $gsl-ecache       => <gsl-cache-limit-exceeded>;
    $gsl-etable       => <gsl-table-limit-exceeded>;
    $gsl-enoprog      => <gsl-no-progress>;
    $gsl-enoprogjac   => <gsl-no-progress-jacobian>;
    $gsl-etolf        => <gsl-tolerance-f>;
    $gsl-etolx        => <gsl-tolerance-x>;
    $gsl-etolg        => <gsl-tolerance-gradient>;
    $gsl-eof          => <gsl-end-of-file>;
  end select;
  apply(make, type, all-keys)
end;

define method gsl-error-message
  (err :: <gsl-error>) => (message :: <string>)
  gsl-strerror(err.gsl-error-code)
end;