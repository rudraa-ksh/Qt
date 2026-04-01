import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

ApplicationWindow {
    visible: true
    width: 400
    height: 500
    title: "Counter App - Signal & Slots Demo"

    // Connect to the C++ signal
    Connections {
        target: counter
        
        // Handle the milestoneReached signal from C++
        function onMilestoneReached(milestone) {
            milestoneText.text = "🎉 Milestone: " + milestone + "!"
            milestoneAnimation.start()
        }
    }

    ColumnLayout {
        anchors.fill: parent
        anchors.margins: 20
        spacing: 20

        // Title
        Text {
            Layout.alignment: Qt.AlignHCenter
            text: "Qt Quick Counter"
            font.pixelSize: 28
            font.bold: true
            color: "#2c3e50"
        }

        // Counter Display
        Rectangle {
            Layout.fillWidth: true
            Layout.preferredHeight: 150
            color: "#3498db"
            radius: 10

            Text {
                anchors.centerIn: parent
                text: counter.count  // Binding to C++ property
                font.pixelSize: 72
                font.bold: true
                color: "white"
            }
        }

        // Milestone message
        Text {
            id: milestoneText
            Layout.alignment: Qt.AlignHCenter
            Layout.preferredHeight: 30
            text: ""
            font.pixelSize: 18
            color: "#e74c3c"
            
            NumberAnimation on opacity {
                id: milestoneAnimation
                from: 1.0
                to: 0.0
                duration: 2000
                running: false
            }
        }

        // Buttons Row
        RowLayout {
            Layout.fillWidth: true
            spacing: 10

            // Decrement Button
            Button {
                Layout.fillWidth: true
                text: "-"
                font.pixelSize: 32
                font.bold: true
                
                // Call C++ slot when clicked
                onClicked: counter.decrement()
                
                background: Rectangle {
                    color: parent.pressed ? "#c0392b" : "#e74c3c"
                    radius: 5
                }
                
                contentItem: Text {
                    text: parent.text
                    font: parent.font
                    color: "white"
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }
            }

            // Increment Button
            Button {
                Layout.fillWidth: true
                text: "+"
                font.pixelSize: 32
                font.bold: true
                
                // Call C++ slot when clicked
                onClicked: counter.increment()
                
                background: Rectangle {
                    color: parent.pressed ? "#27ae60" : "#2ecc71"
                    radius: 5
                }
                
                contentItem: Text {
                    text: parent.text
                    font: parent.font
                    color: "white"
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }
            }
        }

        // Reset Button
        Button {
            Layout.fillWidth: true
            text: "Reset"
            font.pixelSize: 18
            
            // Call C++ slot when clicked
            onClicked: counter.reset()
            
            background: Rectangle {
                color: parent.pressed ? "#7f8c8d" : "#95a5a6"
                radius: 5
            }
            
            contentItem: Text {
                text: parent.text
                font: parent.font
                color: "white"
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
            }
        }
    }
}
