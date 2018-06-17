import QtQuick 2.9
import QtQuick.Controls 2.2
import "./HintsPages" as Pages

Item {
    id: main
    height: parent.height
    width: parent.width
    state: "hidden"
    signal destroyHints();
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
        anchors {
            fill: parent
        }
        Pages.FirstPage {
            id: page1
            onContinueClicked: {
                main.state = "hidden";
                //destroyHints();
            }
        }
        Pages.FirstPage {
            onContinueClicked: {
                main.state = "hidden";
                //destroyHints();
            }
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
