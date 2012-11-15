import QtQuick 2.0

Item {
    property alias text: labelText.text
    property alias color: labelText.color
    property alias font: labelText.font

    height: 61; width: labelText.implicitWidth || 1 // Empty labels should always occupy some space

    Text {
        id: labelText
        anchors.verticalCenter: parent.verticalCenter

        color: "white"
        elide: Text.ElideRight
        font.pointSize: 24
        smooth: true
        style: Text.Raised
        styleColor: "black"
    }
}

