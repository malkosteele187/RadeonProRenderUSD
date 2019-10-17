if(NOT DEFINED HOUDINI_ROOT)
	if (NOT DEFINED ENV{HOUDINI_ROOT})
	    message(FATAL_ERROR "Specify HOUDINI_ROOT")
	endif()
    set(HOUDINI_ROOT $ENV{HOUDINI_ROOT})
endif()

if(CMAKE_INSTALL_PREFIX_INITIALIZED_TO_DEFAULT)
    message(STATUS "Setting CMAKE_INSTALL_PREFIX to HOUDINI_ROOT - ${HOUDINI_ROOT}")
    set(CMAKE_INSTALL_PREFIX "${HOUDINI_ROOT}" CACHE PATH "..." FORCE)
endif()

set(HOUDINI_INCLUDE_DIR ${HOUDINI_ROOT}/toolkit/include)
if(WIN32)
    set(HOUDINI_PLUGIN_INSTALL_RELPATH bin)
    set(HOUDINI_LIB ${HOUDINI_ROOT}/custom/houdini/dsolib)
elseif(APPLE)
    set(HOUDINI_PLUGIN_INSTALL_RELPATH ../Libraries)
    set(HOUDINI_LIB ${HOUDINI_ROOT}/../Libraries)
else()
    set(HOUDINI_PLUGIN_INSTALL_RELPATH dsolib)
    set(HOUDINI_LIB ${HOUDINI_ROOT}/dsolib)
endif()
add_definitions(-DBUILD_AS_HOUDINI_PLUGIN)

list(APPEND CMAKE_PREFIX_PATH ${HOUDINI_LIB})
