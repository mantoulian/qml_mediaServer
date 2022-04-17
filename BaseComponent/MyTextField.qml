import QtQuick 2.5
import QtQuick.Controls 2.5

Item {
    id:root
    width:800
    height:100

    property double textProportion: 0.3

    property alias textName: name
    property alias textFont: name.font.family
    property alias textFontSize: name.font.pixelSize
    property alias textFontBold: name.font.bold
    property alias textFontColor: name.color


    property alias textField: textField
    property alias textFieldTxt:textField.text

    Text {
        id: name
        width:parent.width * textProportion
        height: parent.height
        text: qsTr("text")
    }

    TextField{
        id:textField
        width: parent.width - name.width
        height: parent.height

        anchors.top: name.top
        anchors.left: name.right
    }


}
