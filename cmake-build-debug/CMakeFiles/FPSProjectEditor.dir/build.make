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

# Utility rule file for FPSProjectEditor.

# Include the progress variables for this target.
include CMakeFiles/FPSProjectEditor.dir/progress.make

CMakeFiles/FPSProjectEditor:
	cd /home/mingle/ue4/UnrealEngine && bash /home/mingle/ue4/UnrealEngine/Engine/Build/BatchFiles/Linux/Build.sh FPSProjectEditor Linux Development -project=/home/mingle/git/FPSProject/FPSProject.uproject -game -progress -buildscw

FPSProjectEditor: CMakeFiles/FPSProjectEditor
FPSProjectEditor: CMakeFiles/FPSProjectEditor.dir/build.make

.PHONY : FPSProjectEditor

# Rule to build all files generated by this target.
CMakeFiles/FPSProjectEditor.dir/build: FPSProjectEditor

.PHONY : CMakeFiles/FPSProjectEditor.dir/build

CMakeFiles/FPSProjectEditor.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/FPSProjectEditor.dir/cmake_clean.cmake
.PHONY : CMakeFiles/FPSProjectEditor.dir/clean

CMakeFiles/FPSProjectEditor.dir/depend:
	cd /home/mingle/git/FPSProject/cmake-build-debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/mingle/git/FPSProject /home/mingle/git/FPSProject /home/mingle/git/FPSProject/cmake-build-debug /home/mingle/git/FPSProject/cmake-build-debug /home/mingle/git/FPSProject/cmake-build-debug/CMakeFiles/FPSProjectEditor.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/FPSProjectEditor.dir/depend
