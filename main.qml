import QtQuick 2.15
import QtQuick.Controls.Basic 2.15
import QtQuick.Window 2.15

ApplicationWindow {
    property color orange: "#FF5F1F"
    property int spacing: 10
    id: mainWindow
    width: 480
    height: 480
    flags: Qt.Window | Qt.CustomizeWindowHint | Qt.FramelessWindowHint
    visible: true
    title: qsTr("CoreMP135 UI")
    color: orange
    maximumHeight: height
    maximumWidth: width
    minimumHeight: height
    minimumWidth: width

    function buttonSize() {
        return 1;
    }

    menuBar: Rectangle {
        height: mainWindow.height/10
        color: "#ffffffff"
        Text {
            anchors.centerIn: parent
            text: "Bitcrush Testing"
            color: orange
            font.family: "Inter Tight"
            font.weight: Font.Bold
            font.letterSpacing: 1
            font.pointSize: spacing*2
            font.capitalization: Font.AllUppercase
            horizontalAlignment: Text.AlignHCenter
        }
    }

    footer: Rectangle {
        height: mainWindow.height/10
        color: "#ffffffff"
        PageIndicator {
            id: indicator
            count: swipeView.count
            currentIndex: swipeView.currentIndex
            anchors.bottom: parent.bottom
            anchors.horizontalCenter: parent.horizontalCenter
        }
    }

    SwipeView {
        id: swipeView

        currentIndex: 0
        anchors.fill: parent

        Item {
            id: firstPage
            Grid {
                anchors.centerIn: parent
                rows: 2
                columns: 2
                spacing: mainWindow.spacing

                Repeater {
                    model: 4
                    delegate: Button {
                        width: (Math.min(firstPage.width, firstPage.height)-(mainWindow.spacing*3))/2
                        height: width
                        text: (index + 1).toString()
                        font.family: "Inter Tight"
                        font.pointSize: 80
                        background: Rectangle {
                            border.color: "white"
                            border.width: 2
                            radius: 4
                            color: parent.pressed ? "white" : "transparent"
                        }
                        contentItem: Text {
                            text: parent.text
                            font: parent.font
                            color: parent.pressed ? orange : "white"
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
                        }
                    }
                }
            }
        }
        Item {
            id: secondPage
        }
    }
}
