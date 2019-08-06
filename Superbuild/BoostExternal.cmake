#---------------------------------------------------------------------------
# Get and build boost

SET_PROPERTY(DIRECTORY PROPERTY "EP_BASE" ${ep_base})
SET(boost_GIT_TAG "origin/master")
set( Boost_Bootstrap_Command )

if( UNIX )
  set( Boost_Bootstrap_Command ./bootstrap.sh )
  set( Boost_b2_Command ./b2 )
else()
  if( WIN32 )
    set( Boost_Bootstrap_Command bootstrap.bat )
    set( Boost_b2_Command b2.exe)
  endif()
endif()

if(WIN32)
  ExternalProject_Add(Boost_external_Download
    GIT_REPOSITORY "https://github.com/Sailanarmo/boost.git"
    GIT_TAG ${boost_GIT_TAG}
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
      --link=shared
      --variant=release
      -j8
    INSTALL_COMMAND ""
    INSTALL_DIR ""
  )
else()
  ExternalProject_Add(Boost_external_Download
    GIT_REPOSITORY "https://github.com/Sailanarmo/boost.git"
    GIT_TAG ${boost_GIT_TAG}
    BUILD_IN_SOURCE 1
    UPDATE_COMMAND ""
    PATCH_COMMAND ""
    CONFIGURE_COMMAND ${Boost_Bootstrap_Command}
    BUILD_COMMAND  ${Boost_b2_Command} install
      --with-system
      --with-chrono
      --with-filesystem
      --disable-icu
      --prefix=${CMAKE_BINARY_DIR}/Boost
      --threading=single,multi
      --link=shared
      --variant=release
      -j8
    INSTALL_COMMAND ""
    INSTALL_DIR ""
  )
endif()

#CACHE PATH "" seems to write the path to a file that I can set 
#library paths to. 

set(Boost_LIBRARY_DIR ${CMAKE_BINARY_DIR}/Boost/lib CACHE PATH "")
if(WIN32)
  set(Boost_INCLUDE_DIR ${CMAKE_BINARY_DIR}/Boost/include/boost-1_69 CACHE PATH "")
else()
  set(Boost_INCLUDE_DIR ${CMAKE_BINARY_DIR}/Boost/include CACHE PATH "")
endif()
ExternalProject_Get_Property(Boost_external_Download BINARY_DIR)
SET(Boost_DIR ${BINARY_DIR} CACHE PATH "")

add_library(Boost_external SHARED IMPORTED)

message(STATUS "Boost_DIR: ${Boost_DIR}")
