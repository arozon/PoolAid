import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Controls.Material 2.2
import QtQuick.Layouts 1.3

ColumnLayout {
    clip: true
    Material.accent: "steelblue"
    //Login screen example

    Label {
        id: lblSignIn
        height: parent.height / 4
        color: headingLabelColor
        text: "Account Information"
        Layout.maximumHeight: implicitHeight * 2
        Layout.topMargin: 30
        Layout.fillHeight: true
        Layout.fillWidth: true
        font.pointSize: 30
        font.family: "Tahoma"
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
    }
    Label {
        id: descriptionLabel
        font.weight: Font.DemiBold
        renderType: Text.QtRendering
        font.pointSize: 15
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        wrapMode: Text.Wrap
        height: parent.height / 3
        color: "#dd006992"
        text: qsTr("PoolAid is here, on your phone, available at anytime for all your pool servicing needs!")
        Layout.maximumHeight: implicitHeight * 1.3
        Layout.fillHeight: true
        Layout.fillWidth: true
    }

    Item {
        Layout.fillHeight: true
        Layout.fillWidth: true

        Rectangle {
            width: parent.width * 4 / 5
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
            width: parent.width * 4 / 5
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
                RowLayout {
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                    Layout.alignment: Qt.AlignRight | Qt.AlignVCenter

                    Button {
                        id: register
                        text: qsTr("Register")
                        flat: true
                        Layout.minimumHeight: implicitHeight
                        Layout.minimumWidth: implicitWidth
                        Layout.alignment: Qt.AlignRight | Qt.AlignBaseline
                    }
                    Button {
                        id: login
                        text: qsTr("Login")
                        highlighted: true
                        Layout.minimumHeight: implicitHeight
                        Layout.minimumWidth: implicitWidth
                        Layout.alignment: Qt.AlignRight | Qt.AlignBaseline
                    }

                }

            }
        }

    }

}
