import QtQuick 2.0
import QuickCascades 1.0

Image {
    property Action action

    height: 140; width: 173
    source: "../graphics/back_action_bg.png"
    visible: action.visible

    Rectangle {
        id: highlight
        anchors {
            left: parent.left
            verticalCenter: parent.verticalCenter
        }
        color: "#00aae7"
        height: 101; width: 8
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
        anchors {
            left: parent.left; leftMargin: 30
            verticalCenter: parent.verticalCenter
        }
        height: 101; width: 101
        opacity: action.enabled ? 1 : 0.4

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
