import QtQuick 2.0

Item {
    property alias title: titleText.text
    property alias subtitle: subtitleText.text

    height: 120; width: Screen.width
    z: 100

    MouseArea {
        anchors.fill: parent
    }

    Rectangle {
        anchors.fill: parent

        color: "black"
        opacity: 0.5
    }

    Column {
        anchors.centerIn: parent

        Text {
            id: titleText

            anchors.horizontalCenter: parent.horizontalCenter

            color: "white"
            elide: Text.ElideRight
            font.pointSize: 36
            horizontalAlignment:  Text.AlignHCenter
        }

        Text {
            id: subtitleText

            anchors.horizontalCenter: parent.horizontalCenter

            color: "#b2b2b2"
            elide: Text.ElideRight
            font.pointSize: 24
            horizontalAlignment:  Text.AlignHCenter
        }
    }
}
