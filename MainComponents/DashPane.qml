import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Controls.Material 2.2
import QtQuick.Layouts 1.3

Item {
    width: 360
    height: 100
    property int actionsCount: 1
    property var actionText: [ "DefaultItemPlsConfig" ]
    property string panelText: "Default"
    property string panelCountText: "Count: "
    property string panelCountValueText: " 1 "
    property color textColor: "white"
    property color subTextColor: textColor
    property int secondRowSpacing: 3
    property int panelHeightMinimum: 60
//    height: col.height <= 60 ? 60 : col.height + 10 * col.children.length


    Column {
        id: col
        spacing: 10
        y: 1
        width: parent.width

        height: childrenRect.height

        Repeater {

            model: actionText
            Button {
                property int actionIndex: index
                text: modelData
                anchors {
                    left: parent.left
                    right: parent.right
                    margins: defMargin * 3
                }
            }

        }
    }

    Pane {
        height: {
            if (parent.height < panelHeightMinimum){
                return panelHeightMinimum;
            }else {
                return implicitHeight;
            }
        }
        anchors {
            left: parent.left
            right: parent.right
            margins: defMargin + 2
        }
        Material.elevation: dashPanelRadius

        ColumnLayout {
            Label {
                text: panelText
                Material.foreground: textColor
                font.pixelSize: mainImplicitFontSize
            }
            RowLayout {
                spacing: secondRowSpacing
                Material.foreground: subTextColor
                Label {
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                    Layout.maximumWidth: implicitWidth
                    verticalAlignment: Text.Center
                    horizontalAlignment: Text.Right
                    text: panelCountText
                    font.pixelSize: mainImplicitFontSize

                }
                Label {
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                    Layout.maximumWidth: implicitWidth
                    verticalAlignment: Text.Center
                    horizontalAlignment: Text.Center
                    text: panelCountValueText
                    font.pixelSize: mainImplicitFontSize

                }
            }
        }

    }



}
