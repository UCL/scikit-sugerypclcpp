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

set(SKSURGERYPCLCPP_PACKAGE_NAME "sksurgerypclcpp" CACHE STRING "")
if(WIN32)
  set(SKSURGERYPCLCPP_BASE_NAME "sksurgerypclcpp" CACHE STRING "")
else()
  set(SKSURGERYPCLCPP_BASE_NAME "sksurgerypclcpp" CACHE STRING "")
endif()
set(SKSURGERYPCLCPP_VERSION_STRING "${SKSURGERYPCLCPP_VERSION_MAJOR}.${SKSURGERYPCLCPP_VERSION_MINOR}.${SKSURGERYPCLCPP_VERSION_PATCH}" CACHE STRING "String to describe fully named version" FORCE)
set(SKSURGERYPCLCPP_DEPLOY_NAME "${SKSURGERYPCLCPP_BASE_NAME}-${SKSURGERYPCLCPP_VERSION_STRING}" CACHE STRING "" FORCE)
set(SKSURGERYPCLCPP_CONTACT "Your Name Here <your@email.com>" CACHE STRING "")

# 1. Setup defaults, common for all generators.
include(CPackSetup)

# 2. Configuring the Start Menu and Desktop icon strings for NSIS
if (WIN32)
  set(ICONS_SETUP_STRING "")
  set(ICONS_REMOVE_STRING "")
  set(DESKTOP_ICONS_SETUP_STRING "")
  set(DESKTOP_ICONS_REMOVE_STRING "")
  set(DESKTOP_ICONS_REMOVE_STRING "")

  get_property(_apps GLOBAL PROPERTY SKSURGERYPCLCPP_GUI_APPS)

  foreach(app_name ${_apps})

    message("Current App Name: ${app_name}")

    set(ICONS_SETUP_STRING "${ICONS_SETUP_STRING}CreateShortCut '$SMPROGRAMS\\\\$STARTMENU_FOLDER\\\\${app_name}.lnk' '$INSTDIR\\\\bin\\\\${app_name}.exe'\n")
    set(ICONS_REMOVE_STRING "${ICONS_REMOVE_STRING}Delete '$SMPROGRAMS\\\\$MUI_TEMP\\\\${app_name}.lnk'\n")

    set(DESKTOP_ICONS_SETUP_STRING "${DESKTOP_ICONS_SETUP_STRING}CreateShortCut '$DESKTOP\\\\${app_name}.lnk' '$INSTDIR\\\\bin\\\\${app_name}.exe'\n")
    set(DESKTOP_ICONS_REMOVE_STRING "${DESKTOP_ICONS_REMOVE_STRING}Delete '$DESKTOP\\\\${app_name}.lnk'\n")
  endforeach()
endif()

# 3. Set variables that may be platform (Windows/Linux/Mac) or Generator (TGZ,DEB,NSIS) specific.
#    When CPack runs, it just uses all the information in the generated files cmake_install.cmake.
#    So, CPack does not read all your configuration information in CMakeLists.txt, and CPack
#    does not re-run any cmake process.  So, it is cmake that reads all the CMakeLists.txt files
#    and generates all the cmake_install.cmake.  So this command will use cmake to generate
#    and additional file, that we can politely ask cpack to include, in addition to all the
#    cmake_install.cmake files.

configure_file(${CMAKE_SOURCE_DIR}/CMake/CPackOptions.cmake.in
               ${CMAKE_BINARY_DIR}/SKSURGERYPCLCPPCPackOptions.cmake @ONLY IMMEDIATE)

# 4. Set a variable with the name of this file.
set(CPACK_PROJECT_CONFIG_FILE "${CMAKE_BINARY_DIR}/SKSURGERYPCLCPPCPackOptions.cmake")

# 5. Include this optional file.
include(SKSURGERYPCLCPPCPackOptions)

# 6. Include CPack module once all variables are set.
include(CPack)
