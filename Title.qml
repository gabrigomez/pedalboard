import QtQuick

Text {
  FontLoader {
    id: browser
    source: "fonts/Browser.ttf"
  }

  anchors {
    horizontalCenter: parent.horizontalCenter
    top: parent.top
    topMargin: 20
  }
  text: "The Pedalboard"
  color: "white"

  style: Text.Outline
  styleColor: "black"
  font.pixelSize: 80
  font.family: browser.font.family
}
