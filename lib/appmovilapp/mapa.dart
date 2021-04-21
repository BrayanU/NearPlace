import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/appmovilapp/generateddetailsplaceviewwidget/GeneratedDetailsplaceviewWidget.dart';
import 'package:flutterapp/appmovilapp/generatedreviewviewwidget/generated/GeneratedIPhoneXRXSMax118Widget.dart';
import 'package:flutterapp/appmovilapp/generatedunfilteredviewwidget/generated/GeneratedIPhoneXRXSMax1110Widget.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;

import 'generateddetailsplaceviewwidget/generated/GeneratedIPhoneXRXSMax117Widget.dart';

class Mapa extends StatefulWidget {
  final LatLng center;
  final Set<Marker> markers;
  final int zoom;
  final String searchFor;

  const Mapa({
    Key key,
    this.searchFor,
    this.center,
    this.zoom,
    this.markers,
  }) : super(key: key);

  @override
  _Mapa createState() => _Mapa();
}

class nearPlaces {
  String name;
  String type;
  LatLng location;
  double rating = 0;
  num totalRatings = 0;
}

class reviewsObj {
  double rate;
  String description;
  String userName;

  reviewsObj({
    this.rate,
    this.description,
    this.userName,
  });

  factory reviewsObj.fromJson(Map<String, dynamic> json) => reviewsObj(
        rate: json["rate"],
        description: json["text"],
        userName: json["userName"],
      );
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

class _Mapa extends State<Mapa> {
  bool _bool = false;
  bool _review = false;
  List<reviewsObj> _reviews = [];
  GoogleMapController mapController;
  Set<Marker> _markers;
  Set<Marker> _marker;
  LatLng _center;
  int _zoom;
  bool _isFav;
  List<dynamic> _places = [];
  nearPlaces childTitle;
  GlobalKey<GeneratedIPhoneXRXSMax117WidgetState> _keyChild1 = GlobalKey();
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<http.Response> getPlaces(lat, long) async {
    return await http.get(Uri.parse(
        'https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=$lat,$long&type=restaurant&radius=15000&key=AIzaSyCYrOoham5IJ0r3L_S80mpUPftWqxOuuZ0')); //&type=restaurant&keyword=cruise
  }

  @override
  void initState() {
    _markers = Set();
    _marker = Set();
    _isFav = false;
    _initMarkers();
    childTitle = new nearPlaces();
    _center = widget.center;
    _zoom = widget.zoom;
  }

  _setFalse(bool sw) {
    setState(() {
      if (sw) {
        _review = true;
      }
      _bool = false;
    });
  }

