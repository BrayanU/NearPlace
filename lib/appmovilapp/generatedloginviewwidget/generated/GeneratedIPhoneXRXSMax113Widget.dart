import 'package:flutter/material.dart';
import 'package:flutterapp/appmovilapp/generatedloginviewwidget/generated/GeneratedBarranquillaWidget1.dart';
import 'package:flutterapp/appmovilapp/generatedloginviewwidget/generated/GeneratedRectangle3Widget2.dart';
import 'package:flutterapp/appmovilapp/generatedloginviewwidget/generated/GeneratedGroup2Widget2.dart';
import 'package:flutterapp/appmovilapp/generatedloginviewwidget/generated/GeneratedGroup9Widget.dart';
import 'package:flutterapp/appmovilapp/generatedloginviewwidget/generated/GeneratedBienvenidoWidget.dart';
import 'package:flutterapp/appmovilapp/generatedloginviewwidget/generated/GeneratedGroup12Widget.dart';
import 'package:flutterapp/appmovilapp/generatedloginviewwidget/generated/GeneratedGroup11Widget.dart';
import 'package:flutterapp/appmovilapp/generatedloginviewwidget/generated/GeneratedVectorWidget10.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

/* Group iPhone XR, XS Max, 11 – 3
    Autogenerated by FlutLab FTF Generator
  */
_login(theEmail, thePassword, ctx) async {
  try {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: theEmail, password: thePassword)
        .then((value) =>
            {Navigator.pushNamed(ctx, '/GeneratedWelcomeviewWidget')});
  } catch (e) {
    print(e);
    if (e.code == 'user-not-found') {
      print("user-not-found");
    } else if (e.code == 'wrong-password') {
      print("wrong-password");
    }
  }
}

class logInForm {
  String email;
  String password;
}

class GeneratedIPhoneXRXSMax113Widget extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  logInForm lif = new logInForm();
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 2035.0,
      height: 1017.5,
      child: Stack(
          fit: StackFit.expand,
          alignment: Alignment.center,
          overflow: Overflow.visible,
          children: [
            Positioned(
              left: 738.0,
              top: 89.0,
              right: null,
              bottom: null,
              width: 414.0,
              height: 896.0,
              child: GeneratedVectorWidget10(),
            ),
            Positioned(
              left: 0.0,
              top: 0.0,
              right: null,
              bottom: null,
              width: 2035.0,
              height: 1017.5,
              child: GeneratedBarranquillaWidget1(),
            ),
            Positioned(
              left: 716.0,
              top: 77.0,
              right: null,
              bottom: null,
              width: 459.0,
              height: 930.0,
              child: GeneratedRectangle3Widget2(),
            ),
            Form(
                key: _formKey,
                child: Stack(
                  children: [
                    Positioned(
                      left: 791.0,
                      top: 470.0,
                      right: null,
                      bottom: null,
                      width: 324.0,
                      height: 50.0,
                      child: GeneratedGroup9Widget(
                          onSaved: (value) => lif.email = value), //Email
                    ),
                    Positioned(
                      left: 791.0,
                      top: 555.0,
                      right: null,
                      bottom: null,
                      width: 324.0,
                      height: 50.0,
                      child: GeneratedGroup11Widget(
                          onSaved: (value) => lif.password = value), //Password
                    ),
                    Positioned(
                      left: 769.0,
                      top: 836.0,
                      right: null,
                      bottom: null,
                      width: 339.0,
                      height: 60.0,
                      child: MaterialButton(
                          onPressed: () async {
                            _formKey.currentState.save();
                            if (_formKey.currentState.validate()) {
                              print(lif.password);
                              await _login(lif.email, lif.password, context);
                              print("Its done.");
                            }
                          },
                          child: GeneratedGroup2Widget2()), //Login
                    )
                  ],
                )),
            Positioned(
              left: 853.0,
              top: 654.0,
              right: null,
              bottom: null,
              width: 202.0,
              height: 134.0,
              child: GeneratedGroup12Widget(),
            ),
            Positioned(
              left: 821.0,
              top: 272.0,
              right: null,
              bottom: null,
              width: 264.0,
              height: 67.0,
              child: GeneratedBienvenidoWidget(),
            )
          ]),
    );
  }
}
