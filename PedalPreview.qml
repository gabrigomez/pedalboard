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
        source: "previews/Delay.png"
      }
      ListElement {
        source: "previews/Delay.png"
      }

      ListElement {
        source: "previews/Delay.png"
      }
    }

    delegate: Rectangle {
      width: 100
      height: parent.height
      color: "transparent"

      Image {
        source: model.source
        anchors {
          bottom: parent.bottom
        }
      }

      Button {
        text: "Adicionar"
        anchors.horizontalCenter: parent.horizontalCenter
        onClicked: {
          addItem("green")
        }
      }
    }
  }
}
