import QtQuick

Text {
  property int fontSize: 20

  FontLoader {
    id: russoFontLoader
    source: "fonts/RussoOne-Regular.ttf"
  }

  color: "black"
  font.family: russoFontLoader.font.family
  font.weight: russoFontLoader.font.weight
  font.pixelSize: fontSize
}
