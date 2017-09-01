# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "vicon_module: 2 messages, 0 services")

set(MSG_I_FLAGS "-Ivicon_module:/home/nvidia/RosWorkspace/src/vicon_module/msg;-Istd_msgs:/opt/ros/kinetic/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(vicon_module_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/nvidia/RosWorkspace/src/vicon_module/msg/Position.msg" NAME_WE)
add_custom_target(_vicon_module_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "vicon_module" "/home/nvidia/RosWorkspace/src/vicon_module/msg/Position.msg" ""
)

get_filename_component(_filename "/home/nvidia/RosWorkspace/src/vicon_module/msg/ViconData.msg" NAME_WE)
add_custom_target(_vicon_module_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "vicon_module" "/home/nvidia/RosWorkspace/src/vicon_module/msg/ViconData.msg" "vicon_module/Position:std_msgs/Header"
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(vicon_module
  "/home/nvidia/RosWorkspace/src/vicon_module/msg/Position.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/vicon_module
)
_generate_msg_cpp(vicon_module
  "/home/nvidia/RosWorkspace/src/vicon_module/msg/ViconData.msg"
  "${MSG_I_FLAGS}"
  "/home/nvidia/RosWorkspace/src/vicon_module/msg/Position.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/vicon_module
)

### Generating Services

### Generating Module File
_generate_module_cpp(vicon_module
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/vicon_module
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(vicon_module_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(vicon_module_generate_messages vicon_module_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/nvidia/RosWorkspace/src/vicon_module/msg/Position.msg" NAME_WE)
add_dependencies(vicon_module_generate_messages_cpp _vicon_module_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nvidia/RosWorkspace/src/vicon_module/msg/ViconData.msg" NAME_WE)
add_dependencies(vicon_module_generate_messages_cpp _vicon_module_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(vicon_module_gencpp)
add_dependencies(vicon_module_gencpp vicon_module_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS vicon_module_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(vicon_module
  "/home/nvidia/RosWorkspace/src/vicon_module/msg/Position.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/vicon_module
)
_generate_msg_eus(vicon_module
  "/home/nvidia/RosWorkspace/src/vicon_module/msg/ViconData.msg"
  "${MSG_I_FLAGS}"
  "/home/nvidia/RosWorkspace/src/vicon_module/msg/Position.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/vicon_module
)

### Generating Services

### Generating Module File
_generate_module_eus(vicon_module
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/vicon_module
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(vicon_module_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(vicon_module_generate_messages vicon_module_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/nvidia/RosWorkspace/src/vicon_module/msg/Position.msg" NAME_WE)
add_dependencies(vicon_module_generate_messages_eus _vicon_module_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nvidia/RosWorkspace/src/vicon_module/msg/ViconData.msg" NAME_WE)
add_dependencies(vicon_module_generate_messages_eus _vicon_module_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(vicon_module_geneus)
add_dependencies(vicon_module_geneus vicon_module_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS vicon_module_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(vicon_module
  "/home/nvidia/RosWorkspace/src/vicon_module/msg/Position.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/vicon_module
)
_generate_msg_lisp(vicon_module
  "/home/nvidia/RosWorkspace/src/vicon_module/msg/ViconData.msg"
  "${MSG_I_FLAGS}"
  "/home/nvidia/RosWorkspace/src/vicon_module/msg/Position.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/vicon_module
)

### Generating Services

### Generating Module File
_generate_module_lisp(vicon_module
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/vicon_module
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(vicon_module_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(vicon_module_generate_messages vicon_module_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/nvidia/RosWorkspace/src/vicon_module/msg/Position.msg" NAME_WE)
add_dependencies(vicon_module_generate_messages_lisp _vicon_module_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nvidia/RosWorkspace/src/vicon_module/msg/ViconData.msg" NAME_WE)
add_dependencies(vicon_module_generate_messages_lisp _vicon_module_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(vicon_module_genlisp)
add_dependencies(vicon_module_genlisp vicon_module_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS vicon_module_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(vicon_module
  "/home/nvidia/RosWorkspace/src/vicon_module/msg/Position.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/vicon_module
)
_generate_msg_nodejs(vicon_module
  "/home/nvidia/RosWorkspace/src/vicon_module/msg/ViconData.msg"
  "${MSG_I_FLAGS}"
  "/home/nvidia/RosWorkspace/src/vicon_module/msg/Position.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/vicon_module
)

### Generating Services

### Generating Module File
_generate_module_nodejs(vicon_module
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/vicon_module
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(vicon_module_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(vicon_module_generate_messages vicon_module_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/nvidia/RosWorkspace/src/vicon_module/msg/Position.msg" NAME_WE)
add_dependencies(vicon_module_generate_messages_nodejs _vicon_module_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nvidia/RosWorkspace/src/vicon_module/msg/ViconData.msg" NAME_WE)
add_dependencies(vicon_module_generate_messages_nodejs _vicon_module_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(vicon_module_gennodejs)
add_dependencies(vicon_module_gennodejs vicon_module_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS vicon_module_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(vicon_module
  "/home/nvidia/RosWorkspace/src/vicon_module/msg/Position.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/vicon_module
)
_generate_msg_py(vicon_module
  "/home/nvidia/RosWorkspace/src/vicon_module/msg/ViconData.msg"
  "${MSG_I_FLAGS}"
  "/home/nvidia/RosWorkspace/src/vicon_module/msg/Position.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/vicon_module
)

### Generating Services

### Generating Module File
_generate_module_py(vicon_module
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/vicon_module
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(vicon_module_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(vicon_module_generate_messages vicon_module_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/nvidia/RosWorkspace/src/vicon_module/msg/Position.msg" NAME_WE)
add_dependencies(vicon_module_generate_messages_py _vicon_module_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nvidia/RosWorkspace/src/vicon_module/msg/ViconData.msg" NAME_WE)
add_dependencies(vicon_module_generate_messages_py _vicon_module_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(vicon_module_genpy)
add_dependencies(vicon_module_genpy vicon_module_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS vicon_module_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/vicon_module)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/vicon_module
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(vicon_module_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/vicon_module)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/vicon_module
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(vicon_module_generate_messages_eus std_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/vicon_module)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/vicon_module
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(vicon_module_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/vicon_module)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/vicon_module
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(vicon_module_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/vicon_module)
  install(CODE "execute_process(COMMAND \"/usr/bin/python\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/vicon_module\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/vicon_module
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(vicon_module_generate_messages_py std_msgs_generate_messages_py)
endif()
