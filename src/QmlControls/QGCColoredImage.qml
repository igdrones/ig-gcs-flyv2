import QtQuick
import QtQuick.Controls
import Qt5Compat.GraphicalEffects

import QGroundControl
import QGroundControl.Controls


Item {
    property color color: "white"   // Image color
    property bool  crisp: false     // Disable smoothing/mipmaps for pixel-crisp rendering
    property bool  _overlayEnabled: color.a > 0

    property alias asynchronous:        image.asynchronous
    property alias cache:               image.cache
    property alias fillMode:            image.fillMode
    property alias horizontalAlignment: image.horizontalAlignment
    property alias mirror:              image.mirror
    property alias paintedHeight:       image.paintedHeight
    property alias paintedWidth:        image.paintedWidth
    property alias progress:            image.progress
    property alias mipmap:              image.mipmap
    property alias source:              image.source
    property alias sourceSize:          image.sourceSize
    property alias status:              image.status
    property alias verticalAlignment:   image.verticalAlignment

    width:  image.width
    height: image.height

    Image {
        id:                 image
        smooth:             crisp ? false : true
        mipmap:             crisp ? false : true
        antialiasing:       true
        visible:            !_overlayEnabled
        fillMode:           Image.PreserveAspectFit
        anchors.fill:       parent
        // Match source size to on-screen size to avoid resampling blur
        sourceSize.height:  height
        sourceSize.width:   width
    }

    ColorOverlay {
        anchors.fill:       image
        source:             image
        color:              parent.color
        visible:            _overlayEnabled
    }
}
