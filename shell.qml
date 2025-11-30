import "./Components"
import QtQuick
import QtQuick.Layouts
import Quickshell

PanelWindow {
    implicitHeight: 40
    color: "transparent"

    anchors {
        top: true
        left: true
        right: true
    }

    RowLayout {
        anchors.fill: parent
        anchors.margins: 5
        spacing: 10

        Time {
            anchors.left: parent.left
        }

    }

}
