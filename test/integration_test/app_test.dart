// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.
//  http://127.0.0.1:53777/GqXi1ru3GR0=/
//COMMAND: flutter drive --driver test/integration_test/driver.dart --target test/integration_test/app_test.dart

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutterapp/appmovilapp/generateddetailsplaceviewwidget/GeneratedDetailsplaceviewWidget.dart';
import 'package:flutterapp/appmovilapp/generatedfilteredviewwidget/GeneratedFilteredviewWidget.dart';
import 'package:flutterapp/appmovilapp/generatedloginviewwidget/GeneratedLogInviewWidget.dart';
import 'package:flutterapp/appmovilapp/generatedloginviewwidget/generated/GeneratedIPhoneXRXSMax113Widget.dart';
import 'package:flutterapp/appmovilapp/generatedoptionsviewwidget/GeneratedOptionsviewWidget.dart';
import 'package:flutterapp/appmovilapp/generatedprimeraviewwidget/GeneratedPrimeraviewWidget.dart';
import 'package:flutterapp/appmovilapp/generatedreviewviewwidget/GeneratedReviewviewWidget.dart';
import 'package:flutterapp/appmovilapp/generatedsearchviewwidget/GeneratedSearchviewWidget.dart';
import 'package:flutterapp/appmovilapp/generatedsignupviewwidget/GeneratedSignUpviewWidget.dart';
import 'package:flutterapp/appmovilapp/generatedsignupviewwidget/generated/GeneratedIPhoneXRXSMax112Widget.dart';
import 'package:flutterapp/appmovilapp/generatedsignupviewwidget/userCreationGoogle.dart';
import 'package:flutterapp/appmovilapp/generatedunfilteredviewwidget/generated/GeneratedIPhoneXRXSMax1110Widget.dart';
import 'package:flutterapp/appmovilapp/generatedweatherviewwidget/generated/GeneratedIPhoneXRXSMax119Widget.dart';
import 'package:flutterapp/appmovilapp/generatedwelcomeviewwidget/GeneratedWelcomeviewWidget.dart';
import 'package:flutterapp/appmovilapp/mapa.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';
import 'package:integration_test/integration_test.dart';
import 'package:mockito/mockito.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_core_platform_interface/firebase_core_platform_interface.dart';
import 'package:flutterapp/main.dart' as mainPage;

void setupFirebaseAuthMocks([Callback customHandlers]) {
  TestWidgetsFlutterBinding.ensureInitialized();

  MethodChannelFirebase.channel.setMockMethodCallHandler((call) async {
    if (call.method == 'Firebase#initializeCore') {
      return [
        {
          'name': defaultFirebaseAppName,
          'options': {
            'apiKey': '123',
            'appId': '123',
            'messagingSenderId': '123',
            'projectId': '123',
          },
          'pluginConstants': {},
        }
      ];
    }

    if (call.method == 'Firebase#initializeApp') {
      return {
        'name': call.arguments['appName'],
        'options': call.arguments['options'],
        'pluginConstants': {},
      };
    }

    if (customHandlers != null) {
      customHandlers();
    }

    return null;
  });
}

