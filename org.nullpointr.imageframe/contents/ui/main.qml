import QtQuick 2.15
import org.kde.plasma.plasmoid 2.0
import org.kde.plasma.core 2.0 as PlasmaCore

PlasmoidItem {
    id: root
    width: 200
    height: 200

    Plasmoid.backgroundHints: PlasmaCore.Types.NoBackground

    property string imagePath: plasmoid.configuration.imagePath
    property double playbackSpeed: plasmoid.configuration.playbackSpeed
    property bool smooth: plasmoid.configuration.smooth

    layer.enabled: true
    layer.smooth: smooth

    Rectangle {
        anchors.fill: parent
        color: "transparent"

        AnimatedImage {
            id: pic
            anchors.fill: parent
            fillMode: Image.PreserveAspectFit
            source: imagePath !== "" ? imagePath : Qt.resolvedUrl("../images/evernight.gif")
            cache: true
            speed: playbackSpeed / 10
        }

        MouseArea {
            anchors.fill: parent
            drag.target: root
            cursorShape: Qt.OpenHandCursor
        }
    }
}

