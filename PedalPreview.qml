import QtQuick
import QtQuick.Controls

Rectangle {
  width: 950
  height: 200
  anchors {
    horizontalCenter: parent.horizontalCenter
  }

  radius: 20
  color: "darkgray"

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
        pedal: "pedals/DelayPedal.qml"
      }
      ListElement {
        source: "previews/Distortion.png"
        pedal: "pedals/DistortionPedal.qml"
      }
      ListElement {
        source: "previews/Chorus.png"
        pedal: "pedals/ChorusPedal.qml"
      }
      ListElement {
        source: "previews/Fuzz.png"
        pedal: "pedals/FuzzPedal.qml"
      }
      ListElement {
        source: "previews/Amp.png"
        pedal: "pedals/AmpPedal.qml"
      }
      ListElement {
        source: "previews/Reverb.png"
        pedal: "pedals/ReverbPedal.qml"
      }
      ListElement {
        source: "previews/Tremolo.png"
        pedal: "pedals/TremoloPedal.qml"
      }
    }

    delegate: Rectangle {
      width: 100
      height: parent.height
      color: "transparent"

      Image {
        width: 100
        height: 140
        anchors {
          top: addButton.bottom
          topMargin: 10
        }

        source: model.source
      }

      Button {
        id: addButton
        height: 20
        width: parent.width
        anchors.horizontalCenter: parent.horizontalCenter
        y: 6

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
          anchors.horizontalCenter: parent.horizontalCenter
          text: "Add"
          color: "white"
        }

        MouseArea {
          anchors.fill: parent
          cursorShape: Qt.PointingHandCursor // Altera o cursor para a forma de 'mão' ao passar sobre o botão
          onClicked: {
            addItem(pedal)
          }
        }
      }
    }
  }
}
