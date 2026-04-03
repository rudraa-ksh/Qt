import QtQuick

Item {
    id: root
    width: 200
    height: 350

    property real fillLevel: 0.5

    Rectangle {
        anchors.fill: parent
        color: "transparent"
        border.color: "#444"
        border.width: 4
        radius: 15
        clip: true

        ShaderEffect {
            anchors.fill: parent
            anchors.margins: 4

            property real time: 0
            // FIX: Link this to root.fillLevel
            property real fill: root.fillLevel
            property real padding: 0
            property color waterColor: "#2196F3"

            // The path must match what qt_add_shaders generates
            fragmentShader: "water.frag.qsb"

            NumberAnimation on time {
                from: 0; to: 6.28
                duration: 3500 // Slower (3.5 seconds) feels more "calm" and realistic
                loops: Animation.Infinite
                running: true
            }
        }
    }
}