import QtQuick 2.0
import Sailfish.Silica 1.0

GlassItem {
    id: button
    width: 120
    height: 120
    cache: false
    color: "green"
    falloffRadius: 0.2
    radius:greenArea.pressed ? 1 : 0.1
    signal clicked()
    Behavior on radius {
        NumberAnimation {
            duration : 200

        }
    }

    MouseArea {
        id:greenArea
        anchors.fill: parent
        onClicked: button.clicked()
    }
}
