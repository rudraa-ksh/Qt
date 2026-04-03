import QtQuick
import QtQuick.Layouts
import QtQuick.Controls

ApplicationWindow {
    width: 800
    height: 850
    visible: true
    title: "Pixel Controller"
    color: "#1a1a1a"

    ColumnLayout {
        anchors.fill: parent
        anchors.margins: 20
        spacing: 15

        // The "Pixel Screen" Container
        Rectangle {
            Layout.fillWidth: true
            Layout.fillHeight: true
            color: "black"
            border.color: "#333"
            border.width: 2

            Grid {
                id: pixelGrid
                anchors.centerIn: parent
                columns: 32 // 32x32 grid
                rows: 32
                spacing: 1

                Repeater {
                    model: pixelGrid.columns * pixelGrid.rows

                    delegate: Rectangle {
                        width: 15
                        height: 15
                        // Property to track state
                        property bool isOn: false

                        color: isOn ? "#00FF00" : "#111" // Neon Green for 'On'
                        radius: 2

                        MouseArea {
                            anchors.fill: parent
                            hoverEnabled: true
                            // Toggle on click
                            onClicked: parent.isOn = !parent.isOn
                            // Paint by dragging
                            onEntered: {
                                if (mouse.buttons & Qt.LeftButton) {
                                    parent.isOn = true
                                }
                            }
                        }
                    }
                }
            }
        }

        // Controls
        RowLayout {
            Layout.alignment: Qt.AlignHCenter
            Button {
                text: "Clear All"
                onClicked: {
                    // Logic to reset all delegates
                    for(var i = 0; i < pixelGrid.children.length; i++) {
                        if(pixelGrid.children[i].isOn !== undefined)
                            pixelGrid.children[i].isOn = false
                    }
                }
            }
            Label {
                text: "Click or Drag to 'Turn On' Pixels"
                color: "white"
            }
        }
    }
}
