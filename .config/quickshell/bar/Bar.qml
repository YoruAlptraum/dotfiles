import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import Quickshell
import "widgets" as Widgets
import "widgets/components" as Components
import qs

Scope {
    id: rootScope

    Variants {
        model: Quickshell.screens

        PanelWindow {
            id: root

            required property var modelData
            screen: modelData

            color: "transparent"
            implicitHeight: 22
            margins {
                top: 10      
            }

            anchors {
                top: true
                left: true
                right: true
            }

            Rectangle {
                id: leftPiece
                anchors.left: parent.left
                
                RowLayout {
                    Layout.preferredHeight: root.implicitHeight
                    spacing: 1
                    anchors {
                        left: parent.left
                    }

                    Rectangle {
                        id: tray
                        color: "transparent"
                        Layout.preferredWidth: 150
                        Layout.preferredHeight: parent.Layout.preferredHeight
                        topRightRadius: 10
                        bottomRightRadius: 10

                        Widgets.SysTray {
                            id: sysTray
                            Layout.preferredWidth: 100
                            Layout.preferredHeight: parent.Layout.preferredHeight
                        }
                    }

                }
            }

            Rectangle {
                id: centerPiece
                anchors.centerIn: parent

                RowLayout {
                    Layout.preferredWidth: timeText.implicitWidth + dateText.implicitWidth + mojiWidget.implicitWidth
                    Layout.preferredHeight: root.implicitHeight
                    anchors {
                        centerIn: parent
                    }
                    spacing: 1

                    Rectangle {
                        Layout.preferredWidth: 110
                        Layout.preferredHeight: parent.Layout.preferredHeight
                        color: '#000'
                        topLeftRadius: 10
                        bottomLeftRadius: 10

                        Text {
                            id: timeText
                            color: Globals.colors.hl1
                            font.pixelSize: 13
                            font.bold: true
                            text: Globals.timew
                            anchors {
                                horizontalCenter: parent.horizontalCenter
                                verticalCenter: parent.verticalCenter
                            }
                        }
                    }

                    Widgets.Moji {
                        id: mojiWidget
                        color: "#000"
                        Layout.preferredWidth: 90
                        Layout.preferredHeight: parent.Layout.preferredHeight
                    }

                    Rectangle {
                        Layout.preferredWidth: 110
                        Layout.preferredHeight: parent.Layout.preferredHeight
                        color: "#000"
                        topRightRadius: 10
                        bottomRightRadius: 10

                        Text {                            
                            id: dateText
                            color: Globals.colors.hl1
                            font.pixelSize: 13
                            font.bold: true
                            text: Globals.date
                            anchors {
                                horizontalCenter: parent.horizontalCenter
                                verticalCenter: parent.verticalCenter
                            }
                        }
                    }
                }
            }
            
        }
    }
}