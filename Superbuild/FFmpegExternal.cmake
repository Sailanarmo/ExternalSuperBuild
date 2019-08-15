#---------------------------------------------------------------------------
# Get and build boost


SET_PROPERTY(DIRECTORY PROPERTY "EP_BASE" ${ep_base})

set( FFmpeg_url "https://github.com/FFmpeg/FFmpeg.git")
set( FFmpeg_tag "n4.2")
set( FFmpeg_config_command ./configure )
set( Boost_b2_Command ./b2 )

ExternalProject_Add(Boost_external_Download
  URL ${Boost_url}
  URL_HASH ${Boost_Hash}
  BUILD_IN_SOURCE 1
  UPDATE_COMMAND ""
  PATCH_COMMAND ""
  CONFIGURE_COMMAND ${Boost_Bootstrap_Command} ${BoostToolset}
  BUILD_COMMAND  ${Boost_b2_Command} install
    -toolset=${BoostToolset}
    --with-system
    --with-chrono
    --with-filesystem
    --disable-icu
    --prefix=${CMAKE_BINARY_DIR}/Boost
    --threading=single,multi
    --link=static
    --variant=release
    -j8
  INSTALL_COMMAND ""
  INSTALL_DIR ""
)

#CACHE PATH "" seems to write the path to a file that I can set 
#library paths to. 

set(FFmpeg_LIBRARY_DIR ${CMAKE_BINARY_DIR}/Boost/lib CACHE INTERNAL "")

if(WIN32)
  set(Boost_INCLUDE_DIR ${CMAKE_BINARY_DIR}/Boost/include/boost-1_70 CACHE INTERNAL "")
  set(BOOST_ROOT ${CMAKE_BINARY_DIR}/Boost CACHE INTERNAL "")
else()
  set(Boost_INCLUDE_DIR ${CMAKE_BINARY_DIR}/Boost/include CACHE INTERNAL "")
endif()

ExternalProject_Get_Property(Boost_external_Download BINARY_DIR)
SET(Boost_DIR ${BINARY_DIR} CACHE INTERNAL "")

add_library(Boost_external STATIC IMPORTED)

message(STATUS "Boost_DIR: ${Boost_DIR}")
