find_program(YASM_EXE NAMES yasm nasm)

if(NOT YASM_EXE)
  message(FATAL_ERROR "
  yasm/nasm has not been detected! It is required for FFmpeg Libraries 
  Progam on Ubuntu can be installed with: sudo apt install yasm
  ")
endif()
