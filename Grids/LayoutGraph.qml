import QtQuick
import QtQuick.Layouts
import QtCharts

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
        clip: true

        ChartView {
            anchors.fill: parent
            backgroundColor: "transparent"
            antialiasing: true
            LineSeries {
                XYPoint { x: 1; y: 0 }
                XYPoint { x: 1.1; y: 2.1 }
                XYPoint { x: 1.2; y: 0 }
                XYPoint { x: 1.3; y: 0 }
                XYPoint { x: 1.4; y: 4.9 }
                XYPoint { x: 1.5; y: 3.0 }
                XYPoint { x: 1.6; y: 0 }
            }
        }
    }

    Rectangle { width: 200; height: 200; color: "#e6e4e0"; radius: 5 }
    Rectangle { width: 200; height: 200; color: "#e6e4e0"; radius: 5 }
}