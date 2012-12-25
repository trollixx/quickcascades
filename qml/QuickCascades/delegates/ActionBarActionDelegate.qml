import QtQuick 2.0

import QuickCascades 1.0

Item {
    property ActionItem action

    signal clicked

    height: 140; width: 153

    Image {
        id: backgroundImage

        anchors {
            fill: parent
        }

        source: action.backgroundImageSource
    }

    Column {
        anchors.centerIn: parent
        width: parent.width

        Image {
            id: iconImage

            anchors.horizontalCenter: parent.horizontalCenter
            height: 81; width: 81

            source: action.imageSource
        }

        Text {
            id: textText

            anchors.horizontalCenter: parent.horizontalCenter
            width: parent.width - 20
            visible: text !== ""

            color: "white"
            elide: Text.ElideRight
            font.pointSize: 18
            horizontalAlignment: Text.AlignHCenter
            style: Text.Raised
            styleColor: "black"

            text: action.title
        }
    }

    MouseArea {
        anchors.fill: parent

        onClicked: action.triggered()
    }
}
