import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:favorite_button/favorite_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutterapp/appmovilapp/generateddetailsplaceviewwidget/generated/GeneratedStar1Widget2.dart';
import 'package:flutterapp/appmovilapp/generateddetailsplaceviewwidget/generated/GeneratedStar1Widget1.dart';
import 'package:flutterapp/appmovilapp/generateddetailsplaceviewwidget/generated/GeneratedFotolugarWidget.dart';
import 'package:flutterapp/appmovilapp/generateddetailsplaceviewwidget/generated/GeneratedNombreLugarWidget.dart';
import 'package:flutterapp/appmovilapp/generateddetailsplaceviewwidget/generated/GeneratedReseasWidget.dart';
import 'package:flutterapp/appmovilapp/generateddetailsplaceviewwidget/generated/GeneratedDescripcinlugarWidget.dart';
import 'package:flutterapp/appmovilapp/generateddetailsplaceviewwidget/generated/GeneratedPinWidget7.dart';
import 'package:flutterapp/appmovilapp/generateddetailsplaceviewwidget/generated/GeneratedXWidget1.dart';
import 'package:flutterapp/appmovilapp/generateddetailsplaceviewwidget/generated/GeneratedRectangle12Widget.dart';
import 'package:flutterapp/appmovilapp/generateddetailsplaceviewwidget/generated/Generated276reseasWidget.dart';
import 'package:flutterapp/appmovilapp/generateddetailsplaceviewwidget/generated/GeneratedStar1Widget3.dart';
import 'package:flutterapp/appmovilapp/generateddetailsplaceviewwidget/generated/GeneratedRectangle3Widget6.dart';
import 'package:flutterapp/appmovilapp/generateddetailsplaceviewwidget/generated/GeneratedPinWidget4.dart';
import 'package:flutterapp/appmovilapp/generateddetailsplaceviewwidget/generated/GeneratedPinWidget5.dart';
import 'package:flutterapp/appmovilapp/generateddetailsplaceviewwidget/generated/GeneratedLine2Widget2.dart';
import 'package:flutterapp/appmovilapp/generateddetailsplaceviewwidget/generated/GeneratedPinWidget6.dart';
import 'package:flutterapp/appmovilapp/generateddetailsplaceviewwidget/generated/GeneratedStar1Widget4.dart';
import 'package:flutterapp/appmovilapp/generateddetailsplaceviewwidget/generated/GeneratedLine1Widget3.dart';
import 'package:flutterapp/appmovilapp/generateddetailsplaceviewwidget/generated/GeneratedStar1Widget.dart';
import 'package:flutterapp/appmovilapp/generateddetailsplaceviewwidget/generated/GeneratedRectangle7Widget3.dart';
import 'package:flutterapp/appmovilapp/generateddetailsplaceviewwidget/generated/GeneratedLine3Widget3.dart';
import 'package:flutterapp/appmovilapp/generateddetailsplaceviewwidget/generated/GeneratedGroup21Widget1.dart';
import 'package:flutterapp/appmovilapp/generateddetailsplaceviewwidget/generated/GeneratedRepeatGrid1Widget.dart';
import 'package:flutterapp/appmovilapp/generateddetailsplaceviewwidget/generated/GeneratedMapWidget3.dart';
import 'package:flutterapp/appmovilapp/generateddetailsplaceviewwidget/generated/GeneratedRectangle6Widget3.dart';
import 'package:flutterapp/appmovilapp/generateddetailsplaceviewwidget/generated/GeneratedVectorWidget30.dart';
import 'package:flutterapp/appmovilapp/generateddetailsplaceviewwidget/generated/GeneratedGroupWidget1.dart';
import 'package:flutterapp/appmovilapp/generateddetailsplaceviewwidget/generated/GeneratedOpcinWidget1.dart';
import 'package:flutterapp/appmovilapp/mapa.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

