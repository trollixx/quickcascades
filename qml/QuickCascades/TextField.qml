import QtQuick 1.1

Rectangle {
    id: component

    property alias echoMode: textInput.echoMode
    property alias hintText: hintText.text
    property alias text: textInput.text

    signal textChanged

    height: 83; width: 606

    border {
        color: ThemeManager.textFieldBorderColor
        width: 3
    }
    color: ThemeManager.textFieldBackgroundColor
    radius: 5

    states: [
        State {
            name: "focused"
            when: textInput.activeFocus
            PropertyChanges {
                target: component
                border.color: ThemeManager.textFieldBorderColorFocused
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
            left: component.left; right: component.right
            leftMargin: 10; rightMargin: 10
            verticalCenter: component.verticalCenter
        }

        clip: true
        visible: component.state !== "focused" && textInput.text === ""

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
            left: component.left; right: component.right
            leftMargin: 10; rightMargin: 10
            verticalCenter: component.verticalCenter
        }

        clip: true
        font.pointSize: 24

        onTextChanged: {
            component.textChanged()
            /// FIXME: Why is it needed?
            forceActiveFocus()
        }
    }
}
