import QtQuick 2.0
import QuickCascades 1.0

Item {
    property Action action

    implicitHeight: 140; implicitWidth: 101

    Column {
        anchors.fill: parent
        opacity: action.enabled ? 1 : 0.4
        spacing: 5

        Rectangle {
            color: mouseArea.pressed ? "#00aae7" : "transparent"
            height: 8; width: parent.width
        }

        Image {
            anchors.horizontalCenter: parent.horizontalCenter
            height: 81; width: 81
            source: action.icon || "../icons/gear.png"
        }

        Label {
            anchors.horizontalCenter: parent.horizontalCenter
            font {
                pointSize: 5
                weight: Font.DemiBold
            }
            text: action.text
        }
    }

    MouseArea {
        id: mouseArea
        anchors.fill: parent
        enabled: action.enabled
        onClicked: action.triggered()
    }
}
