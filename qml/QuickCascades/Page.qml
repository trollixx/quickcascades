import QtQuick 2.0
import QtQuick.Window 2.0
import QuickCascades 1.0

import "delegates"

AbstractPane {
    id: page

    default property alias data: childrenWrapper.data
    property string __qcType: "Page"
    property list<ActionItem> actions
    property TitleBar titleBar: null


    TitleBar {
        data: titleBar
        visible: titleBar !== null
    }

    Rectangle {
        anchors.fill: parent
        color: ThemeManager.backgroundColor

        Flickable {
            id: flickable
            anchors.fill: parent
            contentHeight: column.height
            contentWidth: column.width
            flickableDirection: Flickable.VerticalFlick
            interactive: contentHeight > height

            Column {
                id: column
                height: Math.max(Screen.height, childrenRect.height)
                width: Math.max(Screen.width, childrenRect.width)

                Item {
                    height: titleBar ? titleBar.height : 0; width: Screen.width
                    visible: titleBar && titleBar.visible
                }

                Item {
                    id: childrenWrapper
                    height: childrenRect.height; width: childrenRect.width
                }
            }
        }
    }
}
