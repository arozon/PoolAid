import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Controls.Material 2.2
import QtQuick.Layouts 1.3

Item {

    //Login screen example

    Label {
        id: lblSignIn
        height: parent.height / 4
        color: headingLabelColor
        text: "Sign In"
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
        anchors {
            top: lblSignIn.bottom
            right: parent.right
            left: parent.left
            bottom: parent.bottom
        }

        Rectangle {
            opacity: 0.4
            width: parent.width * 2 / 3
            height: parent.height * 2 /3
            border.color: borderColor
            border.width: 1
            radius: rectRadius * 2
            anchors {
                verticalCenter: parent.verticalCenter
                horizontalCenter: parent.horizontalCenter
            }
        }
        Item {
            width: parent.width * 2 / 3
            height: parent.height * 2 /3
            anchors {
                verticalCenter: parent.verticalCenter
                horizontalCenter: parent.horizontalCenter
            }
            ColumnLayout {
                id: columnLayout
                anchors {
                    fill: parent
                    topMargin: parent.height / 28
                    bottomMargin: parent.height / 28
                    margins: parent.width / 14
                }

                TextField {
                    id: textField
                    Layout.alignment: Qt.AlignHCenter | Qt.AlignBottom
                    Layout.fillHeight: true
                    Layout.maximumHeight: implicitHeight * 2
                    placeholderText: "Email"
                    Layout.fillWidth: true
                    selectByMouse: true
                }

                TextField {
                    id: textField1
                    Layout.alignment: Qt.AlignHCenter | Qt.AlignTop
                    Layout.fillHeight: true
                    placeholderText: "Password"
                    Layout.fillWidth: true
                    Layout.maximumHeight: implicitHeight * 2
                    passwordCharacter: "*"
                    selectByMouse: true
                    echoMode: TextInput.Password

                }

                Button {
                    id: button
                    text: qsTr("Button")
                    Layout.minimumHeight: implicitHeight
                    Layout.minimumWidth: implicitWidth
                    Layout.alignment: Qt.AlignRight | Qt.AlignBaseline
                    Material.background: buttonColor
                    Material.foreground: buttonTextColor
                    Material.elevation: buttonElevation
                }
            }
        }

    }

}
