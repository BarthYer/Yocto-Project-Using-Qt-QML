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

    color: "Lavender"

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

 /*   GridLayout {
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.margins: 10
        columns: 1
        anchors.fill: parent


        Rectangle{
            id: rectmenu
            Layout.fillWidth: true
            height: 60
            color: "#80DEEA"
            anchors.top: parent.top
            radius: 5
            Material.elevation: 6
           // Material.foreground: Material.Pink
            GridLayout{
                anchors.margins: 5
                columns: 3
                anchors.fill: parent
                columnSpacing: 5

                Rectangle {
                    id: telephoneLogo
                        width: 50
                        height: 50
                        color: "red"
                        radius: 5

                        Text {
                            id: textTele
                            text: qsTr("Tel")
                            font.family: "Bold"
                            font.pointSize: 10
                            anchors.horizontalCenter: parent.horizontalCenter
                            anchors.bottom: parent.bottom
                        }
                    }
                Rectangle {
                    id: documentationrec
                        width: 50
                        height: 50
                        color: "red"
                        radius: 5
                        Text {
                            id: textDoc
                            text: qsTr("Doc")
                            font.family: "Bold"
                            font.pointSize: 10
                            anchors.horizontalCenter: parent.horizontalCenter
                            anchors.bottom: parent.bottom
                        }
                    }
                Rectangle {
                    id: setuprec
                        width: 50
                        height: 50
                        color: "red"
                        radius: 5
                        Text {
                            id: textSet
                            text: qsTr("Setup")
                            font.family: "Bold"
                            font.pointSize: 10
                            anchors.horizontalCenter: parent.horizontalCenter
                            anchors.bottom: parent.bottom
                        }
                    }

            }

        }
    }*/

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
                color: "White"
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
                anchors.centerIn: parent
                color: "White"
            }
        }
        Rectangle{
            id: recHour
            width: 110
            height: 110
            color: "green"
            radius: 20
            Text {
                id: textHour
                text: qsTr("Hours")
                anchors.centerIn: parent
                color: "White"
            }

        }
        Rectangle{
            id: recAcc
            width: 110
            height: 110
            //color: "blue"
            radius: 20
            Text {
                id: textAcc
                text: qsTr("Accelerometre")
                anchors.centerIn: parent
                color: "White"
            }
            Image {
                id: imageId
                anchors.fill: parent
                fillMode: Image.PreserveAspectFit
                source: "logo.png"
                width: parent.width
                height: parent.height
            }
        }
    }

}
