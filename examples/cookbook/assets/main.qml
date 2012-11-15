import QtQuick 2.0
import QtQuick.XmlListModel 2.0

import QuickCascades 1.0

import "common"

Window {
    id: appWindow

    NavigationPane {
        id: navPane

        anchors.fill: parent

        pages: [
            Page {
                BorderImage {
                    anchors.fill: parent
                    source: "images/Book_background.png"
                    border.top: 15
                    border.bottom: 15
                }

                ListView {
                    anchors {
                        fill: parent
                        topMargin: 15; bottomMargin: 15
                    }

                    clip: true
                    snapMode: ListView.SnapToItem

                    model: XmlListModel {
                        id: recipeModel
                        source: "models/recipemodel.xml"
                        query: "/root/recipeitem"

                        XmlRole { name: "title"; query: "@title/string()" }
                        XmlRole { name: "image"; query: "@image/string()" }
                        XmlRole { name: "file"; query: "@file/string()" }
                    }

                    delegate: RecipeItem {
                        image: "assets/" + model.image
                        title: model.title

                        onClicked: navPane.push(pageIntroduction)
                    }
                }
            },
            Page {
                id: pageIntroduction
                titleBar: TitleBar {
                    title: "Test"
                }

                Rectangle {
                    anchors.centerIn: parent
                    color: "green"
                    height: 100; width: 100

                    MouseArea {
                        anchors.fill: parent
                        onClicked: navPane.pop()
                    }
                }
            }
        ]
    }
}
