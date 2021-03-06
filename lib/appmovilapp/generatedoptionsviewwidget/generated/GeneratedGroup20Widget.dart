import 'package:flutter/material.dart';
import 'package:flutterapp/appmovilapp/generatedoptionsviewwidget/generated/GeneratedEllipse1Widget5.dart';
import 'package:flutterapp/appmovilapp/generatedoptionsviewwidget/generated/GeneratedOp6Widget.dart';

/* Group Group 20
    Autogenerated by FlutLab FTF Generator
  */
class GeneratedGroup20Widget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, '/GeneratedFilteredviewWidget'),
      child: Container(
        width: 64.0,
        height: 62.0,
        child: Stack(
            fit: StackFit.expand,
            alignment: Alignment.center,
            overflow: Overflow.visible,
            children: [
              Positioned(
                left: 0.0,
                top: 0.0,
                right: null,
                bottom: null,
                width: 64.0,
                height: 62.0,
                child: GeneratedEllipse1Widget5(),
              ),
              Positioned(
                left: 15.17999267578125,
                top: 17.0,
                right: null,
                bottom: null,
                width: 36.0,
                height: 26.0,
                child: GeneratedOp6Widget(),
              )
            ]),
      ),
    );
  }
}
