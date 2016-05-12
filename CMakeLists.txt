CMAKE_MINIMUM_REQUIRED (VERSION 2.8)

INCLUDE (ExternalProject)

LIST (APPEND CMAKE_MODULE_PATH ${CMAKE_SOURCE_DIR}/cmake/backbone)

ExternalProject_Add (core
                     SOURCE_DIR ${CMAKE_SOURCE_DIR}/core
                     CMAKE_ARGS -DCMAKE_INSTALL_PREFIX:PATH=image
                     INSTALL_DIR image
)

INCLUDE (CPackCommonRules)
