import QtQuick 2.9
import QtQuick.Controls 2.2

Item {
    Label {
        id: message
        height: parent.height / 4
        color: headingLabelColor
        text: "Bug Report"
        font.pointSize: 30
        font.family: "Verdana"
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        anchors {
            verticalCenter: parent.verticalCenter
            horizontalCenter: parent.horizontalCenter
        }
    }

}
