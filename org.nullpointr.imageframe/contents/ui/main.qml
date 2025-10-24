import QtQuick 2.15
import org.kde.plasma.plasmoid 2.0
import org.kde.plasma.core 2.0 as PlasmaCore

PlasmoidItem {
    id: root
    width: 200
    height: 200

    Plasmoid.backgroundHints: PlasmaCore.Types.NoBackground

    layer.enabled: true
    layer.smooth: true

    property string imagePath: plasmoid.configuration.imagePath

    Rectangle {
        anchors.fill: parent
        color: "transparent"

        AnimatedImage {
            id: pic
            anchors.fill: parent
            fillMode: Image.PreserveAspectFit
            source: imagePath !== "" ? imagePath : Qt.resolvedUrl("../images/evernight.gif")
            cache: true
            smooth: true
        }

        MouseArea {
            anchors.fill: parent
            drag.target: root
            cursorShape: Qt.OpenHandCursor
        }
    }
}

