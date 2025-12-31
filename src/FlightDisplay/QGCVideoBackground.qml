/****************************************************************************
 *
 * (c) 2009-2020 QGROUNDCONTROL PROJECT <http://www.qgroundcontrol.org>
 *
 * QGroundControl is licensed according to the terms in the file
 * COPYING.md in the root of the source code directory.
 *
 ****************************************************************************/

import QtQuick
import QtQuick.Controls
import QGroundControl

Item {
    id: videoBackground
    anchors.fill: parent

    Loader {
        id: loader
        anchors.fill: parent
        active: QGroundControl.videoManager.hasVideo
        source: QGroundControl.videoManager.hasVideo ? "qrc:/qml/QGroundControl/FlightDisplay/FlightDisplayViewGStreamer.qml" : ""
        sourceComponent: QGroundControl.videoManager.hasVideo ? undefined : fallback
    }

    Component {
        id: fallback
        Rectangle { anchors.fill: parent; color: "black" }
    }
}
