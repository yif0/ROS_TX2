; Auto-generated. Do not edit!


(cl:in-package serial_module-msg)


;//! \htmlinclude ArduinoCommand.msg.html

(cl:defclass <ArduinoCommand> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (mode
    :reader mode
    :initarg :mode
    :type cl:integer
    :initform 0)
   (speed
    :reader speed
    :initarg :speed
    :type cl:integer
    :initform 0)
   (steering
    :reader steering
    :initarg :steering
    :type cl:integer
    :initform 0))
)

(cl:defclass ArduinoCommand (<ArduinoCommand>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ArduinoCommand>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ArduinoCommand)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name serial_module-msg:<ArduinoCommand> is deprecated: use serial_module-msg:ArduinoCommand instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <ArduinoCommand>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader serial_module-msg:header-val is deprecated.  Use serial_module-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'mode-val :lambda-list '(m))
(cl:defmethod mode-val ((m <ArduinoCommand>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader serial_module-msg:mode-val is deprecated.  Use serial_module-msg:mode instead.")
  (mode m))

(cl:ensure-generic-function 'speed-val :lambda-list '(m))
(cl:defmethod speed-val ((m <ArduinoCommand>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader serial_module-msg:speed-val is deprecated.  Use serial_module-msg:speed instead.")
  (speed m))

(cl:ensure-generic-function 'steering-val :lambda-list '(m))
(cl:defmethod steering-val ((m <ArduinoCommand>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader serial_module-msg:steering-val is deprecated.  Use serial_module-msg:steering instead.")
  (steering m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ArduinoCommand>) ostream)
  "Serializes a message object of type '<ArduinoCommand>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'mode)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'speed)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'speed)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'speed)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'speed)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'steering)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'steering)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'steering)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'steering)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ArduinoCommand>) istream)
  "Deserializes a message object of type '<ArduinoCommand>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'mode)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'speed)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'speed)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'speed)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'speed)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'steering)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'steering)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'steering)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'steering)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ArduinoCommand>)))
  "Returns string type for a message object of type '<ArduinoCommand>"
  "serial_module/ArduinoCommand")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ArduinoCommand)))
  "Returns string type for a message object of type 'ArduinoCommand"
  "serial_module/ArduinoCommand")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ArduinoCommand>)))
  "Returns md5sum for a message object of type '<ArduinoCommand>"
  "59645092d9ebb21463ea4e8aa734f900")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ArduinoCommand)))
  "Returns md5sum for a message object of type 'ArduinoCommand"
  "59645092d9ebb21463ea4e8aa734f900")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ArduinoCommand>)))
  "Returns full string definition for message of type '<ArduinoCommand>"
  (cl:format cl:nil "std_msgs/Header header~%char mode~%uint32 speed~%uint32 steering~%~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ArduinoCommand)))
  "Returns full string definition for message of type 'ArduinoCommand"
  (cl:format cl:nil "std_msgs/Header header~%char mode~%uint32 speed~%uint32 steering~%~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ArduinoCommand>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     1
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ArduinoCommand>))
  "Converts a ROS message object to a list"
  (cl:list 'ArduinoCommand
    (cl:cons ':header (header msg))
    (cl:cons ':mode (mode msg))
    (cl:cons ':speed (speed msg))
    (cl:cons ':steering (steering msg))
))
