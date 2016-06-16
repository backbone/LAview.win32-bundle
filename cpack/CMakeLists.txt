SET (CONTACT "backbone@backbone.ws")
SET (LICENSE "LGPLv3+")
SET (WIN32_UNINSTALL_NAME "LAvBundl") # <= 8 symbols for the name
SET (CPACK_NSIS_MENU_LINKS "https://redmine.backbone.ws/projects/laview/wiki"
                           "Homepage for ${PROJECT_DESCRIPTION}")

INCLUDE (CPackDetectArch)
IF (ARCHITECTURE STREQUAL "amd64")
  SET (ARCH 64)
ELSE ()
  SET (ARCH 32)
ENDIF ()

SET (CPACK_PACKAGE_EXECUTABLES "..\\\\win${ARCH}\\\\bundle\\\\bin\\\\laview-desktop-1;LAview Desktop")
SET (CPACK_NSIS_INSTALLED_ICON_NAME ..\\\\win${ARCH}\\\\bundle\\\\bin\\\\laview-desktop-1.exe)
SET (CPACK_CREATE_DESKTOP_LINKS "..\\\\win${ARCH}\\\\bundle\\\\bin\\\\laview-desktop-1")


FILE (MAKE_DIRECTORY ${CMAKE_BINARY_DIR}/bundle/bin)

FOREACH (libname libgio-2.0-0.dll libgmodule-2.0-0.dll libglib-2.0-0.dll)
  EXECUTE_PROCESS (COMMAND ln -sf /mingw${ARCH}/bin/${libname} ${CMAKE_BINARY_DIR}/bundle/bin/${libname})
ENDFOREACH (libname)

INSTALL (DIRECTORY ${CMAKE_BINARY_DIR}/bundle DESTINATION "win${ARCH}")

INCLUDE (CPackCommonRules)
