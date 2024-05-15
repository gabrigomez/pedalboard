import QtQuick
import QtQuick.Controls
import Pedals

Rectangle {
  id: pedalBoard
  width: parent.width

  Connections {
    target: pedalPreview
    function onAddItem(color) {
      boardListView.model.append({
                                   "colorElement": color
                                 })
    }
  }

  clip: true
  color: "silver"

  anchors {
    horizontalCenter: parent.horizontalCenter
    top: pedalPreview.bottom
    bottom: parent.bottom
    bottomMargin: 10
    topMargin: 10
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
    ListElement {}
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
        y: 80
        anchors.right: pedalContainer.left
        height: 40
        width: 100
      }

      DelayPedal {
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
      }
      Button {
        text: "Remover"
        anchors.horizontalCenter: parent.horizontalCenter
        onClicked: {
          if (boardListView.model.count > 0) {
            boardListView.model.remove(boardListView.model.count - 1)
          }
        }
      }
    }
  }
}
