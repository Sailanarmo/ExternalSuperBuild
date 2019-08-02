project(Source)

SET(Source_BINARY_DIR ${CMAKE_BINARY_DIR}/Source CACHE INTERNAL "" FORCE)

#[[
MACRO(CONFIG_STANDARD_EXTERNAL name config_file directory)
  FIND_PACKAGE(${name} CONFIGS ${config_file} HINTS ${directory} NO_SYSTEM_ENVIRONMENT_PATH)
  IF(NOT ${name}_FOUND)
    MESSAGE(FATAL_ERROR "${name} library not found in ${directory}")
  ENDIF()
ENDMACRO()

CONFIG_STANDARD_EXTERNAL( Zlib ZlibConfig.cmake ${Zlib_DIR} )
INCLUDE(${ZLIB_USE_FILE})

CONFIG_STANDARD_EXTERNAL( LibPNG LibPNGConfig.cmake ${LibPNG_DIR} )
INCLUDE(${PNG_USE_FILE})

CONFIG_STANDARD_EXTERNAL( Teem TeemConfig.cmake ${Teem_DIR} )
INCLUDE(${Teem_USE_FILE})
]]

include_directories(${Boost_INCLUDE_DIR})

add_executable(Main main.cpp)
target_link_libraries(Main Boost_external)
add_dependencies(Main Zlib_external LibPNG_external Teem_external Boost_external_Download)

message(Boost_Dir: "${Boost_DIR}")
message(Boost_Dir_Include: "${Boost_INCLUDE_DIR}")

include_directories(${SCI_TEEM_INCLUDE})
include_directories(${SCI_ZLIB_INCLUDE})
