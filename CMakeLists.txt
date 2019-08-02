CMAKE_MINIMUM_REQUIRED(VERSION 3.0)

set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin)

Project(Superbuild)

#Include(${CMAKE_SOURCE_DIR}/Superbuild/Superbuild.cmake)
add_subdirectory(Superbuild)

#add_custom_target(makeExternal /usr/bin/make -f "${CMAKE_CURRENT_SOURCE_DIR}/Superbuild/Makefile"})

include_directories(${SCI_TEEM_INCLUDE})
include_directories(${SCI_ZLIB_INCLUDE})
include_directories(${Boost_INCLUDE_DIR})

message(TEST_Boost_Dir: "${Boost_DIR}")
message(STATUS "Boost_Include: ${Boost_INCLUDE_DIRS}")

add_subdirectory(Source)
