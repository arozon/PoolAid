import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Controls.Material 2.2
import "../MainComponents" as Comps

Item {
    Flickable {
        anchors {
            fill: parent
            margins: defMargin
        }

        contentHeight: col.height
        contentWidth: parent.width
        Column {
            id: col
            spacing: 10
            width: parent.width
            //            anchors {
            //                left: parent.left
//                right: parent.right
//                top: parent.top
//                margins: 5
//            }

            Label {
                font.pixelSize: 30
                text: "This is the dashboard page"
            }
            Comps.DashLabel {
                font.pixelSize: 30
                text: "This is the dashboard page"
            }

            Comps.DashPane {
                id: test
                width: parent.width
                height: 60
                anchors {
                    left: parent.left
                    right: parent.right
                    margins: defMargin * 2
                    topMargin: defMargin * 3
                }

                Material.background: Material.Green
                Material.elevation: 5
            }



            Label {
                font.pixelSize: 30
                text: "This is the dashboard page"
            }
            Component.onCompleted: {
                console.log(col.width)
            }


        }


    }


}
