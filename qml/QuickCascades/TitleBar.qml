import QtQuick 2.0

Item {
    property alias title: titleText.text
    property alias subtitle: subtitleText.text

    implicitHeight: 120; implicitWidth: parent.width

    MouseArea {
        anchors.fill: parent
    }

    Rectangle {
        anchors.fill: parent
        color: "black"
        opacity: 0.8
    }

    Column {
        anchors.centerIn: parent

        Label {
            id: titleText
            anchors.horizontalCenter: parent.horizontalCenter
            font.pointSize: 11
        }

        Label {
            id: subtitleText
            anchors.horizontalCenter: parent.horizontalCenter
            color: "gray"
            font {
                pointSize: 6
                weight: Font.Light
            }
        }
    }
}
