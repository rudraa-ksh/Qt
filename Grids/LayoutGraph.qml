import QtQuick
import QtQuick.Layouts

// LayoutGraph.qml
RowLayout {
    id: graphrow
    spacing: 10
    Layout.fillWidth: true
    Layout.leftMargin: 10
    Layout.rightMargin: 10

    Rectangle {
        width: 200
        height: 200
        color: "#e6e4e0"
        radius: 5
    }

    Rectangle {
        Layout.fillWidth: true // This one stretches
        height: 200
        color: "#e6e4e0"
        radius: 5
    }

    Rectangle { width: 200; height: 200; color: "#e6e4e0"; radius: 5 }
    Rectangle { width: 200; height: 200; color: "#e6e4e0"; radius: 5 }
}