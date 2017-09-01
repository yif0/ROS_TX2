; Auto-generated. Do not edit!


(cl:in-package serial_module-msg)


;//! \htmlinclude WheelEncoder.msg.html

(cl:defclass <WheelEncoder> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (we_speed
    :reader we_speed
    :initarg :we_speed
    :type cl:float
    :initform 0.0)
   (we_aspeed
    :reader we_aspeed
    :initarg :we_aspeed
    :type cl:float
    :initform 0.0))
)

(cl:defclass WheelEncoder (<WheelEncoder>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <WheelEncoder>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'WheelEncoder)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name serial_module-msg:<WheelEncoder> is deprecated: use serial_module-msg:WheelEncoder instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <WheelEncoder>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader serial_module-msg:header-val is deprecated.  Use serial_module-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'we_speed-val :lambda-list '(m))
(cl:defmethod we_speed-val ((m <WheelEncoder>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader serial_module-msg:we_speed-val is deprecated.  Use serial_module-msg:we_speed instead.")
  (we_speed m))

(cl:ensure-generic-function 'we_aspeed-val :lambda-list '(m))
(cl:defmethod we_aspeed-val ((m <WheelEncoder>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader serial_module-msg:we_aspeed-val is deprecated.  Use serial_module-msg:we_aspeed instead.")
  (we_aspeed m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <WheelEncoder>) ostream)
  "Serializes a message object of type '<WheelEncoder>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'we_speed))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'we_aspeed))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <WheelEncoder>) istream)
  "Deserializes a message object of type '<WheelEncoder>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'we_speed) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'we_aspeed) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<WheelEncoder>)))
  "Returns string type for a message object of type '<WheelEncoder>"
  "serial_module/WheelEncoder")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'WheelEncoder)))
  "Returns string type for a message object of type 'WheelEncoder"
  "serial_module/WheelEncoder")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<WheelEncoder>)))
  "Returns md5sum for a message object of type '<WheelEncoder>"
  "85e6a7e4dd9ef07d01bd4179c2a9b1be")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'WheelEncoder)))
  "Returns md5sum for a message object of type 'WheelEncoder"
  "85e6a7e4dd9ef07d01bd4179c2a9b1be")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<WheelEncoder>)))
  "Returns full string definition for message of type '<WheelEncoder>"
  (cl:format cl:nil "std_msgs/Header header~%float32 we_speed~%float32 we_aspeed~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'WheelEncoder)))
  "Returns full string definition for message of type 'WheelEncoder"
  (cl:format cl:nil "std_msgs/Header header~%float32 we_speed~%float32 we_aspeed~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <WheelEncoder>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <WheelEncoder>))
  "Converts a ROS message object to a list"
  (cl:list 'WheelEncoder
    (cl:cons ':header (header msg))
    (cl:cons ':we_speed (we_speed msg))
    (cl:cons ':we_aspeed (we_aspeed msg))
))
