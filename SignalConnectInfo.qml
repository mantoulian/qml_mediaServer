import QtQuick 2.12
import QtQml 2.12
import QtQuick.Controls 2.12


//视频流链接信息
Rectangle {
    id:root
    width:800
    height:600
    color: "#1b1b3a"

    property QtObject dataMode: null


    //划线
    Canvas{
        id: infoTitelCanvas
        width: parent.width
        height: parent.height/6

        Text {
            id: connectInfoTitel
            text: qsTr("视频流链接信息")
            color: "#afbecb"
            font.pixelSize : 20
            font.bold: true //粗体
            font.family: "MicrosoftYaHei"
            //x: infoTitelLine
            //y: 10

            anchors.verticalCenter: parent.verticalCenter
            anchors.leftMargin: 10

        }

        onPaint: {
            var ctx = getContext("2d");
            var line_y = connectInfoTitel.y + connectInfoTitel.font.pixelSize +5

            //console.log("width:", height, "line_y:", line_y)
            ctx.fillStyle ="#222";           // 设置画笔属性
            ctx.strokeStyle = "#666";
            ctx.lineWidth = 1
            ctx.beginPath();                  // 开始一条路径
            ctx.moveTo(0 ,line_y);         // 移动到指定位置
            ctx.lineTo(width, line_y);
            ctx.stroke();
        }

    }

    //副标题名称
    Rectangle{
        id: infoTile_name
        width: parent.width/5 * 3
        height: 20
        color: "#5f5f5f"
        anchors.top:infoTitelCanvas.bottom

        Text {
            id: infoName
            text: qsTr("名称")
            color: "#ffffff"
            font.pixelSize : 12
            font.family: "MicrosoftYaHei"

            anchors.centerIn: parent
        }
    }

    //副标题时间
    Rectangle{
        id: infoTile_time
        width: parent.width - infoTile_name.width
        height: infoTile_name.height
        color: "#5f5f5f"
        anchors.verticalCenter: infoTile_name.verticalCenter
        anchors.left: infoTile_name.right
        anchors.leftMargin: 2


        Text {
            id: infoTime
            text: qsTr("时间")

            color: "#ffffff"
            font.pixelSize : 12
            font.family: "MicrosoftYaHei"

            anchors.centerIn: parent
        }
    }

    TableView {
        id:dataTable
        width: parent.width
        height:parent.height - (infoTile_name.y + infoTile_name.height)

        anchors.top: infoTile_name.bottom
        anchors.topMargin: 40
        anchors.fill: parent
        //columnSpacing: root.spacing
        //rowSpacing: root.spacing
        clip: true


        model: dataMode

        delegate: Rectangle{
            id:columnRec
            width: 400
            height: 40

            //anchors.top: infoTile_name.bottom

             Text {
                 id: connName
                 //width: infoTile_name.width
                 //height: parent.height
                 width: 200
                 height:40
                 color: "#ffffff"

                 text: dataMode.name
             }

             Text {
                 id: connTime
                 //width: connectInfoRoot.width - infoTile_name.width
                 //height: parent.height
                 width: 200
                 height:40
                 color: "#ffffff"
                 text: dataMode.connectTime

                 anchors.left: connName.right
                 anchors.verticalCenter: connName.verticalCenter
             }

         }

        Timer {
            id: updateClientTimer
            interval: 500
            repeat: true
            triggeredOnStart: true
            onTriggered:  mediaServer.updateSignalClient(lstSignals.currentIndex)
        }

        //Component.onCompleted: updateClientTimer.start();
        Component.onDestruction: updateClientTimer.stop();

    }

}
