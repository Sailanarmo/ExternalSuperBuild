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
    set( Boost_b2_Command b2.exe )
  endif()
endif()

ExternalProject_Add(Boost_external_Download
  GIT_REPOSITORY "https://github.com/boostorg/boost.git"
  GIT_TAG ${boost_GIT_TAG}
  BUILD_IN_SOURCE 1
  UPDATE_COMMAND ""
  PATCH_COMMAND ""
  CONFIGURE_COMMAND ${Boost_Bootstrap_Command}
  BUILD_COMMAND  ${Boost_b2_Command} install
    --without-python
    --without-mpi
    --disable-icu
    --prefix=${CMAKE_BINARY_DIR}/Boost
    --threading=single,multi
    --link=shared
    --variant=release
    -j8
  INSTALL_COMMAND ""
#  INSTALL_COMMAND ${Boost_b2_Command} install 
#    --without-python
#    --without-mpi
#    --disable-icu
#    --prefix=${CMAKE_BINARY_DIR}/INSTALL
#    --threading=single,multi
#    --link=shared
#    --variant=release
#    -j8
  #INSTALL_DIR ${CMAKE_BINARY_DIR}/INSTALL
  INSTALL_DIR ""
)


set(Boost_LIBRARY_DIR ${CMAKE_BINARY_DIR}/Boost/lib)
set(Boost_INCLUDE_DIR ${CMAKE_BINARY_DIR}/Boost/include CACHE PATH "")

ExternalProject_Get_Property(Boost_external_Download BINARY_DIR)
SET(Boost_DIR ${BINARY_DIR} CACHE PATH "")

add_library(Boost_external SHARED IMPORTED)
set_target_properties(Boost_external PROPERTIES IMPORTED_LOCATION ${Boost_LIBRARY_DIR}/libBoost_external.so)

message(STATUS "Boost_Include: ${Boost_INCLUDE_DIR}")
message(STATUS "Boost_dir: ${Boost_DIR}")
