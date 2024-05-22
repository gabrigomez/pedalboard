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

      color: "white"
      font.family: secrcode.font.family
      font.weight: secrcode.font.weight
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
        source: "assets/MuffKnob.png"
        anchors.centerIn: parent
        rotation: knob.angle
      }

      DeviceText {
        id: knobLabel
        fontSize: 16
        color: "black"
        anchors {
          top: knob.bottom
          horizontalCenter: knob.horizontalCenter
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
        property alias color: label.color
        property int lineWidth: 200
        property int lineHeight: 2

        property color lineColor: "black"

        DeviceText {
          id: label
          style: Text.Outline
          anchors.horizontalCenter: parent.horizontalCenter
        }
      }

      InfoText {
        text: "tiny amp"
        color: "black"
        font.pixelSize: 40
        spacing: 2
        anchors {
          top: parent.verticalCenter
          topMargin: 25
          horizontalCenter: parent.horizontalCenter
        }
      }

      SwitchImage {
        y: 140
        anchors.horizontalCenter: parent.horizontalCenter
        sourceBaseName: "LED"
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
        anchors.horizontalCenter: parent.horizontalCenter
        y: 20
        text: "ROAR"
      }
    }
  }
}
