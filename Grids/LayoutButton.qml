import QtQuick


Rectangle {
    width: 125;
    height: 50
    color: "#e6e4e0"
    radius: 7
    Rectangle{
        radius: 5
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: parent.left
        anchors.leftMargin: 5
        id: inde
        height: 40
        width: 40
        color: "#85d63e"
        Text {
            text: index
            font{
                pixelSize: 18
                bold: true
            }
            color: "white"
            anchors.centerIn: parent
        }
    }
    Text {
        anchors.right: inde.right
        anchors.centerIn: parent
        text: "Item"

    }
}
