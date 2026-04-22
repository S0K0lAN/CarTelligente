import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Control {
    id: card
    required property string label
    required property string value
    required property string icon
    property color accent: "#635BFF"

    padding: 16
    implicitHeight: 108
    background: Rectangle {
        radius: 20
        color: "white"
        border.color: "#E7EBF2"
        border.width: 1
    }

    contentItem: ColumnLayout {
        spacing: 10

        RowLayout {
            spacing: 10
            Rectangle {
                width: 36
                height: 36
                radius: 12
                color: accent
                opacity: 0.12
                Text {
                    anchors.centerIn: parent
                    text: icon
                    font.pixelSize: 16
                    color: accent
                }
            }
            Text {
                text: value
                font.pixelSize: 20
                font.bold: true
                color: "#1F2F50"
            }
        }

        Text {
            text: label
            font.pixelSize: 12
            color: "#7E8BA5"
            wrapMode: Text.WordWrap
        }
    }
}
