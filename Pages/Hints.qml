import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Controls.Material 2.2
import "./HintsPages" as Pages

Pane {
    id: main
        Material.background: "ghostwhite"
    Material.elevation: dashPanelElevation
    state: "hidden"
    signal destroyHints();
    signal nextHints()
    Component.onCompleted: {
        state = "visible"
        console.log(hintView.height)
        console.log(page1.height)
    }

    states: [
        State {
            name: "hidden"
            PropertyChanges {
                target: main
                y: height

            }

        },
        State {
            name: "visible"
            PropertyChanges {
                target: main
                y: 0
            }
        }
    ]

    Behavior on y {
        SequentialAnimation {
        NumberAnimation { duration: 500 }
        ScriptAction {
            script: {
                if (state == "hidden") {
                    destroyHints();
                    console.log("Destroying Hints");
                }
            }
        }
        }
    }

    SwipeView {
        id: hintView
        clip: true
        anchors {
            fill: parent
        }
        Pages.FirstPage {
            id: page1
            onContinueClicked: {
                hintView.incrementCurrentIndex();
                //main.state = "hidden";
                //destroyHints();
            }
        }
        Pages.LoginPage {

        }
        Pages.FirstPage {
            onContinueClicked: {
                main.state = "hidden";
                //destroyHints();
            }
        }
    }
    PageIndicator {
        id: indicator
        currentIndex: hintView.currentIndex
        count: hintView.count
        height: implicitHeight
        anchors {
            bottom: hintView.bottom
            bottomMargin: parent.height / 15
            horizontalCenter: parent.horizontalCenter
        }
    }



}
