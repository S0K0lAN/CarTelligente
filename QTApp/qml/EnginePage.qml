import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Window

Page {
    id: enginePage
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
                radius: 20
                color: "white"
                border.color: "#E7EBF2"
                border.width: 1
                anchors.margins: 0
                anchors.fill: parent

                ColumnLayout {
                    spacing: 12

                    Text {
                        text: "Параметры двигателя"
                        font.pixelSize: 24
                        font.bold: true
                        color: "#1F2F50"
                    }

                    Text {
                        text: dataProvider.engine.carModel
                        font.pixelSize: 14
                        color: "#7E8BA5"
                    }
                }
            }

            GridLayout {
                columns: 2
                columnSpacing: 12
                rowSpacing: 12
                Layout.fillWidth: true

                EngineCard {
                    title: "Температура"
                    subtitle: "Двигатель"
                    value: dataProvider.engine.temperature + "°C"
                    percentage: dataProvider.engine.temperature
                    maxValue: 120
                }

                EngineCard {
                    title: "Уровень масла"
                    subtitle: "Система смазки"
                    value: dataProvider.engine.oilLevel + "%"
                    percentage: dataProvider.engine.oilLevel
                    maxValue: 100
                }

                EngineCard {
                    title: "Обороты"
                    subtitle: "RPM"
                    value: dataProvider.engine.rpm + " об/мин"
                    percentage: dataProvider.engine.rpm / 80
                    maxValue: 100
                }

                EngineCard {
                    title: "Турбонаддув"
                    subtitle: "Давление"
                    value: dataProvider.engine.turboPressure + " bar"
                    percentage: dataProvider.engine.turboPressure * 50
                    maxValue: 100
                }
            }

            Rectangle {
                Layout.fillWidth: true
                radius: 16
                color: "#E8F7EA"
                border.color: "#D3E8D7"
                border.width: 1
                height: 72

                RowLayout {
                    anchors.fill: parent
                    anchors.margins: 16
                    spacing: 12

                    Rectangle {
                        width: 44
                        height: 44
                        radius: 12
                        color: "#50B23C"

                        Text {
                            anchors.centerIn: parent
                            text: "✓"
                            color: "white"
                            font.pixelSize: 20
                        }
                    }

                    ColumnLayout {
                        spacing: 4
                        Text {
                            text: "Все параметры в норме"
                            font.pixelSize: 16
                            font.bold: true
                            color: "#1F2F50"
                        }
                        Text {
                            text: "Система работает стабильно и без ошибок"
                            font.pixelSize: 12
                            color: "#63718D"
                        }
                    }
                }
            }

            Item { Layout.fillHeight: true }
        }
    }
}
