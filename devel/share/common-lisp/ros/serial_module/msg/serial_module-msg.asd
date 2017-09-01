
(cl:in-package :asdf)

(defsystem "serial_module-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :std_msgs-msg
)
  :components ((:file "_package")
    (:file "ArduinoCommand" :depends-on ("_package_ArduinoCommand"))
    (:file "_package_ArduinoCommand" :depends-on ("_package"))
    (:file "WheelEncoder" :depends-on ("_package_WheelEncoder"))
    (:file "_package_WheelEncoder" :depends-on ("_package"))
  ))