import QtQuick 2.0

Rectangle {
    /// TODO: Use orientation property
    property bool isPortrait: height >= width

    height: Screen.height; width: Screen.width
}
