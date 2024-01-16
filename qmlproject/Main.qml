import QtQuick
import QtQuick.Window
import QtQuick.Controls
import QtQuick.Layouts
import QtWebSockets 1.3
import QtQuick.Controls.Material

Window {
    id: rootWindow
    width: 500
    height: 300
    visible: true
    title: qsTr("MQTT Project")

    //color: "#607D8B"
    color:"#DCDCDC"

    function showState(val){
        console.log("State QML est :" + val);
    }

    //property
    property string stateOn: "ON"
    property string stateOff: "OFF"
    MenuBar {

            Material.theme: Material.Dark
            Material.foreground: Material.White
            Material.elevation: 6
            width: rootWindow.width
            Menu {
                title: "Help"

                MenuItem {
                    text: "How to connect"
                    onTriggered: console.log("Open action How to connect")
                }
                MenuItem {
                    text: "ERROR NAME"
                    onTriggered: console.log("Open action ERROR NAME")
                }
            }
    }

    GridLayout {

        anchors.top: parent.top
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.margins: 20
        anchors.topMargin: 70
        columns: 2

    Label {

        text: "User:"
        width: 100
        font.family: "Bold"
        font.pointSize: 12
    }

    TextField {
        id: userName
        width: 180
        height: 40
        placeholderText: "<Type your name>"

    }
    Label {

        text: "Password:"
        width: 100
        font.family: "Bold"
        font.pointSize: 12
    }

    TextField {
        id: password
        width: 180
        height: 40
        placeholderText: "<Your password>"

    }


 }
    Rectangle{
        id :rectLogin
        width: 195
        height: 20
        x:password.x+75
        y:password.y+140
        Text {
            id: textLogin
            anchors.centerIn: parent
            text: qsTr("Login")
        }
        color: "green"
        Loader {
                    id: loader
                    anchors.fill: parent
                    //visible: false
                }
        MouseArea{
            anchors.fill: parent
        onClicked: {
            console.log("Login Button clicked")
            var component = Qt.createComponent("Welcomepage.qml")
            var window    = component.createObject(rootWindow)
            window.show()
        }
        }
    }

    Rectangle{
        id: stateid
        x:rootWindow.width-50
        y:5
        width: 30
        height: 30
        radius: 25
        color: "red"
        Text {
            id: statetext
            text: stateOff
            font.family: "Bold"
            anchors.centerIn: parent
        }

        //verification of the state
        Connections {
                     target: c

                     onStatereceived: {
                         if(c.valeurState===2){
                            stateid.color= "green";
                            statetext.text = stateOn;
                         }else{
                             stateid.color= "red";
                             statetext.text = stateOff;
                         }


                     }
                 }

    }

    Rectangle{
        id: retval
        x:10
        y:150
        width: 60
        height: 30
        //anchors.centerIn: parent
        Text {
            id: textrecval
            text: qsTr("0")
            anchors.centerIn: parent
        }
        Connections{
            target: c
            onMessagereceived:{
                textrecval.text=c.message
            }
        }
    }

}
