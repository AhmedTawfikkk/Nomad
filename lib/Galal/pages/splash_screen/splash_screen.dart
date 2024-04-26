import 'dart:async';
import 'package:flutter/material.dart';
import 'package:softwareengineering/Galal/pages/login_screen/login_view.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = "splash";

  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, LoginScreen.routeName);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            "images/splash_screen.png",
            width: mediaQuery.width,
            height: mediaQuery.height,
            fit: BoxFit.cover,
          ),
          Center(
            child: Image.asset("images/application_name.png"),
          )
        ],
      ),
    );
  }
}
