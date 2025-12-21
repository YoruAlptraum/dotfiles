import QtQuick
import Quickshell.Widgets
import QtQuick.Layouts
import QtQuick.Controls
import Quickshell
import "components" as Components
import qs

Rectangle {
    id: root
    anchors {
        horizontalCenter: parent.horizontalCenter
    }

    color: "transparent"

    property int index: 0
    property int interval: 1000
    property var symbols: ["^◕  ‿  ◕^", "^◑  ‿  ◑^", "^◒  ‿  ◒^", "^◔  ‿  ◔^", "^◓  ‿  ◓^", "^◐  ‿  ◐^", "^◠  ‿  ◠^"]

    Timer {
        interval: root.interval
        running: true
        repeat: true
        onTriggered: {
            root.index = (root.index + 1) % root.symbols.length;
            label.text = root.symbols[root.index];
        }
    }

    Item {
        width: label.implicitWidth + 5
        height: label.implicitHeight + 5
        anchors.centerIn: parent

        Rectangle {
            id: hoverBackground
            anchors.fill: parent
            color: mouseAreaButton.containsMouse ? "#11c1c1c1" : "transparent"
            radius: 6
            Behavior on color {
                ColorAnimation {
                    duration: 150
                }
            }
        }

        Text {
            id: label
            text: root.symbols[root.index]

            font.pixelSize: 14
            color: Globals.colors.hl1
            anchors.centerIn: parent
        }

        MouseArea {
            id: mouseAreaButton
            anchors.fill: parent
            hoverEnabled: true
        }
    }

    Components.BarTooltip {
        relativeItem: mouseAreaButton.containsMouse ? hoverBackground : null
        offset: 3

        Label {
            font.hintingPreference: Font.PreferFullHinting
            font.pixelSize: 11
            color: Globals.colors.hl1
            text: "Carpe Diem"
        }
    }
}