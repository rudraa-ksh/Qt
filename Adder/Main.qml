import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

ApplicationWindow {
    visible: true
    width: 420
    height: 520
    minimumWidth: 380
    minimumHeight: 480
    title: "Qt Adder"

    // ── Background ───────────────────────────────────────────────────────────
    Rectangle {
        anchors.fill: parent
        gradient: Gradient {
            orientation: Gradient.Vertical
            GradientStop { position: 0.0; color: "#0f0c29" }
            GradientStop { position: 0.5; color: "#302b63" }
            GradientStop { position: 1.0; color: "#24243e" }
        }
    }

    // ── State ────────────────────────────────────────────────────────────────
    QtObject {
        id: state
        property double numA: 0
        property double numB: 0
        property double result: 0
        property bool   calculated: false

        function calculate() {
            result = numA + numB
            calculated = true
        }

        function reset() {
            numA = 0
            numB = 0
            result = 0
            calculated = false
            inputA.text = ""
            inputB.text = ""
        }
    }

    // ── Card ─────────────────────────────────────────────────────────────────
    Rectangle {
        anchors.centerIn: parent
        width: 340
        height: contentCol.implicitHeight + 60
        radius: 20
        color: "#1e1b4b"

        Rectangle {
            anchors.fill: parent
            radius: parent.radius
            color: "transparent"
            border.color: "#7c3aed"
            border.width: 1.5
            opacity: 0.6
        }

        ColumnLayout {
            id: contentCol
            anchors {
                top: parent.top
                left: parent.left
                right: parent.right
                topMargin: 36
                leftMargin: 28
                rightMargin: 28
            }
            spacing: 0

            // ── Title ────────────────────────────────────────────────────────
            Text {
                Layout.alignment: Qt.AlignHCenter
                text: "Number Adder"
                font.pixelSize: 26
                font.weight: Font.Bold
                color: "#e2e8f0"
            }

            Rectangle {
                Layout.fillWidth: true
                Layout.topMargin: 22
                Layout.bottomMargin: 24
                height: 1
                color: "#312e81"
            }

            // ── Input A ──────────────────────────────────────────────────────
            Text { text: "Number A"; font.pixelSize: 13; color: "#94a3b8" }

            Rectangle {
                Layout.fillWidth: true
                Layout.topMargin: 8
                height: 48
                radius: 10
                color: "#13113a"
                border.color: inputA.activeFocus ? "#7c3aed" : "#312e81"
                border.width: inputA.activeFocus ? 2 : 1
                Behavior on border.color { ColorAnimation { duration: 150 } }

                // Placeholder
                Text {
                    anchors { left: parent.left; leftMargin: 14; verticalCenter: parent.verticalCenter }
                    text: "0"
                    font.pixelSize: 18
                    color: "#475569"
                    visible: inputA.text.length === 0 && !inputA.activeFocus
                }

                TextInput {
                    id: inputA
                    anchors { fill: parent; leftMargin: 14; rightMargin: 14 }
                    verticalAlignment: TextInput.AlignVCenter
                    font.pixelSize: 18
                    color: "#e2e8f0"
                    selectByMouse: true
                    validator: DoubleValidator { notation: DoubleValidator.StandardNotation }
                    onTextChanged: state.numA = parseFloat(text) || 0
                }
            }

            // ── Plus symbol ──────────────────────────────────────────────────
            Text {
                Layout.alignment: Qt.AlignHCenter
                Layout.topMargin: 16
                Layout.bottomMargin: 4
                text: "+"
                font.pixelSize: 30
                font.weight: Font.Bold
                color: "#7c3aed"
            }

            // ── Input B ──────────────────────────────────────────────────────
            Text { text: "Number B"; font.pixelSize: 13; color: "#94a3b8" }

            Rectangle {
                Layout.fillWidth: true
                Layout.topMargin: 8
                height: 48
                radius: 10
                color: "#13113a"
                border.color: inputB.activeFocus ? "#7c3aed" : "#312e81"
                border.width: inputB.activeFocus ? 2 : 1
                Behavior on border.color { ColorAnimation { duration: 150 } }

                // Placeholder
                Text {
                    anchors { left: parent.left; leftMargin: 14; verticalCenter: parent.verticalCenter }
                    text: "0"
                    font.pixelSize: 18
                    color: "#475569"
                    visible: inputB.text.length === 0 && !inputB.activeFocus
                }

                TextInput {
                    id: inputB
                    anchors { fill: parent; leftMargin: 14; rightMargin: 14 }
                    verticalAlignment: TextInput.AlignVCenter
                    font.pixelSize: 18
                    color: "#e2e8f0"
                    selectByMouse: true
                    validator: DoubleValidator { notation: DoubleValidator.StandardNotation }
                    onTextChanged: state.numB = parseFloat(text) || 0
                }
            }

            // ── Result box ───────────────────────────────────────────────────
            Rectangle {
                Layout.fillWidth: true
                Layout.topMargin: 24
                height: 64
                radius: 12
                gradient: Gradient {
                    orientation: Gradient.Horizontal
                    GradientStop { position: 0.0; color: "#4c1d95" }
                    GradientStop { position: 1.0; color: "#6d28d9" }
                }

                RowLayout {
                    anchors { fill: parent; leftMargin: 18; rightMargin: 18 }

                    Text {
                        text: "Result"
                        font.pixelSize: 14
                        color: "#c4b5fd"
                        font.weight: Font.Medium
                        Layout.fillWidth: true
                    }

                    Text {
                        id: resultText
                        text: state.calculated
                              ? (state.result % 1 === 0 ? state.result.toFixed(0) : state.result.toFixed(4))
                              : "—"
                        font.pixelSize: 26
                        font.weight: Font.Bold
                        color: "#f5f3ff"

                        Behavior on text {
                            SequentialAnimation {
                                NumberAnimation { target: resultText; property: "opacity"; from: 1; to: 0; duration: 80 }
                                NumberAnimation { target: resultText; property: "opacity"; from: 0; to: 1; duration: 120 }
                            }
                        }
                    }
                }
            }

            // ── Buttons ──────────────────────────────────────────────────────
            RowLayout {
                Layout.fillWidth: true
                Layout.topMargin: 20
                Layout.bottomMargin: 4
                spacing: 12

                // Reset
                Rectangle {
                    Layout.fillWidth: true
                    height: 46
                    radius: 10
                    color: resetMouse.containsPress ? "#2d2b55" : "#1e1b4b"
                    border.color: "#7c3aed"
                    border.width: 1.5
                    Behavior on color { ColorAnimation { duration: 120 } }

                    Text {
                        anchors.centerIn: parent
                        text: "Reset"
                        font.pixelSize: 14
                        font.weight: Font.SemiBold
                        color: "#a78bfa"
                    }
                    MouseArea {
                        id: resetMouse
                        anchors.fill: parent
                        hoverEnabled: true
                        cursorShape: Qt.PointingHandCursor
                        onClicked: state.reset()
                    }
                }

                // Calculate
                Rectangle {
                    Layout.fillWidth: true
                    height: 46
                    radius: 10
                    scale: calcMouse.containsPress ? 0.97 : 1.0
                    Behavior on scale { NumberAnimation { duration: 80 } }
                    gradient: Gradient {
                        orientation: Gradient.Horizontal
                        GradientStop { position: 0.0; color: "#6d28d9" }
                        GradientStop { position: 1.0; color: "#7c3aed" }
                    }

                    Text {
                        anchors.centerIn: parent
                        text: "Calculate"
                        font.pixelSize: 14
                        font.weight: Font.SemiBold
                        color: "#f5f3ff"
                    }
                    MouseArea {
                        id: calcMouse
                        anchors.fill: parent
                        hoverEnabled: true
                        cursorShape: Qt.PointingHandCursor
                        onClicked: state.calculate()
                    }
                }
            }
        }
    }
}
