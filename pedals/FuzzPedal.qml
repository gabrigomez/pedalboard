import QtQuick

Rectangle {
  id: root
  width: 300
  height: 420
  visible: true
  color: "transparent"

  FontLoader {
    id: theDukeofPrunes
    source: "fonts/TheDukeofPrunes.ttf"
  }

  Item {
    height: 420
    width: 300

    anchors {
      verticalCenter: parent.verticalCenter
      horizontalCenter: parent.horizontalCenter
    }

    Image {
      source: "assets/CustomWhite-Background.png"
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
        id: mainTitle
        text: "FUZZ INDUSTRY"
        anchors {
          top: parent.verticalCenter
          topMargin: 24
          horizontalCenter: parent.horizontalCenter
        }

        font.pixelSize: 21
        font.family: theDukeofPrunes.font.family
        font.weight: theDukeofPrunes.font.weight

        color: "black"
        lineColor: "transparent"
      }

      SwitchImage {
        sourceBaseName: "LED"
        anchors.horizontalCenter: parent.horizontalCenter
        y: 4
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
        text: "GATE"
        x: 10
        y: 20
      }

      DeviceKnob {
        text: "VOL"
        x: 185
        y: 20
      }

      DeviceKnob {
        x: 100
        y: 20
        text: "COMP"
      }

      DeviceKnob {
        text: "DRIVE"
        x: 50
        y: 105
      }

      DeviceKnob {
        text: "STAB"
        x: 145
        y: 105
      }
    }
  }
}
