import QtQuick
import QtQuick.Controls

Rectangle {
  signal addItem(string color)
  width: parent.width / 1.5
  height: 170
  color: "red"

  anchors {
    horizontalCenter: parent.horizontalCenter
  }

  ListView {
    id: listView
    anchors.fill: parent
    anchors.leftMargin: 10
    orientation: Qt.Horizontal
    spacing: 16

    model: ListModel {
      ListElement {
        color: "blue"
      }
    }

    delegate: Rectangle {
      color: model.color
      width: 100
      height: parent.height

      Button {
        text: "Adicionar"
        onClicked: {
          addItem("green")
        }
      }
    }
  }
}
