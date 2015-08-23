cmake_minimum_required(VERSION 2.8)
project(librail)

	
	
#Try to find RapidJSON library and include path.		
#Once done this will define		
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

add_subdirectory(cpr)
add_subdirectory(gason)

include_directories(rapidjson/include)

set(SOURCE_FILES main.cpp)
add_executable(librail ${SOURCE_FILES})
target_include_directories(librail PRIVATE cpr/include)
target_include_directories(librail PRIVATE gason/src)


target_link_libraries(librail cpr)
target_link_libraries(librail gason)
