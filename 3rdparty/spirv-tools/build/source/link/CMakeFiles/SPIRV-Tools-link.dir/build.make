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
CMAKE_SOURCE_DIR = /home/bkaradzic/Private/projects/_github/SPIRV-Tools

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/bkaradzic/Private/projects/_github/SPIRV-Tools/build

# Include any dependencies generated for this target.
include source/link/CMakeFiles/SPIRV-Tools-link.dir/depend.make

# Include the progress variables for this target.
include source/link/CMakeFiles/SPIRV-Tools-link.dir/progress.make

# Include the compile flags for this target's objects.
include source/link/CMakeFiles/SPIRV-Tools-link.dir/flags.make

source/link/CMakeFiles/SPIRV-Tools-link.dir/linker.cpp.o: source/link/CMakeFiles/SPIRV-Tools-link.dir/flags.make
source/link/CMakeFiles/SPIRV-Tools-link.dir/linker.cpp.o: ../source/link/linker.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/bkaradzic/Private/projects/_github/SPIRV-Tools/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object source/link/CMakeFiles/SPIRV-Tools-link.dir/linker.cpp.o"
	cd /home/bkaradzic/Private/projects/_github/SPIRV-Tools/build/source/link && /usr/bin/c++   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/SPIRV-Tools-link.dir/linker.cpp.o -c /home/bkaradzic/Private/projects/_github/SPIRV-Tools/source/link/linker.cpp

source/link/CMakeFiles/SPIRV-Tools-link.dir/linker.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/SPIRV-Tools-link.dir/linker.cpp.i"
	cd /home/bkaradzic/Private/projects/_github/SPIRV-Tools/build/source/link && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/bkaradzic/Private/projects/_github/SPIRV-Tools/source/link/linker.cpp > CMakeFiles/SPIRV-Tools-link.dir/linker.cpp.i

source/link/CMakeFiles/SPIRV-Tools-link.dir/linker.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/SPIRV-Tools-link.dir/linker.cpp.s"
	cd /home/bkaradzic/Private/projects/_github/SPIRV-Tools/build/source/link && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/bkaradzic/Private/projects/_github/SPIRV-Tools/source/link/linker.cpp -o CMakeFiles/SPIRV-Tools-link.dir/linker.cpp.s

source/link/CMakeFiles/SPIRV-Tools-link.dir/linker.cpp.o.requires:

.PHONY : source/link/CMakeFiles/SPIRV-Tools-link.dir/linker.cpp.o.requires

source/link/CMakeFiles/SPIRV-Tools-link.dir/linker.cpp.o.provides: source/link/CMakeFiles/SPIRV-Tools-link.dir/linker.cpp.o.requires
	$(MAKE) -f source/link/CMakeFiles/SPIRV-Tools-link.dir/build.make source/link/CMakeFiles/SPIRV-Tools-link.dir/linker.cpp.o.provides.build
.PHONY : source/link/CMakeFiles/SPIRV-Tools-link.dir/linker.cpp.o.provides

source/link/CMakeFiles/SPIRV-Tools-link.dir/linker.cpp.o.provides.build: source/link/CMakeFiles/SPIRV-Tools-link.dir/linker.cpp.o


# Object files for target SPIRV-Tools-link
SPIRV__Tools__link_OBJECTS = \
"CMakeFiles/SPIRV-Tools-link.dir/linker.cpp.o"

# External object files for target SPIRV-Tools-link
SPIRV__Tools__link_EXTERNAL_OBJECTS =

source/link/libSPIRV-Tools-link.a: source/link/CMakeFiles/SPIRV-Tools-link.dir/linker.cpp.o
source/link/libSPIRV-Tools-link.a: source/link/CMakeFiles/SPIRV-Tools-link.dir/build.make
source/link/libSPIRV-Tools-link.a: source/link/CMakeFiles/SPIRV-Tools-link.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/bkaradzic/Private/projects/_github/SPIRV-Tools/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX static library libSPIRV-Tools-link.a"
	cd /home/bkaradzic/Private/projects/_github/SPIRV-Tools/build/source/link && $(CMAKE_COMMAND) -P CMakeFiles/SPIRV-Tools-link.dir/cmake_clean_target.cmake
	cd /home/bkaradzic/Private/projects/_github/SPIRV-Tools/build/source/link && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/SPIRV-Tools-link.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
source/link/CMakeFiles/SPIRV-Tools-link.dir/build: source/link/libSPIRV-Tools-link.a

.PHONY : source/link/CMakeFiles/SPIRV-Tools-link.dir/build

source/link/CMakeFiles/SPIRV-Tools-link.dir/requires: source/link/CMakeFiles/SPIRV-Tools-link.dir/linker.cpp.o.requires

.PHONY : source/link/CMakeFiles/SPIRV-Tools-link.dir/requires

source/link/CMakeFiles/SPIRV-Tools-link.dir/clean:
	cd /home/bkaradzic/Private/projects/_github/SPIRV-Tools/build/source/link && $(CMAKE_COMMAND) -P CMakeFiles/SPIRV-Tools-link.dir/cmake_clean.cmake
.PHONY : source/link/CMakeFiles/SPIRV-Tools-link.dir/clean

source/link/CMakeFiles/SPIRV-Tools-link.dir/depend:
	cd /home/bkaradzic/Private/projects/_github/SPIRV-Tools/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/bkaradzic/Private/projects/_github/SPIRV-Tools /home/bkaradzic/Private/projects/_github/SPIRV-Tools/source/link /home/bkaradzic/Private/projects/_github/SPIRV-Tools/build /home/bkaradzic/Private/projects/_github/SPIRV-Tools/build/source/link /home/bkaradzic/Private/projects/_github/SPIRV-Tools/build/source/link/CMakeFiles/SPIRV-Tools-link.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : source/link/CMakeFiles/SPIRV-Tools-link.dir/depend

