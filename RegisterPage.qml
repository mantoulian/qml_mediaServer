import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Dialogs 1.3 as Dialog_1_3
import "BaseComponent"


MyDialog{
    id:root
    width: 800
    height: 600

    //property alias titleColor: titleBackground.color
    property double titlePos: 0.15
    property alias  titleText: titleTxt
    accept_Btn.contentText: "激活"
    reject_Btn.contentText: "取消"

    //背景
    background:Rectangle{
        color: "#1b1b1b"
        anchors.fill: parent
    }

    //save file dialog
   contentData:[
    Dialog_1_3.FileDialog {
        id: saveFileDialog
        title: "Please choose a file"
        nameFilters : ["(*.txt)"]
        selectExisting : false
        selectMultiple : false

        onAccepted: {
            var filename = saveFileDialog.fileUrl.toString()
            var filename_2 = filename.substring(6)
            var ret = MyQmlFile.WriteMachineCodeToFile(filename_2)
            console.log("ret:", ret, "filename_2:", filename_2)
            close()
        }

        onRejected: {
            close()
        }

    },

    Dialog_1_3.FileDialog {
       id: readFileDialog
       title: "Please choose a file"
       folder: shortcuts.home
       nameFilters : ["(*.srd)"]
       selectMultiple : false

       onAccepted: {
           var fileName = readFileDialog.fileUrl.toString()
           var index = fileName.lastIndexOf('/');
           var fileName_2 = fileName.substring(index + 1)
           console.log("f: ",fileName, "f_2: ", fileName_2, "index:", index)

           registerFileField.textFieldTxt = fileName_2
           close()
       }
       onRejected: {
           close()
       }
   }

]

    //title
    Rectangle{
        id:titleBackground
        width: parent.width
        height: parent.height * parent.titlePos
        color:"blue"

        Text {
            id: titleTxt
            text: qsTr("注册应用软件")
            font.family: "MicrosoftYaHei"
            font.pixelSize:24
            color: "#ffffff"
        }
    }

    MyTextField{
        id: registerCodeField
        width: parent.width
        height: 50
        textName.text:"zhuceshibiema"
        textFont: "MicrosoftYaHei"
        textFontSize: 20
        textFontColor: "#ffffff"

        Component.onCompleted: {
           textField.text = MyQmlFile.GetMachineCode()
        }

        anchors.top:titleBackground.bottom
        anchors.topMargin: 50
    }

    MyButton{
        id:saveCodeBtn
        width: 80
        height: 50
        textItem.text: "save code"

        anchors.right: registerCodeField.right
        anchors.top: registerCodeField.bottom
        anchors.topMargin: 20

        onClicked: {
            saveFileDialog.open()
        }
    }

    MyTextField{
        id: registerFileField
        width: parent.width
        height: 50
        textName.text:"zhucewenjianming"
        textFont: "MicrosoftYaHei"
        textFontSize: 20
        textFontColor: "#ffffff"


        anchors.top:saveCodeBtn.bottom
        anchors.topMargin: 50
    }

    MyButton{
        id:chooseFile
        width: 80
        height: 50
        textItem.text: "choose file"

        anchors.right: registerFileField.right
        anchors.top: registerFileField.bottom
        anchors.topMargin: 20

        onClicked: {
            readFileDialog.open()
        }
    }

}




//Dialog {
//    id:regPage
//    width:800
//    height:600
//    //title: "注册应用软件"
//    //模态
//    modal: true
//    closePolicy: Popup.CloseOnEscape

//    anchors.centerIn: parent
//    padding: 20




//    Component.onCompleted: {
//        open()
//    }

//    signal closeDialog()

//    //标题
//    Rectangle{
//        id :titleRec
//        width: parent.width
//        height: parent.height/10
//        color: "#363d45"

//        Text {
//            id: titelText
//            text: qsTr("注册应用软件")
//            font.family: "MicrosoftYaHei"
//            font.pixelSize: 14
//            font.bold: true
//            color: "#3ec6ff"

//            anchors.verticalCenter: parent.verticalCenter
//        }
//    }


