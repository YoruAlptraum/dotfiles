import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Quickshell
import Quickshell.Services.SystemTray
import Quickshell.Widgets
import "components" as Components
import qs

Rectangle {
    id: sysTrayRoot
    anchors.fill: parent
    color: "transparent"
    property bool trayExpanded: false

    implicitWidth: (trayExpanded ? contentLayout.implicitWidth + 5 : toggleBtn.width)

    QsMenuOpener {
        id: menuOpener
        property SystemTrayItem currentItem: null
        menu: currentItem ? currentItem.menu : null
    }

    RowLayout {
        id: contentLayout
        anchors.fill: parent
        spacing: 2
        layoutDirection: Qt.LeftToRight

        Rectangle {
            id: toggleBtn
            Layout.preferredWidth: 20
            Layout.preferredHeight: parent.height - 14
            Layout.bottomMargin: 3
            color: toggleBtnMouseArea.containsMouse ? "#11c1c1c1" : "transparent"
            radius: 5

            MouseArea {
                id: toggleBtnMouseArea
                anchors.fill: parent
                hoverEnabled: true
                cursorShape: Qt.PointingHandCursor
                onClicked: {
                    sysTray.trayExpanded = !sysTray.trayExpanded;
                }
            }

            Text {
                id: arrowIcon
                anchors.centerIn: parent
                text: "▶"
                color: Globals.colors.hl1
                font.pixelSize: 8
                rotation: sysTray.trayExpanded ? 180 : 0
            }

            Components.BarTooltip {
                relativeItem: toggleBtnMouseArea.containsMouse ? toggleBtn : null
                offset: 6

                Label {
                    font.pixelSize: 11
                    color: "white"
                    text: sysTray.trayExpanded ? "Hide System Tray" : "Show System Tray"
                }
            }
        }

        Item {
            id: trayItemsContainer
            clip: true
            Layout.preferredHeight: parent.height
            Layout.preferredWidth: trayMask.width
            Layout.minimumWidth: 1
            Layout.minimumHeight: 20

            Item {
                id: trayMask
                width: sysTray.trayExpanded ? trayRow.implicitWidth + 10 : 2
                height: parent.height

                Behavior on width {
                    NumberAnimation {
                        duration: 250
                        easing.type: Easing.OutCubic
                    }
                }

                Row {
                    id: trayRow
                    anchors.fill: parent
                    height: 24
                    spacing: 7

                    Repeater {
                        id: trayRepeater
                        model: SystemTray.items

                        MouseArea {
                            id: delegate
                            required property SystemTrayItem modelData
                            property alias item: delegate.modelData
                            width: icon.implicitWidth + 12
                            height: parent.height - 8
                            anchors.top: parent.top
                            anchors.topMargin: 3
                            enabled: sysTray.trayExpanded

                            cursorShape: Qt.PointingHandCursor
                            hoverEnabled: true

                            onClicked: {
                                menuOpener.currentItem = item;
                                trayPopup.currentAnchorItem = delegate;
                                trayPopup.show();
                                trayPopup.anchor.updateAnchor();
                                grab.active = true;
                            }
                            
                            Rectangle {
                                id: hoverBackground
                                anchors.fill: parent
                                color: delegate.containsMouse ? "#11c1c1c1" : "transparent"
                                radius: 5

                                Behavior on color {
                                    ColorAnimation {
                                        duration: 150
                                    }
                                }
                            }

                            IconImage {
                                id: icon
                                anchors.centerIn: parent
                                source: Qt.resolvedUrl(item.icon)
                                implicitSize: 16
                            }
                        }
                    }
                }
            }
        }
    }
}