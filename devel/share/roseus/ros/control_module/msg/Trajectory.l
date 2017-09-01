;; Auto-generated. Do not edit!


(when (boundp 'control_module::Trajectory)
  (if (not (find-package "CONTROL_MODULE"))
    (make-package "CONTROL_MODULE"))
  (shadow 'Trajectory (find-package "CONTROL_MODULE")))
(unless (find-package "CONTROL_MODULE::TRAJECTORY")
  (make-package "CONTROL_MODULE::TRAJECTORY"))

(in-package "ROS")
;;//! \htmlinclude Trajectory.msg.html


(defclass control_module::Trajectory
  :super ros::object
  :slots (_num_chkpnt _path ))

(defmethod control_module::Trajectory
  (:init
   (&key
    ((:num_chkpnt __num_chkpnt) 0)
    ((:path __path) (let (r) (dotimes (i 0) (push (instance control_module::CheckPoint :init) r)) r))
    )
   (send-super :init)
   (setq _num_chkpnt (round __num_chkpnt))
   (setq _path __path)
   self)
  (:num_chkpnt
   (&optional __num_chkpnt)
   (if __num_chkpnt (setq _num_chkpnt __num_chkpnt)) _num_chkpnt)
  (:path
   (&rest __path)
   (if (keywordp (car __path))
       (send* _path __path)
     (progn
       (if __path (setq _path (car __path)))
       _path)))
  (:serialization-length
   ()
   (+
    ;; int32 _num_chkpnt
    4
    ;; control_module/CheckPoint[] _path
    (apply #'+ (send-all _path :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _num_chkpnt
       (write-long _num_chkpnt s)
     ;; control_module/CheckPoint[] _path
     (write-long (length _path) s)
     (dolist (elem _path)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _num_chkpnt
     (setq _num_chkpnt (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; control_module/CheckPoint[] _path
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _path (let (r) (dotimes (i n) (push (instance control_module::CheckPoint :init) r)) r))
     (dolist (elem- _path)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get control_module::Trajectory :md5sum-) "0496593fe4ee00171e01b9b76a8b46bc")
(setf (get control_module::Trajectory :datatype-) "control_module/Trajectory")
(setf (get control_module::Trajectory :definition-)
      "int32 num_chkpnt
CheckPoint[] path


================================================================================
MSG: control_module/CheckPoint
float32 x
float32 y

")



(provide :control_module/Trajectory "0496593fe4ee00171e01b9b76a8b46bc")


