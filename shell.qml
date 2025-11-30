import QtQuick
import QtQuick.Layouts
import Quickshell

PanelWindow {
    implicitHeight: 30
    color: "transparent"

    anchors {
        top: true
        left: true
        right: true
    }

    SystemClock {
        id: clock

        precision: SystemClock.Minutes
    }

    MouseArea {
        id: hoverArea

        anchors.fill: parent
        hoverEnabled: true
    }

    Rectangle {
        // width: childrenRect.width + 20
        width: hoverArea.containsMouse ? date.width + time.width : time.width
        height: parent.height
        color: "#D3D2D2"
        radius: 100
        clip: true

        RowLayout {
            anchors.left: parent.left
            anchors.verticalCenter: parent.verticalCenter
            anchors.margins: 0
            spacing: 0

            Text {
                id: time

                anchors.left: parent.left
                anchors.verticalCenter: parent.verticalCenter
                anchors.margins: 10
                text: Qt.formatDateTime(clock.date, "hh:mm AP | dddd ")
                font.pixelSize: 13
                font.family: "Segoe UI"
                color: "black"
                font.bold: true
            }

            Text {
                id: date

                anchors.left: parent.left
                anchors.verticalCenter: parent.verticalCenter
                anchors.margins: 10
                text: Qt.formatDateTime(clock.date, "hh:mm AP | dddd")
                font.pixelSize: 13
                font.family: "Segoe UI"
                color: "black"
                font.bold: true
            }

        }

    }

}
