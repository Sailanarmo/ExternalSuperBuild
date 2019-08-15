project(Source)

find_package(Threads REQUIRED)

SET(Source_BINARY_DIR ${CMAKE_BINARY_DIR}/Source CACHE INTERNAL "" FORCE)

include_directories(${Boost_INCLUDE_DIR})
set(Boost_LIBRARY_DIRS ${Boost_LIBRARY_DIR})
include_directories(${Teem_INCLUDE_DIR})

if(MSVC)
  link_directories(${Boost_LIBRARY_DIR})
endif()

add_executable(Main main.cpp)
target_link_libraries(Main ${Boost_LIBRARIES} ${CMAKE_THREAD_LIBS_INIT})

if(WIN32)
  target_link_libraries(Main ws2_32)
endif()

add_dependencies(Main 
  Zlib_external_download 
  LibPNG_external_download 
  Teem_external_download
  FFmpeg_external_download
  )

#  Boost_external_Download

#[[
add_dependencies(Main
  Zlib
  LibPNG_external
  Teem_external
  )
]]
