GSL-RNG
*******

.. current-library:: dylan-gsl
.. current-module:: gsl-rng

This module introduce the class :class:`<gsl-rng>` that provides a
uniform interface to a large collection of random number generators.

To create a random number generator with the BSD :const:`$gsl-rng-rand`
generator and a seed:

.. code-block:: dylan

   let rng = make(<gsl-rng>, type: $gsl-rng-rand, seed: 1234);
   format-out("generator type: %s\n", rng.gsl-rng-name);
   format-out("seed = %d\n", rng.gsl-rng-seed);
   format-out("first value = %d\n", rng.gsl-rng-get);

.. _rng_environment_variables:

Random number environment variables
-----------------------------------

.. function:: gsl-rng-env-setup

   This function reads the environment variables ``GSL_RNG_TYPE`` and
   ``GSL_RNG_SEED`` and uses their values to set the corresponding
   library variables gsl_rng_default and gsl_rng_default_seed.

   If you don’t specify a generator for ``GSL_RNG_TYPE`` then
   :const:`$gsl-rng-mt19937` is used as the default. The initial value
   of :func:`gsl-rng-default-seed` is zero.

   :signature: gsl-rng-env-setup () => ()

   :seealso:

      https://www.gnu.org/software/gsl/doc/html/rng.html#c.gsl_rng_env_setup

   :example:

      Here we create a default random number generator with default seed:

      .. code-block:: dylan

         gsl-rng-env-setup();

         let rng = make(<gsl-rng>);

         format-out("generator type: %s\n", rng.gsl-rng-name);
         format-out("seed = %d\n", rng.gsl-rng-seed);
         format-out("first value = %d\n", rng.gsl-rng-get);

   :example:

      Running the program without any environment variables,

      .. code-block:: shell

         $ test-rng.exe                     
         generator type: mt19937
         seed = 0
         first value = 4293858116

   :example:

      We can pass the environment variables to choose type of
      algorithm and seed:

      .. code-block:: shell

         $ GSL_RNG_TYPE="taus" GSL_RNG_SEED=123 test-rng.exe
         GSL_RNG_TYPE=taus
         GSL_RNG_SEED=123
         generator type: taus
         seed = 123
         first value = 2720986350

Random generator base class
---------------------------

.. class:: <gsl-rng>

   The class for random number generators.

   :supers:

     :class:`<object>`

   :keyword type:

    Type of random number generator. An instance of :drm:`<integer>`.
    If no type is provided, it defaults to the environment variable
    ``GLS_RNG_TYPE``.

   :keyword seed:

    An instance of :drm:`<integer>` that will be used as the seed for
    the random number generator. If no seed is provided it defaults to
    the ``GLS_RNG_SEED`` environment variable or 0, if the variable is
    absent.

    :example:

    .. code-block:: dylan

       let r1 = make(<gsl-rng>, type: $gsl-rng-cmrg, seed: 123456);
       let r2 = make(<gsl-rng>, seed: 123456);
       let r3 = make(<gsl-rng>);

    :operations:

       - :func:`gsl-rng-get`

       - :func:`gsl-rng-uniform`

       - :func:`gsl-rng-uniform-positive`

       - :func:`gsl-rng-uniform-integer`

       - :meth:`gsl-rng-seed(<gsl-rng>)`

       - :func:`gsl-rng-name`

       - :func:`gsl-rng-min`

       - :func:`gsl-rng-max`

Sampling
--------

.. function:: gsl-rng-get

    Returns a random number between the minimum and maximum value of
    the random number generator.

    :signature:

      gsl-rng-get (rng) => (number)

    :param rng:

      An instance of :class:`<gsl-rng>`.

    :values number:

      A random number between the minimum and maximum value of the
      random number generator as an instance of :drm:`<integer>`.

    :example:

       .. code-block:: dylan

          let r = make(<gsl-rng>);
          let s = r.gsl-rng-get;

.. function:: gsl-rng-uniform

    Returns a random floating point number uniformly distributed in
    the range [0,1).

    :signature:

      gsl-rng-uniform (rng) => (number)

    :param rng:

      An instance of :class:`<gsl-rng>`.

    :values number:

      An instance of :drm:`<float>`.  The range includes 0.0 but
      excludes 1.0.

    :example:

       .. code-block:: dylan

          let r = make(<gsl-rng>);
          let s = r.gsl-rng-uniform;

.. function:: gsl-rng-uniform-positive

    Returns a positive random number uniformly distributed in the
    range (0,1), excluding both 0.0 and 1.0.  The number is obtained
    by sampling the generator with the algorithm of
    :func:`gsl-rng-uniform` until a non-zero value is obtained.

    :signature:

      gsl-rng-uniform-positive (rng) => (number)

    :param rng:

      An instance of :class:`<gsl-rng>`.

    :values number:

      An instance of :drm:`<float>`, between 0.0 and 1.0 excluding
      both endpoints.

    :example:

       .. code-block:: dylan

          let r = make(<gsl-rng>);
          let s = r.gsl-rng-uniform-positive;

