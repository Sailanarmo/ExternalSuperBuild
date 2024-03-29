SET( Source_DEPENDENCIES )
SET(ep_base "${CMAKE_BINARY_DIR}/Superbuild" CACHE INTERNAL "")

MACRO(ADD_EXTERNAL cmake_file external)
  INCLUDE( ${cmake_file} )
  LIST(APPEND Source_DEPENDENCIES ${external})
ENDMACRO()

include(ExternalProject)

if( UNIX )
  ADD_EXTERNAL(${CMAKE_CURRENT_LIST_DIR}/x264_external.cmake x264_external)
  ADD_EXTERNAL(${CMAKE_CURRENT_LIST_DIR}/FFmpegExternal_Unix.cmake FFmpeg_external)
else()
  ADD_EXTERNAL(${CMAKE_CURRENT_LIST_DIR}/FFmpegExternal_Win_Apple.cmake FFmpeg_external)
endif()

ADD_EXTERNAL(${CMAKE_CURRENT_LIST_DIR}/ZlibExternal.cmake Zlib_external)
ADD_EXTERNAL(${CMAKE_CURRENT_LIST_DIR}/LibPNGExternal.cmake LibPNG_external)
ADD_EXTERNAL(${CMAKE_CURRENT_LIST_DIR}/TeemExternal.cmake Teem_external)
ADD_EXTERNAL(${CMAKE_CURRENT_LIST_DIR}/glmExternal.cmake glm_external)
ADD_EXTERNAL(${CMAKE_CURRENT_LIST_DIR}/poleExternal.cmake pole_external)
ADD_EXTERNAL(${CMAKE_CURRENT_LIST_DIR}/BoostExternal.cmake Boost_external)
