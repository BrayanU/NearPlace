import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/appmovilapp/generatedprimeraviewwidget/GeneratedPrimeraviewWidget.dart';
import 'package:flutterapp/appmovilapp/generatedsignupviewwidget/GeneratedSignUpviewWidget.dart';
import 'package:flutterapp/appmovilapp/generatedloginviewwidget/GeneratedLogInviewWidget.dart';
import 'package:flutterapp/appmovilapp/generatedsignupviewwidget/userCreationGoogle.dart';
import 'package:flutterapp/appmovilapp/generatedunfilteredviewwidget/generated/GeneratedIPhoneXRXSMax1110Widget.dart';
import 'package:flutterapp/appmovilapp/generatedweatherviewwidget/generated/GeneratedIPhoneXRXSMax119Widget.dart';
import 'package:flutterapp/appmovilapp/generatedwelcomeviewwidget/GeneratedWelcomeviewWidget.dart';
import 'package:flutterapp/appmovilapp/generatedoptionsviewwidget/GeneratedOptionsviewWidget.dart';
import 'package:flutterapp/appmovilapp/generatedfilteredviewwidget/GeneratedFilteredviewWidget.dart';
import 'package:flutterapp/appmovilapp/generateddetailsplaceviewwidget/GeneratedDetailsplaceviewWidget.dart';
import 'package:flutterapp/appmovilapp/generatedreviewviewwidget/GeneratedReviewviewWidget.dart';
import 'package:flutterapp/appmovilapp/generatedweatherviewwidget/GeneratedWeatherviewWidget.dart';
import 'package:flutterapp/appmovilapp/generatedunfilteredviewwidget/GeneratedUnfilteredviewWidget.dart';
import 'package:flutterapp/appmovilapp/generatedsearchviewwidget/GeneratedSearchviewWidget.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(appMovilApp());
}

class appMovilApp extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: Scaffold(
          body: FutureBuilder(
        future: _initialization,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            print("Error ${snapshot.error}");
            return Wrong();
          } else if (snapshot.connectionState == ConnectionState.done) {
            print(FirebaseAuth.instance.currentUser);
            if (FirebaseAuth.instance.currentUser == null) {
              print("shouldn't be here");
              return GeneratedPrimeraviewWidget();
            } else {
              print("Aqui toy");
              return GeneratedWelcomeviewWidget();
            }
          }
          return Loading();
        },
      )),
      //initialRoute: '/GeneratedPrimeraviewWidget',
      routes: {
        '/GeneratedPrimeraviewWidget': (context) =>
            GeneratedPrimeraviewWidget(),
        '/GeneratedSignUpviewWidget': (context) => GeneratedSignUpviewWidget(),
        '/GeneratedLogInviewWidget': (context) => GeneratedLogInviewWidget(),
        '/GeneratedWelcomeviewWidget': (context) =>
            GeneratedWelcomeviewWidget(),
        '/userCreationGoogle': (context) => userCreationGoogle(),
        '/GeneratedOptionsviewWidget': (context) =>
            GeneratedOptionsviewWidget(),
        '/GeneratedFilteredviewWidget': (context) =>
            GeneratedFilteredviewWidget(),
        '/GeneratedDetailsplaceviewWidget': (context) =>
            GeneratedDetailsplaceviewWidget(),
        '/GeneratedReviewviewWidget': (context) => GeneratedReviewviewWidget(),
        '/GeneratedWeatherviewWidget': (context) =>
            GeneratedIPhoneXRXSMax119Widget(),
        '/GeneratedUnfilteredviewWidget': (context) =>
            GeneratedIPhoneXRXSMax1110Widget(),
        '/GeneratedSearchviewWidget': (context) => GeneratedSearchviewWidget(),
      },
    );
  }
}

class Wrong extends StatelessWidget {
  const Wrong({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: Text("Something went wrong")),
    );
  }
}

class Loading extends StatelessWidget {
  const Loading({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: Text("Loading")),
    );
  }
}
