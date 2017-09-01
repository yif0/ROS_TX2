
(cl:in-package :asdf)

(defsystem "vicon_module-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :std_msgs-msg
)
  :components ((:file "_package")
    (:file "Position" :depends-on ("_package_Position"))
    (:file "_package_Position" :depends-on ("_package"))
    (:file "ViconData" :depends-on ("_package_ViconData"))
    (:file "_package_ViconData" :depends-on ("_package"))
  ))