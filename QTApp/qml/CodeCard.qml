import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Control {
    id: card
    required property string code
    required property string date
    required property string description
    required property bool isActive

    padding: 16
    implicitHeight: 140
    background: Rectangle {
        radius: 20
        color: "white"
        border.color: "#E7EBF2"
        border.width: 1
    }

    contentItem: ColumnLayout {
        spacing: 12

        RowLayout {
            Layout.fillWidth: true
            spacing: 16

            Rectangle {
                width: 44
                height: 44
                radius: 14
                color: card.isActive ? "#FFF1F0" : "#ECFDF5"
                Text {
                    anchors.centerIn: parent
                    text: card.isActive ? "⚠️" : "✓"
                    font.pixelSize: 22
                }
            }

            ColumnLayout {
                Layout.fillWidth: true
                spacing: 4

                RowLayout {
                    Layout.fillWidth: true
                    spacing: 10
                    Text {
                        text: card.code
                        font.pixelSize: 18
                        font.bold: true
                        color: "#1F2F50"
                    }
                    Control {
                        padding: 6
                        leftPadding: 12
                        rightPadding: 12
                        background: Rectangle {
                            radius: 12
                            color: card.isActive ? "#FFF1F0" : "#ECFDF5"
                        }

                        contentItem: Text {
                            text: card.isActive ? "Активен" : "Решён"
                            font.pixelSize: 12
                            color: card.isActive ? "#D4232C" : "#2F855A"
                            font.bold: true
                        }
                    }
                }

                Text {
                    text: card.date
                    font.pixelSize: 12
                    color: "#7E8BA5"
                }
                Text {
                    text: card.description
                    font.pixelSize: 13
                    color: "#4B5563"
                    wrapMode: Text.WordWrap
                }
            }
        }
    }
}
