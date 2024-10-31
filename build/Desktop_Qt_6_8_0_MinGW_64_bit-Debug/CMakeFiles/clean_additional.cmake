# Additional clean files
cmake_minimum_required(VERSION 3.16)

if("${CONFIG}" STREQUAL "" OR "${CONFIG}" STREQUAL "Debug")
  file(REMOVE_RECURSE
  "CMakeFiles\\appNotesApplication_autogen.dir\\AutogenUsed.txt"
  "CMakeFiles\\appNotesApplication_autogen.dir\\ParseCache.txt"
  "appNotesApplication_autogen"
  )
endif()
