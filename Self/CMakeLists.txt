cmake_minimum_required(VERSION 3.16)

project(CounterApp VERSION 1.0.0 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)
set(CMAKE_AUTOUIC ON)

find_package(Qt6 COMPONENTS Core Gui Quick Qml QUIET)
if (NOT Qt6_FOUND)
    find_package(Qt5 5.15 REQUIRED COMPONENTS Core Gui Quick Qml)
endif()

set(PROJECT_SOURCES
    main.cpp
    counter.cpp
    counter.h
    qml.qrc
)

if(Qt6_FOUND)
    qt_add_executable(CounterApp
        MANUAL_FINALIZATION
        ${PROJECT_SOURCES}
    )
else()
    add_executable(CounterApp
        ${PROJECT_SOURCES}
    )
endif()

if(Qt6_FOUND)
    target_link_libraries(CounterApp PRIVATE
        Qt6::Core
        Qt6::Gui
        Qt6::Quick
        Qt6::Qml
    )
else()
    target_link_libraries(CounterApp PRIVATE
        Qt5::Core
        Qt5::Gui
        Qt5::Quick
        Qt5::Qml
    )
endif()

if(Qt6_FOUND)
    qt_finalize_executable(CounterApp)
endif()
