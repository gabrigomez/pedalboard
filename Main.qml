import QtQuick
import QtQuick.Controls

Window {
  id: root
  visible: true
  color: "gray"

  title: qsTr("PedalBoard")
  width: 1700
  height: 900

  Image {
    source: "https://wallpapercave.com/wp/NcdPGXX.jpg"
    width: root.width
    height: root.height
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
