import QtQuick 2.12
import QtQml 2.12
import Com.ItSync.MediaServer 1.0
//import QtQuick.Controls 1.4

Item{



TableView {

    id:dpTable
    //anchors.fill: parent
    //columnSpaci root.spacing
    //rowSpacing: root.spacing
    //clip: true
    model: lstSignals.activeItem.clients
    //SysTableTextColumnsHeaderDelegate();


    delegate: displayDelegate


//    rowDelegate: Rectangle {
//        width: parent.width
//        height: 40
//    }


//    TableViewColumn {
//        role: "name"
//        title: qsTr("名称")
//        width: 200
//        resizable: false
//    }

//    TableViewColumn {
//        role: "connectTime"
//        title: qsTr("连接时间")
//        width: 300
//        resizable: false
//    }
}

    Component{
        id:displayDelegate

        Text{
            id:textDisplay1

        }

        Text{
            id:textDisplay2
        }

    }
}





