import QtQuick 2.0
import QuickCascades 1.0

TabbedPane {
    id: tabbedPane
    tabs: [
        Tab {
            text: "Tab 1"
            description: text + " description"

            Page {
                titleBar: TitleBar {
                    title: qsTr("Tab 1")
                }

                actions: [
                    Action {
                        text: "Peek tabs"
                        onTriggered: tabbedPane.sidebarState = SidebarState.VisibleCompact
                    },
                    Action {
                        text: "Open tabs"
                        onTriggered: tabbedPane.sidebarState = SidebarState.VisibleFull
                    }
                ]

                Column {
                    Rectangle {
                        color: "red"
                        height: 100; width: 100

                        MouseArea {
                            anchors.fill: parent
                            onClicked: tabbedPane.sidebarState = SidebarState.Hidden
                        }
                    }
                    Rectangle {
                        color: "yellow"
                        height: 100; width: 100

                        MouseArea {
                            anchors.fill: parent
                            onClicked: tabbedPane.sidebarState = SidebarState.VisibleCompact
                        }
                    }
                    Rectangle {
                        color: "green"
                        height: 100; width: 100

                        MouseArea {
                            anchors.fill: parent
                            onClicked: tabbedPane.sidebarState = SidebarState.VisibleFull
                        }
                    }
                }
            }
        },
        Tab {
            text: "Tab 2"

            Page {
                titleBar: TitleBar {
                    title: qsTr("Tab 2")
                }

                actions: Action {
                    text: "Open tabs"
                    onTriggered: tabbedPane.sidebarState = SidebarState.VisibleFull
                }

                Rectangle {
                    color: "yellow"
                    height: 100; width: 100

                    MouseArea {
                        anchors.fill: parent
                        //onClicked: root.push(page2)
                    }
                }
            }
        },
        Tab {
            description: text + " description"
            text: "Tab 3"

            PageStack {
                id: root

                initialPage: Page {
                    titleBar: TitleBar {
                        title: "Page 1"
                    }

                    actions: [
                        Action {
                            text: "Open tabs"
                            onTriggered: tabbedPane.sidebarState = SidebarState.VisibleFull
                        },
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
                        Component.onDestruction: console.log("page3 destructed")

                        titleBar: TitleBar {
                            title: "Page 3"
                        }
                    }
                }
            }
        },
        Tab {
            text: "Tab 4"

            Page {
                titleBar: TitleBar {
                    title: qsTr("Tab 4")
                }

                actions: Action {
                    text: "Open tabs"
                    onTriggered: tabbedPane.sidebarState = SidebarState.VisibleFull
                }

                Rectangle {
                    color: "yellow"
                    height: 100; width: 100

                    MouseArea {
                        anchors.fill: parent
                        //onClicked: root.push(page2)
                    }
                }
            }
        }
    ]
}
