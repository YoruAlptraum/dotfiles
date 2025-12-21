pragma Singleton
import QtQuick
import Quickshell
import Quickshell.Io

Singleton {
    id: root
    
    readonly property bool toolTip: true
    readonly property var popupContext: PopupContext {}

    readonly property var fallbackColors: ({
            "colors": {
                "color0": "181818",
                "color1": "3f425e",
                "color2": "5d463e",
                "color3": "5a4c73",
                "color4": "906070",
                "color5": "b1948a",
                "color6": "c8c1ad",
                "color7": "c5c5c5",
                "color8": "515151",
                "color9": "3f425e",
                "color10": "5d463e",
                "color11": "5a4c73",
                "color12": "906070",
                "color13": "b1948a",
                "color14": "c8c1ad",
                "color15": "c5c5c5"
            }
        })

    readonly property var colors: colorManager.colorsLoaded ? colorManager.currentColors : fallbackColors

    readonly property string date: {
        Qt.formatDateTime(clock.date, "MMM d yyyy")
    }

    readonly property string time: {
        Qt.formatDateTime(clock.date, "hh:mm, ddd")
    }

    SystemClock {
        id: clock
        precision: SystemClock.Seconds
    }

    QtObject {
        id: colorManager
        property var currentColors: ({})
        property bool colorsLoaded: false

        property FileView colorFile: FileView {
            path: Qt.resolvedUrl("./colors-qs.json")
            preload: true
            watchChanges: true
            onFileChanged: {
                colorManager.reloadColors();
            }
            onLoaded: {
                colorManager.reloadColors();
            }
        }

        function reloadColors() {
            colorFile.reload();
            try {
                if (!colorFile.text()) {
                    return;
                }
                currentColors = JSON.parse(colorFile.text());
                colorsLoaded = true;
            } catch (e) {
                colorsLoaded = false;
            }
        }
    }

    signal colorReloadRequested
    onColorReloadRequested: {
        colorManager.reloadColors();
    }

    function reloadColors() {
        colorManager.reloadColors();
    }

    Component.onCompleted: {
        colorManager.reloadColors();
    }
}
