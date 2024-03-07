import QtQuick 2.0
import QtQuick.Effects

Item {
    id: root
    property string color: "black"
    property string icon: ""
    property real iconSize: 24
    property real strokeWidth: 2

    width: iconSize
    height: iconSize

    Image {
        id: iconImage
        fillMode: Image.PreserveAspectFit
        anchors.fill: parent
        source: FeatherIconsVault.getSource(root.icon, root.strokeWidth)
        sourceSize.width: root.iconSize
        visible: false
    }

    MultiEffect {
        id: multiEffect
        source: iconImage
        anchors.fill: iconImage
        colorization: 1
        colorizationColor: root.color
    }
}
