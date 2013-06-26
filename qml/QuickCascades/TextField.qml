import QtQuick 2.1

Rectangle {
    id: root


    border {
        color: "green"
        width: 2
    }
    color: "#fefefe"
    height: 101; width: 250
    radius: 10

    TextInput {
        id: textInput

        objectName: "__qc_textField"

        anchors.fill: parent
        horizontalAlignment: TextInput.AlignHCenter
        verticalAlignment: TextInput.AlignVCenter

        Keys.onReturnPressed: textInput.focus = false
    }
}
