import QtQuick 2.9
import "../../MainComponents" as Comps
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3
import QtQuick.Controls.Material 2.2

Item {
    id: rect
    signal continueClicked();


    Label {
        id: header
        height: parent.height / 4
        color: headingLabelColor
        text: "Welcome to Poolaid"
        font.weight: Font.ExtraBold
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
            font.weight: Font.DemiBold
            renderType: Text.QtRendering
            font.pointSize: 15
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            wrapMode: Text.Wrap
            height: parent.height / 3
            color: "#dd006992"
            text: qsTr("PoolAid is here, on your phone available at anytime for all your pool servicing needs!")
            anchors {
                top: parent.top
                left: parent.left
                right: parent.right
            }
        }
        Image {
            id: image
            fillMode: Image.Tile
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
                text: "Next"
                highlighted: false
                flat: true
                display: AbstractButton.TextOnly
                autoExclusive: false
                Layout.alignment: Qt.AlignRight | Qt.AlignVCenter
                onClicked: {
                    continueClicked();
                }
            }
        }
    }
}
