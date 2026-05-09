GSL-COMPLEX
***********
.. current-library:: dylan-gsl
.. current-module:: gsl-complex

Complex numbers
===============

.. class:: <gsl-complex>

   :description:

     Represents a complex number.  It is a wrapper around the C
     structure ``gsl_complex``.

   :example:

   .. code-block:: dylan

     let c = make(<gsl-complex>, r: 1.0, i: 2.0);

.. function:: gsl-complex

   :signature: gsl-complex (real imag) => (complex)

   :parameter real:

      A :class:`<float>`. The real part of the complex number.

   :parameter imag:

      A :class:`<float>`. The imaginary part of the complex number.

   :value complex:

      A :class:`<gsl-complex>`.

   :description:

     Creates a new complex number with the given real and imaginary
     parts.

.. method:: finalize
   :specializer: <gsl-complex>

   :signature:

     finalize (complex) => ()

   :parameter complex:

      A :class:`<gsl-complex>`. The complex number to finalize.

   :description:

     Finalizes the complex number, freeing its memory.


.. function:: gsl-complex-real

   :signature: gsl-complex-real (complex) => (real)

   :parameter complex:

      A :class:`<gsl-complex>`. The complex number.

   :value real:

      A :class:`<float>`. The real part of the complex number.

   :description:

     Returns the real part of a complex number.

.. function:: gsl-complex-imag

   :signature: gsl-complex-imag (complex) => (imag)

   :parameter complex:

      A :class:`<gsl-complex>`. The complex number.

   :value imag:

      A :class:`<float>`. The imaginary part of the complex number.

   :description:

     Returns the imaginary part of a complex number.

Properties of complex numbers
=============================

.. function:: gsl-complex-abs

   :signature: gsl-complex-abs (complex) => (abs)

   :parameter complex:

      A :class:`<gsl-complex>`. The complex number.

   :value abs:

      A :class:`<float>`. The absolute value of the complex number.

   :description:

     Returns the absolute value of a complex number.

.. function:: gsl-complex-abs2

   :signature: gsl-complex-abs2 (complex) => (abs2)

   :parameter complex:

      A :class:`<gsl-complex>`. The complex number.

   :value abs2:

      A :class:`<float>`. The squared absolute value of the complex number.

   :description:

     Returns the squared absolute value of a complex number.

.. function:: gsl-complex-arg

   :signature: gsl-complex-arg (complex) => (arg)

   :parameter complex:

      A :class:`<gsl-complex>`. The complex number.

   :value arg:

      A :class:`<float>`. The argument of the complex number.

   :description:

     Returns the argument of a complex number.

.. function:: gsl-complex-logabs

   :signature: gsl-complex-logabs (complex) => (logabs)

   :parameter complex:

      A :class:`<gsl-complex>`. The complex number.

   :value logabs:

      A :class:`<float>`. The natural logarithm of the absolute value of the complex number.

   :description:

     Returns the natural logarithm of the absolute value of a complex number.
                    
Complex arithmetic operators
============================

Two complex numbers
^^^^^^^^^^^^^^^^^^^

.. method:: +
   :specializer: <gsl-complex>,<gsl-complex>            

   :signature:

      \+ a b => (c)

   :parameter a:

      A :class:`<gsl-complex>`.

   :parameter b:

      A :class:`<gsl-complex>`.

   :value c:

      A :class:`<gsl-complex>`.

   :description:

      Adds two complex numbers.

.. method:: -
   :specializer: <gsl-complex>,<gsl-complex>            

   :signature:

      \- a b => (c)

   :parameter a:

      A :class:`<gsl-complex>`.

   :parameter b:

      A :class:`<gsl-complex>`.

   :value c:

      A :class:`<gsl-complex>`.

   :description:

      Substracts two complex numbers.

.. method:: *
   :specializer: <gsl-complex>,<gsl-complex>            

   :signature:

      \* a b => (c)

   :parameter a:

      A :class:`<gsl-complex>`.

   :parameter b:

      A :class:`<gsl-complex>`.

   :value c:

      A :class:`<gsl-complex>`.

   :description:

      Multiply two complex numbers.

.. method:: /
   :specializer: <gsl-complex>,<gsl-complex>            

   :signature:

      \/ a b => (c)

   :parameter a:

      A :class:`<gsl-complex>`.

   :parameter b:

      A :class:`<gsl-complex>`.

   :value c:

      A :class:`<gsl-complex>`.

   :description:

      Divides two complex numbers.

