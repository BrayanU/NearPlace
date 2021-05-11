import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:flutterapp/appmovilapp/generatedsignupviewwidget/generated/GeneratedGroup10Widget.dart';
import 'package:flutterapp/appmovilapp/generatedsignupviewwidget/generated/GeneratedGroup2Widget1.dart';
import 'package:flutterapp/appmovilapp/generatedsignupviewwidget/generated/GeneratedGroup6Widget.dart';
import 'package:flutterapp/appmovilapp/generatedsignupviewwidget/generated/GeneratedGroup3Widget.dart';
import 'package:flutterapp/appmovilapp/generatedsignupviewwidget/generated/GeneratedGroup4Widget.dart';
import 'package:flutterapp/appmovilapp/generatedsignupviewwidget/generated/GeneratedVectorWidget1.dart';
import 'package:flutterapp/appmovilapp/generatedsignupviewwidget/generated/GeneratedParanosotrosesungustorecibirteWidget.dart';
import 'package:flutterapp/appmovilapp/generatedsignupviewwidget/generated/GeneratedGroup5Widget.dart';
import 'package:flutterapp/appmovilapp/generatedsignupviewwidget/generated/GeneratedGroup8Widget.dart';
import 'package:flutterapp/appmovilapp/generatedsignupviewwidget/generated/GeneratedRectangle3Widget1.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:google_sign_in/google_sign_in.dart';

/* Group iPhone XR, XS Max, 11 – 2
    Autogenerated by FlutLab FTF Generator
  */

class signUpForm {
  String name;
  String email;
  String password;
  int number;
}

class GeneratedIPhoneXRXSMax112Widget extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  signUpForm sup = new signUpForm();
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  CollectionReference users = FirebaseFirestore.instance.collection('user');
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> _signup(email, password, name, phone, ctx) async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) => {
                print(value.user.uid),
                addUser(email, name, value.user.uid, phone).then((value) =>
                    Navigator.pushNamed(ctx, '/GeneratedWelcomeviewWidget')),
              });
    } on FirebaseAuthException catch (e) {
      print(e);
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      } else if (e.code == 'invalid-email') {
        print("The email is invalid.");
      }
    }
  }

  Future<void> addUser(email, name, uid, phone) {
    return users
        .add({
          "name": name.toString().trim(),
          "emailAddress": email.toString().trim(),
          "phoneNumber": phone,
          "userId": uid
        })
        .then((value) => print("User added to db " + value.toString()))
        .catchError((error) => print("Failed to add user: $error"));
  }

  Future signInWithGoogle() async {
    // get GoogleUser
    final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();

    // authenticate against google with that user
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    // get the credentials from the authentication to use on firebase
    final GoogleAuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    // use those credentials to signin with firebase
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 459.0,
      height: 930.0,
      child: Stack(
          fit: StackFit.expand,
          alignment: Alignment.center,
          overflow: Overflow.visible,
          children: [
            Positioned(
              left: 22.0,
              top: 12.0,
              right: null,
              bottom: null,
              width: 414.0,
              height: 896.0,
              child: GeneratedVectorWidget1(),
            ),
            Positioned(
              left: 0.0,
              top: 0.0,
              right: null,
              bottom: null,
              width: 459.0,
              height: 930.0,
              child: GeneratedRectangle3Widget1(),
            ),
            Positioned(
              left: 139.0,
              top: 73.0,
              right: null,
              bottom: null,
              width: 201.0,
              height: 128.0,
              child: GeneratedGroup3Widget(),
            ),
            Form(
                key: _formKey,
                child: Stack(children: [
                  Positioned(
                    key: Key("Name"),
                    left: 67.0,
                    top: 325.0,
                    right: null,
                    bottom: null,
                    width: 324.0,
                    height: 30.0,
                    child: GeneratedGroup4Widget(
                        onSaved: (value) => {
                              if (value.isNotEmpty) {sup.name = value}
                            }), //Nombre
                  ),
                  Positioned(
                    key: Key("Email"),
                    left: 67.0,
                    top: 402.0,
                    right: null,
                    bottom: null,
                    width: 324.0,
                    height: 50.0,
                    child: GeneratedGroup5Widget(
                        onSaved: (value) => {
                              if (value.isNotEmpty) {sup.email = value}
                            }), //Correo
                  ),
                  Positioned(
                    key: Key("Celular"),
                    left: 67.0,
                    top: 479.0,
                    right: null,
                    bottom: null,
                    width: 324.0,
                    height: 50.0,
                    child: GeneratedGroup6Widget(
                        onSaved: (value) => {
                              if (value.isNotEmpty)
                                {sup.number = int.parse(value)}
                            }), //Celular
                  ),
                  Positioned(
                    key: Key("Password"),
                    left: 67.0,
                    top: 556.0,
                    right: null,
                    bottom: null,
                    width: 324.0,
                    height: 50.0,
                    child: GeneratedGroup10Widget(
                        onSaved: (value) => {
                              if (value.isNotEmpty) {sup.password = value}
                            }), //Password
                  ),
                  Positioned(
//                    key: Key("Registrar"),
                    left: 60.0,
                    top: 725.0,
                    right: null,
                    bottom: null,
                    width: 339.0,
                    height: 60.0,
                    child: MaterialButton(
                        key: Key("Registrar"),
                        onPressed: () async {
                          _formKey.currentState.save();
                          if (_formKey.currentState.validate() &&
                              sup.email.isNotEmpty) {
                            print(sup.email);
                            await _signup(sup.email, sup.password, sup.name,
                                sup.number, context);
                            print("Its done.");
                          }
                        },
                        child: GeneratedGroup2Widget1()), //Boton registrar
                  )
                ])),
            Positioned(
              left: 80.0,
              top: 228.0,
              right: null,
              bottom: null,
              width: 300.0,
              height: 23.0,
              child: GeneratedParanosotrosesungustorecibirteWidget(),
            ),
            Positioned(
              left: 60.0,
              top: 807.0,
              right: null,
              bottom: null,
              width: 339.0,
              height: 60.0,
              child: GeneratedGroup8Widget(), //Cancelar
            ),
          ]),
    );
  }
}
