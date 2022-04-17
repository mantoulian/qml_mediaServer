import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQml 2.12
import "BaseComponent"



MyDialog{
    id: root
    width: 800
    height: 400


    //模态
    modal: true
    closePolicy: Popup.CloseOnEscape

    //背景
    background:Rectangle{
        anchors.fill: parent

        color:"#1e1e1e"
    }

    property int cusPadding : 40
    property int itemIndex: -1
    //property alias index: sigCtrl.itemIndex
    property alias name: tbSignalName.textFieldTxt
    property alias url: tbSignalUrl.textFieldTxt
    property alias hasAudioUrl: chkHasAudioUrl.checked
    property alias audioUrl: txtAudioUrl.text
    property alias muteAudio: chkMuteAudio.checked



    onAccepted:{

        console.log("aaa")
        var itemName = txtSignalName.text
        var itemUrl = txtSignalUrl.text
        var itemHasAudioUrl = chkHasAudioUrl.checked
        var itemAudioUrl = txtAudioUrl.text
        var itemMuteAudio = chkMuteAudio.checked

        if (itemName === "") return;
        if (itemUrl === "") return;
        if (itemHasAudioUrl && itemAudioUrl === "") return;

        if (itemIndex < 0)
        {
           signalList.append(itemName, itemUrl, itemHasAudioUrl, itemAudioUrl, itemMuteAudio);
        }
        else
        {
            mediaServer.removeStream(signalList.get(itemIndex).name);
            signalList.set(itemIndex, itemName, itemUrl, itemHasAudioUrl, itemAudioUrl, itemMuteAudio);
        }

        mediaServer.addStream(itemName, itemUrl);
        signalList.saveSettings();
        //console.log("itemName: ", itemName, "itemUrl: ", itemUrl);

    }



    //标题矩形
    Rectangle{
        id: titelRec
        width: parent.width
        height: parent.height/10
        color: "#363d45"


        Text {
            id: titelText
            text: qsTr("视频流信息")
            font.family: "MicrosoftYaHei"
            font.pixelSize: 14
            font.bold: true
            color: "#3ec6ff"

            anchors.verticalCenter: parent.verticalCenter
        }
    }


    MyTextField{
        id:tbSignalName
        width:parent.width
        height:50
        textName.text: "视频流名称"
        textFont: "MicrosoftYaHei"
        textFontSize:40
        textFontColor: "#ffffff"

        anchors.top: titelRec.bottom
        anchors.topMargin: 50
        anchors.leftMargin: parent.cusPadding
        anchors.rightMargin: parent.cusPadding
    }

    MyTextField{
        id:tbSignalUrl
        width:parent.width
        height:50
        textName.text: "视频流地址"
        textFont: "MicrosoftYaHei"
        textFontSize:40
        textFontColor: "#ffffff"

        anchors.top: tbSignalName.bottom
        anchors.topMargin: 50
        anchors.leftMargin: parent.cusPadding
        anchors.rightMargin: parent.cusPadding
    }


    CheckBox{
        id: chkHasAudioUrl

        anchors.top: tbSignalUrl.bottom
        anchors.right: tbSignalName.right
        anchors.topMargin: 20
    }

    TextField {
        id: txtAudioUrl
        height: txtSignalName.height

        anchors.verticalCenter: chkHasAudioUrl.verticalCenter
        anchors.left: chkHasAudioUrl.right
        anchors.right: parent.right

        anchors.margins: parent.padding

        enabled: chkHasAudioUrl.checked
        //readOnly: parent.readonly
    }

    CheckBox{
        id: chkMuteAudio

        anchors.top: txtAudioUrl.bottom
        anchors.left: txtAudioUrl.left
        anchors.topMargin: 20
    }



        Button{
            id: ctlOk
            width: 80
            height: 30

            anchors.bottom: parent.bottom
            anchors.bottomMargin: 10
            anchors.right: parent.horizontalCenter
            anchors.rightMargin: 10

            contentItem: Text {
                id: ctlButtonText
                text: qsTr("确定")
                font.family: "MicrosoftYaHei"
                font.pixelSize:10
                color: "#ffffff"

                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
            }

           background: Rectangle{
               color: "#2889f4"
           }

           onClicked: {
               //parent.accepted();
               root.accept();
           }
        }

        Button{
            id: ctlCancel
            width: 80
            height: 30

            anchors.bottom: parent.bottom
            anchors.bottomMargin: 10
            anchors.left: parent.horizontalCenter
            anchors.leftMargin: 10

            contentItem: Text {
                id: ctlButtonText_2
                text: qsTr("取消")
                font.family: "MicrosoftYaHei"
                font.pixelSize:10
                color: "#ffffff"

                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
            }

           background: Rectangle{
               color: "#2889f4"
           }

           onClicked: {
               root.reject();
           }
        }


}



