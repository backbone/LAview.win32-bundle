PROJECT (LAviewWin32Bundle C)

CMAKE_MINIMUM_REQUIRED (VERSION 2.8)

INCLUDE (ExternalProject)

LIST (APPEND CMAKE_MODULE_PATH ${CMAKE_SOURCE_DIR}/cmake/backbone)

SET (PROJECT_LOWERCASE_NAME "laview-win32-bundle")
SET (PROJECT_DESCRIPTION "LAview Win32 Bundle.")

SET (MAJOR 0)
SET (MINOR 0)
SET (PATCH 0)

ExternalProject_Add (desktop
                     SOURCE_DIR ${CMAKE_SOURCE_DIR}/desktop
                     #CMAKE_ARGS -DCMAKE_INSTALL_PREFIX:PATH=bundle
                     CMAKE_ARGS -DCMAKE_INSTALL_PREFIX:PATH=${CMAKE_BINARY_DIR}/bundle
#                     PREFIX desktop
                     INSTALL_DIR bundle
)

ExternalProject_Add (core
                     SOURCE_DIR ${CMAKE_SOURCE_DIR}/core
                     #CMAKE_ARGS -DCMAKE_INSTALL_PREFIX:PATH=bundle
                     CMAKE_ARGS -DCMAKE_INSTALL_PREFIX:PATH=${CMAKE_BINARY_DIR}/bundle
#                     PREFIX core
                     INSTALL_DIR bundle
)

ExternalProject_Add (gobject-plugin
                     SOURCE_DIR ${CMAKE_SOURCE_DIR}/gobject-plugin
                     #CMAKE_ARGS -DCMAKE_INSTALL_PREFIX:PATH=bundle
                     CMAKE_ARGS -DCMAKE_INSTALL_PREFIX:PATH=${CMAKE_BINARY_DIR}/bundle
#                     PREFIX gobject-plugin
                     INSTALL_DIR bundle
)

ExternalProject_Add (latex-struct
                     SOURCE_DIR ${CMAKE_SOURCE_DIR}/latex-struct
                     #CMAKE_ARGS -DCMAKE_INSTALL_PREFIX:PATH=bundle
                     CMAKE_ARGS -DCMAKE_INSTALL_PREFIX:PATH=${CMAKE_BINARY_DIR}/bundle
#                     PREFIX latex-struct
                     INSTALL_DIR bundle
)

ExternalProject_Add (data-example
                     SOURCE_DIR ${CMAKE_SOURCE_DIR}/data-example
                     #CMAKE_ARGS -DCMAKE_INSTALL_PREFIX:PATH=bundle
                     CMAKE_ARGS -DCMAKE_INSTALL_PREFIX:PATH=${CMAKE_BINARY_DIR}/bundle
#                     PREFIX data-example
                     INSTALL_DIR bundle
)

ExternalProject_Add (object-example
                     SOURCE_DIR ${CMAKE_SOURCE_DIR}/object-example
                     #CMAKE_ARGS -DCMAKE_INSTALL_PREFIX:PATH=bundle
                     CMAKE_ARGS -DCMAKE_INSTALL_PREFIX:PATH=${CMAKE_BINARY_DIR}/bundle
#                     PREFIX object-example
                     INSTALL_DIR bundle
)






#DEPENDS latex-struct

#INSTALL (DIRECTORY ${CMAKE_BINARY_DIR}/bin DESTINATION "win32")
#INSTALL (DIRECTORY ${CMAKE_BINARY_DIR}/include)
#INSTALL (DIRECTORY ${CMAKE_BINARY_DIR}/lib)
#INSTALL (DIRECTORY ${CMAKE_BINARY_DIR}/share)

ADD_SUBDIRECTORY (cpack)
