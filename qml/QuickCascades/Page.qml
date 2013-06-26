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

import "private"

AbstractPane {
    id: root

    default property alias data: childrenWrapper.data

    property list<Action> actions

    property int actionBarAlignment: ActionBarAlignment.Justify
    property Action backAction: Action {
        id: defaultBackAction
        iconSource: Style.toolBarBackIcon
        text: qsTr("Back")
        visible: root.pageStack && root !== root.pageStack.initialPage
        onTriggered: root.pageStack.pop()
    }
    property PageStack pageStack
    property int status: PageStatus.Inactive
    property TitleBar titleBar
    property AbstractBar toolBar: defaultToolBar
    property alias toolBarVisibility: defaultToolBar.visibility

    visible: false

    width: visible && parent ? parent.width : internal.previousWidth
    height: visible && parent ? parent.height : internal.previousHeight

    onWidthChanged: internal.previousWidth = visible ? width : internal.previousWidth
    onHeightChanged: internal.previousHeight = visible ? height : internal.previousHeight

    Rectangle {
        anchors.fill: parent
        color: Style.pageBackgroundColor
    }

    Image {
        anchors.fill: parent
        source: Style.pageBackgroundImage
    }

    Column {
        Item {
            id: titleBarPlaceholder
            height: titleBar && titleBar.visibility === ChromeVisibility.Visible ? titleBar.height : 0
            width: root.width
        }

        Item {
            id: childrenWrapper
            implicitHeight: root.height ? root.height - titleBarPlaceholder.height - toolBarPlaceholder.height : 0
            implicitWidth: root.width
        }

        Item {
            id: toolBarPlaceholder
            height: root.toolBar.visibility === ChromeVisibility.Visible && !Qt.inputMethod.visible
                    ? root.toolBar.height : 0
            width: root.width
        }
    }

    TitleBar {
        data: titleBar
    }

    ToolBar {
        id: defaultToolBar
        actions: root.actions
        backAction: root.backAction
    }

    QtObject {
        id: internal
        property int previousWidth: 0
        property int previousHeight: 0
    }
}
