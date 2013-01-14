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
            /// FIXME: This check is intented to prevent errors in log, because component
            /// is removed before its bindings somewhy
            width: root ? root.width / Math.min(4, actions.length) : 0
            ActionBarActionDelegate {
                action: modelData
                anchors.centerIn: parent
            }
        }
    }
}
