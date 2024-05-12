import QtQuick
import QtQuick.Controls

Window {
  id: root
  visible: true
  color: "gray"

  title: qsTr("PedalBoard")
  width: 1500
  height: 800

  Title {
    id: title
  }

  PedalBoard {}
}
