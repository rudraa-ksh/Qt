cmake_minimum_required(VERSION 3.16)

project(CounterApp VERSION 1.0 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# Find Qt packages
find_package(Qt6 REQUIRED COMPONENTS Core Gui Qml Quick)

# Enable automatic MOC (Meta-Object Compiler)
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)

# Add executable
add_executable(CounterApp
    main.cpp
    counter.h
    counter.cpp
    qml.qrc
)

# Link Qt libraries
target_link_libraries(CounterApp
    Qt6::Core
    Qt6::Gui
    Qt6::Qml
    Qt6::Quick
)

# Set executable properties
set_target_properties(CounterApp PROPERTIES
    WIN32_EXECUTABLE TRUE
    MACOSX_BUNDLE TRUE
)
