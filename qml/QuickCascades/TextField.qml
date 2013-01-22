import QtQuick 2.0

Rectangle {
    id: root

    property alias echoMode: textInput.echoMode
    property alias hintText: hintText.text
    property alias text: textInput.text

    signal textChanged

    height: 83; width: 606

    border {
        color: Style.textFieldBorderColor
        width: 3
    }
    color: Style.textFieldBackgroundColor
    radius: 5

    states: [
        State {
            name: "focused"
            when: textInput.activeFocus
            PropertyChanges {
                target: root
                border.color: Style.textFieldBorderColorFocused
            }
        }
    ]

    transitions: [
        Transition {
            ColorAnimation { properties: "border.color"; duration: 50 }
        }
    ]

    Text {
        id: hintText

        anchors {
            left: root.left; right: root.right
            leftMargin: 10; rightMargin: 10
            verticalCenter: root.verticalCenter
        }

        clip: true
        visible: root.state !== "focused" && textInput.text === ""

        color: "gray"
        font { italic: true; pointSize: 24 }
    }

    MouseArea {
        anchors.fill: parent
        onClicked: textInput.forceActiveFocus()
    }

    TextInput {
        id: textInput

        anchors {
            left: root.left; right: root.right
            leftMargin: 10; rightMargin: 10
            verticalCenter: root.verticalCenter
        }

        clip: true
        font.pointSize: 24
    }
}
