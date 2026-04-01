cmake_minimum_required(VERSION 3.22)
project(QtAdderQml VERSION 1.0 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 COMPONENTS Quick REQUIRED)

qt_standard_project_setup(REQUIRES 6.5)

qt_add_executable(QtAdderQml
    main.cpp
)

qt_add_qml_module(QtAdderQml
    URI QtAdderQml
    VERSION 1.0
    QML_FILES Main.qml
)

target_link_libraries(QtAdderQml
    PRIVATE
    Qt6::Quick
)
