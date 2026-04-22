import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Control {
    id: card
    required property string title
    required property string value
    required property string icon

    padding: 16
    implicitHeight: 108
    background: Rectangle {
        radius: 20
        color: "white"
        border.color: "#E7EBF2"
        border.width: 1
    }

    contentItem: ColumnLayout {
        spacing: 12

        RowLayout {
            spacing: 10
            Rectangle {
                width: 36
                height: 36
                radius: 12
                color: "#EEF3FF"
                Text {
                    anchors.centerIn: parent
                    text: card.icon
                    font.pixelSize: 16
                }
            }
            ColumnLayout {
                spacing: 4
                Text {
                    text: card.title
                    font.pixelSize: 12
                    color: "#7E8BA5"
                }
                Text {
                    text: card.value
                    font.pixelSize: 18
                    font.bold: true
                    color: "#1F2F50"
                }
            }
        }
    }
}
