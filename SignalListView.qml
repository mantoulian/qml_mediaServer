import QtQuick 2.12
import QtQml 2.12
import QtQuick.Controls 2.12

//视频流列表
Item {
    id:root
    width:200
    height:600

    //property alias sigName: lstSignals.contentItem.name
    //property alias sigAddr: lstSignals.contentItem.url
    property alias sigMode: lstSignals

    property string sigName
    property string sigUrl

    Component.onCompleted: {
        if(null != signalList.get(0))
        {
            sigName = signalList.get(0).name
            sigUrl = signalList.get(0).url
        }

    }


    //背景矩形
    Rectangle{
        id: backgroundRec
        //width:root.width/4
        //height: root.heightA
        color: "#272e36"

        anchors.fill: parent

        //标题矩形
        Rectangle{
            id: sinnalListTitel
            width: parent.width
            height: parent.height / 8
            color: "#272e36"

            Text {
                id: sinnalListText
                text: qsTr("视频流列表")
                color: "#afbecb"
                font.pixelSize : 20
                font.bold: true //粗体
                font.family: "MicrosoftYaHei"

                anchors.verticalCenter: parent.verticalCenter

            }

            Button{
                id:addSinnalButt
                //text:"添加"
                //icon.name: "list-add"
                width:30
                height: 30
                icon.source: "src/u4.png"
                icon.color: "White"
                display: AbstractButton.IconOnly
                background: Rectangle {
                    color: "Transparent"
                }

                Loader{id: sigCtrlLoad}

                Connections{
                    target: sigCtrlLoad.item

                   function onCloseDialog(){
                        if(sigCtrlLoad.source != "")
                        {
                           sigCtrlLoad.source = ""
                        }
                    }
                }

                anchors.right: parent.right
                anchors.verticalCenter: parent.verticalCenter

                onClicked: {

                    sigCtrlLoad.source = "SigCtrlDialog.qml"


//                    dlgSignalInfo.itemIndex = -1;
//                    dlgSignalInfo.name = null;
//                    dlgSignalInfo.url = null;
//                    dlgSignalInfo.hasAudioUrl = false;
//                    dlgSignalInfo.audioUrl = null;
//                    dlgSignalInfo.muteAudio = false;
//                    dlgSignalInfo.open();
                }

            }
        }

        //数据列表
        ListView{
            id: lstSignals
            width: parent.width
            height: parent.height - sinnalListTitel.height
            anchors.top: sinnalListTitel.bottom

            //spacing: root.spacing
            //anchors.margins: root.padding

            model: signalList

            focus: true

            property QtObject activeItem : currentIndex >= 0 ? signalList.get(currentIndex) : null;

            delegate: Rectangle {
                width: ListView.view.width
                height: 40

                //color: ListView.isCurrentItem?"#D0D0D0":"transparent"
                color: ListView.isCurrentItem?"#2889F4":"#363D45"
                border.color: Qt.lighter(color, 1.1)

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        lstSignals.currentIndex = index;
                        var activeItem_2 = signalList.get(lstSignals.currentIndex)

                        if(null != activeItem_2 )
                        {
                            sigName = activeItem_2.name
                            sigUrl = activeItem_2.url
                        }

                    }
                }


                Text {
                    //anchors.centerIn: parent
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: parent.left
                    anchors.leftMargin: 20
                    text: model.name
                    font.family: "MicrosoftYaHei"
                    font.pixelSize : 16
                    color: "#ffffff"
                }

                Loader{
                    id:removeSig

                   // anchors.centerIn: root
                }
                Connections{
                    target: removeSig.item

                    onCloseDialog:{
                        if(removeSig.source != "")
                        {
                           removeSig.source = ""
                        }
                    }

                }

                Button{
                    id:btnRemove
                    //text: "删除"
                    //width: parent.width/4
                   // height: parent.height/2
                    width:30
                    height: 30
                    icon.source: "src/u0.png"
                    icon.color: "White"
                    display: AbstractButton.IconOnly
                    background: Rectangle {
                        color: "Transparent"
                    }

                    anchors.right: parent.right
                    anchors.bottom: parent.bottom

                    onClicked: {

                        removeSig.source = "RemoveSignalCtlDlg.qml"
                        removeSig.item.promptTxt = "确实要删除 [" + signalList.get(index).name + "] 吗？";
                        removeSig.item.index = index
                        //dlgPromptDelete.text = "确实要删除 [" + signalList.get(index).name + "] 吗？";
                        //dlgPromptDelete.open()
                    }
                }

                Loader{
                    id: modifySigLoad
                }

                Connections{
                    target: modifySigLoad.item

                    onCloseDialog:{
                        if(modifySigLoad.source != "")
                        {
                           modifySigLoad.source = ""
                        }
                    }

                }

                Button{
                    id:btnModify
                    //text: "修改"
                    //width: parent.width/4
                    //height: parent.height/2
                    width:30
                    height: 30
                    icon.source: "src/u2.png"
                    icon.color: "White"
                    display: AbstractButton.IconOnly
                    background: Rectangle {
                        color: "Transparent"
                    }

                    anchors.right: btnRemove.left
                    anchors.bottom: parent.bottom
                    anchors.rightMargin: 10

                    onClicked: {
//                        var signalSource = signalList.get(lstSignals.currentIndex);
//                        dlgSignalInfo.name = signalSource.name;
//                        dlgSignalInfo.url = signalSource.url;
//                        dlgSignalInfo.itemIndex = lstSignals.currentIndex;
//                        dlgSignalInfo.hasAudioUrl = signalSource.hasAudioUrl;
//                        dlgSignalInfo.audioUrl = signalSource.audioUrl;
//                        dlgSignalInfo.muteAudio = signalSource.muteAudio;
//                        dlgSignalInfo.open();

                        modifySigLoad.source = "SigCtrlDialog.qml"
                        var signalSource = signalList.get(lstSignals.currentIndex);
                        modifySigLoad.item.name = signalSource.name;
                        modifySigLoad.item.url = signalSource.url;
                        modifySigLoad.item.index = lstSignals.currentIndex;
                        modifySigLoad.item.hasAudioUrl = signalSource.hasAudioUrl;
                        modifySigLoad.item.audioUrl = signalSource.audioUrl;
                        modifySigLoad.item.muteAudio = signalSource.muteAudio;


                    }

                }

            }

        }

    }

}
