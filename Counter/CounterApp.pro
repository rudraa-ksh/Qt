QT += quick qml gui

CONFIG += c++17

# Source files
SOURCES += \
    main.cpp \
    counter.cpp

# Header files
HEADERS += \
    counter.h

# QML resources
RESOURCES += qml.qrc

# Disable deprecated APIs
DEFINES += QT_DEPRECATED_WARNINGS

# Output
TARGET = CounterApp
TEMPLATE = app
