# CMake roolchain file inspired by https://kubasejdak.com/how-to-cross-compile-for-embedded-with-cmake-like-a-champ

set(CMAKE_SYSTEM_NAME               Generic)
set(CMAKE_SYSTEM_PROCESSOR          riscv)

# Without that flag CMake is not able to pass test compilation check
set(CMAKE_TRY_COMPILE_TARGET_TYPE   STATIC_LIBRARY)

# set(RISCV_GCC_NAME riscv64-unknown-linux-gnu)
set(RISCV_GCC_NAME riscv64-unknown-elf)
set(RISCV_GCC_BASE ${RISCV_GCC_PATH}/bin/${RISCV_GCC_NAME})

set(RISCV_MARCH "rv64gc")
# set(RISCV_MARCH "rv64gcv")

set(RISCV_MABI  "lp64d")

set(CMAKE_EXECUTABLE_SUFFIX_C .elf)

set(CMAKE_AR                        ${RISCV_GCC_BASE}-ar${CMAKE_EXECUTABLE_SUFFIX})
set(CMAKE_ASM_COMPILER              ${RISCV_GCC_BASE}-gcc${CMAKE_EXECUTABLE_SUFFIX})
set(CMAKE_C_COMPILER                ${RISCV_GCC_BASE}-gcc${CMAKE_EXECUTABLE_SUFFIX})
set(CMAKE_CXX_COMPILER              ${RISCV_GCC_BASE}-g++${CMAKE_EXECUTABLE_SUFFIX})
set(CMAKE_LINKER                    ${RISCV_GCC_BASE}-ld${CMAKE_EXECUTABLE_SUFFIX})
set(CMAKE_OBJCOPY                   ${RISCV_GCC_BASE}-objcopy${CMAKE_EXECUTABLE_SUFFIX} CACHE INTERNAL "")
set(CMAKE_RANLIB                    ${RISCV_GCC_BASE}-ranlib${CMAKE_EXECUTABLE_SUFFIX} CACHE INTERNAL "")
set(CMAKE_SIZE                      ${RISCV_GCC_BASE}-size${CMAKE_EXECUTABLE_SUFFIX} CACHE INTERNAL "")
set(CMAKE_STRIP                     ${RISCV_GCC_BASE}-strip${CMAKE_EXECUTABLE_SUFFIX} CACHE INTERNAL "")

set(CMAKE_C_FLAGS                   "-march=${RISCV_MARCH} -mabi=${RISCV_MABI} -Wno-psabi --specs=nosys.specs -fdata-sections -ffunction-sections -Wl,--gc-sections" CACHE INTERNAL "")
set(CMAKE_CXX_FLAGS                 "${CMAKE_C_FLAGS} -fno-exceptions" CACHE INTERNAL "")

set(COMMON_FLAGS "-Wall -fno-omit-frame-pointer -MD -ffreestanding -fno-common -mno-relax")

# TODO: -nostartfiles -nostdlib -mcmodel=medany -ggdb

set(CMAKE_C_FLAGS_DEBUG             "${CMAKE_C_FLAGS_DEBUG} ${COMMON_FLAGS}" CACHE INTERNAL "")
set(CMAKE_C_FLAGS_RELEASE           "${CMAKE_C_FLAGS_RELEASE} ${COMMON_FLAGS} -Os" CACHE INTERNAL "")
set(CMAKE_CXX_FLAGS_DEBUG           "${CMAKE_CXX_FLAGS_DEBUG} ${COMMON_FLAGS}" CACHE INTERNAL "")
set(CMAKE_CXX_FLAGS_RELEASE         "${CMAKE_CXX_FLAGS_RELEASE} ${COMMON_FLAGS} -Os" CACHE INTERNAL "")

set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
