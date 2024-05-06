import QtQuick
import QtQuick.Controls

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

  PedalPreview {
    id: pedalPreview
  }
  Board {}
}
