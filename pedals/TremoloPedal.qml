import QtQuick

Rectangle {
  id: root
  width: 300
  height: 420
  visible: true
  color: "transparent"

  FontLoader {
    id: theAugusta
    source: "fonts/TheAugusta.otf"
  }

  Item {
    height: 420
    width: 300

    anchors {
      verticalCenter: parent.verticalCenter
      horizontalCenter: parent.horizontalCenter
    }

    Image {
      source: "assets/Pink-Background.png"
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
        text: "Pink Tremolo"
        anchors {
          top: parent.verticalCenter
          horizontalCenter: parent.horizontalCenter
        }

        color: "pink"
        font.family: theAugusta.font.family
        font.weight: theAugusta.font.weight
        style: Text.Outline

        lineColor: "transparent"
        font.pixelSize: 44
        spacing: 2
      }

      SwitchImage {
        sourceBaseName: "LEDBIG"
        anchors.horizontalCenter: parent.horizontalCenter
        y: 140
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

      DeviceKnob {
        text: "Intensity"
        x: 40
        y: 20
        color: "pink"
      }

      DeviceKnob {
        text: "Rate"
        x: 160
        y: 20
        color: "pink"
      }
    }
  }
}
