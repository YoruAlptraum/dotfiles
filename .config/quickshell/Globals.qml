pragma Singleton
import QtQuick
import Quickshell
import Quickshell.Io

Singleton {
    id: root
    
    readonly property bool toolTip: true
    readonly property var popupContext: PopupContext {}

    readonly property var colors: ({            
            "bg1": "#15171a",
            "hl0": "#7fc8ff",
            "hl1": '#ffcfb1'
        })

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

}
