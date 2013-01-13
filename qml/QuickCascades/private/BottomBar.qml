import QtQuick 2.0

Item {
    anchors.bottom: parent.bottom
    implicitHeight: 140; implicitWidth: parent.width

    Rectangle {
        anchors.fill: parent
        color: ThemeManager.actionBarBackgroundColor
        /// TODO: opacity
    }

    MouseArea {
        anchors.fill: parent
    }
}
