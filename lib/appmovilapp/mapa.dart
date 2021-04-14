import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Mapa extends StatefulWidget {
  @override
  _Mapa createState() => _Mapa();
}

class _Mapa extends State<Mapa> {
  GoogleMapController mapController;
  Set<Marker> _markers = HashSet<Marker>();
  int _markerIdCounter = 1;
  final LatLng _center = const LatLng(10.9878, -74.7955);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  void _setMarkers(LatLng point, String titleMarker, String descriptionMarker) {
    final String markerIdVal = 'marker_id_$_markerIdCounter';
    _markerIdCounter++;
    _markers.add(
      Marker(
          markerId: MarkerId(markerIdVal),
          position: point,
          infoWindow:
              InfoWindow(title: '$titleMarker', snippet: '$descriptionMarker')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      onMapCreated: _onMapCreated,
      initialCameraPosition: CameraPosition(
        target: _center,
        zoom: 15,
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
