import QtQuick 2.0

import "private"

Item {
    // Custom Action (menu for TabbedPane or back for NavigationPane)
    // property alias customAction: customActionDelegate.action

    property var actions

    anchors.bottom: parent.bottom
    implicitHeight: 140; implicitWidth: parent.width
    visible: actions && actions.length

    Rectangle {
        anchors.fill: parent
        color: ThemeManager.actionBarBackgroundColor
    }

    Item {
        anchors.bottom: parent.bottom
        height: 140; width: parent.width

        /*ActionBarActionDelegate {
            id: customActionDelegate
            visible: customAction !== null
        }*/

        Row {
            id: actionWrapper
            anchors.fill: parent

            Repeater {
                model: actions
                Item {
                    height: actionWrapper.height
                    width: actionWrapper.width / Math.min(4, actions.length)
                    ActionBarActionDelegate {
                        action: modelData
                        anchors.centerIn: parent
                    }
                }
            }
        }
    }
}
