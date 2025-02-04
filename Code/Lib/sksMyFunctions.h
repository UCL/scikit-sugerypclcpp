/*=============================================================================

  SKSURGERYPCLCPP: Image-guided surgery functions, in C++, using PCL.

  Copyright (c) University College London (UCL). All rights reserved.

  This software is distributed WITHOUT ANY WARRANTY; without even
  the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
  PURPOSE.

  See LICENSE.txt in the top level directory for details.

=============================================================================*/

#ifndef sksMyFunctions_h
#define sksMyFunctions_h

#include <pcl/point_types.h>
#include <pcl/point_cloud.h>

#include "sksWin32ExportHeader.h"

/**
* \file sksMyFunctions.h
* \brief Various Utilities.
* \ingroup utilities
*/
namespace sks
{

/**
* \brief My first function, adds two integers.
*/
SKSURGERYPCLCPP_WINEXPORT int MyFirstAddFunction(int a, int b);


pcl::PointCloud<pcl::PointNormal>::Ptr computeNormals(const pcl::PointCloud<pcl::PointXYZ>::ConstPtr input,
                                                      float normalSearchRadius);

} // end namespace

#endif
