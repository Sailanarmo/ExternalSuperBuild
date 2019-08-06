project(Source)

find_package(Threads REQUIRED)

SET(Source_BINARY_DIR ${CMAKE_BINARY_DIR}/Source CACHE INTERNAL "" FORCE)

include_directories(${Boost_INCLUDE_DIR})
set(Boost_LIBRARY_DIRS ${Boost_LIBRARY_DIR})
include_directories(${Teem_INCLUDE_DIR})

add_executable(Main main.cpp)
target_link_libraries(Main ${Boost_LIBRARIES} ${CMAKE_THREAD_LIBS_INIT})
add_dependencies(Main 
  Zlib_external_download 
  LibPNG_external_download 
  Teem_external_download
  Boost_external_Download
  )
