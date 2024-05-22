import QtQuick

Image {
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
