;; Auto-generated. Do not edit!


(when (boundp 'vicon_module::Position)
  (if (not (find-package "VICON_MODULE"))
    (make-package "VICON_MODULE"))
  (shadow 'Position (find-package "VICON_MODULE")))
(unless (find-package "VICON_MODULE::POSITION")
  (make-package "VICON_MODULE::POSITION"))

(in-package "ROS")
;;//! \htmlinclude Position.msg.html


(defclass vicon_module::Position
  :super ros::object
  :slots (_x _y _theta _speed _steering ))

(defmethod vicon_module::Position
  (:init
   (&key
    ((:x __x) 0.0)
    ((:y __y) 0.0)
    ((:theta __theta) 0.0)
    ((:speed __speed) 0)
    ((:steering __steering) 0)
    )
   (send-super :init)
   (setq _x (float __x))
   (setq _y (float __y))
   (setq _theta (float __theta))
   (setq _speed (round __speed))
   (setq _steering (round __steering))
   self)
  (:x
   (&optional __x)
   (if __x (setq _x __x)) _x)
  (:y
   (&optional __y)
   (if __y (setq _y __y)) _y)
  (:theta
   (&optional __theta)
   (if __theta (setq _theta __theta)) _theta)
  (:speed
   (&optional __speed)
   (if __speed (setq _speed __speed)) _speed)
  (:steering
   (&optional __steering)
   (if __steering (setq _steering __steering)) _steering)
  (:serialization-length
   ()
   (+
    ;; float32 _x
    4
    ;; float32 _y
    4
    ;; float32 _theta
    4
    ;; int32 _speed
    4
    ;; int32 _steering
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _x
       (sys::poke _x (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _y
       (sys::poke _y (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _theta
       (sys::poke _theta (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; int32 _speed
       (write-long _speed s)
     ;; int32 _steering
       (write-long _steering s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _x
     (setq _x (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _y
     (setq _y (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _theta
     (setq _theta (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; int32 _speed
     (setq _speed (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _steering
     (setq _steering (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get vicon_module::Position :md5sum-) "5dc7fc87da5e567d1717537bf7c988eb")
(setf (get vicon_module::Position :datatype-) "vicon_module/Position")
(setf (get vicon_module::Position :definition-)
      "float32 x
float32 y
float32 theta
int32 speed
int32 steering

")



(provide :vicon_module/Position "5dc7fc87da5e567d1717537bf7c988eb")


