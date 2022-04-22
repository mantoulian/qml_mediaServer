import QtQuick 2.12
import QtQuick.Controls 2.5


Dialog {
    id: root
    width: 800
    height: 600
    padding: 0

    default property alias contentChild: root.contentChildren
    property alias accept_Btn: acceptBtn
    property alias reject_Btn: rejectBtn
    property bool autoOpen: true

    signal closeDialog()

//关闭对话框时,发送信号修改loader源(bug:写在这里会导致onAccepted不触发?)
//    onClosed: {
//        console.log("mydialog onClosed action")
//        //closeDialog()
//    }

    Component.onCompleted: {
        if(autoOpen)
        {
            open()
        }
    }


    MyButton{
        id: acceptBtn
        contentText:"确定"
        contentFontColor:"#ffffff"
        backGroundColor:"blue"

        anchors.bottom: parent.bottom
        anchors.bottomMargin: 10
        anchors.right: parent.horizontalCenter
        anchors.rightMargin: 10

        onClicked: {
            root.accept()
            closeDialog()
        }
    }

    MyButton{
        id: rejectBtn
        contentText:"取消"
        contentFontColor:"#ffffff"
        backGroundColor:"blue"

        anchors.bottom: parent.bottom
        anchors.bottomMargin: 10
        anchors.left: parent.horizontalCenter
        anchors.leftMargin: 10

        onClicked: {
            root.reject()
            closeDialog()
        }
    }

}

//property alias showBaseRec:showBase
//default property alias content: contentRec.children
//property alias backgroundColor:


//            Button{
//            id: ctlOk
//            width: 80
//            height: 30
//            anchors.bottom: parent.bottom
//            anchors.bottomMargin: 10
//            anchors.right: parent.horizontalCenter
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
//               root.accept();
//               //closeDialog();
//           }
//        }
//            Button{
//            id: ctlCancel
//            width: 80
//            height: 30
//            anchors.bottom: parent.bottom
//            anchors.bottomMargin: 10
//            anchors.left: parent.horizontalCenter
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
//               root.reject();
//               //closeDialog();
//           }
//        }

