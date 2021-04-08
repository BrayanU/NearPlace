import 'package:flutter/material.dart';
import 'package:flutterapp/helpers/mask/mask.dart';

/* Vector Rectangle 4
    Autogenerated by FlutLab FTF Generator
  */
class GeneratedRectangle4Widget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300.0,
      height: 346.0,
      child: Stack(
          fit: StackFit.expand,
          alignment: Alignment.center,
          overflow: Overflow.visible,
          children: [
            Positioned(
              left: 0.0,
              top: 0.0,
              right: 0.0,
              bottom: 0.0,
              width: null,
              height: null,
              child: Mask.fromSVGPath(
                'M285 0L15 0C6.71573 0 0 6.71573 0 15L0 331C0 339.284 6.71573 346 15 346L285 346C293.284 346 300 339.284 300 331L300 15C300 6.71573 293.284 0 285 0Z',
                child: Image.asset(
                  "assets/images/0161d7530b8435ebd837316d40fa9334867817ce.png",
                  color: null,
                  fit: BoxFit.cover,
                  width: 300.0,
                  height: 346.0,
                  colorBlendMode: BlendMode.dstATop,
                ),
                offset: Offset(0.0, 0.0),
              ),
            )
          ]),
    );
  }
}