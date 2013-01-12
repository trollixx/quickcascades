import QtQuick 2.0
import QtQuick.Window 2.0
import QuickCascades 1.0

PageStack {
    id: root

    height: Screen.height; width: Screen.width

    initialPage: Page {
        titleBar: TitleBar {
            title: "Page 1"
        }

        actions: [
            Action {
                title: "Test 1"
                onTriggered: console.log(title + " pressed")
            },
            Action {
                enabled: false
                title: "Test 2"
                onTriggered: console.log(title + " pressed")
            },
            Action {
                title: "Test 3"
                onTriggered: console.log(title + " pressed")
            }
        ]

        Rectangle {
            anchors.centerIn: parent
            color: "green"
            height: 1400; width: 100

            MouseArea {
                anchors.fill: parent
                onClicked: root.push(page2)
            }
        }

        Rectangle {
            anchors.bottom: parent.bottom
            color: "green"
            height: 100; width: 100

            MouseArea {
                anchors.fill: parent
                onClicked: root.push(page2)
            }
        }
    }

    Component {
        id: page2
        Page {
            titleBar: TitleBar {
                title: "Page 2"
            }

            Rectangle {
                anchors.centerIn: parent
                color: "blue"
                height: 100; width: 100

                MouseArea {
                    anchors.fill: parent
                    onClicked: root.pop()
                }
            }
        }
    }
}
