cmake_minimum_required(VERSION 2.8)
project(librail)

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++11")

add_subdirectory(cpr)
add_subdirectory(gason)

set(SOURCE_FILES_LIBRAIL_EXEC main.cpp)

add_library(librail SHARED Station.cpp Station.h)
set_target_properties(librail PROPERTIES PREFIX "")

add_executable(librail_exec ${SOURCE_FILES_LIBRAIL_EXEC})

target_include_directories(librail PRIVATE cpr/include)
target_include_directories(librail PRIVATE gason/src)
target_link_libraries(librail cpr)
target_link_libraries(librail gason)

target_link_libraries(librail_exec librail)
