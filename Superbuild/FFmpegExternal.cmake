
SET_PROPERTY(DIRECTORY PROPERTY "EP_BASE" ${ep_base})

set( FFmpeg_url "https://github.com/FFmpeg/FFmpeg.git")
set( FFmpeg_tag "n4.2")
set( FFmpeg_config_command ./configure )
set( FFmpeg_build_command make )

find_program(YASM_EXE NAMES yasm nasm)

if(NOT YASM_EXE)
  set(FFmpeg_depends "yasm_external_download")
else()
  set(FFmpeg_depends "")
endif()

ExternalProject_Add(FFmpeg_external_download
  DEPENDS ${FFmpeg_depends}
  GIT_REPOSITORY ${FFmpeg_url}
  GIT_TAG ${FFmpeg_tag}
  UPDATE_COMMAND ""
  PATCH_COMMAND ""
  CONFIGURE_COMMAND <SOURCE_DIR>/configure
  BUILD_COMMAND ${FFmpeg_build_command} 
    -j8
  INSTALL_COMMAND ""
  INSTALL_DIR ""
)

#CACHE PATH "" seems to write the path to a file that I can set 
#library paths to. 

ExternalProject_Get_Property(FFmpeg_external_download BINARY_DIR)
ExternalProject_Get_Property(FFmpeg_external_download SOURCE_DIR)

if(WIN32)
  set(FFmpeg_LIBRARY_DIR "${BINARY_DIR};${BINARY_DIR}/Debug;${BINARY_DIR}/Release" CACHE INTERNAL "")
else()
  set(FFmpeg_LIBRARY_DIR ${BINARY_DIR} CACHE INTERNAL "")
endif()

set(FFmpeg_INCLUDE_DIR ${SOURCE_DIR} CACHE INTERNAL "")

add_library(FFmpeg_external STATIC IMPORTED)

message(STATUS "FFmpeg_DIR: ${FFmpeg_LIBRARY_DIR}")