A complex and a real
^^^^^^^^^^^^^^^^^^^^

.. method:: +
   :specializer: <gsl-complex>,<float>            

   :signature:

      \+ a b => (c)

   :parameter a:

      A :class:`<gsl-complex>`.

   :parameter b:

      A :drm:`<float>`.

   :value c:

      A :class:`<gsl-complex>`.

   :description:

      Sum of a complex number and a real number.

.. method:: -
   :specializer: <gsl-complex>,<float>            

   :signature:

      \- a b => (c)

   :parameter a:

      A :class:`<gsl-complex>`.

   :parameter b:
      
      A :drm:`<float>`.

   :value c:

      A :class:`<gsl-complex>`.

   :description:

      Difference of a complex number and a real number.

.. method:: *
   :specializer: <gsl-complex>,<float>            

   :signature:

      \* a b => (c)

   :parameter a:

      A :class:`<gsl-complex>`.

   :parameter b:

      A :drm:`<float>`.

   :value c:

      A :class:`<gsl-complex>`.

   :description:

      Product of a complex number and a real number.

.. method:: /
   :specializer: <gsl-complex>,<float>            

   :signature:

      \/ a b => (c)

   :parameter a:

      A :class:`<gsl-complex>`.

   :parameter b:

      A :drm:`<float>`.

   :value c:

      A :class:`<gsl-complex>`.

   :description:

      Quotient of a complex numbers and a real number.

A complex and a imaginary number
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. function:: gsl-complex-add-imag

   :signature: gsl-complex-add-imag (a b) => (z)

   :parameter a:

      A :class:`<gsl-complex>`. The complex number.

   :parameter b:

      A :class:`<float>`. The imaginary number to add to the
      complex number.

   :value z:

      A :class:`<gsl-complex>`. The result of adding the imaginary
      number to the complex number.

   :description:

     Returns the sum of a complex number and an imaginary number.

.. function:: gsl-complex-sub-imag

   :signature: gsl-complex-sub-imag (a b) => (z)

   :parameter a:

      A :class:`<gsl-complex>`. The complex number.

   :parameter b:

      A :class:`<float>`. The imaginary number to subtract from the
      complex number.

   :value z:

      A :class:`<gsl-complex>`. The result of subtracting the
      imaginary number from the complex number.

   :description:

     Returns the difference between a complex number and an imaginary number.

.. function:: gsl-complex-mul-imag

   :signature: gsl-complex-mul-imag (a b) => (z)

   :parameter a:

      A :class:`<gsl-complex>`. The complex number.

   :parameter b:

      A :class:`<float>`. The imaginary number to multiply the
      complex number by.

   :value z:

      A :class:`<gsl-complex>`. The result of multiplying the complex
      number by the imaginary number.

   :description:

     Returns the product of a complex number and an imaginary number.

.. function:: gsl-complex-div-imag

   :signature: gsl-complex-div-imag (a b) => (z)

   :parameter a:

      A :class:`<gsl-complex>`. The complex number.

   :parameter b:

      A :class:`<float>`. The imaginary number to divide the
      complex number by.

   :value z:

      A :class:`<gsl-complex>`. The result of dividing the complex
      number by the imaginary number.

   :description:

     Returns the quotient of a complex number and an imaginary number.

.. function:: gsl-complex-conjugate

   :signature: gsl-complex-conjugate (a) => (z)

   :parameter a:

      A :class:`<gsl-complex>`. The complex number.

   :value z:

      A :class:`<gsl-complex>`. The result of conjugating the complex number.

   :description:

     Returns the complex conjugate of a complex number.

.. function:: gsl-complex-inverse

   :signature: gsl-complex-inverse (a) => (z)

   :parameter a:

      A :class:`<gsl-complex>`. The complex number.

   :value z:

      A :class:`<gsl-complex>`. The result of inverting the complex
      number.

   :description:

     Returns the inverse of a complex number.

.. function:: gsl-complex-negative

   :signature: gsl-complex-negative (a) => (z)

   :parameter a:

      A :class:`<gsl-complex>`. The complex number.

   :value z:

      A :class:`<gsl-complex>`. The result of negating the complex
      number.

   :description:

     Returns the negative of a complex number.

Elementary Complex
==================

