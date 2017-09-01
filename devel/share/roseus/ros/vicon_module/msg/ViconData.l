;; Auto-generated. Do not edit!


(when (boundp 'vicon_module::ViconData)
  (if (not (find-package "VICON_MODULE"))
    (make-package "VICON_MODULE"))
  (shadow 'ViconData (find-package "VICON_MODULE")))
(unless (find-package "VICON_MODULE::VICONDATA")
  (make-package "VICON_MODULE::VICONDATA"))

(in-package "ROS")
;;//! \htmlinclude ViconData.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass vicon_module::ViconData
  :super ros::object
  :slots (_header _obj_num _positions ))

(defmethod vicon_module::ViconData
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:obj_num __obj_num) 0)
    ((:positions __positions) (let (r) (dotimes (i 0) (push (instance vicon_module::Position :init) r)) r))
    )
   (send-super :init)
   (setq _header __header)
   (setq _obj_num (round __obj_num))
   (setq _positions __positions)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:obj_num
   (&optional __obj_num)
   (if __obj_num (setq _obj_num __obj_num)) _obj_num)
  (:positions
   (&rest __positions)
   (if (keywordp (car __positions))
       (send* _positions __positions)
     (progn
       (if __positions (setq _positions (car __positions)))
       _positions)))
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; int32 _obj_num
    4
    ;; vicon_module/Position[] _positions
    (apply #'+ (send-all _positions :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; int32 _obj_num
       (write-long _obj_num s)
     ;; vicon_module/Position[] _positions
     (write-long (length _positions) s)
     (dolist (elem _positions)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; int32 _obj_num
     (setq _obj_num (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; vicon_module/Position[] _positions
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _positions (let (r) (dotimes (i n) (push (instance vicon_module::Position :init) r)) r))
     (dolist (elem- _positions)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get vicon_module::ViconData :md5sum-) "b435bcf2ed522951cf63edc41de10212")
(setf (get vicon_module::ViconData :datatype-) "vicon_module/ViconData")
(setf (get vicon_module::ViconData :definition-)
      "std_msgs/Header header
int32 obj_num
Position[] positions

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

================================================================================
MSG: vicon_module/Position
float32 x
float32 y
float32 theta
int32 speed
int32 steering

")



(provide :vicon_module/ViconData "b435bcf2ed522951cf63edc41de10212")


