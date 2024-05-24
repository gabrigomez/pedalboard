import QtQuick

Rectangle {
  id: root
  width: 300
  height: 420
  visible: true
  color: "transparent"

  FontLoader {
    id: neutronsFontLoader
    source: "fonts/NeutronsDemoRegular.ttf"
  }

  Item {
    height: 420
    width: 300

    anchors {
      verticalCenter: parent.verticalCenter
      horizontalCenter: parent.horizontalCenter
    }

    Image {
      source: "assets/Black-Background.png"
      anchors.fill: parent
    }

    component DeviceText: Text {
      property int fontSize: 20

      color: "white"
      font.family: neutronsFontLoader.font.family
      font.weight: neutronsFontLoader.font.weight
      font.pixelSize: fontSize
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
        text: "DIRTY NOTES"
        anchors {
          top: parent.verticalCenter
          topMargin: 8
          horizontalCenter: parent.horizontalCenter
        }
        color: "silver"

        font.pixelSize: 30
        font.family: neutronsFontLoader.font.family
        font.weight: neutronsFontLoader.font.weight
        style: Text.Outline

        lineColor: "transparent"
        spacing: 2
      }

      InfoText {
        text: "In"
        anchors {
          top: parent.top
          topMargin: 40
          right: parent.right
        }
        color: "silver"
        fontSize: 14
        spacing: 4
        lineWidth: 40
      }

      InfoText {
        text: "Out"
        anchors {
          top: parent.top
          topMargin: 40
          left: parent.left
        }
        color: "silver"

        fontSize: 14
        spacing: 4
        lineWidth: 40
      }

      SwitchImage {
        sourceBaseName: "LED"
        anchors.horizontalCenter: parent.horizontalCenter
        y: 30
        checked: footSwitch.checked
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
        text: "TONE"
        knobSource: "assets/MuffKnob.png"
        x: 40
        y: 80

        knobText: true
        color: "silver"
      }

      DeviceKnob {
        text: "DIRTY"
        knobSource: "assets/MuffKnob.png"
        x: 160
        y: 80

        knobText: true
        color: "silver"
      }
    }
  }
}
