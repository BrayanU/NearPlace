import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutterapp/appmovilapp/generatedsearchviewwidget/generated/GeneratedSearchWidget2.dart';
import 'package:flutterapp/appmovilapp/generatedunfilteredviewwidget/generated/GeneratedMapWidget6.dart';
import 'package:flutterapp/appmovilapp/generatedunfilteredviewwidget/generated/GeneratedRectangle6Widget6.dart';
import 'package:flutterapp/appmovilapp/generatedunfilteredviewwidget/generated/GeneratedLine9Widget.dart';
import 'package:flutterapp/appmovilapp/generatedunfilteredviewwidget/generated/GeneratedLine8Widget.dart';
import 'package:flutterapp/appmovilapp/generatedunfilteredviewwidget/generated/GeneratedRectangle3Widget9.dart';
import 'package:flutterapp/appmovilapp/generatedunfilteredviewwidget/generated/GeneratedRectangle7Widget6.dart';
import 'package:flutterapp/appmovilapp/generatedunfilteredviewwidget/generated/GeneratedNearPlaceWidget3.dart';
import 'package:flutterapp/appmovilapp/generatedunfilteredviewwidget/generated/GeneratedLine7Widget.dart';
import 'package:flutterapp/appmovilapp/generatedunfilteredviewwidget/generated/GeneratedVectorWidget35.dart';
import 'package:flutterapp/appmovilapp/generatedweatherviewwidget/generated/GeneratedIPhoneXRXSMax119Widget.dart';
import 'package:flutterapp/appmovilapp/mapa.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:weather/weather.dart';
import 'package:firebase_auth/firebase_auth.dart';

/* Group iPhone XR, XS Max, 11 – 10
    Autogenerated by FlutLab FTF Generator
  */
class GeneratedIPhoneXRXSMax1110Widget extends StatefulWidget {
  @override
  _GeneratedIPhoneXRXSMax1110WidgetState createState() =>
      _GeneratedIPhoneXRXSMax1110WidgetState();
}

String key = '856822fd8e22db5e1ba48c0e7d69844a';
WeatherFactory wf = new WeatherFactory(key);

class _GeneratedIPhoneXRXSMax1110WidgetState
    extends State<GeneratedIPhoneXRXSMax1110Widget> {
  bool searching = false, _weather = false;
  String namePlace = " ";
  bool routing = false;
  String tmpName;
  double temperature;
  String desc;

  bool _setRouting(bool sw) {
    setState(() {
      routing = sw;
    });
  }

  bool _setWeather(bool sw) {
    setState(() {
      _weather = false;
    });
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

  getWeather(lat, lon) async {
    w = await wf.currentWeatherByLocation(lat, lon);
    print(w.weatherDescription);
    setState(() {
      temperature = w.temperature.celsius;
      desc = w.weatherDescription;
      print(temperature);
    });
    //return await wf.currentWeatherByLocation(lat, lon).then((value) => {print(value.temperature)});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: searching
              ? Row(children: [
                  Container(
                      height: 40,
                      width: 200,
                      alignment: Alignment.center,
                      child: TextField(
                          onChanged: (value) {
                            tmpName = value;
                          },
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0)),
                            labelText: 'Buscar',
                          ))),
                  Container(
                    padding: EdgeInsets.all(8.0),
                    child: GestureDetector(
                      child: GeneratedSearchWidget2(),
                      onTap: () {
                        setState(() {
                          searching = false;
                          print(tmpName);
                          namePlace = tmpName;
                          tmpName = "";
                        });
                      },
                    ),
                  )
                ])
              : Text("NearPlace"),
        ),
        endDrawer: Drawer(
          key: Key("Drawer"),
          child: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MaterialButton(
                key: Key("Search"),
                child: Text("Search"),
                onPressed: () {
                  setState(() {
                    searching = true;
                  });
                  Navigator.pop(context);
                },
              ),
              MaterialButton(
                  child: Text("Weather"),
                  onPressed: () async {
                    await _determinePosition().then((value) async => {
                          await getWeather(value.latitude, value.longitude),
                          setState(() {
                            _weather = true;
                          }),
                          Navigator.pop(context)
                        });
                  }),
              MaterialButton(
                child: Text("Sign Out"),
                onPressed: () async {
                  print(FirebaseAuth.instance.currentUser);
                  await FirebaseAuth.instance
                      .signOut()
                      .then((value) => {
                            print("Signed Out"),
                            Navigator.pushNamed(
                                context, '/GeneratedPrimeraviewWidget')
                          })
                      .catchError(
                          (error) => {print("Error was caught: $error")});
                },
              )
            ],
          )),
        ),
        body: Container(
            child: Stack(
          children: [
            Mapa(
              key: Key("Mapa"),
              searchFor: this.namePlace,
              routing: _setRouting,
              offRoute: this.routing,
              center: LatLng(11.0040, -74.8071),
              zoom: 13,
              markers: Set(),
            ),
            routing
                ? Positioned(
                    left: 55,
                    right: 55,
                    child: Container(
                        alignment: Alignment.center,
                        height: 80,
                        width: 350,
                        color: Colors.orange,
                        child: Column(
                          children: [
                            Text("Origen --------------> Lugar 2",
                                style: new TextStyle(fontSize: 20)),
                            MaterialButton(
                                child: Text("Press here to Finish Routing",
                                    style: new TextStyle(fontSize: 20)),
                                onPressed: () {
                                  _setRouting(false);
                                })
                          ],
                        )))
                : Container(),
            Container(
                alignment: Alignment.center,
                height: 700,
                child: _weather
                    ? GeneratedIPhoneXRXSMax119Widget(
                        setWeather: _setWeather, temp: temperature, desc: desc)
                    : null)
          ],
        ))
        /*  Positioned(
                left: 0.0,
                top: 69.0,
                right: null,
                bottom: null,
                width: 515.0,
                height: 890.0,
                //child: GeneratedMapWidget6(),
                child: Mapa(
                  center: LatLng(10.9800, -74.7995),
                  zoom: 50,
                  markers: _markers,
                )), */
        /* Positioned(
              left: 18.0,
              top: 12.0,
              right: null,
              bottom: null,
              width: 422.0,
              height: 81.0,
              child: GeneratedRectangle6Widget6(),
            ), */
        /*  Positioned(
              left: 352.0,
              top: 12.0,
              right: null,
              bottom: null,
              width: 84.0,
              height: 81.0,
              child: GeneratedRectangle7Widget6(),
            ), */
        /* Positioned(
              left: 61.0,
              top: 35.0,
              right: null,
              bottom: null,
              width: 116.0,
              height: 33.0,
              child: GeneratedNearPlaceWidget3(),
            ), */
        /* Positioned(
              left: 372.5,
              top: 32.5,
              right: null,
              bottom: null,
              width: 48.426998138427734,
              height: 0.0,
              child: GeneratedLine7Widget(),
            ),
            Positioned(
              left: 372.5,
              top: 50.5,
              right: null,
              bottom: null,
              width: 48.426998138427734,
              height: 0.0,
              child: GeneratedLine8Widget(),
            ),
            Positioned(
              left: 372.5,
              top: 68.5,
              right: null,
              bottom: null,
              width: 48.426998138427734,
              height: 0.0,
              child: GeneratedLine9Widget(), )*/

        );
  }
}
