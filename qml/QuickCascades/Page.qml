import QtQuick 2.0
import QuickCascades 1.0

import "delegates"

AbstractPane {
    id: page
    property string __qcType: "Page"
    property list<ActionItem> actions
    //property alias actionBarVisibility: actionBar.visibility
    property TitleBar titleBar

    Rectangle {
        anchors.fill: parent
        color: ThemeManager.backgroundColor
    }

    TitleBar {
        data: titleBar
        visible: titleBar !== null
    }
}
