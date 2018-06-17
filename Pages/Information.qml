import QtQuick 2.9
import QtQuick.Controls.Material 2.2
import QtQuick.Controls 2.2
import QtCharts 2.2

Item {

    Label {
        id: heading
        height: parent.height / 4
        color: headingLabelColor
        text: "Amount of Calls"
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

    ChartView {
        opacity: 0.6

//        legend.visible: false
        antialiasing: true
        anchors {
            top: heading.bottom
            right: parent.right
            left: parent.left
            bottom: parent.bottom
            margins: parent.width / 10
            topMargin: parent.height / 10
            bottomMargin: parent.height / 10
        }

        LineSeries {

            name: "LineSeries"
            XYPoint { x: 0; y: 0 }
            XYPoint { x: 1.1; y: 2.1 }
            XYPoint { x: 1.9; y: 3.3 }
            XYPoint { x: 2.1; y: 2.1 }
            XYPoint { x: 2.9; y: 4.9 }
            XYPoint { x: 3.4; y: 3.0 }
            XYPoint { x: 4.1; y: 3.3 }
        }

    }
}
