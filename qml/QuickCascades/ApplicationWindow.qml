import QtQuick 2.0
import QuickCascades 1.0

Rectangle {
    id: root

    property list<Action> actions
    default property AbstractPane content

    Component.onCompleted: WindowManager.appWindow = root

    onContentChanged: if (content) content.parent = contentWrapper

    color: "#fefefe"

    data: [
        QtObject {
            id: internal
            property PageStack currentPageStack
        },

        Item {
            id: contentWrapper
            anchors.fill: parent
        },

        Item {
            id: sheetWrapper
        }
    ]
}
