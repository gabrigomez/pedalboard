import QtQuick

Rectangle {
  id: root
  width: 300
  height: 420
  visible: true
  color: "transparent"

  FontLoader {
    id: neutronsFontLoader
    source: "fonts/JuicyFills.ttf"
  }

  Item {
    height: 420
    width: 300

    anchors {
      verticalCenter: parent.verticalCenter
      horizontalCenter: parent.horizontalCenter
    }

    Image {
      source: "assets/CustomBlue-Background.png"
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
        text: "CREAM"
        color: "dodgerblue"
        font.family: neutronsFontLoader.font.family
        font.weight: neutronsFontLoader.font.weight
        style: Text.Outline

        lineColor: "transparent"
        font.pixelSize: 40
        spacing: 2
        anchors {
          top: parent.verticalCenter
          topMargin: 10
          horizontalCenter: parent.horizontalCenter
        }
      }
      InfoText {
        text: "Chorus"
        color: "silver"
        font.family: neutronsFontLoader.font.family
        font.weight: neutronsFontLoader.font.weight
        style: Text.Outline

        lineColor: "transparent"
        font.pixelSize: 14
        spacing: 2
        anchors {
          top: mainTitle.bottom
          horizontalCenter: parent.horizontalCenter
        }
      }

      InfoText {
        text: "In"
        color: "white"
        lineColor: "transparent"
        spacing: 4
        lineWidth: 20
        fontSize: 14

        anchors {
          top: parent.top
          topMargin: 40
          right: parent.right
        }
      }

      InfoText {
        text: "Out"
        color: "white"
        lineColor: "transparent"
        spacing: 4
        lineWidth: 20
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
        sourceBaseName: "LEDBIG"
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
        y: 20
        text: "LEVEL"
        color: "white"
        knobSource: "assets/BluesKnob.png"
      }

      DeviceKnob {
        x: 100
        y: 100
        text: "CREAM RATE"
        color: "white"
        knobSource: "assets/BluesKnob.png"
      }

      DeviceKnob {
        x: 160
        y: 20
        text: "DEPTH"
        color: "white"
        knobSource: "assets/BluesKnob.png"
      }
    }
  }
}
