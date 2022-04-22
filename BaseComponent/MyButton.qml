import QtQuick 2.12
import QtQuick.Controls 2.5
import "ConfigQml.js" as Base_config

Button{
    id: root
    //width: 80
    //height: 30
    width:Base_config.buttonWidth
    height:Base_config.buttonHeight

    //内容,字体(大小,颜色,字体,加粗)
    property alias textItem: buttonText //别名导出text实例
    property alias contentText: buttonText.text
    property alias contentFont: buttonText.font.family
    property alias contentFontSize: buttonText.font.pixelSize
    property alias contentFontBold: buttonText.font.bold
    property alias contentFontColor: buttonText.color
    property alias backGroundColor: backGroundRec.color

    contentItem: Text {
        id: buttonText
        text: qsTr("取消")
        font.family: "MicrosoftYaHei"
        font.pixelSize:10
        color: "#ffffff"

        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
    }

   background: Rectangle{
       id:backGroundRec
       color: "#2889f4"
   }


}

