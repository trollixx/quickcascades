import QtQuick 2.0
import QuickCascades 1.0

import "delegates"

AbstractPane {
    id: page
    property string __qcType: "Page"
    property list<ActionItem> actions
    //property alias actionBarVisibility: actionBar.visibility
    property TitleBar titleBar

    height: 1280; width: 720

    Rectangle {
        anchors.fill: parent
        color: ThemeManager.backgroundColor
    }

    TitleBar {
        data: titleBar
        visible: titleBar !== null
    }

    /*ActionBar {
        id: actionBar
        actions: Repeater {
            model: page.actions
            ActionBarActionDelegate {
                action: ActionItem {
                    title: modelData.title
                }
            }
        }
    }*/
}
