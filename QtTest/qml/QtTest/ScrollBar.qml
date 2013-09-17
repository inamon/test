import QtQuick 2.0

Rectangle {
    id: root
    width: 20
    height: 20

    border.width: borderWidth
    border.color: borderColor
    color: backgroundColor

    property int value: 0
    property int maxValue: 100
    property bool isHorizontal: false
    property color backgroundColor: "#eee"
    property color borderColor: "#bbb"
    property int borderWidth: 1

    MouseArea {
        id: mouse
        anchors.fill: root
    }
}
