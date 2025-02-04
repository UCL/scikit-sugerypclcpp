#/*============================================================================
#
#  SKSURGERYPCLCPP: Image-guided surgery functions, in C++, using PCL.
#
#  Copyright (c) University College London (UCL). All rights reserved.
#
#  This software is distributed WITHOUT ANY WARRANTY; without even
#  the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
#  PURPOSE.
#
#  See LICENSE.txt in the top level directory for details.
#
#============================================================================*/

#-----------------------------------------------------------------------------
# FLANN - external project needed by PCL.
#-----------------------------------------------------------------------------
if(NOT BUILD_FLANN)
  return()
endif()

# Sanity checks
if(DEFINED FLANN_DIR AND NOT EXISTS ${FLANN_DIR})
  message(FATAL_ERROR "FLANN_DIR variable is defined but corresponds to non-existing directory \"${FLANN_DIR}\".")
endif()

if (UNIX AND NOT APPLE)
  set(version "1.8.1-src")
else()
  set(version "1.9.1")
endif()


set(location "https://github.com/mariusmuja/flann.git")
mpMacroDefineExternalProjectVariables(FLANN ${version} ${location})
set(proj_DEPENDENCIES )

if(NOT DEFINED FLANN_DIR)

  ExternalProject_Add(${proj}
    LIST_SEPARATOR ^^
    PREFIX ${proj_CONFIG}
    SOURCE_DIR ${proj_SOURCE}
    BINARY_DIR ${proj_BUILD}
    INSTALL_DIR ${proj_INSTALL}
    GIT_REPOSITORY ${proj_LOCATION}
    GIT_TAG ${proj_VERSION}
    UPDATE_COMMAND ${GIT_EXECUTABLE} checkout ${proj_VERSION}
    CMAKE_GENERATOR ${gen}
    CMAKE_ARGS
      ${EP_COMMON_ARGS}
      -DCMAKE_PREFIX_PATH:PATH=${SKSURGERYPCLCPP_PREFIX_PATH}
      -DUSE_OPENMP:BOOL=${OpenMP_FOUND}
      -DBUILD_CUDA_LIB:BOOL=${SKSURGERYPCLCPP_USE_CUDA}
      -DCUDA_TOOLKIT_ROOT_DIR:PATH=${CUDA_TOOLKIT_ROOT_DIR}
      -DCUDA_ARCH_BIN:STRING=${SKSURGERYPCLCPP_CUDA_ARCH_BIN}
      #-DUSE_MPI:BOOL=${SKSURGERYPCLCPP_USE_MPI} Turning off for now, as you need a parallel version of HDF5.
      -DBUILD_MATLAB_BINDINGS:BOOL=OFF
      -DBUILD_PYTHON_BINDINGS:BOOL=OFF
      -DBUILD_C_BINDINGS:BOOL=OFF
      -DBUILD_TESTS:BOOL=OFF
      -DCMAKE_DEBUG_POSTFIX:STRING=
    CMAKE_CACHE_ARGS
      ${EP_COMMON_CACHE_ARGS}
    CMAKE_CACHE_DEFAULT_ARGS
      ${EP_COMMON_CACHE_DEFAULT_ARGS}
    DEPENDS ${proj_DEPENDENCIES}
  )

  set(FLANN_DIR ${proj_INSTALL})
  set(FLANN_ROOT ${FLANN_DIR})

  set(SKSURGERYPCLCPP_PREFIX_PATH ${proj_INSTALL}^^${SKSURGERYPCLCPP_PREFIX_PATH})
  mitkFunctionInstallExternalCMakeProject(${proj})

  message("SuperBuild loading FLANN from ${FLANN_DIR}")

else()

  mitkMacroEmptyExternalProject(${proj} "${proj_DEPENDENCIES}")

endif()
