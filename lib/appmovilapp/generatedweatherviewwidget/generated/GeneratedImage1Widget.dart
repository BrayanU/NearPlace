import 'package:flutter/material.dart';
import 'package:weather/weather.dart';
import 'package:flutterapp/appmovilapp/generatedunfilteredviewwidget/generated/GeneratedRectangle7Widget6.dart'
    as weather;

/* Rectangle Image 1
    Autogenerated by FlutLab FTF Generator
  */

class GeneratedImage1Widget extends StatefulWidget {
  final String desc;
  final double temp;
  const GeneratedImage1Widget({Key key, this.desc, this.temp})
      : super(key: key);
  @override
  _GeneratedImage1WidgetState createState() => _GeneratedImage1WidgetState();
}

class _GeneratedImage1WidgetState extends State<GeneratedImage1Widget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 308.0,
      height: 200.0,
      child: ClipRRect(
        borderRadius: BorderRadius.zero,
        child: Padding(
          padding: const EdgeInsets.only(top: 3.0),
          child: Text(
            "Temperatura actual: ${widget.temp.toString()}° Celsius\n Descripción del clima: ${widget.desc}", //key2.toString(),
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.red, fontFamily: 'IranSansLight', fontSize: 20.0),
          ),
        ),
      ),
    );
  }
}