.. function:: gsl-complex-sqrt

   :signature: gsl-complex-sqrt (a) => (z)

   :parameter a:

      A :class:`<gsl-complex>`. The complex number.

   :value z:

      A :class:`<gsl-complex>`. The result of taking the square root
      of the complex number.

   :description:

     Returns the square root of a complex number.

.. function:: gsl-complex-exp

   :signature: gsl-complex-exp (a) => (z)

   :parameter a:

      A :class:`<gsl-complex>`. The complex number.

   :value z:

      A :class:`<gsl-complex>`. The result of taking the exponential
      of the complex number.

   :description:

     Returns the exponential of a complex number.

.. function:: gsl-complex-log

   :signature: gsl-complex-log (a) => (z)

   :parameter a:

      A :class:`<gsl-complex>`. The complex number.

   :value z:

      A :class:`<gsl-complex>`. The result of taking the natural
      logarithm of the complex number.

   :description:

     Returns the natural logarithm of a complex number.

.. function:: gsl-complex-log10

   :signature: gsl-complex-log10 (a) => (z)

   :parameter a:

      A :class:`<gsl-complex>`. The complex number.

   :value z:

      A :class:`<gsl-complex>`. The result of taking the base-10
      logarithm of the complex number.

   :description:

     Returns the base-10 logarithm of a complex number.

.. function:: gsl-complex-sqrt-real

   :signature: gsl-complex-sqrt-real (a) => (z)

   :parameter a:

      A :class:`<float>`. The real number.

   :value z:

      A :class:`<gsl-complex>`. The result of taking the square root
      of the real number.

   :description:

     Returns the square root of a real number as a complex number.

.. function:: gsl-complex-pow

   :signature: gsl-complex-pow (a b) => (z)

   :parameter a:

      A :class:`<gsl-complex>`. The base.

   :parameter b:

      A :class:`<gsl-complex>`. The exponent.

   :value z:

      A :class:`<gsl-complex>`. The result of raising the base to the
      power of the exponent.

   :description:

     Returns the result of raising a complex number to the power of
     another complex number.

.. function:: gsl-complex-pow-real

   :signature: gsl-complex-pow-real (a b) => (z)

   :parameter a:

      A :class:`<gsl-complex>`. The base.

   :parameter b:

      A :class:`<float>`. The exponent.

   :value z:

      A :class:`<gsl-complex>`. The result of raising the base to the
      power of the exponent.

   :description:

     Returns the result of raising a complex number to the power of a
     real number.

.. function:: gsl-complex-log-b

   :signature: gsl-complex-log-b (a b) => (z)

   :parameter a:

      A :class:`<gsl-complex>`. The number.

   :parameter b:

      A :class:`<gsl-complex>`. The base.

   :value z:

      A :class:`<gsl-complex>`. The result of taking the logarithm of
      the number with the given base.

   :description:

     Returns the logarithm of a complex number with the given base.

Complex trigonometric
=====================

.. function:: gsl-complex-sin

   :signature: gsl-complex-sin (a) => (z)

   :parameter a:

      A :class:`<gsl-complex>`. The complex number.

   :value z:

      A :class:`<gsl-complex>`. The result of taking the sine of the
      complex number.

   :description:

     Returns the sine of a complex number.

.. function:: gsl-complex-cos

   :signature: gsl-complex-cos (a) => (z)

   :parameter a:

      A :class:`<gsl-complex>`. The complex number.

   :value z:

      A :class:`<gsl-complex>`. The result of taking the cosine of
      the complex number.

   :description:

     Returns the cosine of a complex number.

.. function:: gsl-complex-tan

   :signature: gsl-complex-tan (a) => (z)

   :parameter a:

      A :class:`<gsl-complex>`. The complex number.

   :value z:

      A :class:`<gsl-complex>`. The result of taking the tangent of
      the complex number.

   :description:

     Returns the tangent of a complex number.

.. function:: gsl-complex-sec

   :signature: gsl-complex-sec (a) => (z)

   :parameter a:

      A :class:`<gsl-complex>`. The complex number.

   :value z:

      A :class:`<gsl-complex>`. The result of taking the secant of
      the complex number.

   :description:

     Returns the secant of a complex number.

.. function:: gsl-complex-csc

   :signature: gsl-complex-csc (a) => (z)

   :parameter a:

      A :class:`<gsl-complex>`. The complex number.

   :value z:

      A :class:`<gsl-complex>`. The result of taking the cosecant of
      the complex number.

   :description:

     Returns the cosecant of a complex number.

