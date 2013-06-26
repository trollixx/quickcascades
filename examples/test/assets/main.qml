import QtQuick 2.1
import QtGraphicalEffects 1.0
import QuickCascades 1.0

ApplicationWindow {
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
                        visibility: ChromeVisibility.Overlay
                    }

                    actions: Action {
                        text: "VKB Info"
                        onTriggered: console.log(Qt.inputMethod.keyboardRectangle)
                    }

                    TextField {
                        anchors.centerIn: parent
                    }

                    Rectangle {
                        color: "yellow"
                        height: 100; width: 100

                        MouseArea {
                            anchors.fill: parent
                        }
                    }
                }
            },
            Tab {
                text: "PageStack"

                PageStack {
                    id: root

                    initialPage: Page {
                        titleBar: TitleBar {
                            title: "Page 1"
                        }

                        toolBarVisibility: ChromeVisibility.Overlay

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
                    id: page4

                    Component.onCompleted: timer.start()

                    actions: Action {
                        text: "Open tabs"
                        onTriggered: tabbedPane.sidebarState = SidebarState.VisibleFull
                    }
                    titleBar: TitleBar {
                        title: qsTr("Tab 4")
                        visibility: ChromeVisibility.Overlay
                    }
                    toolBarVisibility: ChromeVisibility.Overlay

                    Rectangle {
                        id: rect
                        anchors.centerIn: parent
                        antialiasing: true
                        radius: 20
                        //smooth: true
                        color: "yellow"
                        height: 100; width: 100
                        layer.enabled: true

                        MouseArea {
                            anchors.fill: parent
                            onClicked: {
                                page4.toolBarVisibility = (page4.toolBarVisibility === ChromeVisibility.Hidden ? ChromeVisibility.Overlay : ChromeVisibility.Hidden)
                                page4.titleBar.visibility = (page4.titleBar.visibility === ChromeVisibility.Hidden ? ChromeVisibility.Overlay : ChromeVisibility.Hidden)
                            }
                        }
                    }

                    DropShadow {
                        anchors.fill: rect
                        //fast: true
                        horizontalOffset: 10
                        verticalOffset: 10
                        radius: 20
                        samples: 16
                        color: "black"
                        source: rect
                        antialiasing: true
                        transparentBorder: true
                    }

                    Timer {
                        id: timer
                        interval: 3300
                        onTriggered: {
                            page4.toolBar.visibility = ChromeVisibility.Hidden
                            page4.titleBar.visibility = ChromeVisibility.Hidden
                        }
                    }
                }
            }
        ]
    }
}
