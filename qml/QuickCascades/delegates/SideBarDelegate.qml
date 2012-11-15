import QtQuick 2.0

Rectangle {
    id: component

    property alias imageSource: iconImage.source
    property alias title: titleText.text

    property bool selected: false
    property bool pressed: false

    signal clicked

    height: 118; width: parent.width

    color: (selected || pressed) ? "#91c128" : "transparent"

    Row {
        height: 115; width: parent.width

        Item {
            anchors.verticalCenter: parent.verticalCenter
            height: parent.height; width: 101

            Image {
                id: iconImage

                anchors.centerIn: parent
                height: 81; width: 81
            }
        }

        Text {
            id: titleText

            height: parent.height

            color: "white"
            elide: Text.ElideRight
            font.pointSize: 36
            verticalAlignment: Text.AlignVCenter
        }
    }

    Rectangle {
        anchors.bottom: parent.bottom
        height: 3; width: parent.width

        color: "black"
    }

    MouseArea {
        height: 115; width: parent.width

        onClicked: component.clicked()
        onPressedChanged: component.pressed = pressed
    }
}
