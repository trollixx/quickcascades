import QtQuick 2.0

import "private"

Row {
    id: root

    property var actions: []

    height: 140

    Repeater {
        model: actions
        Item {
            height: root.height
            width: root.width / Math.min(4, actions.length)
            ActionBarActionDelegate {
                action: modelData
                anchors.centerIn: parent
            }
        }
    }
}
