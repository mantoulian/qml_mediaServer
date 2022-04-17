import QtQuick 2.9
import QtQuick.Controls 2.5


Item {
    id: root

    property alias name: txtSignalName.text
    property alias url: txtSignalUrl.text

    property int padding: 2
    property bool readonly: false

    Text {
        id: tbSignalName
        x: root.padding + 50
        y: root.padding
        text: qsTr("流名称：")
    }

    TextField {
        id: txtSignalName
        height: tbSignalName.height + 10

        anchors.verticalCenter: tbSignalName.verticalCenter
        anchors.left: tbSignalName.right
        anchors.right: parent.right

        anchors.margins: root.padding

        readOnly: root.readonly
    }


    Text {
        id: tbSignalUrl

        anchors.top: tbSignalName.bottom
        anchors.right: tbSignalName.right

        anchors.topMargin: 20
        text: qsTr("流地址：")
    }

    TextField {
        id: txtSignalUrl
        height: txtSignalName.height

        anchors.verticalCenter: tbSignalUrl.verticalCenter
        anchors.left: tbSignalUrl.right
        anchors.right: parent.right

        anchors.margins: root.padding

        readOnly: root.readonly
    }
}
