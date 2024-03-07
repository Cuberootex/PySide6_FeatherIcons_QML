import QtQuick
import QtQuick.Controls.Universal
import QtQuick.Layouts
import FeatherIcons

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")
    Universal.theme: Universal.Dark
    color: Universal.background

    ColumnLayout {
        anchors.fill: parent

        FeatherIcon {
            icon: "feather"
            iconSize: 72
            color: Universal.foreground
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
        }

        RowLayout {
            Layout.alignment: Qt.AlignHCenter
            spacing: 8

            FeatherIcon {
                icon: "chevrons-right"
                strokeWidth: 1
                color: Universal.foreground
            }
            Button {
                text: "Button 1"
            }
            Button {
                text: "Button 2"
            }
            Button {
                text: "Button 3"
            }
            FeatherIcon {
                icon: "chevrons-left"
                strokeWidth: 1
                color: Universal.foreground
            }
        }
    }
}
