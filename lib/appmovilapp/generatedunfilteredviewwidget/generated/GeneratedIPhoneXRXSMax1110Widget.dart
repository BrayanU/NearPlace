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
import 'package:flutterapp/appmovilapp/mapa.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

/* Group iPhone XR, XS Max, 11 – 10
    Autogenerated by FlutLab FTF Generator
  */
class GeneratedIPhoneXRXSMax1110Widget extends StatefulWidget {
  @override
  _GeneratedIPhoneXRXSMax1110WidgetState createState() =>
      _GeneratedIPhoneXRXSMax1110WidgetState();
}

class _GeneratedIPhoneXRXSMax1110WidgetState
    extends State<GeneratedIPhoneXRXSMax1110Widget> {
  bool searching = false;
  String namePlace = " ";
  String tmpName;

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
          child: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MaterialButton(
                child: Text("Search"),
                onPressed: () {
                  setState(() {
                    searching = true;
                  });
                  Navigator.pop(context);
                },
              )
            ],
          )),
        ),
        body: Container(
            child: Mapa(
          searchFor: this.namePlace,
          center: LatLng(11.0040, -74.8071),
          zoom: 50,
          //markers: _markers,
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
