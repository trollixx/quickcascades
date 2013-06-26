/****************************************************************************
**
** Copyright (C) 2012-2013 Oleg Shparber.
** All rights reserved.
**
** This file is part of the QuickCascades project.
**
** You may use this file under the terms of the BSD license as follows:
**
** "Redistribution and use in source and binary forms, with or without
** modification, are permitted provided that the following conditions are
** met:
**   * Redistributions of source code must retain the above copyright
**     notice, this list of conditions and the following disclaimer.
**   * Redistributions in binary form must reproduce the above copyright
**     notice, this list of conditions and the following disclaimer in
**     the documentation and/or other materials provided with the
**     distribution.
**   * Neither the name of the QuickCascades project nor the names of its
**     contributors may be used to endorse or promote products derived
**     from this software without specific prior written permission.
**
** THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
** "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
** LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
** A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
** OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
** SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
** LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
** DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
** THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
** (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
** OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE."
**
****************************************************************************/

import QtQuick 2.1
import QuickCascades 1.0

import "private" as Private

AbstractPane {
    id: root

    property int currentIndex: tabs.length > 0 ? 0 : -1
    readonly property Tab currentTab: (currentIndex < 0 || currentIndex >= tabs.length) ? null : tabs[currentIndex]
    property list<Tab> tabs
    property int sidebarState: SidebarState.Hidden

    Component.onCompleted: {
        if (!WindowManager.tabbedPane)
            WindowManager.tabbedPane = root
        else
            throw new Error("Only one TabbedPane in time is supported.")
    }

    onTabsChanged: {
        for (var i = 0; i < tabs.length; ++i) {
            if (tabs[i].content)
                tabs[i].content.parent = viewport

            if (i > 0)
                tabs[i].content.visible = false
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
        color: Style.tabMenuBackgroundColor
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
                    Private.TabMenuDelegate {
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
