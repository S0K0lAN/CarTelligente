import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Control {
    id: card
    required property string name
    required property string timeAgo
    required property string severity
    required property string icon

    padding: 16
    implicitHeight: 140
    background: Rectangle {
        radius: 20
        color: "white"
        border.color: "#E7EBF2"
        border.width: 1
    }

    property color severityColor: severity === "red" ? "#F97316" : "#F59E0B"
    property color severityLight: severity === "red" ? "#FEF3F2" : "#FFFBEB"

    contentItem: ColumnLayout {
        spacing: 12

        RowLayout {
            Layout.fillWidth: true
            spacing: 14

            Rectangle {
                width: 52
                height: 52
                radius: 16
                color: severityLight
                Text {
                    anchors.centerIn: parent
                    text: icon
                    font.pixelSize: 24
                }
            }

            ColumnLayout {
                Layout.fillWidth: true
                spacing: 6

                Text {
                    text: name
                    font.pixelSize: 16
                    font.bold: true
                    color: "#1F2F50"
                }
                Text {
                    text: timeAgo
                    font.pixelSize: 12
                    color: "#7E8BA5"
                }
            }
        }

        Rectangle {
            Layout.fillWidth: true
            height: 1
            color: "#E7EBF2"
        }

        Text {
            text: "Подробнее →"
            font.pixelSize: 13
            font.bold: true
            color: severityColor
        }
    }
}
