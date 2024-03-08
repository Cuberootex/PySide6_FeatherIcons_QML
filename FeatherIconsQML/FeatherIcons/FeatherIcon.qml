import QtQuick 2.0
import QtQuick.Effects

Item {
    id: root
    property color color: "black"
    property string icon: ""
    property real iconSize: 24
    property real strokeWidth: 2

    property bool shadowEnabled: false
    property color shadowColor: "black"
    property real shadowOpacity: 0.6
    property real shadowHorizontalOffset: 2
    property real shadowVerticalOffset: 2
    property real shadowBlur: 0.6
    property real shadowScale: 1

    property bool blurEnabled: false
    property real blur: 0.0
    property int blurMax: 32
    property real blurMultiplier: 1.0


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

        shadowEnabled: root.shadowEnabled
        shadowColor: root.shadowColor
        shadowOpacity: root.shadowOpacity
        shadowScale: root.shadowScale
        shadowHorizontalOffset: root.shadowHorizontalOffset
        shadowVerticalOffset: root.shadowVerticalOffset
        shadowBlur: root.shadowBlur

        blurEnabled: root.blurEnabled
        blur: root.blur
        blurMax: root.blurMax
        blurMultiplier: root.blurMultiplier
    }
}
