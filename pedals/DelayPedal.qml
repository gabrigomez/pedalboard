import QtQuick

Rectangle {
  id: root
  width: 300
  height: 420
  visible: true
  color: "transparent"

  FontLoader {
    id: russoFontLoader
    source: "fonts/RussoOne-Regular.ttf"
  }

  FontLoader {
    id: prismaFontLoader
    source: "fonts/Prisma.ttf"
  }

  Item {
    height: 420
    width: 300

    anchors {
      verticalCenter: parent.verticalCenter
      horizontalCenter: parent.horizontalCenter
    }

    Image {
      source: "assets/Guitar-Pedal-Background.png"
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
        text: "|TIME KILLER|"
        anchors {
          top: parent.verticalCenter
          topMargin: 16
          horizontalCenter: parent.horizontalCenter
        }
        fontSize: 28
        spacing: 10
      }

      InfoText {
        text: "Input"
        anchors {
          top: parent.top
          topMargin: 40
          right: parent.right
        }
        spacing: 4
        lineWidth: 40
        fontSize: 10
      }

      InfoText {
        text: "Output"
        anchors {
          top: parent.top
          topMargin: 40
          left: parent.left
        }
        spacing: 4
        lineWidth: 40
        fontSize: 10
      }

      SwitchImage {
        sourceBaseName: "LED"
        x: parent.width * 0.33 - width / 2
        y: 2
        checked: footSwitch.checked

        DeviceText {
          text: qsTr("ON")
          anchors {
            top: parent.bottom
            topMargin: 2
            horizontalCenter: parent.horizontalCenter
          }
          fontSize: 12
        }
      }

      DeviceSwitch {
        sourceBaseName: "Switch"
        x: parent.width * 0.66
        y: 2
        tapMargin: 16

        DeviceText {
          text: "MODE"
          anchors {
            top: parent.bottom
            topMargin: 4
            horizontalCenter: parent.horizontalCenter
          }
          fontSize: 12
        }
      }

      DeviceSwitch {
        id: footSwitch
        sourceBaseName: "Button-Pedal"
        anchors {
          bottom: parent.bottom
          right: parent.right
          left: parent.left
          bottomMargin: 17
          leftMargin: 10
          rightMargin: 10
        }
      }

      DeviceKnob {
        text: "LEVEL"
        anchors.horizontalCenter: parent.horizontalCenter
        y: 30
        knobText: true
      }

      DeviceKnob {
        text: "TIME"
        anchors.left: footSwitch.left
        y: 100
        knobText: true
      }

      DeviceKnob {
        text: "FEEDBACK"
        anchors.right: footSwitch.right
        y: 100
        knobText: true
      }
    }
  }
}
