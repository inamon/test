import QtQuick 2.0

Rectangle {
    id: root
    width: minWidth > caption.contentWidth + captionMargin * 2 ? minWidth : caption.contentWidth + captionMargin * 2
    height: minHeight > caption.contentHeight + captionMargin * 2 ? minHeight : caption.contentHeight + captionMargin * 2
    anchors.margins: margin
    border.width: borderWidth
    border.color: borderColor
    radius: borderRadius
    gradient: Gradient {
        GradientStop {position: 0.0; color: Qt.lighter(backgroundColor) }
        GradientStop {position: 1.0; color: backgroundColor }
    }

    property int minWidth: 80
    property int minHeight: 30
    property int margin: 20
    property int captionMargin: 4
    property alias captionText: caption.text
    property int borderWidth: 2
    property color borderColor: "#bbb"
    property int borderRadius: 2
    property color backgroundColor: "#ddd"
    property color backgroundPressedColor: "#aaa"
    property color backgroundEnteredColor: "#ccc"
    property color backgroundToggledColor: "#ccf"
    property bool isToggleButton: false
    property bool isToggled: false

    signal buttonClicked()

    MouseArea {
        id: mouse
        anchors.fill: root
        hoverEnabled: true
        onReleased: {
            if (root.isToggleButton)
            {
                isToggled = !isToggled
            }
            buttonClicked()
        }

        states: [
            State {
                name: "toggled"
                when: root.isToggleButton && root.isToggled
                PropertyChanges {
                    target: root
                    backgroundColor: backgroundToggledColor
                }
            },
            State {
                name: "pressed"
                when: mouse.pressed
                PropertyChanges {
                    target: root
                    backgroundColor: backgroundPressedColor
                }
            },
            State {
                    name: "entered"
                    when: mouse.containsMouse
                    PropertyChanges {
                        target: root
                        backgroundColor: backgroundEnteredColor
                    }
                }
        ]
    }

    Text {
        id: caption
        anchors.centerIn: root
    }
}
