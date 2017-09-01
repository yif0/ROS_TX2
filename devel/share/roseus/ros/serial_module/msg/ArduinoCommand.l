;; Auto-generated. Do not edit!


(when (boundp 'serial_module::ArduinoCommand)
  (if (not (find-package "SERIAL_MODULE"))
    (make-package "SERIAL_MODULE"))
  (shadow 'ArduinoCommand (find-package "SERIAL_MODULE")))
(unless (find-package "SERIAL_MODULE::ARDUINOCOMMAND")
  (make-package "SERIAL_MODULE::ARDUINOCOMMAND"))

(in-package "ROS")
;;//! \htmlinclude ArduinoCommand.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass serial_module::ArduinoCommand
  :super ros::object
  :slots (_header _mode _speed _steering ))

(defmethod serial_module::ArduinoCommand
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:mode __mode) 0)
    ((:speed __speed) 0)
    ((:steering __steering) 0)
    )
   (send-super :init)
   (setq _header __header)
   (setq _mode (round __mode))
   (setq _speed (round __speed))
   (setq _steering (round __steering))
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:mode
   (&optional __mode)
   (if __mode (setq _mode __mode)) _mode)
  (:speed
   (&optional __speed)
   (if __speed (setq _speed __speed)) _speed)
  (:steering
   (&optional __steering)
   (if __steering (setq _steering __steering)) _steering)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; char _mode
    1
    ;; uint32 _speed
    4
    ;; uint32 _steering
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; char _mode
       (write-byte _mode s)
     ;; uint32 _speed
       (write-long _speed s)
     ;; uint32 _steering
       (write-long _steering s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; char _mode
     (setq _mode (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint32 _speed
     (setq _speed (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; uint32 _steering
     (setq _steering (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get serial_module::ArduinoCommand :md5sum-) "59645092d9ebb21463ea4e8aa734f900")
(setf (get serial_module::ArduinoCommand :datatype-) "serial_module/ArduinoCommand")
(setf (get serial_module::ArduinoCommand :definition-)
      "std_msgs/Header header
char mode
uint32 speed
uint32 steering


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



(provide :serial_module/ArduinoCommand "59645092d9ebb21463ea4e8aa734f900")


