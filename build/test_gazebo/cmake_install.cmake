# Install script for directory: /home/yboudjemai/M2IIA/DiagnosticEtPronostic/AnimatedBall_Test/TEST2/src/test_gazebo

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/home/yboudjemai/M2IIA/DiagnosticEtPronostic/AnimatedBall_Test/TEST2/install")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/yboudjemai/M2IIA/DiagnosticEtPronostic/AnimatedBall_Test/TEST2/build/test_gazebo/catkin_generated/installspace/test_gazebo.pc")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/test_gazebo/cmake" TYPE FILE FILES
    "/home/yboudjemai/M2IIA/DiagnosticEtPronostic/AnimatedBall_Test/TEST2/build/test_gazebo/catkin_generated/installspace/test_gazeboConfig.cmake"
    "/home/yboudjemai/M2IIA/DiagnosticEtPronostic/AnimatedBall_Test/TEST2/build/test_gazebo/catkin_generated/installspace/test_gazeboConfig-version.cmake"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/test_gazebo" TYPE FILE FILES "/home/yboudjemai/M2IIA/DiagnosticEtPronostic/AnimatedBall_Test/TEST2/src/test_gazebo/package.xml")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/test_gazebo" TYPE DIRECTORY FILES "/home/yboudjemai/M2IIA/DiagnosticEtPronostic/AnimatedBall_Test/TEST2/src/test_gazebo/include/test_gazebo/" FILES_MATCHING REGEX "/[^/]*\\.h$" REGEX "/\\.svn$" EXCLUDE)
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libanimated_box.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libanimated_box.so")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libanimated_box.so"
         RPATH "")
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES "/home/yboudjemai/M2IIA/DiagnosticEtPronostic/AnimatedBall_Test/TEST2/devel/lib/libanimated_box.so")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libanimated_box.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libanimated_box.so")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libanimated_box.so"
         OLD_RPATH "/usr/lib/x86_64-linux-gnu/gazebo-11/plugins:"
         NEW_RPATH "")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libanimated_box.so")
    endif()
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/test_gazebo" TYPE DIRECTORY FILES "/home/yboudjemai/M2IIA/DiagnosticEtPronostic/AnimatedBall_Test/TEST2/src/test_gazebo/include/test_gazebo/")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/test_gazebo" TYPE DIRECTORY FILES
    "/home/yboudjemai/M2IIA/DiagnosticEtPronostic/AnimatedBall_Test/TEST2/src/test_gazebo/launch"
    "/home/yboudjemai/M2IIA/DiagnosticEtPronostic/AnimatedBall_Test/TEST2/src/test_gazebo/models"
    "/home/yboudjemai/M2IIA/DiagnosticEtPronostic/AnimatedBall_Test/TEST2/src/test_gazebo/worlds"
    "/home/yboudjemai/M2IIA/DiagnosticEtPronostic/AnimatedBall_Test/TEST2/src/test_gazebo/include"
    )
endif()

