import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQml 2.12
import "BaseComponent"

//删除视频流对话框
MyDialog {
    id: root
    title: qsTr("操作提示")
    width: 200
    height: 150
    //模态
    modal: true
    closePolicy: Popup.CloseOnEscape

    property alias infoText: displayInfo.text
    property int itemIndex: -1

    accept_Btn.contentText: "确定"
    reject_Btn.contentText: "取消"

    onAccepted:{
        if(null == signalList.get(itemIndex))
        {
            return;
        }
        console.log("index:", itemIndex, "sig:", signalList.get(itemIndex))
        mediaServer.removeStream(signalList.get(itemIndex).name);
        signalList.remove(itemIndex)
        signalList.saveSettings();

        var index = itemIndex;
        if (index >= signalList.count) index--;
        lstSignals.currentIndex = index;
    }


    Text {
        id: displayInfo
        text: qsTr("")

        anchors.centerIn: parent
    }


}


//    property alias  promptTxt: promptText.text
//    property alias  index: dlgPromptDelete.itemIndex

//    anchors.centerIn: parent

//    property int itemIndex: -1

//    Text {
//        id: promptText
//        text: qsTr("text")
//    }

//    //standardButtons: Dialog.Ok | Dialog.Cancel
//    DialogButtonBox{
//    anchors.bottom: parent.bottom

//    //id:dialogBtnBox
//    Button {
//    //text: qsTr("Save")
//    id:delBtnOK
//    //anchors.fill: parent
//    DialogButtonBox.buttonRole: DialogButtonBox.AcceptRole

//    anchors.bottom: dlgPromptDelete.Bottom
//    anchors.left: dlgPromptDelete.Left

//    background: Rectangle{
//    color: "#2889f4"
//    }

//    contentItem: Text {
//    id: delBtnOkText
//    text: qsTr("确定")
//    font.family: "MicrosoftYaHei"
//    font.pixelSize:10
//    color: "#ffffff"

//    //水平和居中对齐
//    verticalAlignment: Text.AlignVCenter
//    horizontalAlignment: Text.AlignHCenter
//    }

//    }

//    Button {
//    id: delBtnCel
//    DialogButtonBox.buttonRole: DialogButtonBox.DestructiveRole
//    icon.source: "src/u0.png"
//    display: AbstractButton.IconOnly

//    background: Rectangle{
//    color: "#2889f4"
//    }

//    contentItem: Text {
//    id: delBtnCelText
//    text: qsTr("取消")
//    font.family: "MicrosoftYaHei"
//    font.pixelSize:10
//    color: "#ffffff"

//    //水平和居中对齐
//    verticalAlignment: Text.AlignVCenter
//    horizontalAlignment: Text.AlignHCenter
//    }
//    }

//    onAccepted: {
//    //console.log("del accepted action");
//    if(null == signalList.get(dlgPromptDelete.itemIndex))
//    {
//    return;
//    }
//    mediaServer.removeStream(signalList.get(dlgPromptDelete.itemIndex).name);
//    signalList.remove(dlgPromptDelete.itemIndex)
//    signalList.saveSettings();

//    var index = dlgPromptDelete.itemIndex;
//    if (index >= signalList.count) index--;
//    lstSignals.currentIndex = index;
//    }

//    onDiscarded:{
//    //console.log("del onDiscarded action");
//    dlgPromptDelete.close()

//    }

//    }

