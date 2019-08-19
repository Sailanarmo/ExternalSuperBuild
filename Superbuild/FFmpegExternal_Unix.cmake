SET_PROPERTY(DIRECTORY PROPERTY "EP_BASE" ${ep_base})

set( FFmpeg_url "https://github.com/FFmpeg/FFmpeg.git")
set( FFmpeg_TAG "n4.2")
set(FFmpeg_depends "x264_external_download")

set(PATH_DEPENDS "${x264_LIBRARY_DIR}/pkgconfig")

ExternalProject_Add(FFmpeg_external_download
  DEPENDS ${FFmpeg_depends}
  GIT_REPOSITORY ${FFmpeg_url}
  GIT_TAG ${FFmpeg_TAG}
  UPDATE_COMMAND ""
  PATCH_COMMAND ""
  INSTALL_COMMAND ""
  INSTALL_DIR ""
  CONFIGURE_COMMAND PKG_CONFIG_PATH=${PATH_DEPENDS} <SOURCE_DIR>/configure
    --enable-static
    --extra-cflags=-I${x264_INCLUDE_DIR}\ --static
    --extra-ldflags=-L${x264_LIBRARY_DIR}
    --enable-gpl
    --enable-libx264
  BUILD_COMMAND make
    -j8
)

#CACHE PATH "" seems to write the path to a file that I can set 
#library paths to. 

ExternalProject_Get_Property(FFmpeg_external_download BINARY_DIR)
ExternalProject_Get_Property(FFmpeg_external_download SOURCE_DIR)

set(FFmpeg_LIBRARY_DIR ${BINARY_DIR} CACHE INTERNAL "")
set(FFmpeg_INCLUDE_DIR ${SOURCE_DIR} CACHE INTERNAL "")

add_library(FFmpeg_external STATIC IMPORTED)

message(STATUS "FFmpeg_DIR: ${FFmpeg_LIBRARY_DIR}")
