project(printf LANGUAGES C ASM)

add_library(${PROJECT_NAME} printf.c)

target_include_directories(${PROJECT_NAME} PUBLIC .)
