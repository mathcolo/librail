cmake_minimum_required(VERSION 2.8)
project(librail)

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++11")

add_subdirectory(cpr)

set(SOURCE_FILES main.cpp)
add_executable(librail ${SOURCE_FILES})
target_include_directories(librail PRIVATE cpr/include)
target_link_libraries(librail cpr)