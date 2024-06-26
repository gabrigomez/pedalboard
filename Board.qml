import QtQuick
import QtQuick.Controls

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
    ScrollBar.horizontal: ScrollBar {}
  }
  ListModel {
    id: boardListModel
    ListElement {
      source: "pedals/DelayPedal.qml"
    }
    ListElement {
      source: "pedals/DistortionPedal.qml"
    }
  }

  Component {
    id: boardDelegate

    Rectangle {
      id: pedalContainer
      width: 300
      height: 450
      color: "transparent"

      Rectangle {
        id: cableComponent
        height: 30
        width: 25
        anchors.right: pedalContainer.left
        y: 56

        color: "black"
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
        anchors.bottom: pedalContainer.bottom

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
          anchors.horizontalCenter: parent.horizontalCenter
          text: "Remove"
          color: "white"
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
