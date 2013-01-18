import QtQuick 2.0
import QuickCascades 1.0

Item {
    property bool selected
    property Tab tab

    signal triggered

    height: 121

    states: [
        State {
            name: "selected"
            when: selected
            PropertyChanges { target: selectedHighlight; opacity: 1 }
            PropertyChanges { target: descriptionLabel; color: "#fefefe" }
        },
        State {
            name: "pressed"
            when: mouseArea.pressed
            PropertyChanges { target: pressedHighlight; opacity: 1 }
        }
    ]

    transitions: [
        Transition {
            from: "selected"
            PropertyAnimation { target: selectedHighlight; property: "opacity"; duration: 100 }
        },
        Transition {
            from: "pressed"
            PropertyAnimation { target: pressedHighlight; property: "opacity"; duration: 100 }
        }
    ]

    Rectangle {
        id: selectedHighlight
        anchors.fill: parent
        color: "#00a7de" /// TODO: Theming
        opacity: 0
    }

    Rectangle {
        id: pressedHighlight
        anchors.fill: parent
        border { /// TODO: Theming, it needs more Cacades styling (complex border)
            color: "#00a7de"
            width: 3
        }
        color: "transparent" /// TODO: Theming
        opacity: 0
    }

    Rectangle {
        height: 1; width: parent.width
        color: "#282828" /// TODO: Theming
    }

    Row {
        anchors.centerIn: parent
        spacing: 20
        width: parent.width - 40

        Image {
            anchors.verticalCenter: parent.verticalCenter
            height: 81; width: 81
            source: tab.icon || "../icons/gear.png"
        }

        Column {
            anchors.verticalCenter: parent.verticalCenter

            Label {
                font.pointSize: 11
                text: tab.text
            }

            Label {
                id: descriptionLabel
                text: tab.description
                color: "#909090"
            }
        }
    }

    Rectangle {
        anchors.bottom: parent.bottom
        height: 1; width: parent.width
        color: "#282828" /// TODO: Theming
    }

    MouseArea {
        id: mouseArea
        anchors.fill: parent
        onClicked: if (tab.enabled) parent.triggered()
    }
}
