# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.5

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/nvidia/RosWorkspace/src

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/nvidia/RosWorkspace/build

# Include any dependencies generated for this target.
include serial_module/CMakeFiles/serial_module.dir/depend.make

# Include the progress variables for this target.
include serial_module/CMakeFiles/serial_module.dir/progress.make

# Include the compile flags for this target's objects.
include serial_module/CMakeFiles/serial_module.dir/flags.make

serial_module/CMakeFiles/serial_module.dir/src/serial_module.cpp.o: serial_module/CMakeFiles/serial_module.dir/flags.make
serial_module/CMakeFiles/serial_module.dir/src/serial_module.cpp.o: /home/nvidia/RosWorkspace/src/serial_module/src/serial_module.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/nvidia/RosWorkspace/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object serial_module/CMakeFiles/serial_module.dir/src/serial_module.cpp.o"
	cd /home/nvidia/RosWorkspace/build/serial_module && /usr/bin/c++   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/serial_module.dir/src/serial_module.cpp.o -c /home/nvidia/RosWorkspace/src/serial_module/src/serial_module.cpp

serial_module/CMakeFiles/serial_module.dir/src/serial_module.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/serial_module.dir/src/serial_module.cpp.i"
	cd /home/nvidia/RosWorkspace/build/serial_module && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/nvidia/RosWorkspace/src/serial_module/src/serial_module.cpp > CMakeFiles/serial_module.dir/src/serial_module.cpp.i

serial_module/CMakeFiles/serial_module.dir/src/serial_module.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/serial_module.dir/src/serial_module.cpp.s"
	cd /home/nvidia/RosWorkspace/build/serial_module && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/nvidia/RosWorkspace/src/serial_module/src/serial_module.cpp -o CMakeFiles/serial_module.dir/src/serial_module.cpp.s

serial_module/CMakeFiles/serial_module.dir/src/serial_module.cpp.o.requires:

.PHONY : serial_module/CMakeFiles/serial_module.dir/src/serial_module.cpp.o.requires

serial_module/CMakeFiles/serial_module.dir/src/serial_module.cpp.o.provides: serial_module/CMakeFiles/serial_module.dir/src/serial_module.cpp.o.requires
	$(MAKE) -f serial_module/CMakeFiles/serial_module.dir/build.make serial_module/CMakeFiles/serial_module.dir/src/serial_module.cpp.o.provides.build
.PHONY : serial_module/CMakeFiles/serial_module.dir/src/serial_module.cpp.o.provides

serial_module/CMakeFiles/serial_module.dir/src/serial_module.cpp.o.provides.build: serial_module/CMakeFiles/serial_module.dir/src/serial_module.cpp.o


# Object files for target serial_module
serial_module_OBJECTS = \
"CMakeFiles/serial_module.dir/src/serial_module.cpp.o"

# External object files for target serial_module
serial_module_EXTERNAL_OBJECTS =

/home/nvidia/RosWorkspace/devel/lib/serial_module/serial_module: serial_module/CMakeFiles/serial_module.dir/src/serial_module.cpp.o
/home/nvidia/RosWorkspace/devel/lib/serial_module/serial_module: serial_module/CMakeFiles/serial_module.dir/build.make
/home/nvidia/RosWorkspace/devel/lib/serial_module/serial_module: /opt/ros/kinetic/lib/libroscpp.so
/home/nvidia/RosWorkspace/devel/lib/serial_module/serial_module: /usr/lib/aarch64-linux-gnu/libboost_signals.so
/home/nvidia/RosWorkspace/devel/lib/serial_module/serial_module: /usr/lib/aarch64-linux-gnu/libboost_filesystem.so
/home/nvidia/RosWorkspace/devel/lib/serial_module/serial_module: /opt/ros/kinetic/lib/librosconsole.so
/home/nvidia/RosWorkspace/devel/lib/serial_module/serial_module: /opt/ros/kinetic/lib/librosconsole_log4cxx.so
/home/nvidia/RosWorkspace/devel/lib/serial_module/serial_module: /opt/ros/kinetic/lib/librosconsole_backend_interface.so
/home/nvidia/RosWorkspace/devel/lib/serial_module/serial_module: /usr/lib/aarch64-linux-gnu/liblog4cxx.so
/home/nvidia/RosWorkspace/devel/lib/serial_module/serial_module: /usr/lib/aarch64-linux-gnu/libboost_regex.so
/home/nvidia/RosWorkspace/devel/lib/serial_module/serial_module: /opt/ros/kinetic/lib/libxmlrpcpp.so
/home/nvidia/RosWorkspace/devel/lib/serial_module/serial_module: /opt/ros/kinetic/lib/libroscpp_serialization.so
/home/nvidia/RosWorkspace/devel/lib/serial_module/serial_module: /opt/ros/kinetic/lib/librostime.so
/home/nvidia/RosWorkspace/devel/lib/serial_module/serial_module: /opt/ros/kinetic/lib/libcpp_common.so
/home/nvidia/RosWorkspace/devel/lib/serial_module/serial_module: /usr/lib/aarch64-linux-gnu/libboost_system.so
/home/nvidia/RosWorkspace/devel/lib/serial_module/serial_module: /usr/lib/aarch64-linux-gnu/libboost_thread.so
/home/nvidia/RosWorkspace/devel/lib/serial_module/serial_module: /usr/lib/aarch64-linux-gnu/libboost_chrono.so
/home/nvidia/RosWorkspace/devel/lib/serial_module/serial_module: /usr/lib/aarch64-linux-gnu/libboost_date_time.so
/home/nvidia/RosWorkspace/devel/lib/serial_module/serial_module: /usr/lib/aarch64-linux-gnu/libboost_atomic.so
/home/nvidia/RosWorkspace/devel/lib/serial_module/serial_module: /usr/lib/aarch64-linux-gnu/libpthread.so
/home/nvidia/RosWorkspace/devel/lib/serial_module/serial_module: /usr/lib/aarch64-linux-gnu/libconsole_bridge.so
/home/nvidia/RosWorkspace/devel/lib/serial_module/serial_module: serial_module/CMakeFiles/serial_module.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/nvidia/RosWorkspace/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable /home/nvidia/RosWorkspace/devel/lib/serial_module/serial_module"
	cd /home/nvidia/RosWorkspace/build/serial_module && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/serial_module.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
serial_module/CMakeFiles/serial_module.dir/build: /home/nvidia/RosWorkspace/devel/lib/serial_module/serial_module

.PHONY : serial_module/CMakeFiles/serial_module.dir/build

serial_module/CMakeFiles/serial_module.dir/requires: serial_module/CMakeFiles/serial_module.dir/src/serial_module.cpp.o.requires

.PHONY : serial_module/CMakeFiles/serial_module.dir/requires

serial_module/CMakeFiles/serial_module.dir/clean:
	cd /home/nvidia/RosWorkspace/build/serial_module && $(CMAKE_COMMAND) -P CMakeFiles/serial_module.dir/cmake_clean.cmake
.PHONY : serial_module/CMakeFiles/serial_module.dir/clean

serial_module/CMakeFiles/serial_module.dir/depend:
	cd /home/nvidia/RosWorkspace/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/nvidia/RosWorkspace/src /home/nvidia/RosWorkspace/src/serial_module /home/nvidia/RosWorkspace/build /home/nvidia/RosWorkspace/build/serial_module /home/nvidia/RosWorkspace/build/serial_module/CMakeFiles/serial_module.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : serial_module/CMakeFiles/serial_module.dir/depend
