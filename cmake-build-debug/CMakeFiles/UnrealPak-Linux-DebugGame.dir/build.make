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

# Utility rule file for UnrealPak-Linux-DebugGame.

# Include the progress variables for this target.
include CMakeFiles/UnrealPak-Linux-DebugGame.dir/progress.make

CMakeFiles/UnrealPak-Linux-DebugGame:
	cd /home/mingle/ue4/UnrealEngine && bash /home/mingle/ue4/UnrealEngine/Engine/Build/BatchFiles/Linux/Build.sh UnrealPak Linux DebugGame -project=/home/mingle/git/FPSProject/FPSProject.uproject -game -progress -buildscw

UnrealPak-Linux-DebugGame: CMakeFiles/UnrealPak-Linux-DebugGame
UnrealPak-Linux-DebugGame: CMakeFiles/UnrealPak-Linux-DebugGame.dir/build.make

.PHONY : UnrealPak-Linux-DebugGame

# Rule to build all files generated by this target.
CMakeFiles/UnrealPak-Linux-DebugGame.dir/build: UnrealPak-Linux-DebugGame

.PHONY : CMakeFiles/UnrealPak-Linux-DebugGame.dir/build

CMakeFiles/UnrealPak-Linux-DebugGame.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/UnrealPak-Linux-DebugGame.dir/cmake_clean.cmake
.PHONY : CMakeFiles/UnrealPak-Linux-DebugGame.dir/clean

CMakeFiles/UnrealPak-Linux-DebugGame.dir/depend:
	cd /home/mingle/git/FPSProject/cmake-build-debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/mingle/git/FPSProject /home/mingle/git/FPSProject /home/mingle/git/FPSProject/cmake-build-debug /home/mingle/git/FPSProject/cmake-build-debug /home/mingle/git/FPSProject/cmake-build-debug/CMakeFiles/UnrealPak-Linux-DebugGame.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/UnrealPak-Linux-DebugGame.dir/depend
