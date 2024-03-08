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
    Universal.theme: Universal.System
    color: Universal.background

    property string featherIconName: "feather"
    property real mainIconStrokeWidth: 2

    function formatStrokeWidth(strokeWidth) {
        return strokeWidth.toFixed(1);
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
                font.pixelSize: 28
            }
        }

        ColumnLayout {
            Layout.alignment: Qt.AlignHCenter
            spacing: 32

            FeatherIcon {
                icon: featherIconName
                iconSize: 72
                strokeWidth: mainIconStrokeWidth
                color: Universal.accent
                Layout.alignment: Qt.AlignHCenter
            }
            TextField {
                id: input
                placeholderText: "Enter icon name"
                text: featherIconName
                Layout.preferredWidth: 200
                Layout.alignment: Qt.AlignHCenter
                onTextChanged: {
                    featherIconName = input.text;
                }
            }
            Text {
                text: qsTr("Find more icons on the ")
                        .concat("<a href='https://feathericons.com/'>Feather Icons</a>")
                        .concat(" website.")
                color: Universal.foreground
                linkColor: Universal.accent
                Layout.alignment: Qt.AlignHCenter
                onLinkActivated: Qt.openUrlExternally(link)
                MouseArea {
                    anchors.fill: parent
                    acceptedButtons: Qt.NoButton 
                    cursorShape: parent.hoveredLink ? Qt.PointingHandCursor : Qt.ArrowCursor
                }
            }
        }

        RowLayout {
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
                        mainIconStrokeWidth += 0.5;
                    }
                    enabled: mainIconStrokeWidth < 3
                }
                Button {
                    text: "Decrease"
                    icon.source: FeatherIconsVault.getSource("minus")
                    Layout.preferredWidth: 130
                    onClicked: {
                        mainIconStrokeWidth -= 0.5;
                    }
                    enabled: mainIconStrokeWidth > 0.5
                }
            }
        }
    }
}
