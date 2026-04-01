import QtQuick

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    Rectangle{
        width: 100
        height: 100
        Text{
            text: "Click Me!"
            anchors.centerIn: parent
        }
        color: if(mousearea.containsPress){
                   return Qt.darker("red")
               }else if (mousearea.containsMouse){
                   return Qt.lighter("red")
               }else {
                   return "red"
               }

        anchors.centerIn: parent

        MouseArea{
            id: mousearea
            anchors.fill: parent
            hoverEnabled: true

            onClicked: {
                console.log("Button Clicked")
            }
        }
    }
}
