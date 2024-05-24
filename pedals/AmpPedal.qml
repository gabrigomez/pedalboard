import QtQuick

Rectangle {
  id: root
  width: 300
  height: 420

  visible: true
  color: "transparent"

  FontLoader {
    id: secrcode
    source: "fonts/secrcode.ttf"
  }

  Item {
    height: 420
    width: 300

    anchors {
      verticalCenter: parent.verticalCenter
      horizontalCenter: parent.horizontalCenter
    }

    Image {
      source: "assets/Yellow-Background.png"
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
        text: "tiny amp"
        anchors {
          top: parent.verticalCenter
          topMargin: 25
          horizontalCenter: parent.horizontalCenter
        }

        color: "black"
        lineColor: "transparent"
        style: Text.Outline

        font.weight: secrcode.font.weight
        font.family: secrcode.font.family
        font.pixelSize: 40
        spacing: 2
      }

      InfoText {
        text: "In"
        anchors {
          top: parent.top
          topMargin: 60
          right: parent.right
        }
        spacing: 4
        lineWidth: 20

        color: "black"
        lineColor: "transparent"
        fontSize: 16

        transform: Rotation {
          origin.x: 0
          origin.y: 0
          angle: -90
        }
      }

      InfoText {
        text: "Out"
        anchors {
          top: parent.top
          topMargin: 60
          left: parent.left
          leftMargin: -10
        }

        color: "black"
        lineColor: "transparent"
        fontSize: 16

        spacing: 4
        lineWidth: 20
        transform: Rotation {
          angle: -90
        }
      }

      SwitchImage {
        sourceBaseName: "LED"
        anchors.horizontalCenter: parent.horizontalCenter
        y: 140
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

      DeviceKnob {
        anchors.horizontalCenter: parent.horizontalCenter
        y: 20
        knobSource: "assets/MuffKnob.png"
        text: "ROAR"
      }
    }
  }
}
