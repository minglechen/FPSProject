# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.19

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Disable VCS-based implicit rules.
% : %,v


# Disable VCS-based implicit rules.
% : RCS/%


# Disable VCS-based implicit rules.
% : RCS/%,v


# Disable VCS-based implicit rules.
% : SCCS/s.%


# Disable VCS-based implicit rules.
% : s.%


.SUFFIXES: .hpux_make_needs_suffix_list


# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
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
RM = /usr/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/mingle/git/FPSProject

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/mingle/git/FPSProject/cmake-build-debug

# Utility rule file for DatasmithSketchUp2018-Linux-Test.

# Include the progress variables for this target.
include CMakeFiles/DatasmithSketchUp2018-Linux-Test.dir/progress.make

CMakeFiles/DatasmithSketchUp2018-Linux-Test:
	cd /home/mingle/ue4/UnrealEngine && bash /home/mingle/ue4/UnrealEngine/Engine/Build/BatchFiles/Linux/Build.sh DatasmithSketchUp2018 Linux Test -project=/home/mingle/git/FPSProject/FPSProject.uproject -game -progress -buildscw

DatasmithSketchUp2018-Linux-Test: CMakeFiles/DatasmithSketchUp2018-Linux-Test
DatasmithSketchUp2018-Linux-Test: CMakeFiles/DatasmithSketchUp2018-Linux-Test.dir/build.make

.PHONY : DatasmithSketchUp2018-Linux-Test

# Rule to build all files generated by this target.
CMakeFiles/DatasmithSketchUp2018-Linux-Test.dir/build: DatasmithSketchUp2018-Linux-Test

.PHONY : CMakeFiles/DatasmithSketchUp2018-Linux-Test.dir/build

CMakeFiles/DatasmithSketchUp2018-Linux-Test.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/DatasmithSketchUp2018-Linux-Test.dir/cmake_clean.cmake
.PHONY : CMakeFiles/DatasmithSketchUp2018-Linux-Test.dir/clean

CMakeFiles/DatasmithSketchUp2018-Linux-Test.dir/depend:
	cd /home/mingle/git/FPSProject/cmake-build-debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/mingle/git/FPSProject /home/mingle/git/FPSProject /home/mingle/git/FPSProject/cmake-build-debug /home/mingle/git/FPSProject/cmake-build-debug /home/mingle/git/FPSProject/cmake-build-debug/CMakeFiles/DatasmithSketchUp2018-Linux-Test.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/DatasmithSketchUp2018-Linux-Test.dir/depend

