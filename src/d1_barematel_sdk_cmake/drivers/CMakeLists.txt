project(drivers LANGUAGES C)

set(DRIVERS_SRCS clint.c clk.c gpio.c plint.c timer.c uart.c)

# TODO: build each lib by itself?

add_library(${PROJECT_NAME} ${DRIVERS_SRCS})

target_include_directories(${PROJECT_NAME} PUBLIC .)

target_link_libraries(${PROJECT_NAME} support)
