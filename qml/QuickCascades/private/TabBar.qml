import QtQuick 2.0
import QuickCascades 1.0

Row {
    id: root

    property list<Tab> tabs

    height: 140

    TabBarMenuDelegate {
        action: Action {
            onTriggered: WindowManager.tabbedPane.sidebarState = SidebarState.VisibleFull
        }
    }

    /*Repeater {
        model: root.tabs
        TabBarDelegate {
            tab: modelData
        }
    }*/
}
