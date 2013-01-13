import QtQuick 2.0
import QuickCascades 1.0

import "private"

AbstractPane {
    id: root

    default property alias data: childrenWrapper.data

    property list<Action> actions
    property alias backAction: backActionDelegate.action
    property PageStack pageStack
    property int status: PageStatus.Inactive
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
                                    - (bottomBar.visible ? bottomBar.height : 0)
                    implicitWidth: root.width
                }

                Item {
                    height: bottomBar.height; width: root.width
                    visible: bottomBar.visible
                }
            }
        }
    }

    BottomBar {
        id: bottomBar

        BackActionDelegate {
            id: backActionDelegate
            action: Action {
                icon: "../icons/back.png"
                text: qsTr("Back")
                onTriggered: root.pageStack.pop()
            }
        }

        ActionBar {
            actions: root.actions
            anchors {
                left: backActionDelegate.visible ? backActionDelegate.right : parent.left
                right: parent.right
            }
        }
    }
}
