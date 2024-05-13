import QtQuick
import QtQuick.Controls

Rectangle {
  signal addItem(string color)
  width: parent.width / 1.5
  height: 170

  color: "lightgray"
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
        id: addButton
        anchors.horizontalCenter: parent.horizontalCenter
        y: 6
        height: 20
        width: parent.width

        background: Rectangle {
          anchors.fill: parent
          color: addButton.hovered ? "gray" : "darkgray"

          Behavior on color {
            PropertyAnimation {
              duration: 200
              easing.type: Easing.InOutQuad
            }
          }
        }

        Text {
          id: addButtonText
          text: "Add"
          color: "white"
          anchors.horizontalCenter: parent.horizontalCenter
        }

        MouseArea {
          anchors.fill: parent
          cursorShape: Qt.PointingHandCursor // Altera o cursor para a forma de mão ao passar sobre o botão
          onClicked: {
            addItem("white")
          }
        }
      }
    }
  }
}
