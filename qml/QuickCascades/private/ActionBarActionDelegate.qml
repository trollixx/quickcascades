import QtQuick 2.0
import QuickCascades 1.0

Item {
    property Action action

    height: 140; width: 150

    Column {
        anchors.centerIn: parent
        width: parent.width

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
        anchors.fill: parent
        onClicked: action.triggered()
    }
}
