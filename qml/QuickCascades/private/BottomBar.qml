import QtQuick 2.0
import QuickCascades 1.0

AbstractBar {
    anchors.bottom: parent.bottom
    implicitHeight: 140; implicitWidth: parent.width

    Rectangle {
        anchors.fill: parent
        gradient: Gradient {
            GradientStop { position: 0; color: "#323232" }
            GradientStop { position: 1; color: "#252525" }
        }
        /// TODO: opacity
    }

    MouseArea {
        anchors.fill: parent
    }
}