.. function:: gsl-rng-uniform-integer

    Returns a random number between 0 and n-1 of the random number
    generator.

    :signature:

      gsl-rng-uniform-integer (rng, n) => (number)

    :param rng:

      An instance of :class:`<gsl-rng>`.

    :param n:

      An instance of :drm:`<integer>`. The parameter must be less than
      or equal to the range or the generator ``rng``. If ``n`` is
      larger than the range of the generator an error will be
      signaled.

    :values number:

      A random number between 0 and n-1 of the random number generator
      as an instance of :drm:`<integer>`.

    :example:

       .. code-block:: dylan

          let r = make(<gsl-rng>);
          let s = gsl-rng-uniform-integer(r, 10);

Auxiliary functions
-------------------

.. function:: gsl-rng-name

    Returns the name of the random number generator.

    :signature:

      gsl-rng-name (rng) => (name)

    :param rng:

      An instance of :class:`<gsl-rng>`.

    :values name:

      The name of the random number generator as an instance of
      :class:`<string>`.

    :example:

       .. code-block:: dylan

          let r = make(<gsl-rng>, type: $gsl-rng-rand);
          format-out("%s", r.gsl-rng-name);
          // rand

.. method:: gsl-rng-seed
   :specializer: <gsl-rng>

   Returns the seed of the random number generator

   :signature:

      gsl-rng-seed (rng) => (seed)

   :parameter rng:

      An instance of :class:`<gsl-rng>`

   :values seed:

      An instance of :drm:`<integer>`

   :example:

      .. code-block:: dylan

         let r = make(<gsl-rng>, seed: 1234);
         format-out("Seed: %d\n", r.gsl-rng-seed);
         // Seed: 1234

.. function:: gsl-rng-min

    Returns the smallest value returned by the random number
    generator.

    :signature:

      gsl-rng-min (rng) => (min)

    :param rng:

      An instance of :class:`<gsl-rng>`.

    :values min:

      The minimum value returned by the random number generator as an
      instance of :drm:`<integer>`.

.. function:: gsl-rng-max

    Returns the maximum value returned by the random number generator.

    :signature:

      gsl-rng-max (rng) => (max)

    :param rng:

      An instance of :class:`<gsl-rng>`.

    :values max:

      The maximum value returned by the random number generator as an
      instance of :drm:`<integer>`.

Random number generator algorithms
----------------------------------

Below are all the algorithms of random number generators available,
whose constants can be passed in the class :class:`<gsl-rng>`
construction with the ``type:`` keyword.

MT19937 generators
^^^^^^^^^^^^^^^^^^

.. constant:: $mt19937

    :seealso:

      https://www.gnu.org/software/gsl/doc/html/rng.html#c.gsl_rng_mt19937

.. constant:: $mt19937-1999

.. constant:: $mt19937-1998

RANLUX generators
^^^^^^^^^^^^^^^^^

.. constant:: $ranlxs0

    :seealso:

      https://www.gnu.org/software/gsl/doc/html/rng.html#c.gsl_rng_ranlxs0

.. constant:: $ranlxs1

    :seealso:

      https://www.gnu.org/software/gsl/doc/html/rng.html#c.gsl_rng_ranlxs1

.. constant:: $ranlxs2

    :seealso:

      https://www.gnu.org/software/gsl/doc/html/rng.html#c.gsl_rng_ranlxs2

.. constant:: $ranlxd1

    :seealso:

      https://www.gnu.org/software/gsl/doc/html/rng.html#c.gsl_rng_ranlxd1

.. constant:: $ranlxd2

    :seealso:

      https://www.gnu.org/software/gsl/doc/html/rng.html#c.gsl_rng_ranlxd2


.. constant:: $ranlux

    :seealso:

      https://www.gnu.org/software/gsl/doc/html/rng.html#c.gsl_rng_ranlux

.. constant:: $ranlux389

    :seealso:

      https://www.gnu.org/software/gsl/doc/html/rng.html#c.gsl_rng_ranlux389

L'Ecuyer generators
^^^^^^^^^^^^^^^^^^^

.. constant:: $cmrg

    :seealso:

      https://www.gnu.org/software/gsl/doc/html/rng.html#c.gsl_rng_cmrg

.. constant:: $mrg

    :seealso:

      https://www.gnu.org/software/gsl/doc/html/rng.html#c.gsl_rng_mrg

.. constant:: $taus

    :seealso:

      https://www.gnu.org/software/gsl/doc/html/rng.html#c.gsl_rng_taus

