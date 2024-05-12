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
  font.pixelSize: 80
  font.family: browser.font.family
}