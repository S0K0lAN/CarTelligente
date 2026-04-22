import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Control {
    id: navButton
    property string icon: ""
    property bool isActive: false
    required property string text
    signal clicked()

    padding: 8

    background: Rectangle {
        color: navButton.isActive ? "#EEF2FF" : "transparent"
        radius: 12
    }

    contentItem: ColumnLayout {
        spacing: 4

        Text {
            text: navButton.icon
            font.pixelSize: 18
            color: navButton.isActive ? "#635BFF" : "#8F95A0"
            Layout.alignment: Qt.AlignHCenter
        }

        Text {
            text: navButton.text
            font.pixelSize: 10
            color: navButton.isActive ? "#635BFF" : "#8F95A0"
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            Layout.alignment: Qt.AlignHCenter
        }
    }

    MouseArea {
        anchors.fill: parent
        onClicked: navButton.clicked()
    }
}
