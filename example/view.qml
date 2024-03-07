import QtQuick
import QtQuick.Controls.Universal
import QtQuick.Layouts
import FeatherIcons

Window {
    id: root
    visible: true
    width: 640
    height: 560
    title: qsTr("Feather Icons PySide example")
    Universal.theme: Universal.Dark
    color: Universal.background

    property string featherIconName: "feather"
    property real mainIconStrokeWidth: 2

    function formatStrokeWidth(strokeWidth) {
        return strokeWidth.toFixed(1);
    }

    function getNewStrokeWidth(curWidth, delta) {
        console.log("Current width: " + curWidth + ", delta: " + delta);
        return Math.max(0.5, Math.min(3, curWidth + delta));
    }

    ColumnLayout {
        anchors.fill: parent
        anchors.margins: 32

        ColumnLayout {
            Text {
                text: qsTr("PySide6 Example")
                color: Universal.foreground
            }
            Text {
                text: qsTr("Feather Icons")
                color: Universal.foreground
                font.pixelSize: 24
            }
        }

        FeatherIcon {
            icon: featherIconName
            iconSize: 72
            strokeWidth: mainIconStrokeWidth
            color: Universal.foreground
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            Layout.fillHeight: true
        }

        RowLayout {
            Layout.fillHeight: true
            Layout.topMargin: 32
            Layout.bottomMargin: 32
            Layout.alignment: Qt.AlignHCenter
            spacing: 32
            ColumnLayout {
                Text {
                    text: qsTr("Stroke width")
                    color: Universal.foreground
                    font.pixelSize: 14
                }
                Text {
                    text: formatStrokeWidth(mainIconStrokeWidth)
                    Layout.alignment: Qt.AlignRight
                    color: Universal.foreground
                    font.pixelSize: 26
                }
            }
            ColumnLayout {

                Button {
                    text: "Increase"
                    icon.source: FeatherIconsVault.getSource("plus")
                    Layout.preferredWidth: 130
                    onClicked: {
                        mainIconStrokeWidth = getNewStrokeWidth(mainIconStrokeWidth, 0.5);
                    }
                }
                Button {
                    text: "Decrease"
                    icon.source: FeatherIconsVault.getSource("minus")
                    Layout.preferredWidth: 130
                    onClicked: {
                        mainIconStrokeWidth = getNewStrokeWidth(mainIconStrokeWidth, -0.5);
                    }
                }
            }
        }

        RowLayout {
            Layout.alignment: Qt.AlignHCenter
            spacing: 16
        }
    }
}
