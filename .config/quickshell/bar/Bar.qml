import QtQuick
import Quickshell
import Quickshell.Io
import QtQuick.Layouts
import "widgets" as Widgets
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
                id: bar
                anchors.centerIn: parent

                RowLayout {
                    id: centerPiece
                    Layout.preferredWidth: timeText.implicitWidth + dateText.implicitWidth + mojiWidget.implicitWidth
                    Layout.preferredHeight: root.implicitHeight
                    anchors {
                        centerIn: parent
                    }
                    spacing: 1

                    Rectangle {
                        Layout.preferredWidth: 110
                        Layout.preferredHeight: centerPiece.Layout.preferredHeight
                        color: '#000000'
                        topLeftRadius: 10
                        bottomLeftRadius: 10

                        Text {
                            id: timeText
                            color: Globals.colors.hl1
                            font.pixelSize: 13
                            font.bold: true
                            text: Globals.time
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
                        Layout.preferredHeight: centerPiece.Layout.preferredHeight
                    }

                    Rectangle {
                        Layout.preferredWidth: 110
                        Layout.preferredHeight: centerPiece.Layout.preferredHeight
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