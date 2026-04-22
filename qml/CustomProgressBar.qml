import QtQuick
import QtQuick.Controls

ProgressBar {
    id: progressBar
    property color statusColor: "#4CAF50"
    implicitHeight: 10

    background: Rectangle {
        radius: 6
        color: "#E7EBF2"
        implicitHeight: 10
    }

    contentItem: Item {
        Rectangle {
            width: progressBar.visualPosition * parent.width
            height: parent.height
            radius: 6
            color: progressBar.statusColor
        }
    }
}
