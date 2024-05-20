import QtQuick
import QtQuick.Controls

Rectangle {
  width: parent.width / 1.8
  height: 200
  radius: 20
  color: "#AFAFAF"
  anchors {
    horizontalCenter: parent.horizontalCenter
  }

  signal addItem(string color)

  ListView {
    id: listView
    anchors.fill: parent
    anchors.leftMargin: 30
    orientation: Qt.Horizontal
    spacing: 30

    model: ListModel {
      ListElement {
        source: "previews/Delay.png"
        pedal: "components/DelayPedal.qml"
      }
      ListElement {
        source: "previews/Distortion.png"
        pedal: "components/DistortionPedal.qml"
      }
      ListElement {
        source: "previews/Chorus.png"
        pedal: "components/ChorusPedal.qml"
      }
      ListElement {
        source: "previews/Fuzz.png"
        pedal: "components/FuzzPedal.qml"
      }
    }

    delegate: Rectangle {
      width: 100
      height: parent.height
      color: "transparent"

      Image {
        source: model.source
        width: 100
        height: 140
        anchors {
          top: addButton.bottom
          topMargin: 10
        }
      }

      Button {
        id: addButton
        anchors.horizontalCenter: parent.horizontalCenter
        y: 6
        height: 20
        width: parent.width

        background: Rectangle {
          anchors.fill: parent
          color: addButton.hovered ? "gray" : "darkgray"
          border.color: "silver"

          Behavior on color {
            PropertyAnimation {
              duration: 200
              easing.type: Easing.InOutQuad
            }
          }
        }

        Text {
          id: addButtonText
          text: "Add"
          color: "white"
          anchors.horizontalCenter: parent.horizontalCenter
        }

        MouseArea {
          anchors.fill: parent
          cursorShape: Qt.PointingHandCursor // Altera o cursor para a forma de mão ao passar sobre o botão
          onClicked: {
            addItem(pedal)
          }
        }
      }
    }
  }
}
