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

import QtQuick 2.0
import QuickCascades 1.0

Item {
    property bool selected
    property Tab tab

    signal triggered

    height: 121

    states: [
        State {
            name: "selected"
            when: selected
            PropertyChanges { target: selectedHighlight; opacity: 1 }
            PropertyChanges { target: descriptionLabel; color: "#fefefe" }
        },
        State {
            name: "pressed"
            when: mouseArea.pressed
            PropertyChanges { target: pressedHighlight; opacity: 1 }
        }
    ]

    transitions: [
        Transition {
            from: "selected"
            PropertyAnimation { target: selectedHighlight; property: "opacity"; duration: 100 }
        },
        Transition {
            from: "pressed"
            PropertyAnimation { target: pressedHighlight; property: "opacity"; duration: 100 }
        }
    ]

    Rectangle {
        id: selectedHighlight
        anchors.fill: parent
        color: Style.tabMenuCurrentItemColor
        opacity: 0
    }

    Rectangle {
        id: pressedHighlight
        anchors.fill: parent
        border {
            color: Style.tabMenuPressedItemBorderColor
            width: Style.tabMenuPressedItemBorderWidth
        }
        color: Style.tabMenuPressedItemColor
        opacity: 0
    }

    Rectangle {
        height: 1; width: parent.width
        color: "#282828" /// TODO: Theming
    }

    Row {
        anchors.centerIn: parent
        spacing: 20
        width: parent.width - 40

        Image {
            anchors.verticalCenter: parent.verticalCenter
            height: 81; width: 81
            source: tab.icon || "image://icons/action-default"
        }

        Column {
            anchors.verticalCenter: parent.verticalCenter

            Label {
                font.pointSize: 11
                text: tab.text
            }

            Label {
                id: descriptionLabel
                text: tab.description
                color: "#909090"
            }
        }
    }

    Rectangle {
        anchors.bottom: parent.bottom
        height: 1; width: parent.width
        color: "#282828" /// TODO: Theming
    }

    MouseArea {
        id: mouseArea
        anchors.fill: parent
        onClicked: if (tab.enabled) parent.triggered()
    }
}
