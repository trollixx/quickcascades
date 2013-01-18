import QtQuick 2.0

import "private"

AbstractPane {
    id: root

    property int currentIndex: tabs.length > 0 ? 0 : -1
    readonly property Tab currentTab: (currentIndex < 0 || currentIndex >= tabs.length) ? null : tabs[currentIndex]
    property list<Tab> tabs

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
            Column {
                anchors.verticalCenter: parent.verticalCenter
                Repeater {
                    model: tabs
                    TabMenuDelegate {
                        selected: index == currentIndex
                        tab: modelData
                        width: flickable.width
                        onTriggered: root.currentIndex = index
                    }
                }
            }
        }
    }
}
