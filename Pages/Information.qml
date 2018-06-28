import QtQuick 2.9
import QtQuick.Controls.Material 2.2
import QtQuick.Controls 2.2
import QtCharts 2.2
import QtLocation 5.9
import QtPositioning 5.8

Item {

    property real latitude: 0
    property real longitude: 0

    Plugin {
        id: mapPlugin
        name: "osm" // "mapboxgl", "esri", ...
        // specify plugin parameters if necessary
        // PluginParameter {
        //     name:
        //     value:
        // }
        PluginParameter {
            name: "osm.mapping.highdpi_tiles"
            value: "true"
        }
    }

    Map {
        anchors.fill: parent
        plugin: mapPlugin
        center: QtPositioning.coordinate(latitude, longitude) // Oslo
        zoomLevel: 14
        copyrightsVisible: false

        onZoomLevelChanged: {
            currentPosition.update();
            console.log(zoomLevel);
        }

        MapCircle {
            id: currentPosition
                center {
                    latitude: latitude
                    longitude: longitude
                }
                radius: 300
                opacity: 0.2
                color: 'steelblue'
                border.width: 3
            }
    }
    PositionSource {
            id: src
            updateInterval: 60000
            active: true
            preferredPositioningMethods: PositionSource.AllPositioningMethods


            Component.onCompleted: {
                  src.start()
                  src.update()
                  var supPos  = "Unknown"
                  if (src.supportedPositioningMethods == PositionSource.NoPositioningMethods) {
                       supPos = "NoPositioningMethods"
                  } else if (src.supportedPositioningMethods == PositionSource.AllPositioningMethods) {
                       supPos = "AllPositioningMethods"
                  } else if (src.supportedPositioningMethods == PositionSource.SatellitePositioningMethods) {
                       supPos = "SatellitePositioningMethods"
                  } else if (src.supportedPositioningMethods == PositionSource.NonSatellitePositioningMethods) {
                       supPos = "NonSatellitePositioningMethods"
                  }
                  console.log("Position Source Loaded || Supported: "+supPos+" Valid: "+valid);
            }

            onPositionChanged: {
                var coord = src.position.coordinate;
                console.log("Coordinate:", coord.longitude, coord.latitude);
                longitude = coord.longitude;
                latitude = coord.latitude;
                console.log(src.nmeaSource)
                active = false;
            }
        }
}
