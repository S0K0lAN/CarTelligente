import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Page {
    id: anomaliesPage
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

            Rectangle {
                Layout.fillWidth: true
                radius: 24
                color: "#6C5CE7"
                anchors.margins: 18

                ColumnLayout {
                    spacing: 10
                    RowLayout {
                        spacing: 10
                        Text {
                            text: "🤖"
                            font.pixelSize: 24
                        }
                        ColumnLayout {
                            spacing: 6
                            Text {
                                text: "Система мониторинга 24/7"
                                font.pixelSize: 16
                                font.bold: true
                                color: "white"
                            }
                            Text {
                                text: "Обнаружено 3 аномалии"
                                font.pixelSize: 13
                                color: "#E8E3FF"
                            }
                        }
                    }
                }
            }

            RowLayout {
                Layout.fillWidth: true
                spacing: 12
                AnomalyStatCard { Layout.fillWidth: true; label: "Проверки"; value: "156"; icon: "🔎"; accent: "#2563EB" }
                AnomalyStatCard { Layout.fillWidth: true; label: "Аномалии"; value: "3"; icon: "⚠️"; accent: "#F97316" }
                AnomalyStatCard { Layout.fillWidth: true; label: "Мониторинг"; value: "24/7"; icon: "📡"; accent: "#7C3AED" }
            }

            Text {
                text: "Обнаруженные аномалии"
                font.pixelSize: 16
                font.bold: true
                color: "#1F2F50"
            }

            AnomalyCard {
                Layout.fillWidth: true
                name: "Необычный расход топлива"
                timeAgo: "2 часа назад"
                severity: "yellow"
                icon: "⛽"
            }
            AnomalyCard {
                Layout.fillWidth: true
                name: "Вибрация двигателя"
                timeAgo: "5 часов назад"
                severity: "red"
                icon: "📳"
            }
            AnomalyCard {
                Layout.fillWidth: true
                name: "Изменение звука двигателя"
                timeAgo: "1 день назад"
                severity: "yellow"
                icon: "🔊"
            }

            Item { Layout.fillHeight: true }
        }
    }
}
