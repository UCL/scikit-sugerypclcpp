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

option(BUILD_glog "Build glog." OFF)
mark_as_advanced(BUILD_glog)

if(BUILD_glog AND NOT BUILD_gflags)
  set(BUILD_gflags ON CACHE BOOL "Build gflags." FORCE)
  message("Forcing BUILD_gflags to ON due to BUILD_glog being ON.")
endif()
