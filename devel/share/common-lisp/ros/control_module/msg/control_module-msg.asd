
(cl:in-package :asdf)

(defsystem "control_module-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "CheckPoint" :depends-on ("_package_CheckPoint"))
    (:file "_package_CheckPoint" :depends-on ("_package"))
    (:file "Trajectory" :depends-on ("_package_Trajectory"))
    (:file "_package_Trajectory" :depends-on ("_package"))
  ))