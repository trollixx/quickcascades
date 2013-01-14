import QtQuick 2.0
import QuickCascades 1.0

PageStack {
    id: root

    initialPage: Page {
        titleBar: TitleBar {
            title: "Page 1"
        }

        actions: [
            Action {
                text: "No action"
                onTriggered: console.log(text + " pressed")
            },
            Action {
                enabled: false
                text: "Disabled"
                onTriggered: console.log(text + " pressed")
            },
            Action {
                text: "Go to Page 2"
                onTriggered: root.push(page2)
            }
        ]

        Rectangle {
            anchors.right: parent.right
            color: "green"
            height: 100; width: 100

            MouseArea {
                anchors.fill: parent
                onClicked: root.push(page2)
            }
        }

        Rectangle {
            anchors.horizontalCenter: parent.horizontalCenter
            color: "yellow"
            height: 1500; width: 100
        }

        Rectangle {
            z: 1
            anchors.bottom: parent.bottom
            color: "green"
            height: 200; width: 100

            MouseArea {
                anchors.fill: parent
                onClicked: root.push(page2)
            }
        }
    }

    Component {
        id: page2
        Page {
            /*titleBar: TitleBar {
                title: "Page 2"
            }*/

            actions: [
                Action {
                    enabled: false
                    text: "Disabled"
                    onTriggered: console.log(text + " pressed")
                },
                Action {
                    text: "Go to Page 3"
                    onTriggered: root.push(page3)
                }
            ]

            Rectangle {
                anchors.bottom: parent.bottom
                color: "blue"
                height: 100; width: 100

                MouseArea {
                    anchors.fill: parent
                    onClicked: root.pop()
                }
            }

            Rectangle {
                anchors.horizontalCenter: parent.horizontalCenter
                color: "yellow"
                height: 100; width: 100
            }
        }
    }

    Component {
        id: page3
        Page {
            titleBar: TitleBar {
                title: "Page 3"
            }
        }
    }
}
