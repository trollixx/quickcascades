import QtQuick 2.0
import QuickCascades 1.0

import "private"

AbstractPane {
    id: root

    default property alias data: childrenWrapper.data

    property list<Action> actions
    property Action backAction: Action {
        icon: "../icons/back.png"
        text: qsTr("Back")
        onTriggered: root.pageStack.pop()
    }
    property PageStack pageStack
    property int status: PageStatus.Inactive
    property TitleBar titleBar

    /// FIXME: Here are temporary workarounds while QML-defined grouped properties don't work
    property alias actionBarMode: actionBarProperty.mode
    property alias actionBarAlignment: actionBarProperty.alignment
    QtObject {
        id: actionBarProperty
        property int alignment: ActionBarAlignment.Justify
        property int mode: BarMode.BuiltIn
    }

    visible: false

    width: visible && parent ? parent.width : internal.previousWidth
    height: visible && parent ? parent.height : internal.previousHeight

    onWidthChanged: internal.previousWidth = visible ? width : internal.previousWidth
    onHeightChanged: internal.previousHeight = visible ? height : internal.previousHeight

    Rectangle {
        anchors.fill: parent
        color: Style.pageBackgroundColor
    }

    Image {
        anchors.fill: parent
        source: Style.pageBackgroundImage
    }

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
                height: titleBar && titleBar.mode === BarMode.BuiltIn ? titleBar.height : 0
                width: root.width
            }

            Item {
                id: childrenWrapper
                implicitHeight: root.height ? root.height
                                              - (titleBar && titleBar.mode === BarMode.BuiltIn ? titleBar.height : 0)
                                              - (bottomBar.visible && root.actionBarMode === BarMode.BuiltIn ? bottomBar.height : 0) : 0
                implicitWidth: root.width
            }

            Item {
                height: root.actionBarMode === BarMode.BuiltIn ? bottomBar.height : 0
                width: root.width
            }
        }
    }


    TitleBar {
        data: titleBar
    }

    BottomBar {
        id: bottomBar

        /// TODO: I am not sure about Loader
        Loader {
            id: backActionLoader
            sourceComponent: root.pageStack && backAction.visible ? backActionComponent : undefined
        }

        Component {
            id: backActionComponent
            BackActionDelegate {
                action: root.backAction
            }
        }

        TabBar {
            id: tabBar
            tabs: if (WindowManager.tabbedPane) WindowManager.tabbedPane.tabs
            visible: !(root.pageStack && backAction.visible)
        }

        ActionBar {
            actions: root.actions
            anchors {
                left: {
                    /// TODO: Better conditions are needed
                    if (root.pageStack && backAction.visible)
                        backActionLoader.right
                    else if (WindowManager.tabbedPane)
                        tabBar.right
                    else
                        parent.left
                }
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
