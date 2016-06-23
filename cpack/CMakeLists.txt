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

# required dlls/executables
FILE (MAKE_DIRECTORY ${CMAKE_BINARY_DIR}/bundle/bin)
FOREACH (binname gspawn-win${ARCH}-helper.exe perl.exe perl522.dll
         libatk-1.0-0.dll libbz2-1.dll libcairo-2.dll libcairo-gobject-2.dll libepoxy-0.dll
         libexpat-1.dll libffi-6.dll libfontconfig-1.dll libfreetype-6.dll libgcc_s_seh-1.dll
         libgdk_pixbuf-2.0-0.dll libgdk-3-0.dll libgee-0.8-2.dll libgio-2.0-0.dll libglib-2.0-0.dll
         libgmodule-2.0-0.dll libgobject-2.0-0.dll libgraphite2.dll libgtk-3-0.dll libharfbuzz-0.dll
         libiconv-2.dll libintl-8.dll libpango-1.0-0.dll libpangocairo-1.0-0.dll libpangoft2-1.0-0.dll
         libpangowin32-1.0-0.dll libpcre-1.dll libpixman-1-0.dll libpng16-16.dll libstdc++-6.dll
         libwinpthread-1.dll zlib1.dll)
  EXECUTE_PROCESS (COMMAND cp /mingw${ARCH}/bin/${binname} ${CMAKE_BINARY_DIR}/bundle/bin)
ENDFOREACH (binname)

# required libraries
FILE (MAKE_DIRECTORY ${CMAKE_BINARY_DIR}/bundle/lib)
FOREACH (dirname perl5)
  EXECUTE_PROCESS (COMMAND cp -r /mingw${ARCH}/lib/${dirname} ${CMAKE_BINARY_DIR}/bundle/lib)
ENDFOREACH (dirname)

# required resources
SET (adwaita_path share/icons/Adwaita)
FILE (MAKE_DIRECTORY ${CMAKE_BINARY_DIR}/bundle/${adwaita_path})
FOREACH (dirname 16x16 24x24)
  EXECUTE_PROCESS (COMMAND cp -r /mingw${ARCH}/${adwaita_path}/${dirname} ${CMAKE_BINARY_DIR}/bundle/${adwaita_path})
ENDFOREACH (dirname)
SET (hicolor_path share/icons/hicolor)
FILE (MAKE_DIRECTORY ${CMAKE_BINARY_DIR}/bundle/${hicolor_path})
EXECUTE_PROCESS (COMMAND cp /mingw${ARCH}/${hicolor_path}/index.theme ${CMAKE_BINARY_DIR}/bundle/${hicolor_path})
FILE (MAKE_DIRECTORY ${CMAKE_BINARY_DIR}/bundle/share/glib-2.0/schemas)
EXECUTE_PROCESS (COMMAND cp /mingw${ARCH}/share/glib-2.0/schemas/gschemas.compiled
                            ${CMAKE_BINARY_DIR}/bundle/share/glib-2.0/schemas)

# locales
FILE (MAKE_DIRECTORY ${CMAKE_BINARY_DIR}/bundle/share/locale)
FOREACH (lang de ru)
  SET (localedir share/locale/${lang}/LC_MESSAGES)
  FILE (MAKE_DIRECTORY ${CMAKE_BINARY_DIR}/bundle/${localedir})
  FOREACH (libname gtk30)
    EXECUTE_PROCESS (COMMAND cp /mingw${ARCH}/${localedir}/${libname}.mo ${CMAKE_BINARY_DIR}/bundle/${localedir})
  ENDFOREACH (libname)
ENDFOREACH (lang)

INSTALL (DIRECTORY ${CMAKE_BINARY_DIR}/bundle DESTINATION "win${ARCH}")

INCLUDE (CPackCommonRules)
