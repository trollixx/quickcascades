import QtQuick 2.0
import QuickCascades 1.0

import "private"

AbstractPane {
    id: root

    property int currentIndex: tabs.length > 0 ? 0 : -1
    readonly property Tab currentTab: (currentIndex < 0 || currentIndex >= tabs.length) ? null : tabs[currentIndex]
    property list<Tab> tabs
    property int sidebarState: SidebarState.Hidden

    onTabsChanged: {
        for (var i = 0; i < tabs.length; ++i) {
            if (tabs[i].content)
                tabs[i].content.parent = viewport
        }
    }

    onCurrentTabChanged: {
        if (internal.oldIndex > -1 && internal.oldIndex < tabs.length)
            tabs[internal.oldIndex].content.visible = false

        if (!currentTab || !currentTab.content)
            return

        currentTab.content.parent = viewport
        currentTab.content.visible = true
        viewport.children[0] = currentTab.content

        internal.oldIndex = currentIndex
    }

    states: [
        State {
            when: root.sidebarState === SidebarState.Hidden
            PropertyChanges { target: viewport; x: 0 }
        },
        State {
            when: root.sidebarState === SidebarState.VisibleCompact
            PropertyChanges { target: viewport; x: 121 }
        },
        State {
            when: root.sidebarState === SidebarState.VisibleFull
            PropertyChanges { target: viewport; x: root.width - 154 }
        }
    ]

    QtObject {
        id: internal
        property int oldIndex: -1
    }

    Rectangle {
        anchors.fill: parent
        color: "#111" /// TODO: Theming
    }

    // TabMenu
    Flickable {
        id: flickable
        anchors.fill: parent
        flickableDirection: Flickable.VerticalFlick

        Item {
            height: flickable.height; width: flickable.width

            MouseArea {
                anchors.fill: parent
                onClicked: root.sidebarState = SidebarState.Hidden
            }

            Column {
                anchors.verticalCenter: parent.verticalCenter
                Repeater {
                    model: tabs
                    TabMenuDelegate {
                        selected: index == currentIndex
                        tab: modelData
                        width: flickable.width
                        onTriggered: {
                            root.currentIndex = index
                            root.sidebarState = SidebarState.Hidden
                        }
                    }
                }
            }
        }
    }

    Rectangle {
        id: viewport
        height: parent.height
        width: parent.width

        Behavior on x {
            NumberAnimation { id: animation; duration: 200; easing.type: Easing.OutQuad }
        }
    }

    Rectangle {
        color: "#30000000"
        height: viewport.height; width: viewport.width
        x: viewport.x
        visible: x > root.width / 2
    }

    MouseArea {
        height: viewport.height; width: viewport.width
        x: viewport.x
        enabled: root.sidebarState === SidebarState.VisibleFull
        onClicked: root.sidebarState = SidebarState.Hidden
    }

    MouseArea {
        anchors.fill: parent
        enabled: animation.running
    }
}
