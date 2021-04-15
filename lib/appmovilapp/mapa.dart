import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutterapp/appmovilapp/generateddetailsplaceviewwidget/GeneratedDetailsplaceviewWidget.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;

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

class nearPlaces {
  String name;
  String type;
  LatLng location;
  double rating = 3.5;
}

/// Determine the current position of the device.
Future<Position> _determinePosition() async {
  bool serviceEnabled;
  LocationPermission permission;

  // Test if location services are enabled.
  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    // Location services are not enabled don't continue
    // accessing the position and request users of the
    // App to enable the location services.
    return Future.error('Location services are disabled.');
  }

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      // Permissions are denied, next time you could try
      // requesting permissions again (this is also where
      // Android's shouldShowRequestPermissionRationale
      // returned true. According to Android guidelines
      // your App should show an explanatory UI now.
      return Future.error('Location permissions are denied');
    }
  }

  if (permission == LocationPermission.deniedForever) {
    // Permissions are denied forever, handle appropriately.
    return Future.error(
        'Location permissions are permanently denied, we cannot request permissions.');
  }

  // When we reach here, permissions are granted and we can
  // continue accessing the position of the device.
  return await Geolocator.getCurrentPosition();
}

Future<http.Response> getPlaces(lat, long) async {
  return await http.get(Uri.parse(
      'https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=$lat,$long&radius=15000&type=restaurant&keyword=cruise&key=AIzaSyCYrOoham5IJ0r3L_S80mpUPftWqxOuuZ0'));
}

class _Mapa extends State<Mapa> {
  bool _bool = false;
  GoogleMapController mapController;
  Set<Marker> _markers;
  LatLng _center;
  int _zoom;
  List<dynamic> _places = [];

  @override
  void initState() {
    _markers = Set();
    _initMarkers();
    _center = widget.center;
    _zoom = widget.zoom;
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;

    //Uncomment for using the actual position of the phone.
    /* _determinePosition().then((value) => setState(() {
          print(value);
          controller.animateCamera(CameraUpdate.newCameraPosition(
              CameraPosition(
                  target: LatLng(value.latitude, value.longitude), zoom: 50)));
        })); */
  }

  Future<void> _initMarkers() async {
    nearPlaces pc;
    String markerIdVal;
    await _determinePosition().then(
        (value) => getPlaces(value.latitude, value.longitude).then((value) => {
              for (var word in json.decode(value.body)['results'])
                {
                  //print(word),
                  if (word['opening_hours']['open_now'])
                    {
                      pc = new nearPlaces(),
                      pc.name = word['name'],
                      pc.type = word['types'][0],
                      pc.location = LatLng(word['geometry']['location']['lat'],
                          word['geometry']['location']['lng']),
                      _places.add(pc)
                      //print(pc.name),
                    }
                },
              setState(() {
                for (var word in _places) {
                  markerIdVal = 'marker_id_${word.location}';
                  _markers.add(
                    Marker(
                        markerId: MarkerId(markerIdVal),
                        position: word.location,
                        onTap: () {
                          print("This has been tap ${word.name}");
                          _bool = true;
                        },
                        infoWindow: InfoWindow(
                            //TODO: remove InfoWindows and make DetailsViewWidget Only that frame and make it appear when OnTap.
                            title: '${word.name}',
                            snippet: '${word.type}')),
                  );
                  print(word.name);
                }
              }),
            }));
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      GoogleMap(
        onMapCreated: _onMapCreated,
        mapToolbarEnabled: true,
        myLocationEnabled: true,
        myLocationButtonEnabled: true,
        initialCameraPosition: CameraPosition(
          target: _center,
          zoom: _zoom.toDouble(),
        ),
        markers: _markers,
        // polylines: _polyline,
      ),
      Container(
          height: 400, child: _bool ? GeneratedDetailsplaceviewWidget() : null)
    ]);
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
