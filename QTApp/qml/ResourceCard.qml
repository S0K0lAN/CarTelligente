import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Rectangle {
    id: card
    required property string name
    required property int percentage
    required property string month
    required property int kmRemaining
    required property string barColor

    radius: 10
    color: "white"
    border.color: "#E0E0E0"
    border.width: 1
    height: 110
    
    implicitHeight: 110

    ColumnLayout {
        anchors.fill: parent
        anchors.margins: 12
        spacing: 10

        RowLayout {
            Layout.fillWidth: true
            spacing: 12

            ColumnLayout {
                Layout.fillWidth: true
                spacing: 4

                Text {
                    text: card.name
                    font.pixelSize: 14
                    font.bold: true
                    color: "#333333"
                }

                Text {
                    text: card.month + " • ~" + card.kmRemaining + " км"
                    font.pixelSize: 12
                    color: "#999999"
                }
            }

            Text {
                text: card.percentage + "%"
                font.pixelSize: 20
                font.bold: true
                color: "#333333"
            }
        }

        CustomProgressBar {
            Layout.fillWidth: true
            value: card.percentage / 100
            from: 0
            to: 1
            statusColor: card.barColor
        }
    }
}
