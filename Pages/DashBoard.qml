import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Controls.Material 2.2
import "../MainComponents" as Comps

Item {
    Flickable {
        flickableDirection: Flickable.VerticalFlick
        anchors {
            fill: parent
            margins: defMargin * 10
        }
        contentHeight: col.height
        contentWidth: width
        Column {
            id: col
            spacing: 30
            width: parent.width
            //            anchors {
            //                left: parent.left
//                right: parent.right
//                top: parent.top
//                margins: 5
//            }

            Label {
                color: "#dd588399"
                text: "DashBoard"
                font.weight: Font.DemiBold
                font.pixelSize: 30
                padding: 20
                font.family: "Tahoma"
                font.capitalization: Font.AllUppercase
                anchors.horizontalCenter: parent.horizontalCenter
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
            }

            Comps.DashPane {
                id: serviceDays
                anchors {
                    left: parent.left
                    right: parent.right
                    margins: defMargin * 2
                    topMargin: defMargin * 3
                }
                panelText: "Days since last service"
                actionsCount: 1
                actionText: [ "Request Service:steelblue:white" ]
                Material.background: Material.LightBlue

                onActionClicked: {
                    console.log(index);
                }
            }

            Comps.DashPane {
                id: contractDays
                anchors {
                    left: parent.left
                    right: parent.right
                    margins: defMargin * 2
                    topMargin: defMargin * 3
                }
                panelText: "Days left on service contract"
                panelCountValueText: "52"
                actionsCount: 1
                actionText: [ "Update Contract:steelblue:white", "Cancel Contract:crimson:white" ]
                Material.background: Material.Orange

                onActionClicked: {
                    console.log(index);
                }
            }

            Comps.DashPane {
                id: lastBill
                anchors {
                    left: parent.left
                    right: parent.right
                    margins: defMargin * 2
                    topMargin: defMargin * 3
                }
                panelText: "Your last bill was charged to your credit card on the 15 of juin 2018"
                panelCountValueText: "122.36$ CAD"
                actionsCount: 1
                actionText: [ "View Bill:steelblue:white" ]
                Material.background: Material.LightGreen

                onActionClicked: {
                    console.log(index);
                }
            }

            Comps.DashPane {
                id: lastContractor
                anchors {
                    left: parent.left
                    right: parent.right
                    margins: defMargin * 2
                    topMargin: defMargin * 3
                }
                panelText: "The last person who came by: Bobby The Builder"
                panelCountValueText: "Rating: * * *"
                actionsCount: 1
                actionText: [ "Rate Contractor:steelblue:white", "File a complaint:crimson:white" ]
                Material.background: Material.Purple

                onActionClicked: {
                    console.log(index);
                }
            }




        }


    }


}
