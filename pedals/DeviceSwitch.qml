import QtQuick

SwitchImage {
  property alias tapMargin: tapHandler.margin

  TapHandler {
    id: tapHandler
    onTapped: parent.checked = !parent.checked
  }
}
