import QtQuick 1.1

import "delegates"

Image {
    id: actionBar

    // Custom Action (menu or back)
    property alias customAction: customActionDelegate.action
    // NOTE: Workaround for read-only list<ActionItem>
    property variant actions
    /// TODO: Move this to C++ enum as QML doesn't allow to declare enums
    property string visibility

    anchors.bottom: parent.bottom
    height: 150; width: parent.width
    //visible: visibility !== "Hidden"

    fillMode: Image.TileHorizontally
    source: "qrc:/img/bar_bg.png"

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
