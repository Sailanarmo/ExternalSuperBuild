SET_PROPERTY(DIRECTORY PROPERTY "EP_BASE" ${ep_base})

set( x264_url "https://code.videolan.org/videolan/x264.git")
set( x264_TAG "origin/stable")


##[[
  The configure command is required because FFMPEG will try to build these 
  libraries when x264 static does not need them. 
]]
ExternalProject_Add(x264_external_download
  GIT_REPOSITORY ${x264_url}
  GIT_TAG ${x264_TAG}
  UPDATE_COMMAND ""
  PATCH_COMMAND ""
  INSTALL_COMMAND ""
  INSTALL_DIR ""
  CONFIGURE_COMMAND <SOURCE_DIR>/configure
    --prefix=<BINARY_DIR>/x264_build
    --enable-static
    --disable-opencl 
    --disable-avs 
    --disable-cli 
    --disable-ffms 
    --disable-gpac 
    --disable-lavf 
    --disable-swscale
  BUILD_COMMAND make install
    -j8
)

#CACHE PATH "" seems to write the path to a file that I can set 
#library paths to. 

ExternalProject_Get_Property(x264_external_download BINARY_DIR)
ExternalProject_Get_Property(x264_external_download SOURCE_DIR)

set(x264_LIBRARY_DIR ${BINARY_DIR}/x264_build/lib CACHE INTERNAL "")
set(x264_BINARY_DIR ${BINARY_DIR}/x264_build/bin CACHE INTERNAL "")
set(x264_INCLUDE_DIR ${BINARY_DIR}/x264_build/include CACHE INTERNAL "")

add_library(x264_external STATIC IMPORTED)

message(STATUS "x264_DIR: ${x264_LIBRARY_DIR}")
