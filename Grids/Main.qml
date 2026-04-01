import QtQuick
import QtQuick.Layouts

Window {
    width: 1920
    height: 1080
    visible: true
    title: qsTr("Screen")
    RowLayout {
        anchors.fill: parent
        spacing: 0

        ColumnLayout {
            Layout.fillWidth: true
            Layout.fillHeight: true
            spacing: 10

            RowLayout {
                id: headingrow
                Layout.fillWidth: true
                Layout.margins: 10

                Repeater {
                    model: 6
                    delegate: LayoutButton {}
                }
                Item { Layout.fillWidth: true }
            }

            Repeater {
                model: 3
                delegate: LayoutGraph {
                    Layout.fillWidth: true
                }
            }

            Rectangle {
                Layout.fillHeight: true
                Layout.fillWidth: true
                Layout.margins: 10
                radius: 5
                color: "#e6e4e0"
            }
        }

        ColumnLayout {
            Layout.fillHeight: true
            Layout.preferredWidth: 150
            Layout.margins: 10

            Rectangle {
                Layout.fillWidth: true
                Layout.fillHeight: true
                radius: 5
                color: "#e6e4e0"
            }
        }
    }

}