CMAKE_MINIMUM_REQUIRED (VERSION 2.8)

INCLUDE (ExternalProject)

ExternalProject_Add (core
                     SOURCE_DIR  ${CMAKE_SOURCE_DIR}/core
)

INCLUDE (CPackCommonRules)
