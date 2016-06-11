SET (CONTACT "backbone@backbone.ws")
SET (LICENSE "LGPLv3+")
SET (WIN32_UNINSTALL_NAME "LAvBundl") # <= 8 symbols for the name
SET (CPACK_NSIS_MENU_LINKS "https://redmine.backbone.ws/projects/laview/wiki"
                           "Homepage for ${PROJECT_DESCRIPTION}")

SET (CPACK_PACKAGE_EXECUTABLES "${PROJECT_LOWERCASE_NAME}-${MAJOR};LAview Desktop")
SET (CPACK_NSIS_INSTALLED_ICON_NAME bin\\\\${PROJECT_LOWERCASE_NAME}-${MAJOR}.exe)
SET (CPACK_CREATE_DESKTOP_LINKS "${PROJECT_LOWERCASE_NAME}-${MAJOR}")

INCLUDE (CPackCommonRules)
