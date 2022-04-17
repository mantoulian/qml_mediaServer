import QtQuick 2.5


Item {
    id: root
    width: 400
    height: 300

    property alias titleRecWidth: titleRec.width
    property alias titleRecHeight: titleRec.height
    property alias titleRecColor: titleRec.color
    property alias titleText: titleText.text
    property alias titleTextFontFamily: titleText.font.family
    property alias titleTextFontSize: titleText.font.pixelSize
    property alias titleTextFontBold: titleText.font.bold
    property alias titleTextFontColor: titleText.color

    property alias contentRec: contentRec
    property alias contentRecWidth: contentRec.width
    property alias contentRecHeight: contentRec.height
    property alias contentRecColor: contentRec.color

    //标题
    Rectangle{
        id: titleRec
        width: parent.width
        height: parent.height/7
        color: "#363d45"

        Text {
            id: titleText
            text: qsTr("text")
            font.family: "MicrosoftYaHei"
            font.pixelSize: 14
            font.bold: true
            color: "#3ec6ff"
        }

    }

    //内容
    Rectangle{
        id:contentRec
        width: parent.width
        height: parent.height - titleRec.height

        anchors.top:titleRec.bottom
    }

}
