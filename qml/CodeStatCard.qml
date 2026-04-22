import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Control {
    id: card
    required property string count
    required property string label
    property color accent: "#635BFF"

    padding: 16
    implicitHeight: 100
    background: Rectangle {
        radius: 20
        color: "white"
        border.color: "#E7EBF2"
        border.width: 1
    }

    contentItem: ColumnLayout {
        spacing: 10

        Text {
            text: count
            font.pixelSize: 24
            font.bold: true
            color: accent
        }
        Text {
            text: label
            font.pixelSize: 12
            color: "#7E8BA5"
            wrapMode: Text.WordWrap
        }
    }
}
