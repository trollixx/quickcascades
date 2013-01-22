import QtQuick 2.0
import QuickCascades 1.0

Item {
    property Tab tab

    implicitHeight: 140; implicitWidth: 153

    Rectangle {
        id: highlight
        color: "#00aae7"
        height: 8; width: parent.width
        opacity: 0

        states: State {
            name: "pressed"
            when: mouseArea.pressed && mouseArea.containsMouse
            PropertyChanges {
                target: highlight; opacity: 1
            }
        }

        transitions: Transition {
            from: "pressed"
            PropertyAnimation { property: "opacity"; duration: 100 }
        }
    }

    Column {
        anchors.centerIn: parent
        opacity: tab.enabled ? 1 : 0.4
        spacing: 5

        Image {
            anchors.horizontalCenter: parent.horizontalCenter
            height: 81; width: 81
            source: tab.icon || "../icons/gear.png"
        }

        Label {
            anchors.horizontalCenter: parent.horizontalCenter
            font {
                pointSize: 5
                weight: Font.DemiBold
            }
            text: tab.text
        }
    }

    MouseArea {
        id: mouseArea
        anchors.fill: parent
        enabled: tab.enabled
        onClicked: tab.triggered()
    }
}
