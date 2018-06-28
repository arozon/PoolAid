import QtQuick 2.11
import QtQuick.Window 2.11
import Qt.labs.settings 1.0
import Qt.labs.platform 1.0
import QtQuick.Controls 2.2
import QtQuick.Controls.Material 2.2
import "./Pages" as Pages
import "./MainComponents" as MainComponents

Window {
    visible: true
    width: 640
    height: 812
    title: qsTr("PoolAid")
    color: "white"
    flags: Qt.MaximizeUsingFullscreenGeometryHint;


    //Main properties
    property string version: "0.10";
    property string copyrightEn: "Copyright © Alexandre Rozon - 2018"
    property string copyrightFr: "Licencse © Alexandre Rozon - 2018"
    property double mainImplicitFontSize: 30
    property int defMargin: 3


    //Main color properties
    property int animationColorDuration: 250
    property int animationNumberDuration: 300
    property color borderColor: "grey"
    property color focusedColor: "steelblue"
    property color unfocusedColor: "aliceblue"
    property color headingLabelColor: "#dd588399"
    property color buttonColor: "steelblue"
    property color buttonTextColor: "white"


    //Specifique components configurations
    property int dashPanelElevation: 9
    property int buttonElevation: 3
    property int rectRadius: 3



    //Main properties
    property int footerHeight: 80
    Material.accent: Material.BlueGrey
    Material.primary: Material.BlueGrey
    Material.background: buttonColor

    onActiveChanged: {
        if (!active) {
            //Qt.quit();
        }
    }




    /*
      Section includes the main controller for the different windows
      */

    Item {
        anchors {
            fill: parent
        }

        function setPage(index) {
            switch (index) {
            case 0:
                mainStack.push(dashboard);
                break;
            case 1:
                mainStack.push(information);
                break;
            case 2:
                mainStack.push(misc);
                break;

            case 3:
                mainStack.push(bugreport);
                break;

            }
        }

        Image {
            anchors {
                top: parent.top
                right: parent.right
                bottom: footer.top
                left: parent.left
            }
            source: "./Images/pageBackground.png"
            opacity: 0.18
        }
        StackView {
            id: mainStack
            initialItem: dashboard
            anchors {
                top: parent.top
                right: parent.right
                bottom: footer.top
                left: parent.left
            }
        }


        Component.onCompleted: {
            hintsLoader.active = true;
        }




        MainComponents.MainFooter {
            id: footer
            height: footerHeight
            anchors {
                left: parent.left
                right: parent.right
                bottom: parent.bottom
                leftMargin: -1
                rightMargin: -1
                bottomMargin: -1
            }

            onCurrentPageChanged: {
                parent.setPage(currentPage);
            }
        }
        Loader {
            id: hintsLoader
            height: parent.height
            width: parent.width
            asynchronous: false
            active: false
            sourceComponent: Pages.Hints {
                onDestroyHints: {
                    hintsLoader.active = false;
                }
            }
        }


    }

    Component {
        id: dashboard
        Pages.DashBoard { }
    }

    Component {
        id: misc
        Pages.Misc { }
    }
    Component {
        id: information
        Pages.Information { }
    }
    Component {
        id: bugreport
        Pages.BugReport { }
    }



}
