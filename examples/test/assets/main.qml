import QtQuick 2.0
import QtQuick.Window 2.0

import QuickCascades 1.0

NavigationPane {
    id: root

    height: Screen.height; width: Screen.width

    initialPage: Page {
        titleBar: TitleBar {
            title: "Page 1"
        }

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

    /*pages: [
        Page {
            id: page1
            titleBar: TitleBar {
                title: "Page 1"
            }

            Rectangle {
                anchors.centerIn: parent
                color: "green"
                height: 100; width: 100

                MouseArea {
                    anchors.fill: parent
                    onClicked: navPane.push(page2)
                }
            }

            /*Column {
                    Rectangle {
                        color: "green"
                        height: 100; width: 100

                        MouseArea {
                            anchors.fill: parent
                            onClicked: navPane.push()
                        }
                    }

                    Item {
                        height: 1500; width: parent.width
                    }

                    Rectangle {
                        color: "red"
                        height: 100; width: 100

                        MouseArea {
                            anchors.fill: parent
                            onClicked: navPane.pop()
                        }
                    }
                }* /
        },

        Page {
            id: page2
            titleBar: TitleBar {
                title: "Page 2"
            }


        }
    ]*/
}
