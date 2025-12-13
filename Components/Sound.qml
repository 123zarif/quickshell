import QtQuick
import QtQuick.Layouts
import Qt5Compat.GraphicalEffects
import Quickshell
import Quickshell.Services.Pipewire
import QtQuick.Controls

Rectangle {
    id: soundContainer

    Layout.preferredWidth: hoverArea.containsMouse || slider.hovered || slider.pressed ? soundValue.width + slider.width + 30: soundValue.width + 20
    Layout.fillHeight: true

    color: secondary
    radius: 100
    clip: true


    PwObjectTracker {
        objects: [ Pipewire.defaultAudioSink ]
    }

    MouseArea {
        id: hoverArea

        anchors.fill: parent
        hoverEnabled: true

    }

    RowLayout {
        anchors.fill: parent

        anchors.leftMargin: 10
        anchors.rightMargin: 10

        RowLayout {
            id: soundValue

            Layout.fillHeight: true
            spacing: 5

            Rectangle {
                width: 20
                Layout.alignment: Qt.AlignHCenter | Qt.AlignLeft
                color: "transparent"



                Image {
                    id: soundImg
                    width: parent.fill
                    height: 21
                    fillMode: Image.PreserveAspectFit
                    source: "../sound.svg"
                    visible: false
                }

                ColorOverlay {
                    anchors.centerIn: parent
                    width: soundImg.width
                    height: soundImg.height
                    source: soundImg
                    color: primary
                }
            }


            Text {
                id: soundText

                Layout.alignment: Qt.AlignVCenter | Qt.AlignRight
                text: Math.round(Pipewire.defaultAudioSink.audio.volume * 100) + "%"
                font.pixelSize: 13
                font.family: font
                color: primary
                font.bold: true
            }
        }

        Slider {
            id: slider
            Layout.rightMargin: 10
            Layout.leftMargin: 5
            Layout.topMargin: 9
            Layout.bottomMargin: 9
            Layout.fillHeight: true
            Layout.alignment: Qt.AlignVCenter | Qt.AlignHCenter



            Layout.preferredWidth: 250

            hoverEnabled: true

            MouseArea {
                anchors.fill: parent
                cursorShape: Qt.PointingHandCursor
                propagateComposedEvents: true
                onPressed: (mouse) => mouse.accepted = false
            }

            from: 0
            to: 1
            value: Pipewire.defaultAudioSink.audio.volume

            background: Rectangle {
                color: primary
                width: slider.availableWidth
                height: parent.height
                radius: 20
                Rectangle {
                    width: slider.visualPosition * parent.width
                    height: parent.height
                    color: active
                    radius: 100
                }
            }

            handle: Rectangle {
                color: "transparent"
            }



            onValueChanged: {
                Pipewire.defaultAudioSink.audio.volume = value
            }

        }
    }

    Behavior on Layout.preferredWidth {
    NumberAnimation {
        duration: 300
        easing.type: Easing.OutCubic
    }

}

}

