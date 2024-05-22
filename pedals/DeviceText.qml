import QtQuick

Text {
  property int fontSize: 20

  color: "black"
  font.family: russoFontLoader.font.family
  font.weight: russoFontLoader.font.weight
  font.pixelSize: fontSize
}
