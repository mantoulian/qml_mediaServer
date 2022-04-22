import QtQuick 2.12
import QtQuick.Window 2.3
import QtQml 2.5
import QtQuick.Controls 2.5
import Com.ItSync.MediaServer 1.0
import "BaseComponent"



Window {
    id: root
    width: 1280
    height: 720
    visible: true
    flags: Qt.Window | Qt.FramelessWindowHint
    //title: qsTr("Hello World")



    //标题
    WindowTitle{
        id:logTiele
        width: parent.width
        height: 50
    }

    Connections{
        target: logTiele

        onCloseWindow: {
            root.close()
        }

        onMinimized: {
            root.showMinimized()
        }


    }

    //视频流列表
    SignalListView{
        id:sigList
        width: parent.width/2
        height: parent.height -logTiele.height

        anchors.top: logTiele.bottom


    }

    //视频流信息
    SignalInfo{
        id:sigInfo
        width:parent.width/2
        height:sigList.height/2

        sigName:sigList.sigName
        sigUrl:sigList.sigUrl

        anchors.top: logTiele.bottom
        anchors.left: sigList.right
    }

    //视频流链接信息
    SignalConnectInfo{
        id:sigConnectInfo
        width:parent.width/2
        height:sigList.height/2
        dataMode: sigList.signalSourceObj

        anchors.top: sigInfo.bottom
        anchors.left: sigList.right
    }

//****

//    //"增加"操作模态对话框
//    Dialog {
//        id: dlgSignalInfo
//        //title: qsTr("视频流信息")
//        anchors.centerIn: parent

//        padding: 0 //默认含有间距
//        //模态
//        modal: true
//        closePolicy: Popup.CloseOnEscape

//        width: 400
//        height: 300


//        onAccepted: {
//            var itemName = signalSourceCtrl.name.trim();
//            var itemUrl = signalSourceCtrl.url.trim();
//            var itemHasAudioUrl = signalSourceCtrl.hasAudioUrl;
//            var itemAudioUrl = signalSourceCtrl.audioUrl.trim();
//            var itemMuteAudio = signalSourceCtrl.muteAudio;

//            if (itemName === "") return;
//            if (itemUrl === "") return;
//            if (itemHasAudioUrl && itemAudioUrl === "") return;

//            if (itemIndex < 0)
//            {
//                //console.log("signalList:", signalList);
//                signalList.append(itemName, itemUrl, itemHasAudioUrl, itemAudioUrl, itemMuteAudio);
//            }
//            else
//            {
//                mediaServer.removeStream(signalList.get(itemIndex).name);
//                signalList.set(itemIndex, itemName, itemUrl, itemHasAudioUrl, itemAudioUrl, itemMuteAudio);
//            }

//            mediaServer.addStream(itemName, itemUrl);
//            signalList.saveSettings();
//            console.log("itemName: ", itemName, "itemUrl: ", itemUrl);
//        }


//        //标题矩形
//        Rectangle{
//            id: titelRec
//            width: parent.width
//            height: parent.height/10
//            color: "#363d45"

//            Text {
//                id: titelText
//                text: qsTr("视频流信息")
//                font.family: "MicrosoftYaHei"
//                font.pixelSize: 14
//                font.bold: true
//                color: "#3ec6ff"

//                anchors.verticalCenter: parent.verticalCenter
//            }
//        }


//        property int itemIndex: -1
//        property alias name: signalSourceCtrl.name
//        property alias url: signalSourceCtrl.url
//        property alias hasAudioUrl: signalSourceCtrl.hasAudioUrl
//        property alias audioUrl: signalSourceCtrl.audioUrl
//        property alias muteAudio: signalSourceCtrl.muteAudio

//        SignalSourceCtrl {
//            id: signalSourceCtrl
//            width: parent.width
//            height: parent.height - titelRec.height

//            anchors.top: titelRec.bottom
//            //readonly: false
//        }

//        Button{
//            id: ctlOk
//            width: 80
//            height: 30

//            anchors.bottom: parent.bottom
//            anchors.bottomMargin: 10
//            anchors.right: titelRec.horizontalCenter
//            anchors.rightMargin: 10

//            contentItem: Text {
//                id: ctlButtonText
//                text: qsTr("确定")
//                font.family: "MicrosoftYaHei"
//                font.pixelSize:10
//                color: "#ffffff"

//                verticalAlignment: Text.AlignVCenter
//                horizontalAlignment: Text.AlignHCenter

//            }

//           background: Rectangle{
//               color: "#2889f4"
//           }

//           onClicked: {
//               //parent.accepted();
//               dlgSignalInfo.accept();
//           }
//        }

//        Button{
//            id: ctlCancel
//            width: 80
//            height: 30

//            anchors.bottom: parent.bottom
//            anchors.bottomMargin: 10
//            anchors.left: titelRec.horizontalCenter
//            anchors.leftMargin: 10

//            contentItem: Text {
//                id: ctlButtonText_2
//                text: qsTr("取消")
//                font.family: "MicrosoftYaHei"
//                font.pixelSize:10
//                color: "#ffffff"

//                verticalAlignment: Text.AlignVCenter
//                horizontalAlignment: Text.AlignHCenter
//            }

//           background: Rectangle{
//               color: "#2889f4"
//           }

//           onClicked: {
//               dlgSignalInfo.reject();
//           }
//        }
//    }

//    //"删除"操作 提示对话框
//    Dialog {
//           id: dlgPromptDelete
//           title: qsTr("操作提示")
//           width: 260
//           height: 160
//           //模态
//           modal: true
//           closePolicy: Popup.CloseOnEscape

//           anchors.centerIn: parent

//           property int itemIndex: -1

//           //standardButtons: Dialog.Ok | Dialog.Cancel
//           DialogButtonBox{
//               anchors.bottom: parent.bottom

//               //id:dialogBtnBox
//               Button {
//                   //text: qsTr("Save")
//                   id:delBtnOK
//                   //anchors.fill: parent
//                   DialogButtonBox.buttonRole: DialogButtonBox.AcceptRole

//                   anchors.bottom: dlgPromptDelete.Bottom
//                   anchors.left: dlgPromptDelete.Left

//                   background: Rectangle{
//                       color: "#2889f4"
//                   }

//                   contentItem: Text {
//                       id: delBtnOkText
//                       text: qsTr("确定")
//                       font.family: "MicrosoftYaHei"
//                       font.pixelSize:10
//                       color: "#ffffff"

//                       //水平和居中对齐
//                       verticalAlignment: Text.AlignVCenter
//                       horizontalAlignment: Text.AlignHCenter
//                  }

//               }
//               Button {
//                   id: delBtnCel
//                   DialogButtonBox.buttonRole: DialogButtonBox.DestructiveRole
//                   icon.source: "src/u0.png"
//                   display: AbstractButton.IconOnly

//                   background: Rectangle{
//                       color: "#2889f4"
//                   }

//                   contentItem: Text {
//                       id: delBtnCelText
//                       text: qsTr("取消")
//                       font.family: "MicrosoftYaHei"
//                       font.pixelSize:10
//                       color: "#ffffff"

//                       //水平和居中对齐
//                       verticalAlignment: Text.AlignVCenter
//                       horizontalAlignment: Text.AlignHCenter
//                  }
//               }

//               onAccepted: {
//                   console.log("del accepted action");
//                   mediaServer.removeStream(signalList.get(dlgPromptDelete.itemIndex).name);
//                   signalList.remove(dlgPromptDelete.itemIndex)
//                   signalList.saveSettings();

//                   var index = dlgPromptDelete.itemIndex;
//                   if (index >= signalList.count) index--;
//                   lstSignals.currentIndex = index;
//               }

//               onDiscarded:{
//                   console.log("del onDiscarded action");
//                   dlgPromptDelete.close()

//               }


////               Button{
////                   id: delBtnOK
////                   background: Rectangle{
////                       color: "#2889f4"
////                   }
////                   contentItem: Text {
////                       id: delBtnOkText
////                       text: qsTr("确定")
////                       font.family: "MicrosoftYaHei"
////                       font.pixelSize:10
////                       color: "#ffffff"

////                   }

////                   DialogButtonBox.buttonRole: DialogButtonBox.AcceptRole
////               }

////               Button{
////                   id: delBtnCel
////                   background: Rectangle{
////                       color: "#2889f4"
////                   }
////                   contentItem: Text {
////                       id: delBtnCelText
////                       text: qsTr("取消")
////                       font.family: "MicrosoftYaHei"
////                       font.pixelSize:10
////                       color: "#ffffff"

////                   }

////                   DialogButtonBox.buttonRole: DialogButtonBox.RejectRole
////               }

////               background: Rectangle{
////                   color: "#2889f4"
////               }
////               contentItem:Text{
////                   color: "#ffffff"
////               }
//               //font.family: "Times"
//               //standardButtons: DialogButtonBox.Ok | DialogButtonBox.Cancel
//           }

////           onAccepted: {
////               console.log("del accepted action");
////               mediaServer.removeStream(signalList.get(itemIndex).name);
////               signalList.remove(itemIndex)
////               signalList.saveSettings();

////               var index = itemIndex;
////               if (index >= signalList.count) index--;
////               lstSignals.currentIndex = index;
////           }
//       }

//    Menu{
//        id:logMenu

//        Loader { id: regPageLoader }

//        Connections{
//            target: regPageLoader.item

//            onCloseDialog:{
//                //console.log("bbb")
//                regPageLoader.source = ""
//            }
//        }

//        MenuItem {
//            text: "注册"
//            //shortcut: "Ctrl + a"

//            onClicked: {
//              regPageLoader.source = "RegisterPage.qml"

//            }
//        }

//        MenuItem {
//            text: "退出"
//            onClicked: {
//                root.close()
//            }
//        }
//    }

//    //title
//    Rectangle{
//        id:winTitel
//        width: parent.width
//        height: 50
//        color: "#1b1b1b"

//        Image{
//            id:titelLog
//            source: "src/winTitle.png"

//            fillMode:Image.Stretch

//            MouseArea{
//                acceptedButtons: Qt.LeftButton | Qt.RightButton

//                anchors.fill: parent

//                onClicked: {
//                    if(mouse.button == Qt.RightButton)
//                    {
//                        logMenu.popup()
//                    }
//                }

//            }


//        }

//        Button{
//            id: closeWin
//            width: 30
//            height: 20
//            icon.source: "src/close.png"
//            icon.color: "White"
//            display: AbstractButton.IconOnly
//            background: Rectangle {
//                color: "Transparent"
//            }

//            anchors.right: parent.right
//            anchors.verticalCenter: parent.verticalCenter
//            anchors.rightMargin: 10


//            onClicked: {
//                root.close()

//            }

//        }

//        Button{
//            id: minimize
//            width: 30
//            height: 20
//            icon.source: "src/minimize.png"
//            icon.color: "White"
//            display: AbstractButton.IconOnly
//            background: Rectangle {
//                color: "Transparent"
//            }

//            anchors.right: closeWin.left
//            anchors.rightMargin: 10
//            anchors.verticalCenter: parent.verticalCenter

//            onClicked: {
//                root.showMinimized()
//            }

//        }
//    }

//    //视频流列表
//    Rectangle{
//        id:signalListRoot
//        width:root.width/4
//        height: root.height
//        color: "#272e36"

//        anchors.top: winTitel.bottom

//        Rectangle{
//            id: sinnalListTitel
//            width: parent.width
//            height: parent.height / 8
//            color: "#272e36"



//            Text {
//                id: sinnalListText
//                text: qsTr("视频流列表")
//                color: "#afbecb"
//                font.pixelSize : 20
//                font.bold: true //粗体
//                font.family: "MicrosoftYaHei"

//                anchors.verticalCenter: parent.verticalCenter

//            }

//            Button{
//                id:addSinnalButt
//                //text:"添加"
//                //icon.name: "list-add"
//                width:30
//                height: 30
//                icon.source: "src/u4.png"
//                icon.color: "White"
//                display: AbstractButton.IconOnly
//                background: Rectangle {
//                    color: "Transparent"
//                }

//                anchors.right: parent.right
//                anchors.verticalCenter: parent.verticalCenter

//                onClicked: {
//                    dlgSignalInfo.itemIndex = -1;
//                    dlgSignalInfo.name = null;
//                    dlgSignalInfo.url = null;
//                    dlgSignalInfo.hasAudioUrl = false;
//                    dlgSignalInfo.audioUrl = null;
//                    dlgSignalInfo.muteAudio = false;
//                    dlgSignalInfo.open();
//                }

//            }
//        }


//        //数据列表
//        ListView{
//            id: lstSignals
//            width: parent.width
//            height: parent.height - sinnalListTitel.height
//            anchors.top: sinnalListTitel.bottom

//            //spacing: root.spacing
//            //anchors.margins: root.padding

//            model: signalList

//            focus: true

//            property QtObject activeItem : currentIndex >= 0 ? signalList.get(currentIndex) : null;

//            delegate: Rectangle {
//                width: ListView.view.width
//                height: 40

//                //color: ListView.isCurrentItem?"#D0D0D0":"transparent"
//                color: ListView.isCurrentItem?"#2889F4":"#363D45"
//                border.color: Qt.lighter(color, 1.1)

//                MouseArea {
//                    anchors.fill: parent
//                    onClicked: {
//                        lstSignals.currentIndex = index;
//                    }
//                }


//                Text {
//                    //anchors.centerIn: parent
//                    anchors.verticalCenter: parent.verticalCenter
//                    anchors.left: parent.left
//                    anchors.leftMargin: 20
//                    text: model.name
//                    font.family: "MicrosoftYaHei"
//                    font.pixelSize : 16
//                    color: "#ffffff"
//                }

//                Button{
//                    id:btnRemove
//                    //text: "删除"
//                    //width: parent.width/4
//                   // height: parent.height/2
//                    width:30
//                    height: 30
//                    icon.source: "src/u0.png"
//                    icon.color: "White"
//                    display: AbstractButton.IconOnly
//                    background: Rectangle {
//                        color: "Transparent"
//                    }

//                    anchors.right: parent.right
//                    anchors.bottom: parent.bottom

//                    onClicked: {
//                        dlgPromptDelete.itemIndex = index
//                        dlgPromptDelete.text = "确实要删除 [" + signalList.get(index).name + "] 吗？";
//                        dlgPromptDelete.open()
//                    }
//                }

//                Button{
//                    id:btnModify
//                    //text: "修改"
//                    //width: parent.width/4
//                    //height: parent.height/2
//                    width:30
//                    height: 30
//                    icon.source: "src/u2.png"
//                    icon.color: "White"
//                    display: AbstractButton.IconOnly
//                    background: Rectangle {
//                        color: "Transparent"
//                    }

//                    anchors.right: btnRemove.left
//                    anchors.bottom: parent.bottom
//                    anchors.rightMargin: 10

//                    onClicked: {
//                        var signalSource = signalList.get(lstSignals.currentIndex);
//                        dlgSignalInfo.name = signalSource.name;
//                        dlgSignalInfo.url = signalSource.url;
//                        dlgSignalInfo.itemIndex = lstSignals.currentIndex;
//                        dlgSignalInfo.hasAudioUrl = signalSource.hasAudioUrl;
//                        dlgSignalInfo.audioUrl = signalSource.audioUrl;
//                        dlgSignalInfo.muteAudio = signalSource.muteAudio;
//                        dlgSignalInfo.open();

//                    }

//                }

//            }

//        }

//    }

//    //视频流信息
//    Rectangle{
//        id: signalInfoRoot
//        width: root.width * 3/4
//        height: root.height * 2/5
//        color: "#1e1e1e"

//        anchors.top: winTitel.bottom
//        anchors.left:signalListRoot.right

//        Canvas{
//            id: titelLine
//            width: parent.width
//            height: parent.height/6
//            onPaint: {
//                var ctx = getContext("2d");
//                ctx.fillStyle ="#222";           // 设置画笔属性
//                ctx.strokeStyle = "#666";
//                ctx.lineWidth = 2

//                ctx.beginPath();                  // 开始一条路径
//                ctx.moveTo(0 ,height);         // 移动到指定位置
//                ctx.lineTo(width, height);
//                ctx.stroke();

//                //ctx.

//            }
//        }

//        Text {
//            id: signalInfoTitel
//            text: qsTr("视频流信息")
//            color: "#afbecb"
//            font.pixelSize : 20
//            font.bold: true //粗体
//            font.family: "MicrosoftYaHei"
//            x: 20
//            y: 10

////            anchors.top: parent.top
////            anchors.left: parent.left
////            anchors.topMargin: 10
////            anchors.leftMargin: 10


//        }

//        Text {
//            id: tbSignalName
//            text: qsTr("流名称：")
//            color: "#afbecb"
//            font.pixelSize : 16
//            //font.bold: true //粗体
//            font.family: "MicrosoftYaHei"

//            anchors.top:titelLine.bottom
//            anchors.topMargin: 20
//            anchors.left: parent.left
//            anchors.leftMargin: 20
//            //x: parent.x + 50
//            //y: parent.height / 4 - (height/2)


//        }

//        TextField {
//            id: txtSignalName
//            height: tbSignalName.height + 10
//            text: lstSignals.activeItem.name

//            anchors.verticalCenter: tbSignalName.verticalCenter
//            anchors.left: tbSignalName.right
//            anchors.right: parent.right
//            anchors.rightMargin: 50

//            //readOnly: root.readonly
//        }

//        Text {
//            id: tbSignalUrl
//            text: qsTr("流地址：")
//            color: "#afbecb"
//            font.pixelSize : 16
//            font.family: "MicrosoftYaHei"

//            //y:parent.height * 3 / 4 - (height /2)

//            anchors.top: tbSignalName.bottom
//            anchors.topMargin: 50
//            anchors.left: parent.left
//            anchors.leftMargin: 20
//            //anchors.right: tbSignalName.right

//           //anchors.topMargin: 20

//        }

//        TextField {
//            id: txtSignalUrl
//            height: txtSignalName.height
//            text: lstSignals.activeItem.url

//            anchors.verticalCenter: tbSignalUrl.verticalCenter
//            anchors.left: tbSignalUrl.right
//            anchors.right: parent.right
//            anchors.rightMargin: 50

//            //readOnly: root.readonly
//        }


//    }

//    //视频流链接信息
//    Rectangle{
//        id: connectInfoRoot
//        width: root.width * 3/4
//        height: root.height - signalInfoRoot.height
//        color: "#1b1b3a"

//        anchors.top: signalInfoRoot.bottom
//        anchors.left:signalListRoot.right


//        //划线
//        Canvas{
//            id: infoTitelCanvas
//            width: parent.width
//            height: parent.height/7

//            Text {
//                id: connectInfoTitel
//                text: qsTr("视频流链接信息")
//                color: "#afbecb"
//                font.pixelSize : 20
//                font.bold: true //粗体
//                font.family: "MicrosoftYaHei"
//                //x: infoTitelLine
//                y: 20

//                anchors.verticalCenter: parent.verticalCenter
//                anchors.leftMargin: 10

//            }

//            onPaint: {
//                var ctx = getContext("2d");
//                //var line_y = connectInfoTitel.y + connectInfoTitel.font.pixelSize +10

//                //console.log("width:", height, "line_y:", line_y)
//                ctx.fillStyle ="#222";           // 设置画笔属性
//                ctx.strokeStyle = "#666";
//                ctx.lineWidth = 4
//                ctx.beginPath();                  // 开始一条路径
//                ctx.moveTo(0 ,infoTitelCanvas.height);         // 移动到指定位置
//                ctx.lineTo(width, infoTitelCanvas.height);
//                ctx.stroke();
//            }

//        }

//        Rectangle{
//            id: infoTile_name
//            width: parent.width/5 * 3
//            height: 20
//            color: "#5f5f5f"

//            anchors.top:infoTitelCanvas.bottom
//            anchors.topMargin: 10


//            Text {
//                id: infoName
//                text: qsTr("名称")
//                color: "#ffffff"
//                font.pixelSize : 12
//                font.family: "MicrosoftYaHei"

//                anchors.centerIn: parent

//            }
//        }

//        Rectangle{
//            id: infoTile_time
//            width: parent.width - infoTile_name.width
//            height: infoTile_name.height
//            color: "#5f5f5f"
//            //anchors.top:infoTitelLine.bottom
//            anchors.verticalCenter: infoTile_name.verticalCenter
//            anchors.left: infoTile_name.right
//            anchors.leftMargin: 2


//            Text {
//                id: infoTime
//                text: qsTr("时间")

//                color: "#ffffff"
//                font.pixelSize : 12
//                font.family: "MicrosoftYaHei"

//                anchors.centerIn: parent
//            }
//        }

//        TableView {
//            anchors.fill: parent
//            //columnSpacing: root.spacing
//            //rowSpacing: root.spacing
//            clip: true

//            anchors.top: infoTile_name.bottom

//            model: lstSignals.activeItem.clients

//            delegate: Rectangle{
//                id:columnRec
//                width: 400
//                height: 40

//                //anchors.top: infoTile_name.bottom

//                 Text {
//                     id: connName
//                     //width: infoTile_name.width
//                     //height: parent.height
//                     width: 200
//                     height:40
//                     color: "#ffffff"

//                     text: model.name
//                 }

//                 Text {
//                     id: connTime
//                     //width: connectInfoRoot.width - infoTile_name.width
//                     //height: parent.height
//                     width: 200
//                     height:40
//                     color: "#ffffff"
//                     text: model.connectTime

//                     anchors.left: connName.right
//                     anchors.verticalCenter: connName.verticalCenter
//                 }

//             }

//            Timer {
//                id: updateClientTimer
//                interval: 500
//                repeat: true
//                triggeredOnStart: true
//                onTriggered:  mediaServer.updateSignalClient(lstSignals.currentIndex)
//            }

//            Component.onCompleted: updateClientTimer.start();
//            Component.onDestruction: updateClientTimer.stop();

//        }

//    }


}



//        DialogButtonBox {
//            anchors.bottom: parent.bottom
//            anchors.horizontalCenter: titelRec.horizontalCenter
//            width: 125
//            height: 25
//            background :Rectangle{
//                color: "#2889f4"
//            }
//            standardButtons: DialogButtonBox.Ok | DialogButtonBox.Cancel
//            onAccepted: console.log("Ok clicked")
//            onRejected: console.log("Cancel clicked")
//        }



