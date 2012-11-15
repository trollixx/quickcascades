import QtQuick 2.0

import "delegates"

AbstractPane {
    id: tabbedPane
    property string __qcType: "TabbedPane"

    property alias tabs: actionBar.tabs
    property AbstractPane activePane
    property bool showTabsOnActionBar: false

    function setActiveTab(index) {
        // FIXME: Temp workaround, check for NavigationBar
        actionBar.visible = true
        actionBar.activeTabIndex = index
        // TODO: Implement hideSideBar()
        tabbedPane.x = 0
    }

    Component.onCompleted: {
        for (var i = 0; i < tabs.length; ++i) {
            if (tabs[i].content && tabs[i].content.__qcType === "NavigationPane") {
                tabs[i].content.pushed.connect(function(index) {
                    if (index > 0) {
                        actionBar.visible = false
                    }
                })
                tabs[i].content.popped.connect(function(index) {
                    if (index === 0) {
                        actionBar.visible = true
                    }
                })
            }
        }

        if (tabs[0].content.__qcType === "NavigationPane"
                || tabs[0].content.__qcType === "Page") {
            actionBar.actions = tabs[0].content.actions
        }
    }

    Behavior on x {
        NumberAnimation { duration: 500; easing.type: Easing.InOutQuad }
    }

    TabbedPaneSideBar {
        id: sideBar
        items: Repeater {
            model: tabs
            SideBarDelegate {
                imageSource: modelData.imageSource
                title: modelData.title
                onClicked: setActiveTab(index)
                selected: actionBar.activeTabIndex === index
            }
        }
    }

    Item {
        id: paneWrapper
        anchors.fill: parent
        data: activePane
    }

    TabbedPaneBar {
        id: actionBar

        onActiveTabChanged: {
            activePane = actionBar.activeTab.content
            if (activePane.__qcType === "NavigationPane"
                    || activePane.__qcType === "Page") {
                actionBar.actions = activePane.actions
            }
        }

        onMenuTriggered: {
            if (tabbedPane.x === 0) {
                tabbedPane.x += sideBar.width
            } else {
                tabbedPane.x = 0
            }
        }
    }
}
