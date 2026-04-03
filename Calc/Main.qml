import QtQuick
import QtQuick.Layouts

Window {
    width: 320
    height: 455
    visible: true
    title: qsTr("Calculator")
    ColumnLayout{
        anchors.fill: parent
        Rectangle{
            Layout.fillWidth: true
            Layout.preferredHeight: 120
            color:"#E1E3E4"
            radius: 5
            Layout.margins: 10
            Layout.bottomMargin: 5
            ColumnLayout{
                anchors.fill: parent
                Rectangle{
                    Layout.preferredHeight: 55
                    Layout.fillWidth: true
                    color: "transparent"
                    Text {
                        text: qsTr()
                        anchors.right: parent.right
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.rightMargin: 15
                        font.pointSize: 22
                        font.bold: true
                    }
                }
                Rectangle{
                    Layout.preferredHeight: 55
                    Layout.fillWidth: true
                    color: "transparent"
                    Text {
                        text: qsTr("0")
                        anchors.right: parent.right
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.rightMargin: 15
                        font.pointSize: 22
                        font.bold: true
                    }
                }
            }
        }
        Rectangle{
            Layout.fillWidth: true
            Layout.fillHeight: true
            color:"#E1E3E4"
            radius: 5
            Layout.margins: 10
            Layout.topMargin: 5

            GridLayout{
                anchors.fill: parent
                columns : 4
                rows:4
                anchors.margins: 5
                Button{
                    Text {
                        text: qsTr("1")
                        font.pointSize: 18
                        font.bold: true
                        anchors.centerIn: parent
                        color: "Grey"
                    }
                }
                Button{
                    Text {
                        text: qsTr("2")
                        font.pointSize: 18
                        font.bold: true
                        anchors.centerIn: parent
                        color: "Grey"
                    }
                }
                Button{
                    Text {
                        text: qsTr("3")
                        font.pointSize: 18
                        font.bold: true
                        anchors.centerIn: parent
                        color: "Grey"
                    }
                }
                Button{
                    Text {
                        text: qsTr("C")
                        font.pointSize: 18
                        font.bold: true
                        anchors.centerIn: parent
                        color: "Grey"
                    }
                }
                Button{
                    Text {
                        text: qsTr("4")
                        font.pointSize: 18
                        font.bold: true
                        anchors.centerIn: parent
                        color: "Grey"
                    }
                }
                Button{
                    Text {
                        text: qsTr("5")
                        font.pointSize: 18
                        font.bold: true
                        anchors.centerIn: parent
                        color: "Grey"
                    }
                }
                Button{
                    Text {
                        text: qsTr("6")
                        font.pointSize: 18
                        font.bold: true
                        anchors.centerIn: parent
                        color: "Grey"
                    }
                }
                Button{
                    Text {
                        text: qsTr("=")
                        font.pointSize: 18
                        font.bold: true
                        anchors.centerIn: parent
                        color: "Grey"
                    }
                }
                Button{
                    Text {
                        text: qsTr("7")
                        font.pointSize: 18
                        font.bold: true
                        anchors.centerIn: parent
                        color: "Grey"
                    }
                }
                Button{
                    Text {
                        text: qsTr("8")
                        font.pointSize: 18
                        font.bold: true
                        anchors.centerIn: parent
                        color: "Grey"
                    }
                }
                Button{
                    Text {
                        text: qsTr("9")
                        font.pointSize: 18
                        font.bold: true
                        anchors.centerIn: parent
                        color: "Grey"
                    }
                }
                Button{
                    Text {
                        text: qsTr("0")
                        font.pointSize: 18
                        font.bold: true
                        anchors.centerIn: parent
                        color: "Grey"
                    }
                }
                Button{
                    Text {
                        text: qsTr("+")
                        font.pointSize: 18
                        font.bold: true
                        anchors.centerIn: parent
                        color: "Grey"
                    }
                }
                Button{
                    Text {
                        text: qsTr("-")
                        font.pointSize: 18
                        font.bold: true
                        anchors.centerIn: parent
                        color: "Grey"
                    }
                }
                Button{
                    Text {
                        text: qsTr("÷")
                        font.pointSize: 18
                        font.bold: true
                        anchors.centerIn: parent
                        color: "Grey"
                    }
                }
                Button{
                    Text {
                        text: qsTr("×")
                        font.pointSize: 18
                        font.bold: true
                        anchors.centerIn: parent
                        color: "Grey"
                    }
                }

            }

        }

    }
}
