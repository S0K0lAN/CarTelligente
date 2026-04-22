import QtQuick
import QtQuick.Controls
import QtQuick.Controls.Material
import QtQuick.Layouts

ApplicationWindow {
    id: root
    width: 400
    height: 700
    visible: true
    title: "Диагностика автомобиля"
    color: "#F4F7FF"

    Material.theme: Material.Light
    Material.primary: "#635BFF"
    Material.accent: "#635BFF"
    Material.elevation: 4

    StackView {
        id: stackView
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: bottomNav.top
        initialItem: enginePage

        EnginePage { id: enginePage }
        BatteryPage { id: batteryPage }
        ResourcePage { id: resourcePage }
        CodesPage { id: codesPage }
        AnomaliesPage { id: anomaliesPage }
    }

    Rectangle {
        id: bottomNav
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        height: 72
        color: "#FFFFFF"
        border.color: "#E7EBF2"
        border.width: 1
        radius: 0

        RowLayout {
            anchors.fill: parent
            anchors.margins: 0
            spacing: 0

            NavButton {
                text: "Двигатель"
                icon: "⚙️"
                Layout.fillWidth: true
                isActive: stackView.currentItem === enginePage
                onClicked: stackView.replace(enginePage)
            }
            NavButton {
                text: "АКБ"
                icon: "🔋"
                Layout.fillWidth: true
                isActive: stackView.currentItem === batteryPage
                onClicked: stackView.replace(batteryPage)
            }
            NavButton {
                text: "Ресурс"
                icon: "📈"
                Layout.fillWidth: true
                isActive: stackView.currentItem === resourcePage
                onClicked: stackView.replace(resourcePage)
            }
            NavButton {
                text: "Коды"
                icon: "🧾"
                Layout.fillWidth: true
                isActive: stackView.currentItem === codesPage
                onClicked: stackView.replace(codesPage)
            }
            NavButton {
                text: "Аномалии"
                icon: "⚠️"
                Layout.fillWidth: true
                isActive: stackView.currentItem === anomaliesPage
                onClicked: stackView.replace(anomaliesPage)
            }
        }
    }
}
