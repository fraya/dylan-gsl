The GSL-FFI-RNG module
**********************

.. current-library:: dylan-gsl
.. current-module:: gsl-ffi-rng

The Random Number Generator interface
-------------------------------------

.. class:: <gsl-rng-type*>

    Type of generator.

.. class:: <gsl-rng-type**>

    A pointer to an array of random number generator types.

.. class:: <gsl-rng*>

    Random number generator.

Random number generator initialization
--------------------------------------

.. function:: gsl-rng-default-type

    Returns the default random number generator.

    :signature:

      gsl-rng-default-type () => (generator)

    :value generator:

      An instance of :class:`<gsl-rng*>`

    :seealso:

      https://www.gnu.org/software/gsl/doc/html/rng.html#c.gsl_rng_default

.. function:: gsl-rng-types-setup

    Returns a pointer to an array of all available generator types.
    Should be called before using any other function in this module.

    :signature:

      gsl-rng-types-setup () => (types)

    :values types:

      An instance of :class:`<gsl-rng-type**>`.

    :seealso:

      https://www.gnu.org/software/gsl/doc/html/rng.html#c.gsl_rng_types_setup

.. function:: gsl-rng-env-setup

    This function reads the environment variables ``GSL_RNG_TYPE`` and
    ``GSL_RNG_SEED`` and uses their values to set the defaults.

    :seealso:

       https://www.gnu.org/software/gsl/doc/html/rng.html#c.gsl_rng_env_setup

.. function:: gsl-rng-type-element

    Returns the type of the random number generator at the given index.

    :signature:

        gsl-rng-type-element (types, index) => (generator)

    :param types:

        An instance of :class:`<gsl-rng-type**>`.

    :param index:

        The index of the type to return.

    :value generator:

        An instance of :class:`<gsl-rng-type*>`.

    :seealso:

      https://www.gnu.org/software/gsl/doc/html/rng.html#c.gsl_rng_type_name


.. function:: gsl-rng-alloc

    Allocates a random number generator of the given type.

    :signature:

      gsl-rng-alloc (type) => (generator)

    :param type:

      An instance of :class:`<gsl-rng-type*>`.

    :value generator:

      An instance of :class:`<gsl-rng*>`

    :seealso:

      https://www.gnu.org/software/gsl/doc/html/rng.html#c.gsl_rng_alloc

.. function:: gsl-rng-free

    Free a random number generator.

    :signature: gsl-rng-free (generator) => ()

    :param generator: An instance of :class:`<gsl-rng*>`.

    :seealso:

      https://www.gnu.org/software/gsl/doc/html/rng.html#c.gsl_rng_free

Auxiliary functions
-------------------

.. function:: gsl-rng-set

    Set the seed for the random number generator.

    :signature:

      gsl-rng-set (generator, seed) => ()

    :param generator:

      An instance of :class:`<gsl-rng*>`.

    :param seed:

      An instance of :class:`<c-integer>`.
      The seed for the random number generator.

    :seealso:

      https://www.gnu.org/software/gsl/doc/html/rng.html#c.gsl_rng_set

.. function:: gsl-rng-max

    Return the maximum value of the random number generator.

    :signature:

      gsl-rng-max (generator) => (max)

    :param generator:

      An instance of :class:`<gsl-rng*>`.

    :value max:

      An instance of :class:`<c-integer>`.

    :seealso:

      https://www.gnu.org/software/gsl/doc/html/rng.html#c.gsl_rng_max

.. function:: gsl-rng-min

    Return the minimum value of the random number generator.

    :signature:

      gsl-rng-min (generator) => (min)

    :param generator:

      An instance of :class:`<gsl-rng*>`.

    :value min:

      An instance of :class:`<c-integer>`.

    :seealso:

      https://www.gnu.org/software/gsl/doc/html/rng.html#c.gsl_rng_min

.. function:: gsl-rng-name

    Return the name of the random number generator.

    :signature:

      gsl-rng-name (generator) => (name)

    :param generator:

      An instance of :class:`<gsl-rng*>`.

    :value name:

      An instance of :class:`<c-string>`.

    :seealso:

      https://www.gnu.org/software/gsl/doc/html/rng.html#c.gsl_rng_name

Sampling from a random number generator
---------------------------------------

.. function:: gsl-rng-get

    Returns a random number between the minimum and maximum value of the random number generator.

    :signature:

      gsl-rng-get (generator) => (number)

    :param generator:

      An instance of :class:`<gsl-rng*>`.

    :value number:

      A random number between the minimum and maximum value of the random number generator as an instance of :class:`<c-double>`.

    :seealso:

      https://www.gnu.org/software/gsl/doc/html/rng.html#c.gsl_rng_get


.. function:: gsl-rng-uniform

    Returns a random number between the minimum and maximum value of the random number generator.

    :signature:

      gsl-rng-uniform (generator) => (number)

    :param generator:

      An instance of :class:`<gsl-rng*>`.

    :value number:

      A random number between the minimum and maximum value of the random number generator as an instance of :class:`<c-double>`.

    :seealso:

      https://www.gnu.org/software/gsl/doc/html/rng.html#c.gsl_rng_uniform

.. function:: gsl-rng-uniform-pos

    Returns a random number between 0 and the maximum value of the random number generator.

    :signature:

      gsl-rng-uniform-pos (generator) => (number)

    :param generator:

      An instance of :class:`<gsl-rng*>`.

    :value number:

      A random number between 0 and the maximum value of the random number generator as an instance of :class:`<c-double>`.

    :seealso:

      https://www.gnu.org/software/gsl/doc/html/rng.html#c.gsl_rng_uniform_pos

.. function:: gsl-rng-uniform-int

    Returns a random number between 0 and n-1 of the random number generator.

    :signature:

      gsl-rng-uniform-int (generator, n) => (number)

    :param generator:

      An instance of :class:`<gsl-rng*>`.

    :param n:

      An instance of :class:`<c-integer>`.

    :value number:

      A random number between 0 and n-1 of the random number generator as an instance of :class:`<c-integer>`.

    :seealso:

      https://www.gnu.org/software/gsl/doc/html/rng.html#c.gsl_rng_uniform_int