/* Group iPhone XR, XS Max, 11 – 7
    Autogenerated by FlutLab FTF Generator
  */
class GeneratedIPhoneXRXSMax117Widget extends StatefulWidget {
  final ValueChanged<bool> setFalse, setTrue, setRoute;
  final bool isFav;
  final nearPlaces title;
  final List<reviewsObj> review;
  const GeneratedIPhoneXRXSMax117Widget(
      {Key key,
      this.setFalse,
      this.title,
      this.setRoute,
      this.setTrue,
      this.review,
      this.isFav})
      : super(key: key);
  @override
  GeneratedIPhoneXRXSMax117WidgetState createState() =>
      GeneratedIPhoneXRXSMax117WidgetState();
}

class GeneratedIPhoneXRXSMax117WidgetState
    extends State<GeneratedIPhoneXRXSMax117Widget> {
  CollectionReference user = FirebaseFirestore.instance.collection('user');

  Future<String> pedirlugar(_lugar) async {
    var respuesta = await http.get(Uri.parse(
        "https://maps.googleapis.com/maps/api/place/findplacefromtext/json?input=$_lugar&inputtype=textquery&fields=photos&key=AIzaSyCYrOoham5IJ0r3L_S80mpUPftWqxOuuZ0"));
    var res = json.decode(respuesta.body)["candidates"][0]["photos"][0]
        ["photo_reference"];
    print(res);
    return res;
  }

  Future<Image> pedirfoto(_lugar) async {
    var _reference = await pedirlugar(_lugar);

    var respuesta =
        "https://maps.googleapis.com/maps/api/place/photo?maxwidth=500&photoreference=$_reference&key=AIzaSyCYrOoham5IJ0r3L_S80mpUPftWqxOuuZ0";
    return Image.network(respuesta);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      //decoration: BoxDecoration(borderRadius: BorderRadius.zero),
      width: 350,
      height: 730,
      child: Stack(
          fit: StackFit.expand,
          alignment: Alignment.center,
          overflow: Overflow.visible,
          children: [
            /* Positioned(
              left: 22.0,
              top: 12.0,
              right: null,
              bottom: null,
              width: 414.0,
              height: 896.0,
              child: GeneratedVectorWidget30(),
            ), */
            /* Positioned(
              left: 0.0,
              top: 0.0,
              right: null,
              bottom: null,
              width: 459.0,
              height: 930.0,
              child: GeneratedRectangle3Widget6(),
            ), */
            /* Positioned(
              left: 0.0,
              top: 69.0,
              right: null,
              bottom: null,
              width: 515.0,
              height: 890.0,
              child: GeneratedMapWidget3(),
            ), */
            /* Positioned(
              left: 18.0,
              top: 12.0,
              right: null,
              bottom: null,
              width: 422.0,
              height: 81.0,
              child: GeneratedRectangle6Widget3(),
            ),
            Positioned(
              left: 352.0,
              top: 12.0,
              right: null,
              bottom: null,
              width: 84.0,
              height: 81.0,
              child: GeneratedRectangle7Widget3(),
            ), */
            /*  Positioned(
              left: 369.5,
              top: 32.5,
              right: null,
              bottom: null,
              width: 48.426998138427734,
              height: 0.0,
              child: GeneratedLine1Widget3(),
            ),
            Positioned(
              left: 369.5,
              top: 50.5,
              right: null,
              bottom: null,
              width: 48.426998138427734,
              height: 0.0,
              child: GeneratedLine2Widget2(),
            ),
            Positioned(
              left: 369.5,
              top: 68.5,
              right: null,
              bottom: null,
              width: 48.426998138427734,
              height: 0.0,
              child: GeneratedLine3Widget3(),
            ), */
            /* Positioned(
              left: 61.0,
              top: 35.0,
              right: null,
              bottom: null,
              width: 96.0,
              height: 30.0,
              child: GeneratedOpcinWidget1(),
            ), */
            /* Positioned(
              left: 109.0,
              top: 242.0,
              right: null,
              bottom: null,
              width: 31.388015747070312,
              height: 75.8479995727539,
              child: GeneratedPinWidget4(),
            ),
            Positioned(
              left: 179.0,
              top: 553.0,
              right: null,
              bottom: null,
              width: 31.388015747070312,
              height: 75.8479995727539,
              child: GeneratedPinWidget5(),
            ),
            Positioned(
              left: 315.0,
              top: 317.0,
              right: null,
              bottom: null,
              width: 31.388015747070312,
              height: 75.8479995727539,
              child: GeneratedPinWidget6(),
            ),
            Positioned(
              left: 267.0,
              top: 713.0,
              right: null,
              bottom: null,
              width: 31.388015747070312,
              height: 75.8479995727539,
              child: GeneratedPinWidget7(),
            ), */
            Stack(
              children: [
                Positioned(
/*                   left: 56.0,
                  top: 127.0, */
                  right: null,
                  bottom: null,
                  width: 347.0,
                  height: 724.0,
                  child: GeneratedGroupWidget1(),
                ),
                Positioned(
                    left: 320,
                    top: 10.0,
                    right: null,
                    bottom: null,
                    width: 22.0,
                    height: 35.0,
                    child: GestureDetector(
                      child: GeneratedXWidget1(),
                      onTap: () {
                        widget.setFalse(false);
                      },
                    )),
                Positioned(
                    top: 40,
                    left: 280,
                    child: FavoriteButton(
                      key: Key("Fav"),
                      isFavorite: widget.isFav,
                      iconSize: 40,
                      valueChanged: (valueFav) async {
                        if (valueFav) {
                          await user
                              .where('userId',
                                  isEqualTo:
                                      FirebaseAuth.instance.currentUser.uid)
                              .get()
                              .then((value) async => {
                                    await user.doc(value.docs[0].id).update({
                                      'favPlaces': FieldValue.arrayUnion(
                                          [widget.title.name])
                                    })
                                  });
                        } else {
                          await user
                              .where('userId',
                                  isEqualTo:
                                      FirebaseAuth.instance.currentUser.uid)
                              .where('favPlaces',
                                  arrayContains: widget.title.name)
                              .get()
                              .then((value) async => {
                                    if (value.docs.isNotEmpty)
                                      {
                                        await user
                                            .doc(value.docs[0].id)
                                            .update({
                                          'favPlaces': FieldValue.arrayRemove(
                                              [widget.title.name])
                                        })
                                      }
                                  });
                        }
                      },
                    )),
                Positioned(
                  left: 20,
                  top: 10,
                  right: null,
                  bottom: null,
                  width: 300.0,
                  height: 30.0,
                  child: Text(widget.title.name,
                      style: TextStyle(
                        height: 1.171875,
                        fontSize: 25.0,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w400,
                        color: Color.fromARGB(255, 112, 112, 112),
                      )),
                ),
                /* Positioned(
              left: 86.00221252441406,
              top: 198.99948120117188,
              right: null,
              bottom: null,
              width: 23.236413955688477,
              height: 22.275136947631836,
              child: GeneratedStar1Widget(),
            ),
            Positioned(
              left: 113.00221252441406,
              top: 198.99948120117188,
              right: null,
              bottom: null,
              width: 23.236413955688477,
              height: 22.275136947631836,
              child: GeneratedStar1Widget1(),
            ),
            Positioned(
              left: 140.00221252441406,
              top: 198.99948120117188,
              right: null,
              bottom: null,
              width: 23.236413955688477,
              height: 22.275136947631836,
              child: GeneratedStar1Widget2(),
            ),
            Positioned(
              left: 167.00221252441406,
              top: 198.99948120117188,
              right: null,
              bottom: null,
              width: 23.236413955688477,
              height: 22.275136947631836,
              child: GeneratedStar1Widget3(),
            ),
            Positioned(
              left: 194.00221252441406,
              top: 198.99948120117188,
              right: null,
              bottom: null,
              width: 23.236413955688477,
              height: 22.275136947631836,
              child: GeneratedStar1Widget4(),
            ), */
                Positioned(
                    top: 40,
                    left: 20,
                    child: RatingBarIndicator(
                      rating: widget.title.rating,
                      direction: Axis.horizontal,
                      itemCount: 5,
                      itemSize: 25,
                      itemPadding: EdgeInsets.symmetric(horizontal: 0.0),
                      itemBuilder: (context, _) => Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                    )),
                Positioned(
                  left: 150,
                  top: 45,
                  right: null,
                  bottom: null,
                  width: 95.0,
                  height: 22.0,
                  child: Text("${widget.title.totalRatings} reviews",
                      style: TextStyle(
                        height: 1.171875,
                        fontSize: 17.0,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w400,
                        color: Color.fromARGB(255, 112, 112, 112),
                      )),
                ),
                // Positioned(
                //   left: 20.0,
                //   top: 90.0,
                //   right: null,
                //   bottom: null,
                //   //child: GeneratedRectangle12Widget(),
                // ),
                Positioned(
                  left: 20,
                  top: 120.0,
                  right: null,
                  bottom: null,
                  child: FutureBuilder<String>(
                      future: pedirlugar(widget.title.name),
                      builder: (context, AsyncSnapshot<String> snapshot) {
                        if (snapshot.hasData) {
                          return Image.network(
                              "https://maps.googleapis.com/maps/api/place/photo?maxwidth=300&photoreference=${snapshot.data}&key=AIzaSyCYrOoham5IJ0r3L_S80mpUPftWqxOuuZ0");
                        } else {
                          return CircularProgressIndicator();
                        }
                      }),
                ),
                Positioned(
                  left: 30.0,
                  top: 360.0,
                  right: null,
                  bottom: null,
                  width: 300.0,
                  height: 23.0,
                  child: Text(widget.title.type,
                      style: TextStyle(
                        height: 1.171875,
                        fontSize: 15.0,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w400,
                        color: Color.fromARGB(255, 112, 112, 112),
                      )),
                ),
                Positioned(
                  left: 130,
                  top: 390.0,
                  right: null,
                  bottom: null,
                  width: 97.0,
                  height: 33.0,
                  child: GeneratedReseasWidget(),
                ),
                Positioned(
                  left: 60,
                  top: 430.0,
                  right: null,
                  bottom: null,
                  width: 244.1741943359375,
                  height: 187.00001525878906,
                  child: (widget.review != null && widget.review.isNotEmpty)
                      ? ListView(
                          children: widget.review.map(_buildItem).toList(),
                        )
                      : Text("No se han realizado reseñas, se el primero!"),
                ),
                Positioned(
                  left: 170.0,
                  top: 650.0,
                  right: null,
                  bottom: null,
                  width: 69.0,
                  height: 29.0,
                  child: GestureDetector(
                    key: Key("MakeReview"),
                    child: GeneratedGroup21Widget1(),
                    onTap: () {
                      widget.setTrue(true);
                    },
                  ),
                ),
                Positioned(
                    left: 80,
                    top: 650,
                    width: 69,
                    height: 29,
                    child: GestureDetector(
                        child: MaterialButton(
                            color: Colors.orange,
                            child: Text("Go",
                                style: new TextStyle(
                                    fontSize: 20, color: Colors.white)),
                            onPressed: () {}),
                        onTap: () {
                          widget.setRoute(true);
                          widget.setFalse(false);
                        }))
              ],
            )
          ]),
    );
  }
}

Widget _buildItem(reviewsObj reviews) {
  return new ListTile(
    title: new Text("${reviews.userName} || ${reviews.rate} estrellas"),
    subtitle: (reviews.description != "")
        ? Text("Reseña: ${reviews.description}")
        : null,
  );
}
