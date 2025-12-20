import QtQuick
import Quickshell
import Quickshell.Io
import QtQuick.Layouts
import "widgets" as Widgets

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
                color: "transparent"
                anchors.centerIn: parent
                anchors {
                    fill: parent
                    margins: 6
                }

                RowLayout {
                    id: centerPiece
                    implicitWidth: timeText.implicitWidth + dateText.implicitWidth + mojiWidget.implicitWidth + 40
                    implicitHeight: root.implicitHeight
                    anchors {
                        centerIn: parent
                    }

                    Rectangle {
                        implicitWidth: 120
                        implicitHeight: centerPiece.implicitHeight
                        color: "transparent"

                        Text {
                            id: timeText
                            color: "#ffffff"
                            text: Time.time
                            anchors.centerIn: parent
                        }
                    }

                    Widgets.Moji {
                        id: mojiWidget
                        color: "transparent"
                        implicitWidth: 100
                        implicitHeight: centerPiece.implicitHeight
                    }

                    Rectangle {
                        implicitWidth: 120
                        implicitHeight: centerPiece.implicitHeight
                        color: "transparent"

                        Text {
                            id: dateText
                            color: "#ffffff"
                            text: Time.date
                            anchors.centerIn: parent
                        }
                    }
                }
            }
        }
    }
}