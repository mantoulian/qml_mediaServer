import QtQuick 2.0
import QtQuick.Controls 2.5

//Item {
//    id:infoDlgRoot

Dialog{
        id: dlgSignalInfo
        title: qsTr("视频流信息")
        width: 400
        height: 200
        //模态
        modal: true
        closePolicy: Popup.CloseOnEscape


//        property int itemIndex: -1
//        property alias name: signalSourceCtrl.name
//        property alias url: signalSourceCtrl.url
//        property alias hasAudioUrl: signalSourceCtrl.hasAudioUrl
//        property alias audioUrl: signalSourceCtrl.audioUrl
//        property alias muteAudio: signalSourceCtrl.muteAudio


        Text {
            id: tbSignalName
            x: root.padding + 50
            y: root.padding
            //text: qsTr("流名称：")
        }

        TextField {
            id: txtSignalName
            height: tbSignalName.height + 10

            anchors.verticalCenter: tbSignalName.verticalCenter
            anchors.left: tbSignalName.right
            anchors.right: parent.right

            anchors.margins: root.padding

            readOnly: root.readonly
        }


        Text {
            id: tbSignalUrl

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

            anchors.margins: root.padding

            readOnly: root.readonly
        }



        CheckBox {
            id: chkHasAudioUrl

            anchors.top: tbSignalUrl.bottom
            anchors.right: tbSignalName.right

            anchors.topMargin: 2
            text: qsTr("音频流：")
        }

        TextField {
            id: txtAudioUrl
            height: txtSignalName.height

            anchors.verticalCenter: chkHasAudioUrl.verticalCenter
            anchors.left: chkHasAudioUrl.right
            anchors.right: parent.right

            anchors.margins: root.padding

            enabled: chkHasAudioUrl.checked
            readOnly: root.readonly
        }

        CheckBox {
            id: chkMuteAudio

            anchors.top: txtAudioUrl.bottom
            anchors.left: txtAudioUrl.left

            anchors.topMargin: 2
            text: qsTr("不转发音频")
            visible: !chkHasAudioUrl.checked
        }


        //背景矩形
//               Rectangle{
//                   anchors.fill: parent;
//                   color: "#1e1e1e";
//               }


        //modality: Qt.WindowModal
        //        SignalSourceCtrl {
        //            id: signalSourceCtrl
        //            anchors.fill: parent
        //            padding: root.padding
        //            readonly: false
        //        }

        standardButtons: StandardButton.Ok | StandardButton.Cancel

        onAccepted: {
            var itemName = signalSourceCtrl.name.trim();
            var itemUrl = signalSourceCtrl.url.trim();
            var itemHasAudioUrl = signalSourceCtrl.hasAudioUrl;
            var itemAudioUrl = signalSourceCtrl.audioUrl.trim();
            var itemMuteAudio = signalSourceCtrl.muteAudio;

            if (itemName === "") return;
            if (itemUrl === "") return;
            if (itemHasAudioUrl && itemAudioUrl === "") return;

            if (itemIndex < 0) {
                signalList.append(itemName, itemUrl, itemHasAudioUrl, itemAudioUrl, itemMuteAudio);
            } else {
                mediaServer.removeStream(signalList.get(itemIndex).name);
                signalList.set(itemIndex, itemName, itemUrl, itemHasAudioUrl, itemAudioUrl, itemMuteAudio);
            }
            mediaServer.addStream(itemName, itemUrl);
            signalList.saveSettings();
        }
    }


//}