////    Dialog_1_3.FileDialog {
////        id: fileDialog
////        title: "chose file"
////        folder: shortcuts.home
////        selectExisting: false
////        selectMultiple: false
////        onAccepted: {
////            console.log("You chose: " + fileDialog.fileUrls)
////            Qt.quit()
////        }
////        onRejected: {
////            console.log("Canceled")
////            Qt.quit()
////        }
////        //Component.onCompleted: visible = true
////    }

//    //文件对话框(保存注册码)
//    Dialog_1_3.FileDialog {
//        id: saveFileDialog
//        title: "Please choose a file"
//        //folder: shortcuts.home
//        nameFilters : ["(*.txt)"]
//        selectExisting : false
//        selectMultiple : false

//        onAccepted: {
//            var filename = saveFileDialog.fileUrl.toString()
//            var filename_2 = filename.substring(6)
//            var ret = MyQmlFile.WriteMachineCodeToFile(filename_2)
//            console.log("ret:", ret, "filename_2:", filename_2)
//            close()
//        }
//        onRejected: {
//            close()
//        }

//    }



//    Text {
//        id: regCode
//        //x: regPage.padding + 50
//        //y: regPage.padding
//        font.family: "MicrosoftYaHei"
//        font.pixelSize: 10
//        color: "#ffffff"
//        text: qsTr("注册识别码")

//        anchors.top: titleRec.bottom
//        anchors.topMargin: 40

//    }

//    TextField {
//        id: txtRegCode
//        //height: 10


//        anchors.verticalCenter: regCode.verticalCenter
//        anchors.left: regCode.right
//        anchors.right: parent.right
//        anchors.margins: regPage.padding

//        Component.onCompleted: {
//           placeholderText = MyQmlFile.GetMachineCode()

//        }

//        //readOnly: regPage.readonly
//    }

//    Button{
//        id:saveRegCode
//        text:"保存识别码"

//        anchors.top: txtRegCode.bottom
//        anchors.topMargin: 20
//        anchors.right: txtRegCode.right


//        onClicked: {
//            saveFileDialog.open()
//        }
//    }

//    Text {
//        id: regFileName
//        //x: regPage.padding + 50
//        //y: regPage.padding
//        font.family: "MicrosoftYaHei"
//        font.pixelSize: 10
//        color: "#ffffff"
//        text: qsTr("注册文件名")

//        anchors.top: saveRegCode.bottom
//        anchors.topMargin: 80

//    }

//    TextField {
//        id: txtRegFile
//        //height: regNum.height + 10

//        anchors.verticalCenter: regFileName.verticalCenter
//        anchors.left: regFileName.right
//        anchors.right: parent.right
//        anchors.margins: regPage.padding

//        //readOnly: regPage.readonly
//    }

//    //文件对话框(read file)
//    Dialog_1_3.FileDialog {
//        id: readFileDialog
//        title: "Please choose a file"
//        folder: shortcuts.home
//        nameFilters : ["(*.srd)"]
//        selectMultiple : false

//        onAccepted: {
//            var fileName = readFileDialog.fileUrl.toString()
//            var index = fileName.lastIndexOf('/');
//            var fileName_2 = fileName.substring(index + 1)
//            console.log("f: ",fileName, "f_2: ", fileName_2, "index:", index)

//            txtRegFile.placeholderText = fileName_2
//            close()
//        }
//        onRejected: {
//            close()
//        }

//    }

//    Button{
//        id:saveRegFile
//        text:"选择系统注册文件"

//        anchors.top: txtRegFile.bottom
//        anchors.topMargin: 20
//        anchors.right: txtRegFile.right

//        onClicked: {
//            readFileDialog.open()
//        }
//    }

//    Button{
//        id:activation
//        text: "激活"

//        anchors.bottom: parent.bottom
//        anchors.bottomMargin: 20
//        anchors.right: parent.horizontalCenter
//        anchors.rightMargin: 60
//    }

//    Button{
//        id:cancel
//        text: "取消"

//        anchors.bottom: parent.bottom
//        anchors.bottomMargin: 20
//        anchors.left: parent.horizontalCenter
//        anchors.leftMargin: 60

//        onClicked: {
//            regPage.close()
//            closeDialog()
//        }
//    }


//}

