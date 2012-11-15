import QtQuick 2.0

Item {
    id: button

    property alias text: buttonText.text

    signal clicked

    width: Math.max(354, buttonText.implicitWidth); height: 102

    states: [
        State {
            name: "pressed"
            when: mouseArea.pressed
            PropertyChanges {
                target: defaultImage
                opacity: 0
            }
        }
    ]

    transitions: [
        Transition {
            NumberAnimation { properties: "opacity"; duration: 50 }
        }
    ]

    MouseArea {
        id: mouseArea
        anchors.fill: parent

        onClicked: button.clicked()
    }

    BorderImage {
        id: pressedImage
        anchors.fill: parent

        border.left: 10; border.top: 10
        border.right: 10; border.bottom: 10

        source: "resources/Button_pressed.png"

    }

    BorderImage {
        id: defaultImage
        anchors.fill: parent

        border.left: 10; border.top: 10
        border.right: 10; border.bottom: 10

        source: "resources/Button.png"
    }

    Text {
        id: buttonText

        anchors.centerIn: parent

        color: "white"
        font.pointSize: 24
        smooth: true

        text: button.text
    }
}
