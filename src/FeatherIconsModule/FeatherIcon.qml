import QtQuick 2.0
import QtQuick.Effects

Item {
    id: root
    property string color: "black"
    property string icon: ""
    property real size: 24
    property real strokeWidth: 2
    readonly property string svgPath: "file:///" + featherIconsModuleDir + "/feather/"

    function getPath(iconName, strokeWidth) {
        // find more elegant way to get the path
        const validStrokeWidths = [0.5, 1, 1.5, 2, 2.5, 3];
        if (validStrokeWidths.indexOf(strokeWidth) ===  -1) {
            throw new Error(`Invalid stroke width for icon ${iconName}: ${strokeWidth}`);
        }

        let folder = `stroke_width_${strokeWidth.toFixed(1)}/`;
        return svgPath + folder + iconName + ".svg";
    }

    Image {
        id: iconImage
        fillMode: Image.PreserveAspectFit
        source: getPath(root.icon, root.strokeWidth)
        sourceSize.width: root.size
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
