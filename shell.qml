import "./Components"
import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Wayland


PanelWindow {
    property font font: "Helvetica"
    property color primary: "#221E1E"
    property color secondary: "#D3D2D2"
    property color light: "#5E5E67"
    property color active: '#55df46'



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

        Rectangle {
            Layout.fillHeight: true
            Layout.fillWidth: true
            color: "transparent"

            RowLayout {
                anchors.fill: parent
                Time {
                }
            }



        }

        Workspaces { }

        Rectangle {
            Layout.fillWidth: true
            Layout.fillHeight: true

            color: "transparent"

            RowLayout {
                anchors.right: parent.right
                height: parent.height
                width: children.width


                Sound { }
            }
        }

    }

}
