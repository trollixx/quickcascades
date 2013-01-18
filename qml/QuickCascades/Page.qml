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
    property TitleBar titleBar

    visible: false

    width: visible && parent ? parent.width : internal.previousWidth
    height: visible && parent ? parent.height : internal.previousHeight

    onWidthChanged: internal.previousWidth = visible ? width : internal.previousWidth
    onHeightChanged: internal.previousHeight = visible ? height : internal.previousHeight

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

            Binding {
                target: childrenWrapper
                property: "height"
                value: childrenWrapper.childrenRect.height
                when: root.height
            }

            Column {
                id: column

                Item {
                    height: titleBar ? titleBar.height : 0; width: root.width
                }

                Item {
                    id: childrenWrapper
                    implicitHeight: root.height ? root.height
                                                  - (titleBar ? titleBar.height : 0)
                                                  - (bottomBar.visible ? bottomBar.height : 0) : 0
                    implicitWidth: root.width
                }

                Item {
                    height: bottomBar.height; width: root.width
                }
            }
        }
    }

    TitleBar {
        data: titleBar
    }

    BottomBar {
        id: bottomBar

        BackActionDelegate {
            id: backActionDelegate
            visible: root.pageStack
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

    QtObject {
        id: internal
        property int previousWidth: 0
        property int previousHeight: 0
    }
}
