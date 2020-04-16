/*=============================================================================

  SKSURGERYPCLCPP: Image-guided surgery functions, in C++, using PCL.

  Copyright (c) University College London (UCL). All rights reserved.

  This software is distributed WITHOUT ANY WARRANTY; without even
  the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
  PURPOSE.

  See LICENSE.txt in the top level directory for details.

=============================================================================*/

#include "sksRemoveOutliersFromPointCloud.h"

namespace sks {

//-----------------------------------------------------------------------------
const pcl::PointCloud<pcl::PointXYZ>::Ptr RemoveOutliersFromPointCloud(const pcl::PointCloud<pcl::PointXYZ>::Ptr input,
                                                                       float meanK, float stdDev)
{
  pcl::PointCloud<pcl::PointXYZ>::Ptr output(new pcl::PointCloud<pcl::PointXYZ>);

  return output;
}

} // end namespace
