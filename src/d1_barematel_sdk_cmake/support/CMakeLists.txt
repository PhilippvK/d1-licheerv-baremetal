project(support LANGUAGES C)

set(SUPPORT_SRCS common.c)

add_library(${PROJECT_NAME} ${SUPPORT_SRCS})

target_include_directories(${PROJECT_NAME} PUBLIC .)

target_link_libraries(${PROJECT_NAME} printf)
