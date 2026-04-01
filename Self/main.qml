import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import com.example 1.0  // Import our custom C++ type

ApplicationWindow {
    visible: true
    width: 500
    height: 400
    title: "C++ to QML Integration Demo"

    ColumnLayout {
        anchors.centerIn: parent
        spacing: 30

        // Section 2: Using instantiated QML type
        Rectangle {
            Layout.alignment: Qt.AlignHCenter
            width: 400
            height: 120
            color: "#e8f5e9"
            radius: 10

            ColumnLayout {
                anchors.centerIn: parent
                spacing: 10

                Label {
                    Layout.alignment: Qt.AlignHCenter
                    text: "Local Counter (Registered Type)"
                    font.bold: true
                    font.pixelSize: 16
                }

                // Create an instance of our C++ Counter class in QML
                Counter {
                    id: localCounter
                }

                Label {
                    Layout.alignment: Qt.AlignHCenter
                    text: localCounter.value
                    font.pixelSize: 24
                    color: "#4CAF50"
                }

                RowLayout {
                    Layout.alignment: Qt.AlignHCenter
                    spacing: 10

                    Button {
                        text: "-"
                        onClicked: localCounter.decrement()
                    }

                    Button {
                        text: "Reset"
                        onClicked: localCounter.reset()
                    }

                    Button {
                        text: "+"
                        onClicked: localCounter.increment()
                    }
                }
            }
        }
    }
}
