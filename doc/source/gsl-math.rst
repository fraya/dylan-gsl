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
