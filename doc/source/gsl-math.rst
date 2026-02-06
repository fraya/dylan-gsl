The GSL-MATH module
*******************

.. current-library:: dylan-gsl
.. current-module:: gsl-math


.. constant:: $default-epsilon

.. variable:: *epsilon*

.. function:: f<

   :signature: f< (x y #key epsilon) => (is-less-than)

   :parameter x: An instance of :drm:`<double-float>`.
   :parameter y: An instance of :drm:`<double-float>`.
   :parameter #key epsilon: An instance of :drm:`<double-float>`.
   :value is-less-than: An instance of :drm:`<boolean>`.

.. function:: f<=

   :signature: f<= (x y #key epsilon) => (is-less-than-or-equal-to)

   :parameter x: An instance of :drm:`<double-float>`.
   :parameter y: An instance of :drm:`<double-float>`.
   :parameter #key epsilon: An instance of :drm:`<double-float>`.
   :value is-less-than-or-equal-to: An instance of :drm:`<boolean>`.

.. function:: f=

   :signature: f= (x y #key epsilon) => (is-equal)

   :parameter x: An instance of :drm:`<double-float>`.
   :parameter y: An instance of :drm:`<double-float>`.
   :parameter #key epsilon: An instance of :drm:`<double-float>`.
   :value is-equal: An instance of :drm:`<boolean>`.

.. function:: f>

   :signature: f> (x y #key epsilon) => (is-greater-than)

   :parameter x: An instance of :drm:`<double-float>`.
   :parameter y: An instance of :drm:`<double-float>`.
   :parameter #key epsilon: An instance of :drm:`<double-float>`.
   :value is-greater-than: An instance of :drm:`<boolean>`.

.. function:: f>=

   :signature: f>= (x y #key epsilon) => (is-greater-than-or-equal-to)

   :parameter x: An instance of :drm:`<double-float>`.
   :parameter y: An instance of :drm:`<double-float>`.
   :parameter #key epsilon: An instance of :drm:`<double-float>`.
   :value is-greater-than-or-equal-to: An instance of :drm:`<boolean>`.

.. function:: f~=

   :signature: f~= (x y #key epsilon) => (is-not-equal)

   :parameter x: An instance of :drm:`<double-float>`.
   :parameter y: An instance of :drm:`<double-float>`.
   :parameter #key epsilon: An instance of :drm:`<double-float>`.
   :value is-not-equal: An instance of :drm:`<boolean>`.

.. function:: nan? (x) => (is-nan?)

   :parameter x: An instance of :drm:`<double-float>`.
   :value is-nan?: An instance of :drm:`<boolean>`.

.. function:: infinity? (x) => (is-infinity?)

   :parameter x: An instance of :drm:`<double-float>`.
   :value is-infinity?: An instance of :drm:`<boolean>`

.. function:: positive-infinity? (x) => (is-positive-infinity?)

   :parameter x: An instance of :drm:`<double-float>`.
   :value is-positive-infinity?: An instance of :drm:`<boolean>`.

.. function:: negative-infinity? (x) => (is-negative-infinity?)

   :parameter x: An instance of :drm:`<double-float>`.
   :value is-negative-infinity?: An instance of :drm:`<boolean>`.

// elementary functions

.. function:: log1p (x) => (log1p-x)

   :parameter x: An instance of :drm:`<double-float>`.
   :value log1p-x: An instance of :drm:`<double-float>`.

.. function:: expm1 (x) => (expm1-x)

   :parameter x: An instance of :drm:`<double-float>`.
   :value expm1-x: An instance of :drm:`<double-float>`.

.. function:: hypot (x y) => (hypot-xy)

   :parameter x: An instance of :drm:`<double-float>`.
   :parameter y: An instance of :drm:`<double-float>`.
   :value hypot-xy: An instance of :drm:`<double-float>`.

.. function:: hypot3 (x y z) => (hypot3-xyz)

   :parameter x: An instance of :drm:`<double-float>`.
   :parameter y: An instance of :drm:`<double-float>`.
   :parameter z: An instance of :drm:`<double-float>`.
   :value hypot3-xyz: An instance of :drm:`<double-float>`.

.. function:: acosh (x) => (acosh-x)

   :parameter x: An instance of :drm:`<double-float>`.
   :value acosh-x: An instance of :drm:`<double-float>`.

.. function:: asinh (x) => (asinh-x)

   :parameter x: An instance of :drm:`<double-float>`.
   :value asinh-x: An instance of :drm:`<double-float>`.

.. function:: atanh (x) => (atanh-x)

   :parameter x: An instance of :drm:`<double-float>`.
   :value atanh-x: An instance of :drm:`<double-float>`.

.. function:: atan2 (x y) => (atan2-xy)

   :parameter x: An instance of :drm:`<double-float>`.
   :parameter y: An instance of :drm:`<double-float>`.
   :value atan2-xy: An instance of :drm:`<double-float>`.

.. function:: ldexp (x n) => (ldexp-xn)

   :parameter x: An instance of :drm:`<double-float>`.
   :parameter n: An instance of :drm:`<integer>`.
   :value ldexp-xn: An instance of :drm:`<double-float>`.

.. function:: frexp (x) => (values mantissa exponent)

   :parameter x: An instance of :drm:`<double-float>`.
   :value mantissa: An instance of :drm:`<double-float>`.
   :value exponent: An instance of :drm:`<integer>`.