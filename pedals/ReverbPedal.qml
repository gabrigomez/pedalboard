import QtQuick

Rectangle {
  id: root
  width: 300
  height: 420
  visible: true
  color: "transparent"

  FontLoader {
    id: varsity
    source: "fonts/Varsity.ttf"
  }

  Item {
    height: 420
    width: 300

    anchors {
      verticalCenter: parent.verticalCenter
      horizontalCenter: parent.horizontalCenter
    }

    Image {
      source: "assets/Green-Background.png"
      anchors.fill: parent
    }

    Item {
      anchors.fill: parent
      anchors.leftMargin: 15
      anchors.rightMargin: 15
      anchors.topMargin: 17
      anchors.bottomMargin: 17

      ScrewImage {
        anchors.left: parent.left
        anchors.top: parent.top
      }

      ScrewImage {
        anchors.right: parent.right
        anchors.top: parent.top
      }

      ScrewImage {
        anchors.left: parent.left
        anchors.bottom: parent.bottom
      }

      ScrewImage {
        anchors.right: parent.right
        anchors.bottom: parent.bottom
      }

      InfoText {
        text: "THE HALL"
        color: "green"
        font.pixelSize: 50
        font.family: varsity.font.family
        font.weight: varsity.font.weight

        style: Text.Outline
        lineColor: "transparent"
        spacing: 2
        anchors {
          top: parent.verticalCenter
          topMargin: 14
          horizontalCenter: parent.horizontalCenter
        }
      }

      SwitchImage {
        y: 160
        anchors.horizontalCenter: parent.horizontalCenter
        sourceBaseName: "LEDBIG"
        checked: footSwitch.checked
      }

      DeviceSwitch {
        id: footSwitch
        sourceBaseName: "Stomp"
        anchors {
          bottom: parent.bottom
          bottomMargin: 30
          horizontalCenter: parent.horizontalCenter
        }
      }

      DeviceSwitch {
        x: 240
        y: 140
        sourceBaseName: "Switch"
        tapMargin: 16

        DeviceText {
          text: "INTENSE"
          fontSize: 10
          color: "black"
          anchors {
            top: parent.bottom
            topMargin: 4
            horizontalCenter: parent.horizontalCenter
          }
        }

        DeviceText {
          text: "SOFT"
          fontSize: 10
          color: "black"
          anchors {
            bottom: parent.bottom
            bottomMargin: 16
            horizontalCenter: parent.horizontalCenter
          }
        }
      }

      DeviceKnob {
        x: 20
        y: 20
        text: "REVERB"
        knobSource: "assets/BluesKnob.png"
        color: "white"
      }

      DeviceKnob {
        x: 100
        y: 50
        text: "TONE"
        knobSource: "assets/BluesKnob.png"
        color: "white"
      }

      DeviceKnob {
        x: 180
        y: 20
        text: "MIX"
        knobSource: "assets/BluesKnob.png"
        color: "white"
      }
    }
  }
}
