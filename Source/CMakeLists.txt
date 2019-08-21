project(Source)

find_package(Threads REQUIRED)

SET(Source_BINARY_DIR ${CMAKE_BINARY_DIR}/Source CACHE INTERNAL "" FORCE)

if(UNIX)
  set(CMAKE_PREFIX_PATH ${FFmpeg_LIBRARY_DIR}/pkgconfig)
endif()

set(Boost_LIBRARY_DIRS ${Boost_LIBRARY_DIR})

include_directories(${Boost_INCLUDE_DIR})
include_directories(${Teem_INCLUDE_DIR})
include_directories(${FFmpeg_INCLUDE_DIR})
include_directories(${glm_INCLUDE_DIR})

link_directories(${FFmpeg_LIBRARY_DIR})

if(MSVC)
  link_directories(${Boost_LIBRARY_DIR})
endif()

add_executable(Main main.cpp)
target_link_libraries(Main ${Boost_LIBRARIES} 
  ${CMAKE_THREAD_LIBS_INIT} 
  ${FFmpeg_LIBRARIES}
  )

if(WIN32)
  target_link_libraries(Main ws2_32)
endif()

add_dependencies(Main 
  Zlib_external_download 
  LibPNG_external_download 
  Teem_external_download
  FFmpeg_external_download
  glm_external_download
  )

#  Boost_external_Download

#[[
add_dependencies(Main
  Zlib
  LibPNG_external
  Teem_external
  )
]]
