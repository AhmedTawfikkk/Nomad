import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:softwareengineering/daif/one-way.dart';
import 'package:softwareengineering/daif/round_flight.dart';
import 'package:softwareengineering/eman/feedback.dart';
import 'package:softwareengineering/eman/reservation_Flight.dart';
import 'package:softwareengineering/eman/rooms.dart';
import 'package:softwareengineering/home/home.dart';
import 'package:softwareengineering/profile/profile.dart';
import 'package:softwareengineering/Galal/pages/login_screen/login_view.dart';
import 'package:softwareengineering/Galal/pages/register_screen/register_screen.dart';
import 'package:softwareengineering/Galal/pages/splash_screen/splash_screen.dart';
import 'package:softwareengineering/eman/reservation_hotel.dart';
import 'package:softwareengineering/bottom-nav-bar.dart';
import 'package:softwareengineering/firebaseAddcode.dart';
import 'package:firebase_core/firebase_core.dart';
import 'dart:ui';
import 'package:softwareengineering/modules/myText.dart';
import 'package:softwareengineering/ashraf/flight_search_results.dart';
import 'package:softwareengineering/ashraf/hotel_search_results.dart';
import 'package:test/test.dart';
import 'firebase_options.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  //unit testing
  test('MyText displays correct text and styles', () {
    final text = MyText(text: 'Test Text', fontSize: 16, fontWeight: FontWeight.bold, color: Colors.red);
    expect(text.text, 'Test Text');
    expect(text.fontSize, 16);
    expect(text.fontWeight, FontWeight.bold);
    expect(text.color, Colors.red);
  });
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: SplashScreen.routeName,
      routes: {
        Home.routeName: (context) =>  Home(),
        TT.routeName: (context) => const TT(),
        SplashScreen.routeName: (context) => const SplashScreen(),
        LoginScreen.routeName: (context) => const LoginScreen(),
        RegisterScreen.routeName: (context) => const RegisterScreen(),
        Profile.routeName: (context) =>  Profile(),
        reservation_Hotel.routeName: (context) => const reservation_Hotel(),
        reservation_Flight.routeName: (context) => const reservation_Flight(),
        oneWayFlight.routeName: (context) => const oneWayFlight(),
        roundFlight.routeName: (context) => const roundFlight(),
        BottomNavBar.routeName: (context) =>  const BottomNavBar(),
        Feed_back.routeName: (context) =>  const Feed_back(),
        flightReservation.routeName: (context) =>  const flightReservation(),
        hotelReservation.routeName: (context) =>  const hotelReservation(),


      },
      locale: const Locale('ar', 'AE'),
      supportedLocales:
      const [
        Locale('ar', 'AE'),
      ],
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        // IntlLocalizations.delegate,
      ],
      //home: hotelReservation(),
    );
  }
}

