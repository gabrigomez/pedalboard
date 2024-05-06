import QtQuick

Window {
  width: 1500
  height: 600
  visible: true
  title: qsTr("PedalBoard")

  color: "gray"

  Text {
    id: title
    anchors {
      horizontalCenter: parent.horizontalCenter
      top: parent.top
      topMargin: 20
    }
    text: "Pedalboard"
    font.pixelSize: 40
    font.bold: true
  }
}
