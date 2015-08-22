cmake_minimum_required(VERSION 2.8)
project(librail)


#
# Try to find RapidJSON library and include path.
# Once done this will define
#
# RAPID_JSON_FOUND
# RAPID_JSON_INCLUDE_DIR
#

FIND_PATH(RAPID_JSON_INCLUDE_DIR rapidjson/rapidjson.h
        ${CMAKE_SOURCE_DIR}/rapidjson/include
        $ENV{PROGRAMFILES}/rapidjson/include
        ${COMPILER_PATH}/PlatformSDK/Include
        $ENV{JSON_ROOT_DIR}/include
        ${GLEW_ROOT_DIR}/include
        /usr/include
        /usr/local/include
        /sw/include
        /opt/local/include
        DOC "The directory where rapidjson/rapidjson.h resides")

INCLUDE(FindPackageHandleStandardArgs)
# handle the QUIETLY and REQUIRED arguments and set RAPID_JSON_FOUND to TRUE if
# all listed variables are TRUE
FIND_PACKAGE_HANDLE_STANDARD_ARGS(RAPID_JSON DEFAULT_MSG RAPID_JSON_INCLUDE_DIR)

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++11")

if (CMAKE_CXX_COMPILER_ID MATCHES "Clang")
  # using regular Clang or AppleClang
  set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++11 -I${RAPID_JSON_INCLUDE_DIR} -I/usr/include/x86_64-linux-gnu/c++/4.8 -I/usr/include/c++/4.8 ")
endif()

add_subdirectory(cpr)
add_subdirectory(gason)

set(SOURCE_FILES main.cpp)
add_executable(librail ${SOURCE_FILES})
target_include_directories(librail PRIVATE cpr/include)
target_include_directories(librail PRIVATE gason/src)
target_include_directories(gason PRIVATE rapidjson/include)


target_link_libraries(librail cpr)
target_link_libraries(librail gason)
