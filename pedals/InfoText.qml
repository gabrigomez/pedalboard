import QtQuick

Column {
  id: infoLabel
  spacing: 6

  property alias text: label.text
  property alias font: label.font
  property alias color: label.color
  property alias style: label.style

  property alias fontSize: label.fontSize

  property int lineWidth: 200
  property int lineHeight: 2
  property color lineColor: "black"

  Rectangle {
    width: infoLabel.lineWidth
    height: infoLabel.lineHeight
    color: infoLabel.lineColor
  }

  DeviceText {
    id: label
    anchors.horizontalCenter: parent.horizontalCenter
    text: "Time Killer"
    color: "black"
  }

  Rectangle {
    width: infoLabel.lineWidth
    height: infoLabel.lineHeight
    color: infoLabel.lineColor
  }
}
