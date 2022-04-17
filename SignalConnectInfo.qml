import QtQuick 2.12
import QtQml 2.12
import QtQuick.Controls 2.12


//视频流链接信息
Item {
    id:root
    width:800
    height:600

    Rectangle{
        id: connectInfoRoot
        //width: root.width * 3/4
        //height: root.height / 2
        color: "#1b1b3a"

        anchors.fill: parent
        //anchors.top: signalInfoRoot.bottom
        //anchors.left: signalListRoot.right


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

        Rectangle{
            id: infoTile_time
            width: parent.width - infoTile_name.width
            height: infoTile_name.height
            color: "#5f5f5f"
            //anchors.top:infoTitelLine.bottom
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



    }


}
