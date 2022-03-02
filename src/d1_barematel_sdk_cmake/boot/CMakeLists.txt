project(boot LANGUAGES C ASM)

set(USE_VEXT OFF CACHE BOOL "Use RISC-V vector extension")
set(USE_THEADISAEE OFF CACHE BOOL "Use custom T-Head ISA extensions")

set(BOOT_SRCS interrupt.c start.S trap.S)

add_library(${PROJECT_NAME} ${BOOT_SRCS})

target_include_directories(${PROJECT_NAME} PUBLIC .)

target_link_libraries(${PROJECT_NAME} support drivers)

if(USE_VEXT)
    # TODO: implement
    # target_compile_definitions(${PROJECT_NAME} PRIVATE -D?)
endif()
if(NOT USE_THEADISAEE)
    target_compile_definitions(${PROJECT_NAME} PRIVATE -DRISCV64_QEMU)  # TODO: rename flag
endif()
