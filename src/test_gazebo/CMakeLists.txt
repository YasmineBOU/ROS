################################################################################
# Set minimum required version of cmake, project name and compile options
################################################################################
cmake_minimum_required(VERSION 2.8.3)
project(test_gazebo)

## Compile as C++11, supported in ROS Kinetic and newer
add_compile_options(-std=c++11)

################################################################################
# Find catkin packages and libraries for catkin and system dependencies
################################################################################
find_package(catkin REQUIRED COMPONENTS
  roscpp
  rospy
  std_msgs
  sensor_msgs
  geometry_msgs
  nav_msgs
  tf
  gazebo_ros
)

find_package(gazebo REQUIRED)

################################################################################
# Setup for python modules and scripts
################################################################################

################################################################################
# Declare ROS messages, services and actions
################################################################################

################################################################################
# Declare ROS dynamic reconfigure parameters
################################################################################

################################################################################
# Declare catkin specific configuration to be passed to dependent projects
################################################################################
catkin_package(
  INCLUDE_DIRS include
  LIBRARIES test_gazebo
  CATKIN_DEPENDS roscpp std_msgs sensor_msgs geometry_msgs nav_msgs tf gazebo_ros
  DEPENDS gazebo
)

################################################################################
# Build
################################################################################
link_directories(${GAZEBO_LIBRARY_DIRS})

include_directories(
  include
  ${catkin_INCLUDE_DIRS}
  ${GAZEBO_INCLUDE_DIRS}
)

install(DIRECTORY include/${PROJECT_NAME}/
  DESTINATION ${CATKIN_PACKAGE_INCLUDE_DESTINATION}
  FILES_MATCHING PATTERN "*.h"
  PATTERN ".svn" EXCLUDE
)


# add_executable(testball_drive src/animated_box.cpp src/independent_listener.cpp  src/integrated_main.cpp)
# add_dependencies(testball_drive ${${PROJECT_NAME}_EXPORTED_TARGETS} ${catkin_EXPORTED_TARGETS})
# target_link_libraries(testball_drive ${catkin_LIBRARIES} ${GAZEBO_LIBRARIES})


add_library(animated_box SHARED src/animated_box.cpp)
target_link_libraries(animated_box ${GAZEBO_LIBRARIES})

add_executable(integrated_main src/integrated_main.cpp)
target_link_libraries(integrated_main ${GAZEBO_LIBRARIES} pthread)


add_executable(independent_listener src/independent_listener.cpp)
target_link_libraries(independent_listener ${GAZEBO_LIBRARIES} pthread)

add_executable(robot_controller src/robot_controller.cpp)
target_link_libraries(robot_controller ${catkin_LIBRARIES} ${GAZEBO_LIBRARIES} pthread)

################################################################################
# Install
################################################################################
install(TARGETS animated_box
  RUNTIME DESTINATION ${CATKIN_PACKAGE_BIN_DESTINATION}
)

install(DIRECTORY include/${PROJECT_NAME}/
  DESTINATION ${CATKIN_PACKAGE_INCLUDE_DESTINATION}
)

install(DIRECTORY launch models worlds include
  DESTINATION ${CATKIN_PACKAGE_SHARE_DESTINATION}
)

################################################################################
# Test
################################################################################