.. function:: gsl-complex-cot

   :signature: gsl-complex-cot (a) => (z)

   :parameter a:

      A :class:`<gsl-complex>`. The complex number.

   :value z:

      A :class:`<gsl-complex>`. The result of taking the cotangent of
      the complex number.

   :description:

     Returns the cotangent of a complex number.

Inverse trigonometric
=====================

.. function:: gsl-complex-arcsin

   :signature: gsl-complex-arcsin (a) => (z)

   :parameter a:

      A :class:`<gsl-complex>`. The complex number.

   :value z:

      A :class:`<gsl-complex>`. The result of taking the arcsine of
      the complex number.

   :description:

     Returns the arcsine of a complex number.

.. function:: gsl-complex-arccos

   :signature: gsl-complex-arccos (a) => (z)

   :parameter a:

      A :class:`<gsl-complex>`. The complex number.

   :value z:

      A :class:`<gsl-complex>`. The result of taking the arccosine of
      the complex number.

   :description:

     Returns the arccosine of a complex number.

.. function:: gsl-complex-arctan

   :signature: gsl-complex-arctan (a) => (z)

   :parameter a:

      A :class:`<gsl-complex>`. The complex number.

   :value z:

      A :class:`<gsl-complex>`. The result of taking the arctangent
      of the complex number.

   :description:

     Returns the arctangent of a complex number.

.. function:: gsl-complex-arcsec

   :signature: gsl-complex-arcsec (a) => (z)

   :parameter a:

      A :class:`<gsl-complex>`. The complex number.

   :value z:

      A :class:`<gsl-complex>`. The result of taking the arcsecant of
      the complex number.

   :description:

     Returns the arcsecant of a complex number.

.. function:: gsl-complex-arccsc

   :signature: gsl-complex-arccsc (a) => (z)

   :parameter a:

      A :class:`<gsl-complex>`. The complex number.

   :value z:

      A :class:`<gsl-complex>`. The result of taking the arccosecant
      of the complex number.

   :description:

     Returns the arccosecant of a complex number.

.. function:: gsl-complex-arccot

   :signature: gsl-complex-arccot (a) => (z)

   :parameter a:

      A :class:`<gsl-complex>`. The complex number.

   :value z:

      A :class:`<gsl-complex>`. The result of taking the arccotangent
      of the complex number.

   :description:

     Returns the arccotangent of a complex number.

.. function:: gsl-complex-arcsin-real

   :signature: gsl-complex-arcsin-real (a) => (z)

   :parameter a:

      A :class:`<float>`. The real number.

   :value z:

      A :class:`<gsl-complex>`. The result of taking the arcsine of
      the real number.

   :description:

     Returns the arcsine of a real number as a complex number.

.. function:: gsl-complex-arccos-real

   :signature: gsl-complex-arccos-real (a) => (z)

   :parameter a:

      A :class:`<float>`. The real number.

   :value z:

      A :class:`<gsl-complex>`. The result of taking the arccosine of
      the real number.

   :description:

     Returns the arccosine of a real number as a complex number.

.. function:: gsl-complex-arcsec-real

   :signature: gsl-complex-arcsec-real (a) => (z)

   :parameter a:

      A :class:`<float>`. The real number.

   :value z:

      A :class:`<gsl-complex>`. The result of taking the arcsecant of
      the real number.

   :description:

     Returns the arcsecant of a real number as a complex number.

.. function:: gsl-complex-arccsc-real

   :signature: gsl-complex-arccsc-real (a) => (z)

   :parameter a:

      A :class:`<float>`. The real number.

   :value z:

      A :class:`<gsl-complex>`. The result of taking the arccosecant
      of the real number.

   :description:

     Returns the arccosecant of a real number as a complex number.

.. function:: gsl-complex-arccosh-real

   :signature: gsl-complex-arccosh-real (a) => (z)

   :parameter a:

      A :class:`<float>`. The real number.

   :value z:

      A :class:`<gsl-complex>`. The result of taking the arccosh of
      the real number.

   :description:

     Returns the arccosh of a real number as a complex number.

.. function:: gsl-complex-arctanh-real

   :signature: gsl-complex-arctanh-real (a) => (z)

   :parameter a:

      A :class:`<float>`. The real number.

   :value z:

      A :class:`<gsl-complex>`. The result of taking the arctanh of
      the real number.

   :description:

     Returns the arctanh of a real number as a complex number.

