find_program(YASM_EXE NAMES yasm nasm)

if(NOT YASM_EXE)
  if( UNIX )
    message(FATAL_ERROR "
    yasm/nasm has not been detected! It is required for FFmpeg Libraries! 
    Progam on Ubuntu can be installed with: sudo apt install yasm
    ")
  elseif( WIN32 )
    message(FATAL_ERROR "
    yasm/nasm has not been detected! It is required for FFmpeg Libraries! 
    Progam on Windows can be installed with the provided executable in provided
    Required Programs Folder.
    ")
  endif()
endif()
