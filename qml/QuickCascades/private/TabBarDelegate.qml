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
    property Tab tab

    implicitHeight: 140; implicitWidth: 153

    Rectangle {
        id: highlight
        color: "#00aae7"
        height: 8; width: parent.width
        opacity: 0

        states: State {
            name: "pressed"
            when: mouseArea.pressed && mouseArea.containsMouse
            PropertyChanges {
                target: highlight; opacity: 1
            }
        }

        transitions: Transition {
            from: "pressed"
            PropertyAnimation { property: "opacity"; duration: 100 }
        }
    }

    Column {
        anchors.centerIn: parent
        opacity: tab.enabled ? 1 : 0.4
        spacing: 5

        Image {
            anchors.horizontalCenter: parent.horizontalCenter
            height: 81; width: 81
            source: tab.icon || "../icons/gear.png"
        }

        Label {
            anchors.horizontalCenter: parent.horizontalCenter
            font {
                pointSize: 5
                weight: Font.DemiBold
            }
            text: tab.text
        }
    }

    MouseArea {
        id: mouseArea
        anchors.fill: parent
        enabled: tab.enabled
        onClicked: tab.triggered()
    }
}
