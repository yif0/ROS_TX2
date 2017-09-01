;; Auto-generated. Do not edit!


(when (boundp 'serial_module::WheelEncoder)
  (if (not (find-package "SERIAL_MODULE"))
    (make-package "SERIAL_MODULE"))
  (shadow 'WheelEncoder (find-package "SERIAL_MODULE")))
(unless (find-package "SERIAL_MODULE::WHEELENCODER")
  (make-package "SERIAL_MODULE::WHEELENCODER"))

(in-package "ROS")
;;//! \htmlinclude WheelEncoder.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass serial_module::WheelEncoder
  :super ros::object
  :slots (_header _we_speed _we_aspeed ))

(defmethod serial_module::WheelEncoder
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:we_speed __we_speed) 0.0)
    ((:we_aspeed __we_aspeed) 0.0)
    )
   (send-super :init)
   (setq _header __header)
   (setq _we_speed (float __we_speed))
   (setq _we_aspeed (float __we_aspeed))
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:we_speed
   (&optional __we_speed)
   (if __we_speed (setq _we_speed __we_speed)) _we_speed)
  (:we_aspeed
   (&optional __we_aspeed)
   (if __we_aspeed (setq _we_aspeed __we_aspeed)) _we_aspeed)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; float32 _we_speed
    4
    ;; float32 _we_aspeed
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; float32 _we_speed
       (sys::poke _we_speed (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _we_aspeed
       (sys::poke _we_aspeed (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; float32 _we_speed
     (setq _we_speed (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _we_aspeed
     (setq _we_aspeed (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get serial_module::WheelEncoder :md5sum-) "85e6a7e4dd9ef07d01bd4179c2a9b1be")
(setf (get serial_module::WheelEncoder :datatype-) "serial_module/WheelEncoder")
(setf (get serial_module::WheelEncoder :definition-)
      "std_msgs/Header header
float32 we_speed
float32 we_aspeed

================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
# 0: no frame
# 1: global frame
string frame_id

")



(provide :serial_module/WheelEncoder "85e6a7e4dd9ef07d01bd4179c2a9b1be")


