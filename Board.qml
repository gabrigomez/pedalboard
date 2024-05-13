import QtQuick
import QtQuick.Controls

Rectangle {
  id: pedalBoard
  width: parent.width

  Connections {
    target: pedalPreview
    function onAddItem(color) {
      boardListView.model.append({
                                   "color": color
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
    anchors.fill: pedalBoard
    orientation: Qt.Horizontal
    layoutDirection: Qt.RightToLeft
    spacing: 25

    highlightRangeMode: ListView.StrictlyEnforceRange

    model: ListModel {
      ListElement {
        color: "white"
      }
    }

    delegate: Rectangle {
      color: model.color
      width: 100
      height: parent?.height

      Button {
        text: "Remover"
        onClicked: {
          if (boardListView.model.count > 0) {
            boardListView.model.remove(boardListView.model.count - 1)
          }
        }
      }
    }

    onCountChanged: {
      if (count > 0) {
        positionViewAtIndex(count - 1, ListView.End)
      }
    }
  }
}
