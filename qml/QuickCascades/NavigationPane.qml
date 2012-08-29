import QtQuick 1.1

import "delegates"

AbstractPane {
    id: navigationPane
    property string __qcType: "NavigationPane"
    property list<Page> pages
    property int __pageIndex: 0

    signal popped(int index)
    signal pushed(int index)

    function __stackTop(startIndex) {
        for (var i = (startIndex || pages.length) - 1; i >= 0; --i) {
            if (wrapper.children[i].x === 0) {
                return i
            }
        }
        return -1 // bug
    }

    function push(page) {
        if (page) {
            for (var i = 0; i < pages.length; ++i) {
                if (pages[i] === page) {
                    wrapper.children[i].x = 0
                    __pageIndex = i
                    pushed(__pageIndex)
                    break;
                }
            }
        } else {
            if (__pageIndex < pages.length - 1) {
                wrapper.children[++__pageIndex].x = 0
                pushed(__pageIndex)
            }
        }
        actionBar.actions = pages[__pageIndex].actions
    }

    function pop() {
        var stackTop = __stackTop()
        if (stackTop > 0) {
            wrapper.children[stackTop].x = navigationPane.width
            __pageIndex = __stackTop(stackTop)
            popped(__pageIndex)
        }
        actionBar.actions = pages[__pageIndex].actions
    }

    Item {
        id: wrapper

        height: parent.height; width: parent.width

        Repeater {
            model: pages

            Page {
                data: modelData
                x: index === 0 ? 0 : navigationPane.width

                Behavior on x {
                    enabled: parent.parent.x = (index === 0 ? 0 : navigationPane.width)
                    NumberAnimation { duration: 500; easing.type: Easing.InOutQuad }
                }
            }
        }
    }

    ActionBar {
        id: actionBar

        customAction: ActionItem {
            //imageSource: "qrc:/img/icon_back"
            //backgroundImageSource: "qrc:/img/back_action_bg"
            title: qsTr("Back")
            onTriggered: pop()
        }

        visible: __pageIndex > 0
    }
}
