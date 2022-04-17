import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Controls.Styles 1.4
import QtQuick.Controls 1.4



Rectangle {
    id: ctrlBg
    color: "#1e1e1e"
    width: 300
    height: 100

    property alias name: txtSignalName.text
    property alias url: txtSignalUrl.text
    property alias hasAudioUrl: chkHasAudioUrl.checked
    property alias audioUrl: txtAudioUrl.text
    property alias muteAudio: chkMuteAudio.checked

    property int padding: 20
    property bool readonly: false

    Text {
        id: tbSignalName
        x: parent.padding + 50
        y: parent.padding
        font.family: "MicrosoftYaHei"
        font.pixelSize: 10
        color: "#ffffff"
        text: qsTr("流名称：")

    }

    TextField {
        id: txtSignalName
        height: tbSignalName.height + 10

        anchors.verticalCenter: tbSignalName.verticalCenter
        anchors.left: tbSignalName.right
        anchors.right: parent.right

        anchors.margins: parent.padding

        readOnly: parent.readonly
    }


    Text {
        id: tbSignalUrl
        font.family: "MicrosoftYaHei"
        font.pixelSize: 10
        color: "#ffffff"

        anchors.top: tbSignalName.bottom
        anchors.right: tbSignalName.right
        anchors.topMargin: 20

        text: qsTr("流地址：")
    }

    TextField {
        id: txtSignalUrl
        height: txtSignalName.height

        anchors.verticalCenter: tbSignalUrl.verticalCenter
        anchors.left: tbSignalUrl.right
        anchors.right: parent.right

        anchors.margins: parent.padding

        readOnly: parent.readonly
    }



    CheckBox {
        id: chkHasAudioUrl

        anchors.top: tbSignalUrl.bottom
        anchors.right: tbSignalName.right
        anchors.topMargin: 20

        style: CheckBoxStyle {

            label:Text {
                id: name
                text: qsTr("音频流：")
                color: "#ffffff"
                font.family: "MicrosoftYaHei"
                font.pixelSize: 10
            }
            indicator: Rectangle {
                    implicitWidth: 16
                    implicitHeight: 16
                    radius: 3
                    border.color: control.activeFocus ? "darkblue" : "gray"
                    border.width: 1
                    Rectangle {
                        visible: control.checked
                        color: "#555"
                        border.color: "#333"
                        radius: 1
                        anchors.margins: 4
                        anchors.fill: parent
                    }
            }
        }

    }

    TextField {
        id: txtAudioUrl
        height: txtSignalName.height

        anchors.verticalCenter: chkHasAudioUrl.verticalCenter
        anchors.left: chkHasAudioUrl.right
        anchors.right: parent.right

        anchors.margins: parent.padding

        enabled: chkHasAudioUrl.checked
        readOnly: parent.readonly
    }

    CheckBox {
        id: chkMuteAudio

        anchors.top: txtAudioUrl.bottom
        anchors.left: txtAudioUrl.left
        anchors.topMargin: 20

        style: CheckBoxStyle {
            label:Text {
                id: name
                text: qsTr("不转发音频")
                color: "#ffffff"
                font.family: "MicrosoftYaHei"
                font.pixelSize: 10
            }
            indicator: Rectangle {
                    implicitWidth: 16
                    implicitHeight: 16
                    radius: 3
                    border.color: control.activeFocus ? "darkblue" : "gray"
                    border.width: 1
                    Rectangle {
                        visible: control.checked
                        color: "#555"
                        border.color: "#333"
                        radius: 1
                        anchors.margins: 4
                        anchors.fill: parent
                    }
            }
        }

        visible: !chkHasAudioUrl.checked
    }
}


