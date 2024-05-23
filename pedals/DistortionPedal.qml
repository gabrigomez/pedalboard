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
        color: "silver"
        font.family: neutronsFontLoader.font.family
        font.weight: neutronsFontLoader.font.weight
        style: Text.Outline
        lineColor: "transparent"
        font.pixelSize: 30
        spacing: 2
        anchors {
          top: parent.verticalCenter
          topMargin: 8
          horizontalCenter: parent.horizontalCenter
        }
      }

      InfoText {
        text: "In"
        color: "silver"
        spacing: 4
        lineWidth: 40
        fontSize: 14

        anchors {
          top: parent.top
          topMargin: 40
          right: parent.right
        }
      }

      InfoText {
        text: "Out"
        color: "silver"
        spacing: 4
        lineWidth: 40
        fontSize: 14

        anchors {
          top: parent.top
          topMargin: 40
          left: parent.left
        }
      }

      SwitchImage {
        y: 30
        anchors.horizontalCenter: parent.horizontalCenter
        sourceBaseName: "LED"
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
        x: 40
        y: 80
        text: "TONE"
        knobSource: "assets/MuffKnob.png"
        knobText: true
        color: "silver"
      }

      DeviceKnob {
        x: 160
        y: 80
        text: "DIRTY"
        knobSource: "assets/MuffKnob.png"
        knobText: true
        color: "silver"
      }
    }
  }
}
