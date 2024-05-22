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

    component SwitchImage: Image {
      required property string sourceBaseName
      property bool checked

      source: `assets/${sourceBaseName}${checked ? "-Checked" : ""}.png`
    }

    component DeviceSwitch: SwitchImage {
      property alias tapMargin: tapHandler.margin

      TapHandler {
        id: tapHandler
        onTapped: parent.checked = !parent.checked
      }
    }

    component DeviceText: Text {
      property int fontSize: 20

      color: "black"
      font.family: russoFontLoader.font.family
      font.weight: russoFontLoader.font.weight
      font.pixelSize: fontSize
    }

    component DeviceKnob: Image {
      id: knob
      source: "assets/Knob-Markings.png"

      property alias text: knobLabel.text

      property int value
      property int angle

      readonly property int minValue: 0
      readonly property int maxValue: 100

      readonly property int range: knob.maxValue - knob.minValue

      DragHandler {
        target: null
        onCentroidChanged: updateValueAndRotation()

        function updateValueAndRotation() {
          if (centroid.pressedButtons !== Qt.LeftButton) {
            return
          }

          const startAngle = -140
          const endAngle = 140

          const yy = knob.height / 2.0 - centroid.position.y
          const xx = centroid.position.x - knob.width / 2.0

          const radianAngle = Math.atan2(yy, xx)
          let newAngle = (-radianAngle / Math.PI * 180) + 90

          newAngle = ((newAngle - knob.angle + 180) % 360) + knob.angle - 180

          knob.angle = Math.max(startAngle, Math.min(newAngle, endAngle))
          knob.value = (knob.angle - startAngle) / (endAngle - startAngle) * knob.range

          console.log("angle: ", knob.angle, "value: ", knob.value)
        }
      }

      Image {
        source: "assets/Knob-Dial.png"
        anchors.centerIn: parent
        rotation: knob.angle
      }

      DeviceText {
        id: knobLabel
        fontSize: 12
        anchors {
          top: knob.bottom
          horizontalCenter: knob.horizontalCenter
        }
      }

      DeviceText {
        text: "MIN"
        fontSize: 6
        anchors {
          left: knob.left
          bottom: knob.bottom
        }
      }

      DeviceText {
        text: "MAX"
        fontSize: 6
        anchors {
          right: knob.right
          bottom: knob.bottom
        }
      }
    }

    Item {
      anchors.fill: parent
      anchors.leftMargin: 15
      anchors.rightMargin: 15
      anchors.topMargin: 17
      anchors.bottomMargin: 17

      component ScrewImage: Image {
        source: "assets/Screw.png"
      }

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

      component InfoText: Column {
        id: infoLabel
        spacing: 6

        property alias text: label.text
        property alias font: label.font
        property alias fontSize: label.fontSize
        property int lineWidth: 200
        property int lineHeight: 2

        property color lineColor: "black"

        Rectangle {
          width: infoLabel.lineWidth
          height: infoLabel.lineHeight
          color: infoLabel.lineColor
        }

        DeviceText {
          id: label
          text: "Time Killer"
          anchors.horizontalCenter: parent.horizontalCenter
        }

        Rectangle {
          width: infoLabel.lineWidth
          height: infoLabel.lineHeight
          color: infoLabel.lineColor
        }
      }

      InfoText {
        text: "|TIME KILLER|"
        fontSize: 28
        spacing: 10
        anchors {
          top: parent.verticalCenter
          topMargin: 16
          horizontalCenter: parent.horizontalCenter
        }
      }

      InfoText {
        text: "Input"
        spacing: 4
        lineWidth: 40
        fontSize: 10

        anchors {
          top: parent.top
          topMargin: 40
          right: parent.right
        }
      }

      InfoText {
        text: "Output"
        spacing: 4
        lineWidth: 40
        fontSize: 10

        anchors {
          top: parent.top
          topMargin: 40
          left: parent.left
        }
      }

      SwitchImage {
        x: parent.width * 0.33 - width / 2
        y: 2
        sourceBaseName: "LED"
        checked: footSwitch.checked

        DeviceText {
          text: qsTr("ON")
          fontSize: 12
          anchors {
            top: parent.bottom
            topMargin: 2
            horizontalCenter: parent.horizontalCenter
          }
        }
      }

      DeviceSwitch {
        x: parent.width * 0.66
        y: 2
        sourceBaseName: "Switch"
        tapMargin: 16

        DeviceText {
          text: "MODE"
          fontSize: 12
          anchors {
            top: parent.bottom
            topMargin: 4
            horizontalCenter: parent.horizontalCenter
          }
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
        anchors.horizontalCenter: parent.horizontalCenter
        y: 30
        text: "LEVEL"
      }

      DeviceKnob {
        anchors.left: footSwitch.left
        y: 100
        text: "TIME"
      }

      DeviceKnob {
        anchors.right: footSwitch.right
        y: 100
        text: "FEEDBACK"
      }
    }
  }
}