.. constant:: $taus2

    :seealso:

      https://www.gnu.org/software/gsl/doc/html/rng.html#c.gsl_rng_taus2005

.. constant:: $taus113

    :seealso:

      https://www.gnu.org/software/gsl/doc/html/rng.html#c.gsl_rng_tt800

GSFR4
^^^^^

.. constant:: $gfsr4

    :seealso:

      https://www.gnu.org/software/gsl/doc/html/rng.html#c.gsl_rng_gfsr4


Unix random number generators
-----------------------------

BSD generators
^^^^^^^^^^^^^^

.. constant:: $rand

.. constant:: $random-bsd

.. constant:: $random-glibc2

.. constant:: $random-libc5

.. constant:: $random8-bsd

.. constant:: $random8-glibc2

.. constant:: $random8-libc5

.. constant:: $random32-bsd

.. constant:: $random32-glibc2

.. constant:: $random32-libc5

.. constant:: $random64-bsd

.. constant:: $random64-glibc2

.. constant:: $random64-libc5

.. constant:: $random128-bsd

.. constant:: $random128-glibc2

.. constant:: $random128-libc5

.. constant:: $random256-bsd

.. constant:: $random256-glibc2

.. constant:: $random256-libc5

.. constant:: $rand48

.. constant:: $ran0

.. constant:: $ran1

.. constant:: $ran2

.. constant:: $ran3

Other random number generators
------------------------------

.. constant:: $ranf

   :seealso:

      https://www.gnu.org/software/gsl/doc/html/rng.html#c.gsl_rng_ranf

.. constant:: $ranmar

    :seealso:

      https://www.gnu.org/software/gsl/doc/html/rng.html#c.gsl_rng_ransi

.. constant:: $r250

    :seealso:

      https://www.gnu.org/software/gsl/doc/html/rng.html#c.gsl_rng_r250

.. constant:: $tt800

    :seealso:

      https://www.gnu.org/software/gsl/doc/html/rng.html#c.gsl_rng_tt800

.. constant:: $vax

    :seealso:

      https://www.gnu.org/software/gsl/doc/html/rng.html#c.gsl_rng_vax

.. constant:: $transputer

    :seealso:

      https://www.gnu.org/software/gsl/doc/html/rng.html#c.gsl_rng_vdup

.. constant:: $randu

    :seealso:

      https://www.gnu.org/software/gsl/doc/html/rng.html#c.gsl_rng_randu

.. constant:: $minstd

    :seealso:

      https://www.gnu.org/software/gsl/doc/html/rng.html#c.gsl_rng_minstd

.. constant:: $uni

    :seealso:

      https://www.gnu.org/software/gsl/doc/html/rng.html#c.gsl_rng_uni

.. constant:: $uni32

    :seealso:

      https://www.gnu.org/software/gsl/doc/html/rng.html#c.gsl_rng_uni32

.. constant:: $slatec

    :seealso:

      https://www.gnu.org/software/gsl/doc/html/rng.html#c.gsl_rng_slatec

.. constant:: $zuf

    :seealso:

      https://www.gnu.org/software/gsl/doc/html/rng.html#c.gsl_rng_zuf

.. constant:: $knuthran2

    :seealso:

      https://www.gnu.org/software/gsl/doc/html/rng.html#c.gsl_rng_knuthran2

.. constant:: $knuthran2002

    :seealso:

      https://www.gnu.org/software/gsl/doc/html/rng.html#c.gsl_rng_knuthran2002

.. constant:: $knuthran

    :seealso:

      https://www.gnu.org/software/gsl/doc/html/rng.html#c.gsl_rng_knuthran


.. constant:: $borosh13

    :seealso:

       https://www.gnu.org/software/gsl/doc/html/rng.html#c.gsl_rng_borosh13

.. constant:: $fishman18

    :seealso:

      https://www.gnu.org/software/gsl/doc/html/rng.html#c.gsl_rng_fishman18

.. constant:: $fishman20

    :seealso:

      https://www.gnu.org/software/gsl/doc/html/rng.html#c.gsl_rng_fishman20

.. constant:: $lecuyer21

    :seealso:

      https://www.gnu.org/software/gsl/doc/html/rng.html#c.gsl_rng_lecuyer21

.. constant:: $waterman14

    :seealso:

      https://www.gnu.org/software/gsl/doc/html/rng.html#c.gsl_rng_waterman14

.. constant:: $fishman2x

    :seealso:

      https://www.gnu.org/software/gsl/doc/html/rng.html#c.gsl_rng_fishman2x

.. constant:: $coveyou

    :seealso:

      https://www.gnu.org/software/gsl/doc/html/rng.html#c.gsl_rng_coveyou

