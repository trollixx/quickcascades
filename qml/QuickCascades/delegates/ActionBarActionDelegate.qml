import QtQuick 1.1

import ".."

Item {
    property ActionItem action

    signal clicked

    width: 153; height: 140

    Image {
        id: backgroundImage

        anchors {
            fill: parent
        }

        source: action ? action.backgroundImageSource : ""
    }

    Image {
        id: iconImage

        anchors {
            horizontalCenter: parent.horizontalCenter
            verticalCenter: parent.verticalCenter
        }
        height: 81; width: 81

        source: action ? action.imageSource : ""
    }

    Text {
        id: textText

        anchors {
            top: iconImage.bottom
            horizontalCenter: parent.horizontalCenter
        }
        width: parent.width - 20

        color: "white"
        elide: Text.ElideRight
        font.pointSize: 18
        horizontalAlignment: Text.AlignHCenter
        style: Text.Raised
        styleColor: "black"

        text: action ? action.title : ""
    }

    MouseArea {
        anchors.fill: parent

        onClicked: action.triggered()
    }
}
