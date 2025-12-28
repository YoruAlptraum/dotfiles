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
            "hl0": '#ffcfb1',
            "hl1": '#9ad3ff'
    })

    // date
    readonly property string date: {
        Qt.formatDateTime(clock.date, "MMM d yyyy")
    }

    // time detailed (with seconds)
    readonly property string timed: {
        Qt.formatDateTime(clock.date, "hh:mm:ss")
    }

    // time simplified with weekday
    readonly property string timew: {
        Qt.formatDateTime(clock.date, "hh:mm, ddd")
    }

    SystemClock {
        id: clock
        precision: SystemClock.Seconds
    }
}
