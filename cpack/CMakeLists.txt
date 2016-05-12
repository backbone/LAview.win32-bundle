SET (CONTACT "backbone@backbone.ws")
SET (CPACK_PACKAGE_CONTACT "backbone@backbone.ws")
SET (CPACK_DEBIAN_PACKAGE_MAINTAINER "backbone@backbone.ws")
SET (DEBIAN_DEPENDENCIES "laview-latex-struct-0 (>= 0.1.0), gobject-plugin-0 (>= 0.1.0)")
SET (DEBIAN_SECTION "Libraries")
SET (REDHAT_DEPENDENCIES "laview-latex-struct-0 >= 0.1.0, gobject-plugin-0 >= 0.1.0")
SET (REDHAT_SECTION "Applications/Text")
SET (LICENSE "LGPLv3+")
SET (WIN32_UNINSTALL_NAME "LAvBund") # <= 8 symbols for the name
SET (CPACK_NSIS_MENU_LINKS "https://redmine.backbone.ws/projects/laview"
                           "Homepage for ${PROJECT_DESCRIPTION}")
INCLUDE (CPackCommonRules)