import QtQuick
import QtQuick.Controls

//import Pedals
Rectangle {
  id: pedalBoard
  width: root.width / 1.05

  Connections {
    target: pedalPreview
    function onAddItem(pedal) {
      boardListView.model.append({
                                   "source": pedal
                                 })
    }
  }

  clip: true
  color: "transparent"

  anchors {
    horizontalCenter: parent.horizontalCenter
    top: pedalPreview.bottom
    bottom: parent.bottom
    bottomMargin: 10
    topMargin: 80
  }

  ListView {
    id: boardListView
    model: boardListModel
    delegate: boardDelegate

    anchors.fill: pedalBoard
    orientation: Qt.Horizontal
    layoutDirection: Qt.RightToLeft
    spacing: 25

    //highlightRangeMode: ListView.StrictlyEnforceRange

    //para manter o foco sempre no fim da lista
    onCountChanged: {
      if (count > 0) {
        positionViewAtIndex(count - 1, ListView.End)
      }
    }
  }
  ListModel {
    id: boardListModel
    ListElement {
      source: "components/DelayPedal.qml"
    }
    ListElement {
      source: "components/DistortionPedal.qml"
    }
  }

  Component {
    id: boardDelegate

    Rectangle {
      id: pedalContainer
      color: "transparent"
      width: 300
      height: 450

      Rectangle {
        id: cableComponent
        color: "black"
        y: 56
        anchors.right: pedalContainer.left
        height: 30
        width: 25
      }

      Loader {
        sourceComponent: {
          var component = Qt.createComponent(model.source)
          if (component.status === Component.Ready) {
            return component
          } else {
            return null
          }
        }
      }

      Button {
        id: removeButton
        height: 20
        width: 70
        anchors.horizontalCenter: parent.horizontalCenter

        background: Rectangle {
          anchors.fill: parent
          color: removeButton.hovered ? "gray" : "darkgray"

          Behavior on color {
            PropertyAnimation {
              duration: 200
              easing.type: Easing.InOutQuad
            }
          }
        }

        Text {
          id: removeButtonText
          text: "Remove"
          color: "white"
          anchors.horizontalCenter: parent.horizontalCenter
        }

        MouseArea {
          anchors.fill: parent
          cursorShape: Qt.PointingHandCursor // Altera o cursor para a forma de mão ao passar sobre o botão
          onClicked: {
            if (boardListView.model.count > 0) {
              boardListView.model.remove(index)
            }
          }
        }
      }
    }
  }
}
