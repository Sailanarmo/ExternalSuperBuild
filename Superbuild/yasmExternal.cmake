#  For more information, please see: http://software.sci.utah.edu
#
#  The MIT License
#
#  Copyright (c) 2016 Scientific Computing and Imaging Institute,
#  University of Utah.
#
#
#  Permission is hereby granted, free of charge, to any person obtaining a
#  copy of this software and associated documentation files (the "Software"),
#  to deal in the Software without restriction, including without limitation
#  the rights to use, copy, modify, merge, publish, distribute, sublicense,
#  and/or sell copies of the Software, and to permit persons to whom the
#  Software is furnished to do so, subject to the following conditions:
#
#  The above copyright notice and this permission notice shall be included
#  in all copies or substantial portions of the Software.
#
#  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
#  OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
#  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
#  THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
#  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
#  FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
#  DEALINGS IN THE SOFTWARE.

SET_PROPERTY(DIRECTORY PROPERTY "EP_BASE" ${ep_base})
SET(yasm_GIT_TAG "v1.3.0")


# If CMake ever allows overriding the checkout command or adding flags,
# git checkout -q will silence message about detached head (harmless).
ExternalProject_Add(yasm_external_download
  GIT_REPOSITORY "https://github.com/yasm/yasm.git"
  GIT_TAG ${yasm_GIT_TAG}
  PATCH_COMMAND ""
  INSTALL_DIR ""
  INSTALL_COMMAND ""
)

ExternalProject_Get_Property(yasm_external_download BINARY_DIR)
ExternalProject_Get_Property(yasm_external_download SOURCE_DIR)

if(MSVC)
  SET(yasm_LIBRARY_DIR "${BINARY_DIR};${BINARY_DIR}/Debug;${BINARY_DIR}/Release" CACHE INTERNAL "")
else()
  SET(yasm_LIBRARY_DIR ${BINARY_DIR} CACHE INTERNAL "")
endif()

SET(yasm_INCLUDE_DIR ${SOURCE_DIR} CACHE INTERNAL "")

add_library(yasm STATIC IMPORTED)

MESSAGE(STATUS "yasm_LIBRARY_DIR: ${yasm_LIBRARY_DIR}")
