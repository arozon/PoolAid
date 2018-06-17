import QtQuick 2.9
import "../../MainComponents" as Comps
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3
import QtQuick.Controls.Material 2.2

Item {
    signal continueClicked();
    Pane {
        id: rect
        anchors {
            margins: parent.width / 15
            topMargin: parent.height / 15
            bottomMargin: parent.height / 15
            fill: parent
        }
        Material.background: "ghostwhite"
        Material.elevation: dashPanelElevation

        Label {
            id: header
            height: parent.height / 4
            color: headingLabelColor
            text: "Hints"
            font.pointSize: 30
            font.family: "Verdana"
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            anchors {
                left: parent.left
                right: parent.right
                top: parent.top
            }
        }

        Item {
            id: center
            anchors {
                top: header.bottom
                right: parent.right
                left: parent.left
                bottom: footer.top
            }
            Label {
                id: descriptionLabel
                text: "This is an example"
                font.pointSize: 15
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                height: parent.height / 3
                anchors {
                    top: parent.top
                    left: parent.left
                    right: parent.right
                }
            }
            Image {
                id: image
                fillMode: Image.PreserveAspectFit
                anchors {
                    bottom: parent.bottom
                    right: parent.right
                    left: parent.left
                    top: descriptionLabel.bottom
                }
                source: "../../Images/images.png"
            }
        }

        Item {
            id: footer
            height: parent.height / 6
            anchors {
                left: parent.left
                right: parent.right
                bottom: parent.bottom
            }
            RowLayout {
                anchors.rightMargin: 30
                anchors.topMargin: 0
                anchors {
                    fill: parent
                }
                Button {
                    text: "Confirm"
                    Layout.alignment: Qt.AlignRight | Qt.AlignVCenter
                    onClicked: {
                        continueClicked();
                    }
                }
            }
        }



    }


}
