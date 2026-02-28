Module: dylan-user
Synopsis: Module for error handling in dylan-gsl
Author: Fernando Raya
Copyright: Copyright (C) 2026, Dylan Hackers. All rights reserved.
License: See License.txt in this distribution for details.

define module gsl-ffi-error

  create
    gsl-strerror;

  create
    $gsl-failure,
    $gsl-continue,
    $gsl-success,
    $gsl-edom,
    $gsl-erange,
    $gsl-efault,
    $gsl-einval,
    $gsl-efailed,
    $gsl-efactor,
    $gsl-esanity,
    $gsl-enomem,
    $gsl-ebadfunc,
    $gsl-erunaway,
    $gsl-emaxiter,
    $gsl-ezero,
    $gsl-ebadtol,
    $gsl-etol,
    $gsl-eunderflow,
    $gsl-ovrflw,
    $gsl-eloss,
    $gsl-eround,
    $gsl-ebadlen,
    $gsl-enotsq,
    $gsl-esing,
    $gsl-ediv,
    $gsl-eunsupp,
    $gsl-eunimpl,
    $gsl-ecache,
    $gsl-etable,
    $gsl-enoprog,
    $gsl-enoprogjac,
    $gsl-etolf,
    $gsl-etolx,
    $gsl-etolg,
    $gsl-eof;

end module;

define module gsl-ffi-error-impl

  use common-dylan;
  use c-ffi;
  use uncommon-utils,
    import: { enum-definer };

  use gsl-ffi-error;

end module;
