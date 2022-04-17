import QtQuick 2.5
import QtQuick.Controls 2.5

Dialog {
    id: root
    width: 800
    height: 600

    padding: 0

    //property bool auto_open : true
    signal closeDialog()

    //关闭对话框时,发送信号修改loader源
    onClosed: {
        closeDialog()
    }

    Component.onCompleted: {
       open()
    }


    MyShowBase{
        id: showBase
        width: parent.width
        height: parent.height


        contentRec{

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
               root.accept();
               //closeDialog();
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
               //closeDialog();
           }
        }

        }
    }

}
