CMAKE_MINIMUM_REQUIRED(VERSION 3.0)

set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin)

set(CMAKE_CXX_STANDARD 17)

if(UNIX)
  find_program(NASM_EXE NAMES nasm)
  
  if(NOT NASM_EXE)
    MESSAGE(FATAL_ERROR "
      nasm was not found on your system and is required for FFmpeg, please install with: 
      
      - sudo apt update
      - sudo apt install nasm 
    
      then run Cmake again. 
    ")
  endif()
endif()

if(WIN32)
  include(getCompiler.cmake)
endif()

Project(TestSuperbuild)

Include(${CMAKE_SOURCE_DIR}/Superbuild/Superbuild.cmake)

add_subdirectory(Source)
