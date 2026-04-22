import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Control {
    id: root
    property string label: ""
    property string value: ""

    padding: 16
    Layout.fillWidth: true
    implicitHeight: 80
    background: Rectangle {
        radius: 16
        color: "#F8FAFC"
        border.color: "#E7EBF2"
        border.width: 1
    }

    contentItem: ColumnLayout {
        spacing: 4
        Text {
            text: label
            font.pixelSize: 12
            color: "#7E8BA5"
        }
        Text {
            text: value
            font.pixelSize: 16
            font.bold: true
            color: "#1F2F50"
        }
    }
}
