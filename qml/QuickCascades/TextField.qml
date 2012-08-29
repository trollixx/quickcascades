import QtQuick 1.1

Rectangle {
    id: component

    property alias echoMode: textInput.echoMode
    property alias hintText: hintText.text
    property alias text: textInput.text

    height: 83; width: 606

    color: "#f9f9f9"

    states: [
        State {
            name: "focused"
            when: textInput.activeFocus
            PropertyChanges {
                target: focusedBorderImage
                opacity: 1
            }
        }
    ]

    transitions: [
        Transition {
            NumberAnimation { properties: "opacity"; duration: 50 }
        }
    ]

    BorderImage {
        id: defaultBorderImage
        anchors.fill: parent

        border.left: 10; border.top: 10
        border.right: 10; border.bottom: 10

        source: "resources/TextField.png"
    }

    BorderImage {
        id: focusedBorderImage
        anchors.fill: parent

        border.left: 10; border.top: 10
        border.right: 10; border.bottom: 10

        opacity: 0

        source: "resources/TextField_focused.png"
    }

    Text {
        id: hintText

        anchors {
            left: component.left; right: component.right
            leftMargin: 10; rightMargin: 10
            verticalCenter: component.verticalCenter
        }

        clip: true
        visible: component.state !== "focused" && textInput.text === ""

        color: "gray"
        font.italic: true
        font.pointSize: 24
        smooth: true
    }

    TextInput {
        id: textInput

        anchors {
            left: component.left; right: component.right
            leftMargin: 10; rightMargin: 10
            verticalCenter: component.verticalCenter
        }

        clip: true

        font.pointSize: 24
        smooth: true
    }

}


