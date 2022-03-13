function(d1_add_executable target)
    # message(STATUS "d1_add_executable")
    # message(STATUS "target=${target}")
    # message(STATUS "ARGS=${ARGS}")
    # message(STATUS "ARGN=${ARGN}")
    # message(STATUS "ARGS_SOURCES=${ARGS_SOURCES}")
    # message(STATUS "ARGS_LIBRARIES=${ARGS_LIBRARIES}")
    cmake_parse_arguments(ARGS "" "TARGET_LIBRARY" "SOURCES;LIBRARIES" ${ARGN})
    add_executable(${target})
    target_sources(${target} PRIVATE ${ARGS_SOURCES})
    target_link_libraries(${target} boot drivers printf)
    set(LINKER_SCRIPT ../link.ld)
    set_target_properties(${target} PROPERTIES LINK_DEPENDS ${LINKER_SCRIPT})
    # target_link_options(${target} -nostdlib -nostartfiles)  # not required?
    # set(CMAKE_EXE_LINKER_FLAGS ?)

    add_custom_command(
        TARGET ${target}
        POST_BUILD
        COMMAND ${CMAKE_OBJCOPY} ARGS -O binary ${target}.elf ${target}.bin
        COMMAND echo "Make header information for brom booting"
        COMMAND ${MKSUNXI_EXE} ARGS ${target}.bin
        BYPRODUCTS ${target}.bin
    )
    add_dependencies(${target} mksunxi_project)
endfunction()

