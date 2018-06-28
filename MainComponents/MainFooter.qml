import QtQuick 2.11
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3

RowLayout {
    spacing: -1

    //Color properties
    property color colorSelected: focusedColor
    property color colorUnselected: unfocusedColor
    property int currentPage: 0

    onCurrentPageChanged: {
        dashboard.isSelected = (currentPage === dashboard.pageIndex);
        misc.isSelected = (currentPage === misc.pageIndex);
        about.isSelected = (currentPage === about.pageIndex);
        //bugreport.isSelected = (currentPage === bugreport.pageIndex);
    }


    function getColor(selected){
        if (selected) {
            return colorSelected;
        }else {
            return colorUnselected;
        }
    }

    Rectangle {
        id: dashboard
        property bool isSelected: true
        property int pageIndex: 0
        Layout.fillHeight: true
        Layout.fillWidth: true

        border.width: 1
        border.color: borderColor
        Image {
            fillMode: Image.PreserveAspectFit
            anchors {
                fill: parent
                topMargin: parent.height / 4
                bottomMargin: parent.height / 4
                margins: parent.width / 4
            }
            opacity: 0.5

            source: "../Images/monitor-dashboard-dark.png"
        }

        color: getColor(isSelected);

        MouseArea {
            anchors {
                fill: parent
            }
            onClicked: {
                currentPage = parent.pageIndex;
            }
        }

        Behavior on color {
            ColorAnimation {
                duration: animationColorDuration
            }
        }

    }



    Rectangle {
        id: misc
        property bool isSelected: false
        property int pageIndex: 1
        Layout.fillHeight: true
        Layout.fillWidth: true

        border.width: 1
        border.color: borderColor

        color: getColor(isSelected);

        Image {
            fillMode: Image.PreserveAspectFit
            anchors {
                fill: parent
                topMargin: parent.height / 4
                bottomMargin: parent.height / 4
                margins: parent.width / 4
            }
            opacity: 0.5

            source: "../Images/chart-line.png"
        }
        MouseArea {
            anchors {
                fill: parent
            }
            onClicked: {
                currentPage = parent.pageIndex;
            }
        }

        Behavior on color {
            ColorAnimation {
                duration: animationColorDuration
            }
        }
    }
    Rectangle {
        id: about
        property bool isSelected: false
        property int pageIndex: 2
        Layout.fillHeight: true
        Layout.fillWidth: true

        border.width: 1
        border.color: borderColor

        color: getColor(isSelected);

        Image {
            fillMode: Image.PreserveAspectFit
            anchors {
                fill: parent
                topMargin: parent.height / 4
                bottomMargin: parent.height / 4
                margins: parent.width / 4
            }
            opacity: 0.5

            source: "../Images/account-box-outline.png"
        }
        MouseArea {
            anchors {
                fill: parent
            }

            onClicked: {
                currentPage = parent.pageIndex;
            }
        }

        Behavior on color {
            ColorAnimation {
                duration: animationColorDuration
            }
        }
    }
//    Rectangle {
//        id: bugreport
//        property bool isSelected: false
//        property int pageIndex: 3
//        Layout.fillHeight: true
//        Layout.fillWidth: true

//        border.width: 1
//        border.color: borderColor

//        color: getColor(isSelected);

//        Image {
//            fillMode: Image.PreserveAspectFit
//            anchors {
//                fill: parent
//                topMargin: parent.height / 4
//                bottomMargin: parent.height / 4
//                margins: parent.width / 4
//            }
//            opacity: 0.5

//            source: "../Images/bug.png"
//        }
//        MouseArea {
//            anchors {
//                fill: parent
//            }
//            onClicked: {
//                currentPage = parent.pageIndex;
//            }
//        }

//        Behavior on color {
//            ColorAnimation {
//                duration: animationColorDuration
//            }
//        }
//    }
}
