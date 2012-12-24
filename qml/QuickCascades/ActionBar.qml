import QtQuick 2.0

import "delegates"

Item {
    id: actionBar

    // Custom Action (menu for TabbedPane or back for NavigationPane)
    property alias customAction: customActionDelegate.action
    // NOTE: Workaround for read-only list<ActionItem>
    property var actions
    /// TODO: Move this to C++ enum as QML doesn't allow to declare enums
    property string visibility

    anchors.bottom: parent.bottom
    implicitHeight: 150; implicitWidth: parent.width
    //visible: visibility !== "Hidden"

    Rectangle {
        anchors.fill: parent
        color: ThemeManager.actionBarBackgroundColor
    }

    Item {
        anchors.bottom: parent.bottom
        height: 140; width: parent.width

        ActionBarActionDelegate {
            id: customActionDelegate
            visible: customAction !== null
        }

        Row {
            anchors.right: parent.right

            Repeater {
                model: actions
                ActionBarActionDelegate {
                    action: ActionItem {
                        imageSource: modelData.imageSource
                        title: modelData.title
                        onTriggered: modelData.triggered()
                    }
                }
            }
        }
    }
}
