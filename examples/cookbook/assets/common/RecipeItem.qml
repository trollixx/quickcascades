import QtQuick 1.1
import QuickCascades 1.0

Item {
    height: 180; width: 720

    property alias image: itemImage.source
    property alias title: itemTitle.text

    Image {
        height: 173; width: parent.width
        source: "../images/white_photo.png"

        Rectangle {
            id: highlight
            anchors.fill: parent
            color: "#75b5d3"
            opacity: 0
        }

        Row {
            anchors.fill: parent

            spacing: 20

            Image {
                id: itemImage
                height: 168; width: 250
            }

            Text {
                id: itemTitle
                anchors.leftMargin: 15
                height: parent.height; width: parent.width - itemImage.width
                verticalAlignment: Text.AlignVCenter
            }
        }

        MouseArea {
            anchors.fill: parent
            onPressAndHold: highlight.opacity = 0.9
            onReleased: highlight.opacity = 0
        }
    }
}
