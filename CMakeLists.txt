cmake_minimum_required(VERSION 3.1)

#
# project nane and version
#
project(
    SimpleXML
    VERSION 0.0
    DESCRIPTION "Small and modern XML library library for C++"
    LANGUAGES CXX
    )


set(CMAKE_CXX_EXTENSIONS OFF)
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED True)

find_package(Doxygen)
if(Doxygen_FOUND)
    add_subdirectory(docs)
else()
    message(STATUS "Doxygen not found, not builiding docs")
endif()

 # Let's nicely support folders in IDEs
 set_property(GLOBAL PROPERTY USE_FOLDERS ON)

 add_subdirectory(src)
