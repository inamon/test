import QtQuick 2.0

Rectangle {
    width: 360
    height: 360


        ScrollBar {
                anchors.top: parent.top
                anchors.right: parent.right
                anchors.bottom: parent.bottom
                anchors.margins: 2
        }


    Row
    {
        anchors.centerIn: parent
        spacing: 4

        Column {
            Button {
                isToggleButton: true
                captionText: "OK"
            }
        }

        Column {
            Button {
                captionText: "Cancel"
                onButtonClicked: Qt.quit()
            }
        }
    }
}
