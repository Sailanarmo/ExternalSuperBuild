SET( Source_DEPENDENCIES )
SET(ep_base "${CMAKE_BINARY_DIR}/Superbuild" CACHE INTERNAL "")

MACRO(ADD_EXTERNAL cmake_file external)
  INCLUDE( ${cmake_file} )
  LIST(APPEND Source_DEPENDENCIES ${external})
ENDMACRO()

include(ExternalProject)

find_program(YASM_EXE NAMES yasm nasm)

if(NOT YASM_EXE)
  message(STATUS "yasm or nasm was not found, preparing yasm for installation.")
  ADD_EXTERNAL(${CMAKE_CURRENT_LIST_DIR}/yasmExternal.cmake yasm_external)
endif()

ADD_EXTERNAL(${CMAKE_CURRENT_LIST_DIR}/ZlibExternal.cmake Zlib_external)
ADD_EXTERNAL(${CMAKE_CURRENT_LIST_DIR}/LibPNGExternal.cmake LibPNG_external)
ADD_EXTERNAL(${CMAKE_CURRENT_LIST_DIR}/TeemExternal.cmake Teem_external)
ADD_EXTERNAL(${CMAKE_CURRENT_LIST_DIR}/FFmpegExternal.cmake FFmpeg_external)
#ADD_EXTERNAL(${CMAKE_CURRENT_LIST_DIR}/BoostExternal.cmake Boost_external)
