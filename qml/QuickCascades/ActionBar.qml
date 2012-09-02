import QtQuick 1.1

import "delegates"

Item {
    id: actionBar

    // Custom Action (menu for TabbedPane or back for NavigationPane)
    property alias customAction: customActionDelegate.action
    // NOTE: Workaround for read-only list<ActionItem>
    property variant actions
    /// TODO: Move this to C++ enum as QML doesn't allow to declare enums
    property string visibility

    anchors.bottom: parent.bottom
    height: 150; width: parent.width
    //visible: visibility !== "Hidden"

    Rectangle {
        anchors.fill: parent
        color: "#2b2b2b"
    }

    Item {
        anchors.bottom: parent.bottom
        height: 140; width: parent.width

        ActionBarActionDelegate {
            id: customActionDelegate

            //width: 153
            //width: 170
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
