import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Mapa extends StatefulWidget {
  final LatLng center;
  final Set<Marker> markers;
  final int zoom;

  const Mapa({
    this.center,
    this.zoom,
    this.markers,
  });

  @override
  _Mapa createState() => _Mapa();
}

class _Mapa extends State<Mapa> {
  GoogleMapController mapController;
  Set<Marker> _markers;
  LatLng _center;
  int _zoom;

  void initState() {
    _markers = widget.markers;
    _center = widget.center;
    _zoom = widget.zoom;
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  Set<Marker> _addMarker(Set<Marker> _Markers, LatLng point, String titleMarker,
      String descriptionMarker) {
    final String markerIdVal = 'marker_id_$point';
    _Markers.add(
      Marker(
          markerId: MarkerId(markerIdVal),
          position: point,
          infoWindow:
              InfoWindow(title: '$titleMarker', snippet: '$descriptionMarker')),
    );
    return _Markers;
  }

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      onMapCreated: _onMapCreated,
      initialCameraPosition: CameraPosition(
        target: _center,
        zoom: _zoom.toDouble(),
      ),
      markers: _markers,
      // polylines: _polyline,
    );
  }

  // void _setRoute(LatLng pointInital, LatLng pointFinal) {
  //   List<LatLng> _latlng = [];
  //   _latlng.add(pointInital);
  //   _latlng.add(LatLng(10.9800, -74.7995));
  //   _latlng.add(LatLng(10.9878, -74.7955));
  //   _latlng.add(pointFinal);
  //   _drawPoliLine(_latlng);
  // }

}
