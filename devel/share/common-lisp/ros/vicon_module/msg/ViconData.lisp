; Auto-generated. Do not edit!


(cl:in-package vicon_module-msg)


;//! \htmlinclude ViconData.msg.html

(cl:defclass <ViconData> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (obj_num
    :reader obj_num
    :initarg :obj_num
    :type cl:integer
    :initform 0)
   (positions
    :reader positions
    :initarg :positions
    :type (cl:vector vicon_module-msg:Position)
   :initform (cl:make-array 0 :element-type 'vicon_module-msg:Position :initial-element (cl:make-instance 'vicon_module-msg:Position))))
)

(cl:defclass ViconData (<ViconData>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ViconData>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ViconData)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name vicon_module-msg:<ViconData> is deprecated: use vicon_module-msg:ViconData instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <ViconData>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader vicon_module-msg:header-val is deprecated.  Use vicon_module-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'obj_num-val :lambda-list '(m))
(cl:defmethod obj_num-val ((m <ViconData>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader vicon_module-msg:obj_num-val is deprecated.  Use vicon_module-msg:obj_num instead.")
  (obj_num m))

(cl:ensure-generic-function 'positions-val :lambda-list '(m))
(cl:defmethod positions-val ((m <ViconData>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader vicon_module-msg:positions-val is deprecated.  Use vicon_module-msg:positions instead.")
  (positions m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ViconData>) ostream)
  "Serializes a message object of type '<ViconData>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let* ((signed (cl:slot-value msg 'obj_num)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'positions))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'positions))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ViconData>) istream)
  "Deserializes a message object of type '<ViconData>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'obj_num) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'positions) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'positions)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'vicon_module-msg:Position))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ViconData>)))
  "Returns string type for a message object of type '<ViconData>"
  "vicon_module/ViconData")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ViconData)))
  "Returns string type for a message object of type 'ViconData"
  "vicon_module/ViconData")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ViconData>)))
  "Returns md5sum for a message object of type '<ViconData>"
  "b435bcf2ed522951cf63edc41de10212")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ViconData)))
  "Returns md5sum for a message object of type 'ViconData"
  "b435bcf2ed522951cf63edc41de10212")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ViconData>)))
  "Returns full string definition for message of type '<ViconData>"
  (cl:format cl:nil "std_msgs/Header header~%int32 obj_num~%Position[] positions~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: vicon_module/Position~%float32 x~%float32 y~%float32 theta~%int32 speed~%int32 steering~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ViconData)))
  "Returns full string definition for message of type 'ViconData"
  (cl:format cl:nil "std_msgs/Header header~%int32 obj_num~%Position[] positions~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: vicon_module/Position~%float32 x~%float32 y~%float32 theta~%int32 speed~%int32 steering~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ViconData>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     4
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'positions) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ViconData>))
  "Converts a ROS message object to a list"
  (cl:list 'ViconData
    (cl:cons ':header (header msg))
    (cl:cons ':obj_num (obj_num msg))
    (cl:cons ':positions (positions msg))
))
