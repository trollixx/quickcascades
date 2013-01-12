import QtQuick 2.0
import QuickCascades 1.0

Item {
    property Action action

    implicitHeight: 140; implicitWidth: 101

    Rectangle {
        anchors.top: parent.top
        color: mouseArea.pressed ? "#00aae7" : "transparent"
        height: 8; width: parent.width
    }

    Column {
        anchors.horizontalCenter: parent.horizontalCenter
        height: parent.height; width: 101

        Image {
            id: iconImage
            anchors.horizontalCenter: parent.horizontalCenter
            height: 81; width: 81
            source: action.imageSource
        }

        Label {
            anchors.horizontalCenter: parent.horizontalCenter
            font {
                pointSize: 5
                weight: Font.DemiBold
            }
            text: action.title
        }
    }

    MouseArea {
        id: mouseArea
        anchors.fill: parent
        onClicked: action.triggered()
    }
}
