import QtQuick
import QtQuick.Controls

Window {
  id: root
  width: 1500
  height: 600
  visible: true
  title: qsTr("PedalBoard")

  color: "gray"

  Text {
    id: title
    anchors {
      horizontalCenter: parent.horizontalCenter
      top: parent.top
      topMargin: 20
    }
    text: "Pedalboard"
    font.pixelSize: 40
    font.bold: true
  }

  Item {
    id: pedalBoardContainer
    width: parent.width / 1.2
    height: parent.height / 1.5

    anchors {
      horizontalCenter: parent.horizontalCenter
      top: title.bottom
      bottom: parent.bottom

      topMargin: 20
    }

    Rectangle {
      id: pedalPreview
      width: parent.width / 1.5
      height: 170

      anchors {
        horizontalCenter: parent.horizontalCenter
      }
      color: "red"

      ListView {
        id: listView
        anchors.fill: parent
        orientation: Qt.Horizontal
        spacing: 16

        model: ListModel {
          ListElement {
            color: "blue"
          }
          ListElement {
            color: "blue"
          }
        }

        delegate: Rectangle {
          color: model.color
          width: 100
          height: parent.height
        }
      }
    }
    Rectangle {
      id: pedalBoard
      width: parent.width

      clip: true
      anchors {
        horizontalCenter: parent.horizontalCenter
        top: pedalPreview.bottom
        bottom: parent.bottom
        bottomMargin: 10
        topMargin: 10
      }

      color: "yellow"

      ListView {
        id: boardListView
        anchors.fill: pedalBoard
        orientation: Qt.Horizontal
        layoutDirection: Qt.RightToLeft
        spacing: 25

        highlightRangeMode: ListView.StrictlyEnforceRange

        model: ListModel {
          ListElement {
            color: "red"
          }
        }

        delegate: Rectangle {
          color: model.color
          width: 100
          height: parent?.height
        }

        onCountChanged: {
          if (count > 0) {
            positionViewAtIndex(count - 1, ListView.End)
          }
        }

        Row {
          anchors {
            horizontalCenter: parent.horizontalCenter
            bottom: boardListView.bottom
            //bottom: parent.bottom
            topMargin: 10
          }

          Button {
            text: "Adicionar"
            onClicked: {
              boardListView.model.append({
                                           "color": "green"
                                         })
            }
          }

          Button {
            text: "Remover"
            onClicked: {
              if (boardListView.model.count > 0) {
                boardListView.model.remove(boardListView.model.count - 1)
              }
            }
          }
        }
      }
    }
  }
}
