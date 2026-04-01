# Qt QML C++ Integration Demo

A simple Qt QML application demonstrating how to register C++ objects for use in QML.

## What This Demo Shows

This application demonstrates **two methods** of exposing C++ objects to QML:

### Method 1: Context Property (Global Object)
```cpp
Counter globalCounter;
engine.rootContext()->setContextProperty("globalCounter", &globalCounter);
```
- Creates a C++ object instance in C++
- Makes it globally accessible in QML
- All QML files can access it directly
- Single shared instance

### Method 2: Registered Type (Instantiable in QML)
```cpp
qmlRegisterType<Counter>("com.example", 1, 0, "Counter");
```
- Registers the C++ class as a QML type
- Can create multiple instances in QML
- Each instance is independent
- Import the module to use: `import com.example 1.0`

## Project Structure

```
CounterApp/
├── counter.h          # C++ class header with Q_OBJECT, Q_PROPERTY, Q_INVOKABLE
├── counter.cpp        # Implementation of Counter class
├── main.cpp           # Registers C++ objects and starts QML engine
├── main.qml           # UI that uses both registration methods
├── qml.qrc            # Qt resource file for QML
├── CounterApp.pro     # qmake project file
└── CMakeLists.txt     # CMake project file (alternative)
```

## Key Concepts Demonstrated

### C++ Side (`counter.h`)

1. **Q_OBJECT macro**: Required for Qt meta-object features
2. **Q_PROPERTY**: Exposes C++ properties to QML with automatic binding
3. **Q_INVOKABLE**: Makes C++ methods callable from QML
4. **signals**: Emit notifications when values change (enables QML property binding)

### QML Side (`main.qml`)

1. **Using context property**: `globalCounter.value`
2. **Instantiating registered type**: `Counter { id: localCounter }`
3. **Calling C++ methods**: `globalCounter.increment()`
4. **Property binding**: `text: "Value: " + localCounter.value`

## Building the Application

### Using qmake

```bash
qmake CounterApp.pro
make
./CounterApp
```

### Using CMake

```bash
mkdir build
cd build
cmake ..
make
./CounterApp
```

## Requirements

- Qt 5.15 or Qt 6.x
- C++11 compiler
- Qt Quick and Qt QML modules

## How It Works

1. **C++ Class Definition**: The `Counter` class inherits from `QObject` and uses Qt macros to expose functionality to QML

2. **Property System**: The `value` property uses Q_PROPERTY with READ, WRITE, and NOTIFY, allowing QML to:
   - Read the value
   - Set the value
   - Automatically update when it changes

3. **Invokable Methods**: Methods marked with Q_INVOKABLE can be called directly from QML JavaScript

4. **Registration in main.cpp**:
   - `qmlRegisterType` makes the type available as a QML component
   - `setContextProperty` creates a global object accessible everywhere

5. **QML Usage**: The UI creates two independent counters showing both registration methods working side-by-side

## Extending This Example

You can easily extend this by:
- Adding more Q_PROPERTYs (strings, booleans, custom types)
- Creating more complex C++ classes
- Using Q_INVOKABLE methods with parameters and return values
- Passing QML objects to C++ methods
- Using Q_ENUM to expose C++ enums to QML

## License

This is a demonstration project for educational purposes.
