import 'dart:convert';
import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/appmovilapp/generateddetailsplaceviewwidget/GeneratedDetailsplaceviewWidget.dart';
import 'package:flutterapp/appmovilapp/generatedreviewviewwidget/generated/GeneratedIPhoneXRXSMax118Widget.dart';
import 'package:flutterapp/appmovilapp/generatedunfilteredviewwidget/generated/GeneratedIPhoneXRXSMax1110Widget.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geocoding/geocoding.dart';
import 'package:http/http.dart' as http;

import 'generateddetailsplaceviewwidget/generated/GeneratedIPhoneXRXSMax117Widget.dart';

class Mapa extends StatefulWidget {
  final LatLng center;
  final Set<Marker> markers;
  final int zoom;
  final Set<Marker> allMarks;
  final String searchFor;
  final String distanceF;
  final ValueChanged<bool> routing;
  final ValueChanged<Set<Marker>> marks;
  final bool offRoute;

  const Mapa({
    Key key,
    this.routing,
    this.marks,
    this.searchFor,
    this.distanceF,
    this.center,
    this.zoom,
    this.markers,
    this.offRoute,
    this.allMarks,
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
  PolylinePoints polylinePoints;
  Set<Polyline> polylines = {};
  Set<Polyline> emptyPoly = {};
  List<LatLng> polylineCoordinates = [];
  bool _bool = false;
  bool _review = false;
  double dist;
  List<reviewsObj> _reviews = [];
  GoogleMapController mapController;
  Set<Marker> _markers;
  Set<Marker> _marker;
  Set<Marker> _route;
  LatLng _center;
  int _zoom;
  bool _isFav;
  List<dynamic> _places = [];
  nearPlaces childTitle;
  GlobalKey<GeneratedIPhoneXRXSMax117WidgetState> _keyChild1 = GlobalKey();
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<http.Response> getPlaces(lat, long,dist3) async {
    print("getPlace");
    print(dist);
    return await http.get(Uri.parse(
        'https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=$lat,$long&type=restaurant&radius=$dist3&key=AIzaSyCYrOoham5IJ0r3L_S80mpUPftWqxOuuZ0')); //&type=restaurant&keyword=cruise
  }

  @override
  void initState() {
    _markers = Set();
    _marker = Set();
    _route = Set();
    polylines = Set();
    dist=10.0;
    emptyPoly = Set();
    _isFav = false;
    _initMarkers(dist);
    childTitle = new nearPlaces();
    _center = widget.center;
    _zoom = widget.zoom;
  }

  // Create the polylines for showing the route between two places
  Future<bool> _createPolylines(Position start, Position destination) async {
    polylinePoints = PolylinePoints();
    await polylinePoints
        .getRouteBetweenCoordinates(
          'AIzaSyCYrOoham5IJ0r3L_S80mpUPftWqxOuuZ0',
          PointLatLng(start.latitude, start.longitude),
          PointLatLng(destination.latitude, destination.longitude),
          travelMode: TravelMode.driving,
        )
        .then((value) => setState(() {
              if (value.points.isNotEmpty) {
                value.points.forEach((PointLatLng point) {
                  polylineCoordinates
                      .add(LatLng(point.latitude, point.longitude));
                });
              }
              PolylineId id = PolylineId('poly');
              Polyline polyline = Polyline(
                polylineId: id,
                color: Colors.blue,
                points: polylineCoordinates,
                width: 3,
              );
              polylines.add(polyline);
            }));
    return true;
  }

  _makeaRoute() async {
    Marker startMarker, destinationMarker;
  
    await Geolocator.getCurrentPosition().then((value) async => {
          startMarker = Marker(
              markerId: MarkerId('${value.latitude}'),
              position: LatLng(value.latitude, value.longitude)),
          destinationMarker = Marker(
              markerId: MarkerId("${this.childTitle.name}"),
              position: this.childTitle.location),
          await _createPolylines(
                  value,
                  Position(
                      latitude: this.childTitle.location.latitude,
                      longitude: this.childTitle.location.longitude))
              .then((value) => {
                    setState(() {
                      _route.add(startMarker);
                      _route.add(destinationMarker);
                    })
                  }),
        });
    return true;
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

  Future<void> _initMarkers(double dist2) async {
    nearPlaces pc;
    print("InitMarkers1");
    print(dist2);
    String markerIdVal;
    String str = "";
    CollectionReference places =
        FirebaseFirestore.instance.collection('places');
    CollectionReference user = FirebaseFirestore.instance.collection('user');
    CollectionReference reviews =
        FirebaseFirestore.instance.collection('ratings');
    await _determinePosition().then((value) =>
        getPlaces(value.latitude, value.longitude,dist2).then((value) async => {
              for (var word in json.decode(value.body)['results'])
                { 
                  //print(word),
                  if (word.containsKey(
                      'opening_hours') /*  &&
                      word['opening_hours']['open_now'] */
                  )
                    {
                      pc = new nearPlaces(),
                      pc.name = word['name'],
                      print(word['types']),
                      if (word['types'].length >= 3)
                        {
                          for (var i = 0; i < 2; i++)
                            {
                              str +=
                                  word['types'][i].replaceAll("_", " ") + ", ",
                            },
                          str += word['types'][2].replaceAll("_", " "),
                        }
                      else
                        {
                          for (var i = 0; i < word['types'].length; i++)
                            {
                              str +=
                                  word['types'][i].replaceAll("_", " ") + ", ",
                            },
                        },
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
              setState(() {
                print("THIS IS NULL${_markers.length}");
                widget.marks(_markers);
              }),
              print(widget.marks)
            }));
  }
checkDistance(String distanceF) {
    if (distanceF.trim().isNotEmpty){
      print("empty");
      if (dist.compareTo(double.parse(distanceF))!=0) {
        print("checkDistance");
        _markers.clear();
        dist = double.parse(distanceF);
        print(dist);
        _initMarkers(dist);
        return true;
      }
    }
    
    return false;
  }
  checkSearch(String searchFor) {
    if (searchFor.trim().isNotEmpty) {
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

  checkRoute(bool sw) {
    if (sw) {
      setState(() {
        polylines.clear();
        _route.clear();
        polylineCoordinates.clear();
      });
      _makeaRoute().then((v) async {
        print(v);
        setState(() {
          print(polylines.length);
          widget.routing(true);
        });
      });
    }
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
          markers: widget.offRoute
              ? _route
              : ((checkSearch(widget.searchFor)) ?  _marker : 
              ((checkDistance(widget.distanceF)) ?  _markers : 
              _markers)),
          polylines: widget.offRoute ? polylines : emptyPoly,
        ),
        Stack(children: [
          Container(
              alignment: Alignment.center,
              height: 725,
              child: _bool
                  ? GeneratedIPhoneXRXSMax117Widget(
                      setFalse: _setFalse,
                      setRoute: checkRoute,
                      key: Key("PlaceDetails"),
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
                      key: Key("Review"),
                      setTrue: _setReview,
                      placeName: this.childTitle.name)
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
