cmake_minimum_required(VERSION 3.22)

project(CppSample)

set(CMAKE_CXX_STANDARD 17)

add_executable(${PROJECT_NAME}
    main.cpp
    ../shared/MyCppLib.cpp
)

target_include_directories(${PROJECT_NAME} PRIVATE ../shared)

install(TARGETS ${PROJECT_NAME} DESTINATION bin)

set(CPACK_GENERATOR "TGZ")
set(CPACK_PACKAGE_NAME ${PROJECT_NAME})
set(CPACK_PACKAGE_VERSION "1.0.0")

include(CPack)

