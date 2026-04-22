import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Control {
    id: card
    required property string title
    property string subtitle: ""
    required property string value
    required property real percentage
    required property real maxValue

    width: 180
    padding: 16
    background: Rectangle {
        radius: 20
        color: "white"
        border.color: "#E7EBF2"
        border.width: 1
    }

    contentItem: ColumnLayout {
        spacing: 12

        ColumnLayout {
            spacing: 4
            Text {
                text: card.title
                font.pixelSize: 14
                font.bold: true
                color: "#1F2F50"
            }
            Text {
                text: card.subtitle
                font.pixelSize: 11
                color: "#7E8BA5"
            }
        }

        Text {
            text: card.value
            font.pixelSize: 24
            font.bold: true
            color: "#111827"
        }

        CustomProgressBar {
            Layout.fillWidth: true
            value: Math.min(card.percentage / card.maxValue, 1.0)
            statusColor: {
                const pct = card.percentage / card.maxValue * 100;
                if (pct < 50) return "#4CAF50";
                else if (pct < 80) return "#FFB300";
                else return "#F44336";
            }
        }
    }
}
