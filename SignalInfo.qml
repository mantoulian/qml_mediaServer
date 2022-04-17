import QtQuick 2.12
import QtQml 2.12
import QtQuick.Controls 2.12
//import "SignalListView.qml"

Item {
    id: root
    width: 400
    height: 300

    property string sigName
    property string sigUrl


    Rectangle{
        id: signalInfoRoot
        //width: root.width * 3/4
        //height: root.height * 2/5
        color: "#1e1e1e"

        anchors.fill: parent
        //anchors.top: winTitel.bottom
        //anchors.left:signalListRoot.right

        Canvas{
            id: titelLine
            width: parent.width
            height: parent.height/6
            onPaint: {
                var ctx = getContext("2d");
                ctx.fillStyle ="#222";           // 设置画笔属性
                ctx.strokeStyle = "#666";
                ctx.lineWidth = 2

                ctx.beginPath();                  // 开始一条路径
                ctx.moveTo(0 ,height);         // 移动到指定位置
                ctx.lineTo(width, height);
                ctx.stroke();

            }
        }

        Text {
            id: signalInfoTitel
            text: qsTr("视频流信息")
            color: "#afbecb"
            font.pixelSize : 20
            font.bold: true //粗体
            font.family: "MicrosoftYaHei"
            x: 20
            y: 10
        }

        Text {
            id: tbSignalName
            text: qsTr("流名称：")
            color: "#afbecb"
            font.pixelSize : 16
            //font.bold: true //粗体
            font.family: "MicrosoftYaHei"

            anchors.top:titelLine.bottom
            anchors.topMargin: 20
            anchors.left: parent.left
            anchors.leftMargin: 20
            //x: parent.x + 50
            //y: parent.height / 4 - (height/2)


        }

        TextField {
            id: txtSignalName
            height: tbSignalName.height + 10
            //text: lstSignals.activeItem.name
            text:sigName

            anchors.verticalCenter: tbSignalName.verticalCenter
            anchors.left: tbSignalName.right
            anchors.right: parent.right
            anchors.rightMargin: 50

            //readOnly: root.readonly
        }

        Text {
            id: tbSignalUrl
            text: qsTr("流地址：")
            color: "#afbecb"
            font.pixelSize : 16
            font.family: "MicrosoftYaHei"

            //y:parent.height * 3 / 4 - (height /2)

            anchors.top: tbSignalName.bottom
            anchors.topMargin: 50
            anchors.left: parent.left
            anchors.leftMargin: 20
            //anchors.right: tbSignalName.right

           //anchors.topMargin: 20

        }

        TextField {
            id: txtSignalUrl
            height: txtSignalName.height
            //text: lstSignals.activeItem.url
            text:sigUrl

            anchors.verticalCenter: tbSignalUrl.verticalCenter
            anchors.left: tbSignalUrl.right
            anchors.right: parent.right
            anchors.rightMargin: 50

            //readOnly: root.readonly
        }


    }


}
