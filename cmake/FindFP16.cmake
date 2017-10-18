CMAKE_MINIMUM_REQUIRED(VERSION 3.2 FATAL_ERROR)

FUNCTION(BUILD_FP16)
  INCLUDE(ExternalProject)
  ExternalProject_Add(fp16
    GIT_REPOSITORY https://github.com/Maratyszcza/fp16.git
    GIT_TAG master
    INSTALL_COMMAND ""
    BUILD_BYPRODUCTS <SOURCE_DIR>/include/fp16.h
  )

  ExternalProject_Get_Property(fp16 source_dir)
  SET(FP16_FOUND TRUE PARENT_SCOPE)
  SET(FP16_DEPENDENCY psimd PARENT_SCOPE)
  SET(FP16_INCLUDE_DIRS ${source_dir}/include PARENT_SCOPE)

  MARK_AS_ADVANCED(FORCE FP16_FOUND)
  MARK_AS_ADVANCED(FORCE FP16_DEPENDENCY)
  MARK_AS_ADVANCED(FORCE FP16_INCLUDE_DIRS)
ENDFUNCTION(BUILD_FP16)

BUILD_FP16()