//Text {
//    id: tbSignalName
//    x: parent.padding + 50
//    y: parent.padding
//    font.family: "MicrosoftYaHei"
//    font.pixelSize: 10
//    color: "#ffffff"
//    text: qsTr("流名称：")

//}

//TextField {
//    id: txtSignalName
//    height: tbSignalName.height + 10
//    readOnly: parent.readonly

//    anchors.verticalCenter: tbSignalName.verticalCenter
//    anchors.left: tbSignalName.right
//    anchors.right: parent.right
//    anchors.margins: parent.padding

//}

//Text {
//    id: tbSignalUrl
//    font.family: "MicrosoftYaHei"
//    font.pixelSize: 10
//    color: "#ffffff"

//    anchors.top: tbSignalName.bottom
//    anchors.right: tbSignalName.right
//    anchors.topMargin: 20

//    text: qsTr("流地址：")
//}

//TextField {
//    id: txtSignalUrl
//    height: txtSignalName.height

//    anchors.verticalCenter: tbSignalUrl.verticalCenter
//    anchors.left: tbSignalUrl.right
//    anchors.right: parent.right

//    anchors.margins: parent.padding

//    readOnly: parent.readonly
//}



//内容背景矩形
//Rectangle {
//    id: ctrlBg
//    color: "#1e1e1e"
//    width: parent.width
//    height: parent.height - titelRec.height

//    anchors.top: titelRec.bottom

//    property int padding: 20
//    property bool readonly: false

//}

//           Controls_1_4.CheckBox {
//                id: chkHasAudioUrl
//                anchors.top: tbSignalUrl.bottom
//                anchors.right: tbSignalName.right
//                anchors.topMargin: 20
//                style: ContStyles_1_4.CheckBoxStyle {
//                    label:Text {
//                        id: name
//                        text: qsTr("音频流：")
//                        color: "#ffffff"
//                        font.family: "MicrosoftYaHei"
//                        font.pixelSize: 10
//                    }
//                    indicator: Rectangle {
//                            implicitWidth: 16
//                            implicitHeight: 16
//                            radius: 3
//                            border.color: control.activeFocus ? "darkblue" : "gray"
//                            border.width: 1
//                            Rectangle {
//                                visible: control.checked
//                                color: "#555"
//                                border.color: "#333"
//                                radius: 1
//                                anchors.margins: 4
//                                anchors.fill: parent
//                            }
//                    }
//                }
//            }

//            Controls_1_4.CheckBox {
//                id: chkMuteAudio

//                anchors.top: txtAudioUrl.bottom
//                anchors.left: txtAudioUrl.left
//                anchors.topMargin: 20

//                style: ContStyles_1_4.CheckBoxStyle {
//                    label:Text {
//                        id: name
//                        text: qsTr("不转发音频")
//                        color: "#ffffff"
//                        font.family: "MicrosoftYaHei"
//                        font.pixelSize: 10
//                    }
//                    indicator: Rectangle {
//                            implicitWidth: 16
//                            implicitHeight: 16
//                            radius: 3
//                            border.color: control.activeFocus ? "darkblue" : "gray"
//                            border.width: 1
//                            Rectangle {
//                                visible: control.checked
//                                color: "#555"
//                                border.color: "#333"
//                                radius: 1
//                                anchors.margins: 4
//                                anchors.fill: parent
//                            }
//                    }
//                }

//                visible: !chkHasAudioUrl.checked
//            }