final mockObserver = MockNavigatorObserver();
Future<Widget> createHomeScreen() async {
  WidgetsFlutterBinding.ensureInitialized();
  return MaterialApp(
    debugShowCheckedModeBanner: false,
    home: mainPage.appMovilApp(),
    navigatorObservers: [mockObserver],
    navigatorKey: navigatorKey,
    routes: {
      '/GeneratedPrimeraviewWidget': (context) => GeneratedPrimeraviewWidget(),
      '/GeneratedSignUpviewWidget': (context) => GeneratedSignUpviewWidget(),
      '/GeneratedLogInviewWidget': (context) => GeneratedLogInviewWidget(),
      '/GeneratedWelcomeviewWidget': (context) => GeneratedWelcomeviewWidget(),
      '/userCreationGoogle': (context) => userCreationGoogle(),
      '/GeneratedOptionsviewWidget': (context) => GeneratedOptionsviewWidget(),
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

class MockBuildContext extends Mock implements BuildContext {}

class MockNavigatorObserver extends Mock implements NavigatorObserver {}

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
Future<void> main() async {
  //setupFirebaseAuthMocks();
  final binding = IntegrationTestWidgetsFlutterBinding.ensureInitialized()
      as IntegrationTestWidgetsFlutterBinding;
  group("description", () {
    binding.framePolicy = LiveTestWidgetsFlutterBindingFramePolicy.fullyLive;
    testWidgets("description", (tester) async {
      await Firebase.initializeApp();
      Widget w = await createHomeScreen();
      await tester.pumpWidget(w);
      await tester.pumpAndSettle(Duration(seconds: 5));

      //await tester.press(find.byKey(Key("SignUpEmail")));
      await tester.pumpAndSettle(Duration(seconds: 5));
      navigatorKey.currentState.push(MaterialPageRoute(
        builder: (context) => Material(
            child: GeneratedIPhoneXRXSMax112Widget()), //Emulating navigation
      ));

      await tester.pumpAndSettle(Duration(seconds: 5));

      //First User

      await tester.enterText(find.byKey(Key("Email")), 'testingUser@gmail.com');
      await tester.enterText(find.byKey(Key("Name")), 'testingUser');
      await tester.enterText(find.byKey(Key("Password")), '123456');
      await tester.enterText(find.byKey(Key("Celular")), '300000');
      await tester.pumpAndSettle(Duration(seconds: 5));
      MaterialButton btn = find.byKey(Key("Registrar")).evaluate().first.widget;
      btn.onPressed();
      verify(mockObserver.didPush(any, any));
      await tester.pumpAndSettle(Duration(seconds: 5));
      await tester.tap(find.descendant(
          of: find.byKey(Key("Close")), matching: find.byKey(Key("Cerrar"))));
      await tester.pumpAndSettle(Duration(seconds: 20));
      Mapa map = find.byKey(Key("Mapa")).evaluate().first.widget;
      await map.allMarks.elementAt(0).onTap();
      await tester.pumpAndSettle(Duration(seconds: 5));
      await tester.tap(find.descendant(
          of: find.byKey(Key("PlaceDetails")),
          matching: find.byKey(Key("Fav"))));
      await tester.pumpAndSettle(Duration(seconds: 5));
      await tester.tap(find.descendant(
          of: find.byKey(Key("PlaceDetails")),
          matching: find.byKey(Key("MakeReview"))));
      await tester.pumpAndSettle(Duration(seconds: 5));
      await tester.enterText(
          find.descendant(
              of: find.byKey(Key("Review")),
              matching: find.byKey(Key("Reseña"))),
          "It was not a good place");
      await tester.tapAt(Offset(70, 500)); //0.5
      //await tester.tapAt(Offset(280, 500)); // 5
      /* await tester.drag(
          find.descendant(
              of: find.byKey(Key("Review")),
              matching: find.byKey(Key("Rating"))),
          Offset(-50, 0)); */
      await tester.pumpAndSettle(Duration(seconds: 5));
      btn = await find
          .descendant(
              of: find.byKey(Key("Review")),
              matching: find.byKey(Key("Aceptar")))
          .evaluate()
          .first
          .widget;
      btn.onPressed();
      await tester.pumpAndSettle(Duration(seconds: 5));
      var drawer = find.byTooltip('Open navigation menu');
      await tester.tap(drawer);
      drawer.allCandidates.forEach((element) {
        print(element.widget.key);
      });
      await tester.pumpAndSettle(Duration(seconds: 5));
      btn = await find.byKey(Key("LogOut")).evaluate().first.widget;
      btn.onPressed();

      //Second User

      await tester.pumpAndSettle(Duration(seconds: 5));
      navigatorKey.currentState.push(MaterialPageRoute(
        builder: (context) => Material(
            child: GeneratedIPhoneXRXSMax112Widget()), //Emulating navigation
      ));

      await tester.pumpAndSettle(Duration(seconds: 5));
      await tester.enterText(
          find.byKey(Key("Email")), 'testingUser+1@gmail.com');
      await tester.enterText(find.byKey(Key("Name")), 'testingUser');
      await tester.enterText(find.byKey(Key("Password")), '123456');
      await tester.enterText(find.byKey(Key("Celular")), '300000');
      await tester.pumpAndSettle(Duration(seconds: 5));
      btn = find.byKey(Key("Registrar")).evaluate().first.widget;
      btn.onPressed();
      verify(mockObserver.didPush(any, any));
      await tester.pumpAndSettle(Duration(seconds: 5));
      await tester.tap(find.descendant(
          of: find.byKey(Key("Close")), matching: find.byKey(Key("Cerrar"))));
      await tester.pumpAndSettle(Duration(seconds: 20));
      map = find.byKey(Key("Mapa")).evaluate().first.widget;
      await map.allMarks.elementAt(0).onTap();
      await tester.pumpAndSettle(Duration(seconds: 5));
      await tester.tap(find.descendant(
          of: find.byKey(Key("PlaceDetails")),
          matching: find.byKey(Key("Fav"))));
      await tester.pumpAndSettle(Duration(seconds: 5));
      await tester.tap(find.descendant(
          of: find.byKey(Key("PlaceDetails")),
          matching: find.byKey(Key("MakeReview"))));
      await tester.pumpAndSettle(Duration(seconds: 5));
      await tester.enterText(
          find.descendant(
              of: find.byKey(Key("Review")),
              matching: find.byKey(Key("Reseña"))),
          "It was not a good place");
      await tester.tapAt(Offset(70, 500)); //0.5
      //await tester.tapAt(Offset(280, 500)); // 5
      /* await tester.drag(
          find.descendant(
              of: find.byKey(Key("Review")),
              matching: find.byKey(Key("Rating"))),
          Offset(-50, 0)); */
      await tester.pumpAndSettle(Duration(seconds: 5));
      btn = await find
          .descendant(
              of: find.byKey(Key("Review")),
              matching: find.byKey(Key("Aceptar")))
          .evaluate()
          .first
          .widget;
      btn.onPressed();
      await tester.pumpAndSettle(Duration(seconds: 5));
      drawer = find.byTooltip('Open navigation menu');
      await tester.tap(drawer);
      drawer.allCandidates.forEach((element) {
        print(element.widget.key);
      });
      await tester.pumpAndSettle(Duration(seconds: 5));
      btn = await find.byKey(Key("LogOut")).evaluate().first.widget;
      btn.onPressed();

      //Third user

      await tester.pumpAndSettle(Duration(seconds: 5));
      navigatorKey.currentState.push(MaterialPageRoute(
        builder: (context) => Material(
            child: GeneratedIPhoneXRXSMax112Widget()), //Emulating navigation
      ));

      await tester.pumpAndSettle(Duration(seconds: 5));
      await tester.enterText(
          find.byKey(Key("Email")), 'testingUser+2@gmail.com');
      await tester.enterText(find.byKey(Key("Name")), 'testingUser');
      await tester.enterText(find.byKey(Key("Password")), '123456');
      await tester.enterText(find.byKey(Key("Celular")), '300000');
      await tester.pumpAndSettle(Duration(seconds: 5));
      btn = find.byKey(Key("Registrar")).evaluate().first.widget;
      btn.onPressed();
      verify(mockObserver.didPush(any, any));
      await tester.pumpAndSettle(Duration(seconds: 5));
      await tester.tap(find.descendant(
          of: find.byKey(Key("Close")), matching: find.byKey(Key("Cerrar"))));
      await tester.pumpAndSettle(Duration(seconds: 20));
      map = find.byKey(Key("Mapa")).evaluate().first.widget;
      await map.allMarks.elementAt(0).onTap();
      await tester.pumpAndSettle(Duration(seconds: 5));
      await tester.tap(find.descendant(
          of: find.byKey(Key("PlaceDetails")),
          matching: find.byKey(Key("Fav"))));
      await tester.pumpAndSettle(Duration(seconds: 5));
      await tester.tap(find.descendant(
          of: find.byKey(Key("PlaceDetails")),
          matching: find.byKey(Key("MakeReview"))));
      await tester.pumpAndSettle(Duration(seconds: 5));
      await tester.enterText(
          find.descendant(
              of: find.byKey(Key("Review")),
              matching: find.byKey(Key("Reseña"))),
          "It was not a good place");
      //await tester.tapAt(Offset(70, 500)); //0.5
      await tester.tapAt(Offset(280, 500)); // 5
      /* await tester.drag(
          find.descendant(
              of: find.byKey(Key("Review")),
              matching: find.byKey(Key("Rating"))),
          Offset(-50, 0)); */
      await tester.pumpAndSettle(Duration(seconds: 5));
      btn = await find
          .descendant(
              of: find.byKey(Key("Review")),
              matching: find.byKey(Key("Aceptar")))
          .evaluate()
          .first
          .widget;
      btn.onPressed();
      await tester.pumpAndSettle(Duration(seconds: 5));
      drawer = find.byTooltip('Open navigation menu');
      await tester.tap(drawer);
      drawer.allCandidates.forEach((element) {
        print(element.widget.key);
      });
      await tester.pumpAndSettle(Duration(seconds: 5));
      btn = await find.byKey(Key("LogOut")).evaluate().first.widget;
      btn.onPressed();

      //FirstUserlogin

      await tester.pumpAndSettle(Duration(seconds: 5));
      navigatorKey.currentState.push(MaterialPageRoute(
        builder: (context) => Material(
            child: GeneratedIPhoneXRXSMax113Widget()), //Emulating navigation
      ));
      await tester.pumpAndSettle(Duration(seconds: 5));
      await tester.enterText(find.byKey(Key("Email")), 'testingUser@gmail.com');
      await tester.enterText(find.byKey(Key("Password")), '123456');
      await tester.pumpAndSettle(Duration(seconds: 5));
      btn = find.byKey(Key("Login")).evaluate().first.widget;
      btn.onPressed();
      await tester.pumpAndSettle(Duration(seconds: 5));
      await tester.tap(find.descendant(
          of: find.byKey(Key("Close")), matching: find.byKey(Key("Cerrar"))));
      await tester.pumpAndSettle(Duration(seconds: 20));
      map = find.byKey(Key("Mapa")).evaluate().first.widget;
      await map.allMarks.elementAt(0).onTap();
      await tester.pumpAndSettle(Duration(seconds: 5));
    });

    /// Build our app and trigger a frame.
    // await tester.pumpWidget(MyApp());

    /// Verify that our counter starts at 0.
    // expect(find.text('0'), findsOneWidget);
    // expect(find.text('1'), findsNothing);

    /// Tap the '+' icon and trigger a frame.
    // await tester.tap(find.byIcon(Icons.add));
    // await tester.pump();

    /// Verify that our counter has incremented.
    // expect(find.text('0'), findsNothing);
    // expect(find.text('1'), findsOneWidget);
  });
}
