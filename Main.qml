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

  Title {
    id: title
  }

  PedalBoard {}
}
