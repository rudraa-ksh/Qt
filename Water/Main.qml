// Main.qml
import QtQuick
import QtQuick.Controls

Window {
    width: 600
    height: 600
    visible: true
    title: "Qt 6.11 Wave Comparison"
    color: "#DDD"

    Column {
        anchors.centerIn: parent
        spacing: 20

        Row {
            spacing: 40

            // 1. Shader Approach
            WaveShader {
                fillLevel: fillSlider.value
            }

            // 2. Canvas Approach
            WaveCanvas {
                fillLevel: fillSlider.value
            }

            Lung{}
        }

        Row {
            anchors.horizontalCenter: parent.horizontalCenter
            spacing: 10
            Text { text: "Fill Level:" ; anchors.verticalCenter: parent.verticalCenter}
            Slider {
                id: fillSlider
                from: 0.0
                to: 1.0
                value: 0.4
                width: 300
            }
        }
    }
}