Complex hyperbolic
==================

.. function:: gsl-complex-sinh

   :signature: gsl-complex-sinh (a) => (z)

   :parameter a:

      A :class:`<gsl-complex>`. The complex number.

   :value z:

      A :class:`<gsl-complex>`. The result of taking the hyperbolic
      sine of the complex number.

   :description:

     Returns the hyperbolic sine of a complex number.

.. function:: gsl-complex-cosh

   :signature: gsl-complex-cosh (a) => (z)

   :parameter a:

      A :class:`<gsl-complex>`. The complex number.

   :value z:

      A :class:`<gsl-complex>`. The result of taking the hyperbolic
      cosine of the complex number.

   :description:

     Returns the hyperbolic cosine of a complex number.

.. function:: gsl-complex-tanh

   :signature: gsl-complex-tanh (a) => (z)

   :parameter a:

      A :class:`<gsl-complex>`. The complex number.

   :value z:

      A :class:`<gsl-complex>`. The result of taking the hyperbolic
      tangent of the complex number.

   :description:

     Returns the hyperbolic tangent of a complex number.

.. function:: gsl-complex-sech

   :signature: gsl-complex-sech (a) => (z)

   :parameter a:

      A :class:`<gsl-complex>`. The complex number.

   :value z:

      A :class:`<gsl-complex>`. The result of taking the hyperbolic
      secant of the complex number.

   :description:

     Returns the hyperbolic secant of a complex number.

.. function:: gsl-complex-csch

   :signature: gsl-complex-csch (a) => (z)

   :parameter a:

      A :class:`<gsl-complex>`. The complex number.

   :value z:

      A :class:`<gsl-complex>`. The result of taking the hyperbolic
      cosecant of the complex number.

   :description:

     Returns the hyperbolic cosecant of a complex number.

.. function:: gsl-complex-coth

   :signature: gsl-complex-coth (a) => (z)

   :parameter a:

      A :class:`<gsl-complex>`. The complex number.

   :value z:

      A :class:`<gsl-complex>`. The result of taking the hyperbolic
      cotangent of the complex number.

   :description:

     Returns the hyperbolic cotangent of a complex number.

Inverse complex hyperbolic
==========================

.. function:: gsl-complex-arcsinh

   :signature: gsl-complex-arcsinh (a) => (z)

   :parameter a:

      A :class:`<gsl-complex>`. The complex number.

   :value z:

      A :class:`<gsl-complex>`. The result of taking the arcsinh of
      the complex number.

   :description:

     Returns the arcsinh of a complex number.

.. function:: gsl-complex-arccosh

   :signature: gsl-complex-arccosh (a) => (z)

   :parameter a:

      A :class:`<gsl-complex>`. The complex number.

   :value z:

      A :class:`<gsl-complex>`. The result of taking the arccosh of
      the complex number.

   :description:

     Returns the arccosh of a complex number.

.. function:: gsl-complex-arctanh

   :signature: gsl-complex-arctanh (a) => (z)

   :parameter a:

      A :class:`<gsl-complex>`. The complex number.

   :value z:

      A :class:`<gsl-complex>`. The result of taking the arctanh of
      the complex number.

   :description:

     Returns the arctanh of a complex number.

.. function:: gsl-complex-arcsech

   :signature: gsl-complex-arcsech (a) => (z)

   :parameter a:

      A :class:`<gsl-complex>`. The complex number.

   :value z:

      A :class:`<gsl-complex>`. The result of taking the arcsech of
      the complex number.

   :description:

     Returns the arcsech of a complex number.

.. function:: gsl-complex-arccsch

   :signature: gsl-complex-arccsch (a) => (z)

   :parameter a:

      A :class:`<gsl-complex>`. The complex number.

   :value z:

      A :class:`<gsl-complex>`. The result of taking the arccsch of
      the complex number.

   :description:

     Returns the arccsch of a complex number.

.. function:: gsl-complex-arccoth

   :signature: gsl-complex-arccoth (a) => (z)

   :parameter a:

      A :class:`<gsl-complex>`. The complex number.

   :value z:

      A :class:`<gsl-complex>`. The result of taking the arccoth of
      the complex number.

   :description:

     Returns the arccoth of a complex number.
     
