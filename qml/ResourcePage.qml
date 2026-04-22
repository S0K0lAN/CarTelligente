import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Page {
    id: resourcePage
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
                    text: "Прогнозирование ресурса"
                    font.pixelSize: 24
                    font.bold: true
                    color: "#1F2F50"
                }
                Text {
                    text: "Оценка срока службы ключевых компонентов"
                    font.pixelSize: 13
                    color: "#7E8BA5"
                }
            }

            Rectangle {
                Layout.fillWidth: true
                radius: 20
                color: "white"
                border.color: "#E7EBF2"
                border.width: 1

                ColumnLayout {
                    anchors.fill: parent
                    anchors.margins: 16
                    spacing: 12
                    Text {
                        text: "Текущий пробег"
                        font.pixelSize: 12
                        color: "#7E8BA5"
                    }
                    Text {
                        text: "85 230 км"
                        font.pixelSize: 28
                        font.bold: true
                        color: "#1F2F50"
                    }
                }
            }

            Rectangle {
                Layout.fillWidth: true
                radius: 20
                color: "#6C5CE7"

                ColumnLayout {
                    anchors.fill: parent
                    anchors.margins: 18
                    spacing: 10
                    Text {
                        text: "Следующее обслуживание"
                        font.pixelSize: 14
                        color: "#F4EEFF"
                        opacity: 0.9
                    }
                    Text {
                        text: "4 000 км"
                        font.pixelSize: 34
                        font.bold: true
                        color: "white"
                    }
                    Text {
                        text: "Замена свечей зажигания"
                        font.pixelSize: 13
                        color: "#E7E0FF"
                        wrapMode: Text.WordWrap
                    }
                }
            }

            Text {
                text: "Компоненты"
                font.pixelSize: 16
                font.bold: true
                color: "#1F2F50"
            }

            ResourceCard {
                Layout.fillWidth: true
                name: "Тормозные колодки"
                percentage: 65
                month: "сентябрь 2026"
                kmRemaining: 8500
                barColor: "#FFB300"
            }
            ResourceCard {
                Layout.fillWidth: true
                name: "Масляный фильтр"
                percentage: 45
                month: "июль 2026"
                kmRemaining: 5500
                barColor: "#4CAF50"
            }
            ResourceCard {
                Layout.fillWidth: true
                name: "Воздушный фильтр"
                percentage: 30
                month: "декабрь 2026"
                kmRemaining: 14000
                barColor: "#4CAF50"
            }
            ResourceCard {
                Layout.fillWidth: true
                name: "Свечи зажигания"
                percentage: 80
                month: "май 2026"
                kmRemaining: 4000
                barColor: "#F44336"
            }

            Rectangle {
                Layout.fillWidth: true
                radius: 20
                color: "#EEF4FF"
                border.color: "#D7E3FF"
                border.width: 1

                ColumnLayout {
                    anchors.fill: parent
                    anchors.margins: 16
                    spacing: 8
                    Text {
                        text: "Информация"
                        font.pixelSize: 14
                        font.bold: true
                        color: "#1F2F50"
                    }
                    Text {
                        text: "Прогнозы основаны на стиле вождения и реальном пробеге вашего автомобиля."
                        font.pixelSize: 12
                        color: "#64748B"
                        wrapMode: Text.WordWrap
                    }
                }
            }

            Item { Layout.fillHeight: true }
        }
    }
}
