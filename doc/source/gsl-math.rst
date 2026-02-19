The GSL-MATH module
*******************

.. current-library:: dylan-gsl
.. current-module:: gsl-math

Double-float comparison functions
==================================

.. constant:: $default-epsilon

.. variable:: *epsilon*

.. generic:: f=

   :signature: f= (x y #key epsilon) => (is-equal)

   :parameter x: An instance of :drm:`<object>`.
   :parameter y: An instance of :drm:`<object>`.
   :parameter #key epsilon: An instance of :drm:`<double-float>`.
   :value is-equal: An instance of :drm:`<boolean>`.

.. method:: f=
   :specializer: <double-float>

   :signature: f= (x y #key epsilon) => (is-equal)

   :parameter x: An instance of :drm:`<double-float>`.
   :parameter y: An instance of :drm:`<double-float>`.
   :parameter #key epsilon: An instance of :drm:`<double-float>`.
   :value is-equal: An instance of :drm:`<boolean>`.

Infinity and NaN functions
==========================

.. function:: nan? 

   :signature: nan? (x) => (is-nan?)

   :parameter x: An instance of :drm:`<double-float>`.
   :value is-nan?: An instance of :drm:`<boolean>`.

.. function:: infinity?

   :signature: infinity? (x) => (is-infinity?)

   :parameter x: An instance of :drm:`<double-float>`.
   :value is-infinity?: An instance of :drm:`<boolean>`

.. function:: positive-infinity?

   :signature: positive-infinity? (x) => (is-positive-infinity?)

   :parameter x: An instance of :drm:`<double-float>`.
   :value is-positive-infinity?: An instance of :drm:`<boolean>`.

.. function:: negative-infinity?

   :signature: negative-infinity? (x) => (is-negative-infinity?)

   :parameter x: An instance of :drm:`<double-float>`.
   :value is-negative-infinity?: An instance of :drm:`<boolean>`.

Elementary functions
====================

.. function:: log1p

   :signature: log1p (x) => (log1p-x)

   :parameter x: An instance of :drm:`<double-float>`.
   :value log1p-x: An instance of :drm:`<double-float>`.

.. function:: expm1

   :signature: expm1 (x) => (expm1-x)

   :parameter x: An instance of :drm:`<double-float>`.
   :value expm1-x: An instance of :drm:`<double-float>`.

.. function:: hypot

   :signature: hypot (x y) => (hypot-xy)

   :parameter x: An instance of :drm:`<double-float>`.
   :parameter y: An instance of :drm:`<double-float>`.
   :value hypot-xy: An instance of :drm:`<double-float>`.

.. function:: hypot3

   :signature: hypot3 (x y z) => (hypot3-xyz)

   :parameter x: An instance of :drm:`<double-float>`.
   :parameter y: An instance of :drm:`<double-float>`.
   :parameter z: An instance of :drm:`<double-float>`.
   :value hypot3-xyz: An instance of :drm:`<double-float>`.

.. function:: acosh

   :signature: acosh (x) => (acosh-x)

   :parameter x: An instance of :drm:`<double-float>`.
   :value acosh-x: An instance of :drm:`<double-float>`.

.. function:: asinh

   :signature: asinh (x) => (asinh-x)

   :parameter x: An instance of :drm:`<double-float>`.
   :value asinh-x: An instance of :drm:`<double-float>`.

.. function:: atanh

   :signature: atanh (x) => (atanh-x)

   :parameter x: An instance of :drm:`<double-float>`.
   :value atanh-x: An instance of :drm:`<double-float>`.

.. function:: atan2

   :signature: atan2 (x y) => (atan2-xy)

   :parameter x: An instance of :drm:`<double-float>`.
   :parameter y: An instance of :drm:`<double-float>`.
   :value atan2-xy: An instance of :drm:`<double-float>`.

.. function:: ldexp

   :signature: ldexp (x n) => (ldexp-xn)

   :parameter x: An instance of :drm:`<double-float>`.
   :parameter n: An instance of :drm:`<integer>`.
   :value ldexp-xn: An instance of :drm:`<double-float>`.

.. function:: frexp

   :signature: frexp (x) => (values mantissa exponent)

   :parameter x: An instance of :drm:`<double-float>`.
   :value mantissa: An instance of :drm:`<double-float>`.
   :value exponent: An instance of :drm:`<integer>`.