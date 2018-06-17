import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Controls.Material 2.2
import QtQuick.Layouts 1.3

Item {
    id: mainItem
    height: childrenRect.height
    property int actionsCount: 1
    property var actionText: [ "DefaultItemPlsConfig:steelblue:white" ]
    property string panelText: "Default"
    property string panelCountValueText: "1"
    property color textColor: "white"
    property color subTextColor: textColor
    property color rectBorderColor: "white"


    signal tookFocus();
    signal actionClicked(var index);



    state: "unfocused"

    states: [
        State {
            name: "focused"
            PropertyChanges {
                target: col
                y: panel.height - 10
                opacity: 0.8
            }
        },
        State {
            name: "unfocused"
            PropertyChanges {
                target: col
                y: 1
                opacity: 0.0
            }
        }
    ]

    //    height: col.height <= 60 ? 60 : col.height + 10 * col.children.length

    Rectangle {
        id: col
        radius: 5
        border.color: borderColor
        color: "gainsboro"
        border.width: 1
        y: 1
        width: parent.width * 4 / 5
        anchors {
            horizontalCenter: parent.horizontalCenter
        }

        opacity: 0.0
        height: colr.height + 10

        Column {
            id: colr
            spacing: 5
            width: parent.width
            topPadding: 15
            height: childrenRect.height
            Repeater {

                model: actionText
                Button {
                    property int actionIndex: index
                    text: modelData.split(":")[0]
                    width: parent.width * 3/4
                    Material.background: modelData.split(":")[1]
                    Material.foreground: modelData.split(":")[2]
                    anchors {
                        horizontalCenter: parent.horizontalCenter
                        margins: defMargin * 3
                    }

                    onClicked: {
                        actionClicked(index);
                    }
                }

            }


        }
        Behavior on y {
            NumberAnimation {
                duration: animationNumberDuration
            }
        }
        Behavior on opacity {
            NumberAnimation {
                duration: animationNumberDuration
            }
        }
    }

    Pane {
        id: panel
        anchors {
            left: parent.left
            right: parent.right
            margins: defMargin + 2
        }
        contentHeight: colItem.implicitHeight < col.height ? col.height : colItem.implicitHeight
        contentWidth: colItem.implicitWidth
        Material.elevation: dashPanelElevation


        ColumnLayout {
            width: parent.width
            anchors {
                fill: parent
            }

            id: colItem
            Label {
                text: panelText
                Layout.fillHeight: true
                Layout.minimumHeight: implicitHeight
                Layout.fillWidth: true
                wrapMode: Text.WrapAtWordBoundaryOrAnywhere
                elide: Text.ElideRight
                fontSizeMode: Text.Fit

                Material.foreground: textColor
                font.pixelSize: mainImplicitFontSize
            }
            RowLayout {
                spacing: 0
                clip: true
                id: row
                Layout.alignment: Qt.AlignRight | Qt.AlignVCenter
                Layout.minimumHeight: subLabel.implicitHeight + (defMargin * 2)
                Layout.minimumWidth: subLabel.implicitWidth + (defMargin * 2)
                Layout.maximumWidth: subLabel.implicitWidth + (defMargin * 2)
                Layout.maximumHeight: subLabel.implicitHeight + (defMargin * 2)
                Layout.rightMargin: defMargin * 3
                Rectangle {
                    id: rect
                    Layout.minimumWidth: subLabel.implicitWidth
                    Layout.minimumHeight: subLabel.implicitHeight
                    Layout.fillHeight: true
                    Layout.fillWidth: true

                    Material.foreground: subTextColor

                    color: Qt.rgba(0,0,0,0)
                    border.width: 1
                    radius: rectRadius
                    border.color: rectBorderColor
                    anchors {
                        topMargin: -1 * defMargin
                        bottomMargin: -1 * defMargin
                    }


                    Label {
                        id: subLabel
                        height: implicitHeight
                        width: implicitWidth
                        x: (parent.width - width) / 2
                        text: ' ' + panelCountValueText + ' '
                        anchors {
                            verticalCenter: parent.verticalCenter
                            horizontalCenter: parent.horizontalCenter
                        }

                        font.pixelSize: mainImplicitFontSize

                    }
                }
            }
            Item {
                Layout.fillWidth: true
                Layout.fillHeight: true
                Layout.maximumHeight: childrenRect.height
                Layout.minimumHeight: childrenRect.height
                Layout.topMargin: 5
                Layout.bottomMargin: -5

                Column {
                    anchors {
                        left: parent.left
                        right: parent.right
                        top: parent.top
                    }

                    spacing: 3
                    Rectangle {
                        id: lineOne
                        height: 2
                        width: parent.width / 10
                        opacity: 0.8
                        color: "white"
                        anchors {
                            horizontalCenter: parent.horizontalCenter
                        }
                    }
                    Rectangle {
                        id: lineTwo
                        height: 2
                        width: parent.width / 10
                        color: "white"
                        opacity: 0.4
                        anchors {
                            horizontalCenter: parent.horizontalCenter
                        }
                    }
                    Rectangle {
                        id: lineThree
                        height: 2
                        width: parent.width / 10
                        color: "white"
                        opacity: 0.2
                        anchors {
                            horizontalCenter: parent.horizontalCenter
                        }
                    }
                }
            }
        }

        MouseArea {
            anchors.fill: parent
            onClicked: {
                if (mainItem.state === "unfocused") {
                    mainItem.state = "focused";
                }
                else {
                    mainItem.state = "unfocused";
                }
            }
        }

    }



}
