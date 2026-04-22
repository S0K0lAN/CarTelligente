import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Page {
    id: batteryPage
    background: Rectangle {
        color: "#F4F7FF"
    }

    property bool recommendationsOpen: true

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
                    text: "Состояние АКБ"
                    font.pixelSize: 24
                    font.bold: true
                    color: "#1F2F50"
                }
                Text {
                    text: "Текущие параметры зарядного модуля"
                    font.pixelSize: 13
                    color: "#7E8BA5"
                }
            }

            Rectangle {
                Layout.fillWidth: true
                radius: 20
                color: "#2F54EB"
                border.color: "#D6E4FF"
                border.width: 1

                ColumnLayout {
                    anchors.fill: parent
                    anchors.margins: 20
                    spacing: 16

                    RowLayout {
                        spacing: 16
                        Text {
                            text: "🔋"
                            font.pixelSize: 52
                        }
                        ColumnLayout {
                            spacing: 4
                            Text {
                                text: "Уровень заряда"
                                color: "#E8EBFF"
                                font.pixelSize: 14
                            }
                            Text {
                                text: dataProvider.battery.chargeLevel + "%"
                                color: "white"
                                font.pixelSize: 44
                                font.bold: true
                            }
                        }
                    }

                    CustomProgressBar {
                        Layout.fillWidth: true
                        value: dataProvider.battery.chargeLevel / 100
                        statusColor: dataProvider.battery.chargeLevel > 70 ? "#4CAF50" : "#FFB300"
                    }
                }
            }

            RowLayout {
                Layout.fillWidth: true
                spacing: 12
                BatterySmallCard {
                    Layout.fillWidth: true
                    title: "Напряжение"
                    value: dataProvider.battery.voltage + " V"
                    icon: "⚡"
                }
                BatterySmallCard {
                    Layout.fillWidth: true
                    title: "Здоровье"
                    value: dataProvider.battery.health + "%"
                    icon: "❤️"
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
                    anchors.margins: 20
                    spacing: 16
                    Text {
                        text: "Подробная информация"
                        font.pixelSize: 16
                        font.bold: true
                        color: "#1F2F50"
                    }

                    RowLayout {
                        Layout.fillWidth: true
                        spacing: 12

                        BatteryDetailItem {
                            label: "Ёмкость"
                            value: dataProvider.battery.capacity + " Ah"
                        }
                        BatteryDetailItem {
                            label: "Температура"
                            value: dataProvider.battery.temperature + "°C"
                        }
                    }
                    RowLayout {
                        Layout.fillWidth: true
                        spacing: 12
                        BatteryDetailItem {
                            label: "Состояние"
                            value: dataProvider.battery.health + "%"
                        }
                    }
                }
            }

            Rectangle {
                Layout.fillWidth: true
                radius: 20
                color: "#F7F4FF"
                border.color: "#E9D8FF"
                border.width: 1

                ColumnLayout {
                    anchors.fill: parent
                    anchors.margins: 16
                    spacing: 12

                    RowLayout {
                        Layout.fillWidth: true
                        spacing: 12
                        Text {
                            text: "Рекомендации"
                            font.pixelSize: 16
                            font.bold: true
                            color: "#1F2F50"
                        }
                        Item { Layout.fillWidth: true }
                        Button {
                            text: recommendationsOpen ? "Скрыть" : "Показать"
                            font.pixelSize: 12
                            background: Rectangle {
                                color: "transparent"
                            }
                            onClicked: recommendationsOpen = !recommendationsOpen
                        }
                    }

                    ColumnLayout {
                        visible: recommendationsOpen
                        spacing: 10
                        Text {
                            text: "Проверяйте контакты, не допускайте глубоких разрядов и держите температуру аккумулятора в норме."
                            font.pixelSize: 13
                            color: "#64748B"
                            wrapMode: Text.WordWrap
                        }
                    }
                }
            }

            Item { Layout.fillHeight: true }
        }
    }
}
