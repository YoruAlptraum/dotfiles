pragma Singleton
import QtQuick
import Quickshell
import Quickshell.Io

Singleton {
    id: root
    
    readonly property bool toolTip: true
    readonly property var popupContext: PopupContext {}

    readonly property var fallbackColors: ({            
            "bg1": "#181818",
            "hl1": "#3f425e",
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
