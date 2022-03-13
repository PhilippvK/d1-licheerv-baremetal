cmake_minimum_required(VERSION 3.15)

include(cmake/helpers.cmake)
include(cmake/mksunxi.cmake)  # TODO: FindProgram()

set(CMAKE_TOOLCHAIN_FILE cmake/toolchain.cmake)

set(BUILD_EXAMPLES ON CACHE BOOL "Build example executables")

project(d1_baremetal LANGUAGES C ASM)

add_subdirectory(third_party)
add_subdirectory(support)
add_subdirectory(drivers)
add_subdirectory(boot)

if(BUILD_EXAMPLES)
    add_subdirectory(apps)
endif()

