import QtQuick
import QtQuick.Window
import QtQuick.Controls
import QtQuick.Layouts
import QtWebSockets 1.3
import QtQuick.Controls.Material

Window {
    width: 500
    height: 300
    visible: true
    title: qsTr("MQTT Project")

    color: "white"

    MenuBar {

            Material.theme: Material.Dark
            Material.foreground: Material.White
            Material.elevation: 6
            width: parent.width

            Menu {
                title: "File"

                MenuItem {
                    text: "Open"
                    onTriggered: console.log("Open action triggered")
                }
                MenuItem {
                    text: "Save"
                    font.family: "Bold"
                    onTriggered: console.log("Save action triggered")

                }
                MenuSeparator{}
                MenuItem {
                    text: "Exit"
                    font.family: "Bold"
                    onTriggered: Qt.quit()
                }
            }
            Menu {
                title: "Contact"
                MenuItem {
                    text: "Telephone"
                    font.family: "Bold"
                    onTriggered: console.log("User take Your number")
                }
                MenuItem {
                    text: "Email"
                    onTriggered: console.log("User Send Email")
                }
                MenuItem {
                    text: "Comment"
                    font.family: "Bold"
                    onTriggered: console.log("User want to comment")
                }
            }
            Menu {
                title: "Edit"
                MenuItem {
                    text: "ChangeColor"
                    font.family: "Bold"
                    onTriggered: console.log("Color Setting")
                }
                MenuItem {
                    text: "UpdateScreen"
                    font.family: "Bold"
                    onTriggered: console.log("Update Screen")
                }

            }
            Menu {
                title: "Doc"
                MenuItem {
                    text: "Datasheet"
                    font.family: "Bold"
                    onTriggered: console.log("Go to datasheet")
                }
                MenuItem {
                    text: "Reference"
                    font.family: "Bold"
                    onTriggered: console.log("Reference")
                }

            }
            Menu {
                title: "Help"
                MenuItem {
                    text: "Support"
                    font.family: "Bold"
                    onTriggered: console.log("Support")
                }

            }
    }


    GridLayout{
        id: gridlayoutid
        anchors.margins: 20
        columns: 2
        // anchors.centerIn: parent
        anchors.bottom: parent.bottom
        //anchors.top: parent.top
        anchors.horizontalCenter: parent.horizontalCenter
        y:150

        Rectangle{
            id: recTemp
            width: 110
            height: 110
            color: "blue"
            radius: 20
            Text {
                id: textTemperature
                text: qsTr("Temperature")
                anchors.centerIn: parent
                font.family: "Bold"
                font.pointSize: 12
                color: "black"
            }
            scale: 0.5
            gradient: Gradient{
                GradientStop{
                    position: 0.0;color: "green"
                }
                GradientStop{
                    position: 0.5;color: "Yellow"
                }
                GradientStop{
                    position: 1.0;color: "red"
                }
            }
        }

        Rectangle{
            id: recHumid
            width: 110
            height: 110
            color: "green"
            radius: 20
            Text {
                id: textHumid
                text: qsTr("Humidity")
                font.family: "Bold"
                font.pointSize: 12
                anchors.centerIn: parent
                color: "black"
            }
            gradient: Gradient{
                GradientStop{
                    position: 0.0;color: "blue"
                }
                GradientStop{
                    position: 0.5;color: "white"
                }
                GradientStop{
                    position: 1.0;color: "#77B5FE"
                }
            }
        }
        Rectangle{
            id: recHour
            width: 110
            height: 110
            //color: "green"
            radius: 20
            Text {
                id: textHour
                text: qsTr("Hours")
                font.family: "Bold"
                font.pointSize: 12
                anchors.centerIn: parent
                color: "black"
            }
            gradient: Gradient{
                GradientStop{
                    position: 0.0;color: "#77B5FE"
                }
                GradientStop{
                    position: 0.5;color: "white"
                }
                GradientStop{
                    position: 1.0;color: "blue"
                }
            }

        }
        Rectangle{
            id: recAcc
            width: 110
            height: 110
            color: "blue"
            radius: 20
            Text {
                id: textAcc
                text: qsTr("Accelerometre")
                font.family: "Bold"
                font.pointSize: 12
                anchors.centerIn: parent
                color: "black"
            }
            gradient: Gradient{
                GradientStop{
                    position: 0.0;color: "red"
                }
                GradientStop{
                    position: 0.5;color: "white"
                }
                GradientStop{
                    position: 1.0;color: "black"
                }
            }

        }
    }

}
