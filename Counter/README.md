# Qt Quick Counter Application
### A Simple Example of QML, C++, Signals & Slots

## 📋 What This App Demonstrates

This basic counter application shows the fundamental Qt Quick concepts:

1. **QML UI** - Declarative user interface in `main.qml`
2. **C++ Backend** - Business logic in `counter.h` and `counter.cpp`
3. **Signals & Slots** - Communication between QML and C++
4. **Property Binding** - Automatic UI updates when data changes

## 🏗️ Project Structure

```
CounterApp/
├── main.cpp          # Application entry point, connects C++ to QML
├── counter.h         # Counter class header with Q_OBJECT, signals, slots
├── counter.cpp       # Counter class implementation
├── main.qml          # QML user interface
├── qml.qrc           # Qt resource file (bundles QML)
├── CMakeLists.txt    # CMake build file
└── CounterApp.pro    # qmake build file (alternative)
```

## 🔑 Key Concepts Explained

### 1. C++ Class with Q_OBJECT

```cpp
class Counter : public QObject
{
    Q_OBJECT  // Enables signals, slots, and properties
    Q_PROPERTY(int count READ count WRITE setCount NOTIFY countChanged)
```

- **Q_OBJECT** macro enables Qt's meta-object features
- **Q_PROPERTY** exposes C++ data to QML with automatic binding

### 2. Signals (C++ → QML)

```cpp
signals:
    void countChanged();           // Emitted when count changes
    void milestoneReached(int milestone);  // Custom signal
```

Signals notify QML when something happens in C++.

### 3. Slots (QML → C++)

```cpp
public slots:
    void increment();  // Called from QML button
    void decrement();
    void reset();
```

Slots are C++ functions that QML can call.

### 4. Exposing C++ to QML

```cpp
// In main.cpp
Counter counter;
engine.rootContext()->setContextProperty("counter", &counter);
```

Makes the C++ object available in QML as `counter`.

### 5. QML Connections

```qml
Connections {
    target: counter
    function onMilestoneReached(milestone) {
        // Handle C++ signal in QML
    }
}
```

Receives signals from C++.

### 6. Property Binding

```qml
Text {
    text: counter.count  // Automatically updates when count changes!
}
```

QML automatically updates when the C++ property changes.

### 7. Calling C++ Slots

```qml
Button {
    onClicked: counter.increment()  // Call C++ slot
}
```

## 🚀 How to Build & Run

### Prerequisites
- Qt 6.x installed (Qt 5.15+ also works with minor changes)
- CMake 3.16+ or qmake
- C++ compiler (GCC, Clang, or MSVC)

### Option 1: Using CMake

```bash
# Create build directory
mkdir build
cd build

# Configure
cmake ..

# Build
cmake --build .

# Run
./CounterApp
```

### Option 2: Using qmake

```bash
# Generate Makefile
qmake CounterApp.pro

# Build
make

# Run
./CounterApp
```

### Option 3: Using Qt Creator

1. Open `CMakeLists.txt` or `CounterApp.pro` in Qt Creator
2. Click "Configure Project"
3. Click the green "Run" button

## 🎯 How the App Works

### When You Click "+"

1. QML button's `onClicked` calls `counter.increment()`
2. C++ `increment()` slot runs, updates `m_count`
3. C++ emits `countChanged()` signal
4. QML's property binding automatically updates the display
5. If count is divisible by 10, C++ emits `milestoneReached()`
6. QML's `Connections` receives the signal and shows celebration

### Data Flow

```
User clicks button
       ↓
QML calls C++ slot
       ↓
C++ updates property
       ↓
C++ emits signal
       ↓
QML receives signal & updates UI
```

## 📚 What You Can Learn

- **Q_OBJECT macro** - Required for signals/slots
- **Q_PROPERTY** - Expose C++ properties to QML
- **signals:** - Define events that C++ can emit
- **slots:** - Define functions QML can call
- **emit** keyword - Trigger a signal
- **setContextProperty** - Make C++ objects available in QML
- **Connections** - Receive C++ signals in QML
- **Property binding** - Automatic UI updates

## 🔧 Customization Ideas

Try these to learn more:

1. Add a "multiply by 2" button
2. Add a text input to set the count directly
3. Create a countdown timer using QTimer
4. Save/load the count to a file
5. Add animation when count changes
6. Create multiple counters

## 📝 Notes

- This example uses Qt 6 syntax
- For Qt 5, change `QtQuick 2.15` to `QtQuick 2.12`
- The app demonstrates one-way and two-way communication
- Signals can carry data (like `milestoneReached(int)`)
- Properties auto-notify QML when changed

## 🐛 Common Issues

**"Cannot find module QtQuick"**
- Install Qt Quick module: `sudo apt install qt6-declarative-dev`

**"undefined reference to vtable"**
- Run `qmake` again or clean build directory
- Make sure Q_OBJECT macro is present

**QML not loading**
- Check that qml.qrc is properly configured
- Verify the QML file path in main.cpp

Enjoy learning Qt Quick! 🎉
