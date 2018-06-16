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
        bugreport.isSelected = (currentPage === bugreport.pageIndex);
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
        id: bugreport
        property bool isSelected: false
        property int pageIndex: 3
        Layout.fillHeight: true
        Layout.fillWidth: true

        border.width: 1
        border.color: borderColor

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
}
