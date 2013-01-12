import QtQuick 2.0
import QuickCascades 1.0

Item {
    property Action action

    implicitHeight: 140; implicitWidth: 101

    Column {
        anchors.horizontalCenter: parent.horizontalCenter
        height: parent.height; width: 101
        spacing: 5

        Rectangle {
            color: mouseArea.pressed ? "#00aae7" : "transparent"
            height: 8; width: parent.width
        }

        Image {
            id: iconImage
            anchors.horizontalCenter: parent.horizontalCenter
            height: 81; width: 81
            source: action.imageSource || "../icons/gear.png"
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
