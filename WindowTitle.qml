import QtQuick 2.12
import QtQml 2.12
import QtQuick.Controls 2.12


//主窗口标题
Rectangle {
    id: root
    width:800
    height:200
    color: "#1b1b1b"

    signal closeWindow()
    signal minimized()

    //标题右键菜单
    Menu{
        id:logMenu

        MenuItem {
            text: "注册"
            //shortcut: "Ctrl + a"
            Loader { id: regPageLoader }
            //链接关闭信号
            Connections{
                target: regPageLoader.item

                onCloseDialog: {
                    regPageLoader.source = ""
                }
            }

            onClicked: {
             regPageLoader.source = "RegisterPage.qml"
            }
        }

        MenuItem {
            text: "退出"
            onClicked: {
                root.closeWindow()
            }
        }
    }

    //log image
    Image{
        id:logImage
        source: "src/winTitle.png"

        fillMode:Image.Stretch

        MouseArea{
            acceptedButtons: Qt.LeftButton | Qt.RightButton

            anchors.fill: parent

            onClicked: {
                if(mouse.button == Qt.RightButton)
                {
                    logMenu.popup()
                }
            }

        }

    }

    Button{
        id: closeWin
        width: 30
        height: 20
        icon.source: "src/close.png"
        icon.color: "White"
        display: AbstractButton.IconOnly
        background: Rectangle {
            color: "Transparent"
        }

        anchors.right: parent.right
        anchors.verticalCenter: parent.verticalCenter
        anchors.rightMargin: 10

        onClicked: {
            root.closeWindow()
        }

    }

    Button{
            id: minimize
            width: 30
            height: 20
            icon.source: "src/minimize.png"
            icon.color: "White"
            display: AbstractButton.IconOnly
            background: Rectangle {
                color: "Transparent"
            }

            anchors.right: closeWin.left
            anchors.rightMargin: 10
            anchors.verticalCenter: parent.verticalCenter

            onClicked: {
                root.minimized()
            }

        }

}



//显示内容
//Rectangle{
//    id:backgroundRec
//    width: parent.width
//    height: parent.height
//    color: "#1b1b1b"
//}
