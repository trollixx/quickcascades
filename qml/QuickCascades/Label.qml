import QtQuick 1.1

Item {
    property alias text: labelText.text
    property alias color: labelText.color
    property alias font: labelText.font

    height: 37; width: labelText.implicitWidth || 1 // Empty labels should always occupy some space

    Text {
        id: labelText

        color: "white"
        font.pointSize: 24
        smooth: true
    }
}

