import QtQuick
import QtQuick.Controls

Window {
  id: root
  visible: true
  color: "gray"

  title: qsTr("PedalBoard")
  width: 1700
  height: 900

  Title {
    id: title
  }

  PedalBoard {}
}
