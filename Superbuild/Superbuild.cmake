SET( Source_DEPENDENCIES )
SET(ep_base "${CMAKE_BINARY_DIR}/Ext_Download" CACHE INTERNAL "")

MACRO(ADD_EXTERNAL cmake_file external)
  INCLUDE( ${cmake_file} )
  LIST(APPEND Source_DEPENDENCIES ${external})
ENDMACRO()

include(ExternalProject)

ADD_EXTERNAL(${CMAKE_CURRENT_LIST_DIR}/ZlibExternal.cmake Zlib_external)
ADD_EXTERNAL(${CMAKE_CURRENT_LIST_DIR}/LibPNGExternal.cmake LibPNG_external)
ADD_EXTERNAL(${CMAKE_CURRENT_LIST_DIR}/TeemExternal.cmake Teem_external)
#ADD_EXTERNAL(${CMAKE_CURRENT_LIST_DIR}/BoostExternal.cmake Boost_external)
