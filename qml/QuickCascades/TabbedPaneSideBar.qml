import QtQuick 1.1

Rectangle {
    property alias items: actionsWrapper.children

    height: parent.height; width: parent.width - 153
    x: -width
    color: "#151926"

    Column {
        anchors.verticalCenter: parent.verticalCenter
        height: childrenRect.height; width: parent.width

        Rectangle {
            height: 3; width: parent.width
            color: "black"
        }

        Column {
            id: actionsWrapper
            height: childrenRect.height; width: parent.width
        }
    }

    Row {
        height: parent.height; width: 13
        anchors.right: parent.right
        Image {
            height: parent.height; width: 9

            fillMode: Image.TileVertically
            source: "qrc:/img/sidebar_shadow.png"
        }
        Rectangle {
            height: parent.height; width: 4

            color: "black"
        }
    }
}
