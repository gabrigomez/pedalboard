import QtQuick
import QtQuick.Controls

Window {
  id: root
  width: 1700
  height: 900
  visible: true
  color: "gray"

  title: qsTr("PedalBoard")

  Image {
    width: root.width
    height: root.height
    source: "https://wallpapercave.com/wp/NcdPGXX.jpg"
  }

  TitleLine {
    anchors {
      top: title.top
      horizontalCenter: parent.horizontalCenter
    }
  }

  Title {
    id: title
  }

  TitleLine {
    width: parent.width / 1.8
    anchors {
      top: title.bottom
      horizontalCenter: parent.horizontalCenter
    }
  }

  PedalBoard {}
}
