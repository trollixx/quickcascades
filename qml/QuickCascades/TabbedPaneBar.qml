import QtQuick 1.1

// Currently only menu item is shown
ActionBar {
    property list<Tab> tabs
    property Tab activeTab
    property int activeTabIndex: -1

    onTabsChanged: activeTabIndex = tabs.length ? 0 : -1

    onActiveTabIndexChanged: {
        // TODO: I'm not sure it's the right way
        for (var i = 0; i < tabs.length; ++i) {
            if (tabs[i].content) {
                tabs[i].content.visible = false
            }
        }
        activeTab = activeTabIndex >= 0 ? tabs[activeTabIndex] : null
        if (activeTab.content) {
            activeTab.content.visible = true
        }
    }

    signal menuTriggered

    Component.onCompleted: {
        if (tabs.length && activeTabIndex == -1) {
            activeTabIndex = 0
        }
    }

    customAction: ActionItem {
        imageSource: "qrc:/img/icon_action_menu.png"
        onTriggered: menuTriggered()
    }
}
