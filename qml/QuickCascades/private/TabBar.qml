import QtQuick 2.0
import QuickCascades 1.0

Row {
    id: root

    property list<Tab> tabs

    height: 140

    Repeater {
        model: root.tabs
        TabBarDelegate {
            tab: modelData
        }
    }
}
