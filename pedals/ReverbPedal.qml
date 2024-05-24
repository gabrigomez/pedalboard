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
        anchors {
          top: parent.verticalCenter
          topMargin: 14
          horizontalCenter: parent.horizontalCenter
        }
        color: "green"

        font.pixelSize: 50
        font.family: varsity.font.family
        font.weight: varsity.font.weight
        style: Text.Outline

        lineColor: "transparent"
        spacing: 2
      }

      SwitchImage {
        sourceBaseName: "LEDBIG"
        anchors.horizontalCenter: parent.horizontalCenter
        y: 160
        checked: footSwitch.checked
      }

      DeviceSwitch {
        id: footSwitch
        anchors {
          bottom: parent.bottom
          bottomMargin: 30
          horizontalCenter: parent.horizontalCenter
        }
        sourceBaseName: "Stomp"
      }

      DeviceSwitch {
        sourceBaseName: "Switch"
        x: 240
        y: 140
        tapMargin: 16

        DeviceText {
          text: "INTENSE"
          anchors {
            top: parent.bottom
            topMargin: 4
            horizontalCenter: parent.horizontalCenter
          }
          color: "black"
          fontSize: 10
        }

        DeviceText {
          text: "SOFT"
          anchors {
            bottom: parent.bottom
            bottomMargin: 16
            horizontalCenter: parent.horizontalCenter
          }
          fontSize: 10
          color: "black"
        }
      }

      DeviceKnob {
        text: "REVERB"
        x: 20
        y: 20
        knobSource: "assets/BluesKnob.png"
        color: "white"
      }

      DeviceKnob {
        text: "TONE"
        x: 100
        y: 50
        knobSource: "assets/BluesKnob.png"
        color: "white"
      }

      DeviceKnob {
        text: "MIX"
        x: 180
        y: 20
        knobSource: "assets/BluesKnob.png"
        color: "white"
      }
    }
  }
}
