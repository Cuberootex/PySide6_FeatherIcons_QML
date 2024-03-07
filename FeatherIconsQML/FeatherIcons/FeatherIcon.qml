import QtQuick 2.0
import QtQuick.Effects

Item {
    id: root
    property string color: "black"
    property string icon: ""
    property real iconSize: 24
    property real strokeWidth: 2
    readonly property string svgPath: "file:///" + featherIconsModuleDir + "/feather/"

    function getPath(iconName, strokeWidth) {
        const validStrokeWidths = [0.5, 1, 1.5, 2, 2.5, 3];
        if (validStrokeWidths.indexOf(strokeWidth) === -1) {
            throw new Error(`Invalid stroke width for icon ${iconName}: ${strokeWidth}`);
        }
        let folder = `stroke_width_${strokeWidth.toFixed(1)}/`;
        return svgPath + folder + iconName + ".svg";
    }

width: iconSize
height: iconSize

    Image {
        id: iconImage
        fillMode: Image.PreserveAspectFit
        anchors.fill: parent
        source: getPath(root.icon, root.strokeWidth)
        sourceSize.width: root.iconSize
        visible: false
    }

    // Rectangle {
    //     id: iconRect
    //     anchors.fill: parent
    //     color: "transparent"
    //     border.color: root.color
    //     border.width: root.strokeWidth
    //     visible: true
    // }

    MultiEffect {
        id: multiEffect
        source: iconImage
        anchors.fill: iconImage
        colorization: 1
        colorizationColor: root.color
    }
}
