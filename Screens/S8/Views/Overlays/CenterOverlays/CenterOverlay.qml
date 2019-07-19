import CSI 1.0
import QtQuick 2.0
import QtGraphicalEffects 1.0

Rectangle {
  id: overlay

  // overlay size & position
  color:                         "transparent"
  width:                         296
  height:                        147
  anchors.centerIn:              parent
  anchors.verticalCenterOffset:  -19

  //------------------------------------------------------------------------------------------------------------------

  // background with border, inner glow & drop shadow

  Item { // bugfix for clipped drop shadow / glow
    id: container
    anchors.centerIn: parent;
    width:  border.width  + (2 * rectShadow.radius)
    height: border.height + (2 * rectShadow.radius)

    Rectangle {
      id: border
      width:              overlay.width
      height:             overlay.height - 45
      anchors.centerIn:   parent
      color:              colors.colorBlack69
      border.color:       colors.colorGrey40
      border.width:       3
      radius:             4
    }
  }

  // outer glow
  Glow {
    id: rectShadow
    anchors.fill: source
    cached: true
    radius: 6.0
    samples: 52
    color: colors.colorBlack75
    smooth: true
    source: container
  }

  Rectangle {
    id: innerGlow
    width:              overlay.width -2
    height:             overlay.height -2 - 45
    anchors.centerIn:   parent
    color:              "transparent"
    border.color:       colors.colorGrey08
    border.width:       5
    radius:             5
  }

}
