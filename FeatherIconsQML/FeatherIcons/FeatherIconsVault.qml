pragma Singleton
import QtQuick

QtObject {
    readonly property string svgPath: "file:///" + featherIconsModuleDir + "/feather/"

    function getSource(iconName, strokeWidth) {
        if (strokeWidth === undefined) {
            strokeWidth = 2;
        }
        const validStrokeWidths = [0.5, 1, 1.5, 2, 2.5, 3];
        if (validStrokeWidths.indexOf(strokeWidth) === -1) {
            throw new Error(`Invalid stroke width for icon ${iconName}: ${strokeWidth}`);
        }
        let folder = `stroke_width_${strokeWidth.toFixed(1)}/`;
        return svgPath + folder + iconName + ".svg";
    }
}
