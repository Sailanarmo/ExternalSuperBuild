CMAKE_MINIMUM_REQUIRED(VERSION 3.0)

set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin)

Project(TestSuperbuild)

Include(${CMAKE_SOURCE_DIR}/Superbuild/Superbuild.cmake)

add_subdirectory(Source)
