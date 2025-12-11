import "./Components"
import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Quickshell
import Quickshell.Hyprland

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
        }

        RowLayout {
            Layout.fillWidth: true
            Layout.fillHeight: true
            spacing: 2

            Repeater {
                model: 10

                Rectangle {
                    property bool focused: modelData + 1 === Hyprland.focusedWorkspace.id ? true : false

                    color: workspaceMouseArea.containsMouse ? "#373737" : "transparent"
                    Layout.fillHeight: true
                    Layout.preferredWidth: focused ? 130 : (modelData === Hyprland.focusedWorkspace.id - 2 || modelData === Hyprland.focusedWorkspace.id) ? 60 : 10
                    clip: true

                    Rectangle {
                        anchors.bottom: parent.bottom
                        anchors.horizontalCenter: parent.horizontalCenter
                        radius: 60
                        height: 4
                        width: parent.width
                        color: focused || workspaceMouseArea.containsMouse ? "#fff" : "#5E5E67"
                        anchors.bottomMargin: focused ? 3 : 0
                    }

                    MouseArea {
                        id: workspaceMouseArea

                        anchors.fill: parent
                        hoverEnabled: true
                        onClicked: {
                            modelData + 1 !== Hyprland.focusedWorkspace.id && (Hyprland.dispatch(`workspace ${modelData + 1}`));
                        }
                    }

                    Behavior on Layout.preferredWidth {
                        NumberAnimation {
                            duration: 300
                            easing.type: Easing.OutCubic
                        }

                    }

                }

            }

        }

        Rectangle {
            Layout.fillWidth: true
            color: "transparent"
        }

    }

}
