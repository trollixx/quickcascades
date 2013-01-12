import QtQuick 2.0
import QuickCascades 1.0

import "private"

AbstractPane {
    id: root

    default property alias data: childrenWrapper.data

    property list<Action> actions
    property TitleBar titleBar: null

    height: parent.height; width: parent.width

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

                Item {
                    height: titleBar ? titleBar.height : 0; width: root.width
                    visible: titleBar && titleBar.visible
                }

                Item {
                    id: childrenWrapper

                    Component.onCompleted: if (childrenRect.height > implicitHeight) height = childrenRect.height

                    implicitHeight: root.height - (titleBar ? titleBar.height : 0)
                                    - (actionBar.visible ? actionBar.height : 0)
                    implicitWidth: root.width
                }

                Item {
                    height: actionBar.height; width: root.width
                    visible: actionBar.visible
                }
            }
        }
    }

    ActionBar {
        id: actionBar
        actions: root.actions
    }
}