  _setReview(bool sw) {
    setState(() {
      _review = false;
    });
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  Future<void> _initMarkers() async {
    nearPlaces pc;
    String markerIdVal;
    String str = "";
    CollectionReference places =
        FirebaseFirestore.instance.collection('places');
    CollectionReference user = FirebaseFirestore.instance.collection('user');
    CollectionReference reviews =
        FirebaseFirestore.instance.collection('ratings');
    await _determinePosition().then((value) =>
        getPlaces(value.latitude, value.longitude).then((value) async => {
              for (var word in json.decode(value.body)['results'])
                {
                  //print(word),
                  if (word.containsKey('opening_hours') &&
                      word['opening_hours']['open_now'])
                    {
                      pc = new nearPlaces(),
                      pc.name = word['name'],
                      /* places
                          .where('name', isEqualTo: pc.name)
                          .get()
                          .then((value) async => {
                                print(pc.name),
                                if (value.docs.isEmpty)
                                  {
                                    /* await places.add({
                                      'name': pc.name,
                                      'rating': 0.0,
                                    }) */
                                  }
                                else
                                  {
                                    //nothing
                                  }
                              }), */
                      print(word['types']),
                      for (var i = 0; i < 2; i++)
                        {
                          str += word['types'][i].replaceAll("_", " ") + ", ",
                        },
                      str += word['types'][2].replaceAll("_", " "),
                      pc.type = str,
                      str = "",
                      pc.location = LatLng(word['geometry']['location']['lat'],
                          word['geometry']['location']['lng']),
                      _places.add(pc)
                      //print(pc.name),
                    }
                },
              setState(
                () {
                  for (var word in _places) {
                    markerIdVal = 'marker_id_${word.name}';
                    _markers.add(
                      Marker(
                        markerId: MarkerId(markerIdVal),
                        position: word.location,
                        onTap: () async {
                          print("This has been tap ${word.name}");
                          await places
                              .where('name', isEqualTo: word.name)
                              .get()
                              .then((value) async => {
                                    if (value.docs.isEmpty)
                                      {
                                        await places.add({
                                          'name': word.name,
                                          'rating': 0.0,
                                          'accumulatedRating': 0,
                                          'totalRating': 0
                                        })
                                      }
                                    else
                                      {
                                        word.rating =
                                            value.docs.first.data()['rating'],
                                        word.totalRatings = value.docs.first
                                            .data()['totalRating'],
                                        await reviews
                                            .where('placeName',
                                                isEqualTo: word.name)
                                            .get()
                                            .then((rwdata) async => {
                                                  _reviews.clear(),
                                                  if (rwdata.docs.isNotEmpty)
                                                    {
                                                      print(
                                                          "There are ${rwdata.docs.length}"),
                                                      _reviews = rwdata.docs
                                                          .toList()
                                                          .map((value) =>
                                                              reviewsObj
                                                                  .fromJson(value
                                                                      .data()))
                                                          .toList(),
                                                      /* for (var rws
                                                          in rwdata.docs)
                                                        {
                                                          print(rws.data()),
                                                          rw.userName =
                                                              rws.data()[
                                                                  'userName'],
                                                          rw.rate = rws
                                                              .data()['rate'],
                                                          rw.description =
                                                              rws.data()[
                                                                      'text'] ??
                                                                  " ",
                                                          _reviews.add(rw),
                                                        }, */
                                                    },
                                                  await user
                                                      .where('userId',
                                                          isEqualTo:
                                                              FirebaseAuth
                                                                  .instance
                                                                  .currentUser
                                                                  .uid)
                                                      .get()
                                                      .then((userval) => {
                                                            if (userval.docs[0]
                                                                .data()[
                                                                    'favPlaces']
                                                                .contains(
                                                                    word.name))
                                                              {
                                                                setState(() {
                                                                  _isFav = true;
                                                                })
                                                              }
                                                            else
                                                              {
                                                                setState(() {
                                                                  _isFav =
                                                                      false;
                                                                })
                                                              }
                                                          })
                                                })
                                      }
                                  });
                          setState(() {
                            _bool = true;
                            childTitle = word;
                            print(childTitle);
                            print(_bool);
                          });
                        },
                      ),
                    );
                    print(word.name);
                  }
                },
              ),
            }));
  }

  bool checkSearch(String searchFor) {
    if (searchFor.trim().isEmpty) {
      print("Did I make it?");
      _marker.clear();
      for (var pc in _places) {
        if (pc.name.toLowerCase().contains(searchFor.toLowerCase())) {
          _marker.add(_markers
              .where((element) =>
                  element.markerId == MarkerId('marker_id_${pc.name}'))
              .first);
        }
      }
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GoogleMap(
          onMapCreated: _onMapCreated,
          mapToolbarEnabled: true,
          myLocationEnabled: true,
          myLocationButtonEnabled: true,
          initialCameraPosition: CameraPosition(
            target: _center,
            zoom: _zoom.toDouble(),
          ),
          markers: (checkSearch(widget.searchFor)) ? _marker : _markers,
          // polylines: _polyline,
        ),
        Stack(children: [
          Container(
              alignment: Alignment.center,
              height: 725,
              child: _bool
                  ? GeneratedIPhoneXRXSMax117Widget(
                      setFalse: _setFalse,
                      key: _keyChild1,
                      title: this.childTitle,
                      setTrue: _setFalse,
                      review: _reviews,
                      isFav: _isFav,
                    )
                  : null),
          Container(
              alignment: Alignment.center,
              height: 700,
              child: _review
                  ? GeneratedIPhoneXRXSMax118Widget(
                      setTrue: _setReview, placeName: this.childTitle.name)
                  : null)
        ])
      ],
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
