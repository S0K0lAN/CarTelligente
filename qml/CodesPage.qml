import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Page {
    id: codesPage
    background: Rectangle {
        color: "#F4F7FF"
    }

    ScrollView {
        anchors.fill: parent
        contentWidth: availableWidth

        ColumnLayout {
            width: parent.width
            spacing: 20
            Layout.leftMargin: 16
            Layout.rightMargin: 16
            Layout.topMargin: 16
            Layout.bottomMargin: 16

            ColumnLayout {
                spacing: 6
                Text {
                    text: "Диагностические коды"
                    font.pixelSize: 24
                    font.bold: true
                    color: "#1F2F50"
                }
                Text {
                    text: "Анализ ошибок системы и их статус"
                    font.pixelSize: 13
                    color: "#7E8BA5"
                }
            }

            RowLayout {
                Layout.fillWidth: true
                spacing: 12
                CodeStatCard { Layout.fillWidth: true; count: "2"; label: "Активные"; accent: "#F97316" }
                CodeStatCard { Layout.fillWidth: true; count: "1"; label: "Решённые"; accent: "#22C55E" }
            }

            Text {
                text: "Активные коды"
                font.pixelSize: 16
                font.bold: true
                color: "#1F2F50"
            }
            CodeCard {
                Layout.fillWidth: true
                code: "P0171"
                date: "2 апреля 2026"
                description: "Слишком бедная топливная смесь (банк 1)"
                isActive: true
            }
            CodeCard {
                Layout.fillWidth: true
                code: "P0420"
                date: "28 марта 2026"
                description: "Низкая эффективность катализатора"
                isActive: true
            }

            Text {
                text: "Решённые коды"
                font.pixelSize: 16
                font.bold: true
                color: "#1F2F50"
            }
            CodeCard {
                Layout.fillWidth: true
                code: "P0128"
                date: "15 марта 2026"
                description: "Температура охлаждающей жидкости ниже нормы"
                isActive: false
            }

            Button {
                Layout.fillWidth: true
                height: 52
                text: "Очистить решённые коды"
                background: Rectangle {
                    anchors.fill: parent
                    radius: 16
                    color: "#EF4444"
                }
                contentItem: Text {
                    text: parent.text
                    color: "white"
                    font.pixelSize: 14
                    font.bold: true
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }
                onClicked: console.log("Решённые коды очищены")
            }

            Item { Layout.fillHeight: true }
        }
    }
}
