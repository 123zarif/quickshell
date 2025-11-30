import QtQuick
import QtQuick.Layouts
import Quickshell

Rectangle {
    id: clockContainer

    width: hoverArea.containsMouse ? date.width + time.width + 30 : time.width + 20
    height: parent.height
    color: "#D3D2D2"
    radius: 100
    clip: true

    SystemClock {
        id: clock

        precision: SystemClock.Minutes
    }

    MouseArea {
        id: hoverArea

        anchors.fill: clockContainer
        hoverEnabled: true
    }

    RowLayout {
        anchors.left: parent.left
        anchors.verticalCenter: parent.verticalCenter
        anchors.margins: 10
        spacing: 10

        Text {
            id: time

            Layout.fillWidth: true
            anchors.left: parent.left
            anchors.verticalCenter: parent.verticalCenter
            text: Qt.formatDateTime(clock.date, "hh:mm AP | dddd")
            font.pixelSize: 13
            font.family: "Segoe UI"
            color: "black"
            font.bold: true
        }

        Text {
            id: date

            Layout.fillWidth: true
            anchors.right: parent.right
            anchors.verticalCenter: parent.verticalCenter
            text: Qt.formatDateTime(clock.date, "MMMM dd, yyyy")
            font.pixelSize: 13
            font.family: "Segoe UI"
            color: "black"
            font.bold: true
        }

    }

    Behavior on width {
        NumberAnimation {
            duration: 300
            easing.type: Easing.OutCubic
        }

    }

}
