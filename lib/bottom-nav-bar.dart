import 'package:flutter/material.dart';
import 'package:softwareengineering/constants.dart';
import 'package:softwareengineering/favorite.dart';
import 'package:softwareengineering/home/home.dart';
import 'package:softwareengineering/profile/profile.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});
  static const String routeName = 'BottomNavBar';

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {

  int currentTap = 0;
  List<Widget> screens =
  [
    Home(),
    Favorites(),
    Profile(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.vertical(top: Radius.circular(16))
        ),
        child: BottomNavigationBar(
          backgroundColor: Constants.blueAppColor,
          selectedIconTheme: IconThemeData(
            color: Constants.orangeAppColor,
            size: 35,
          ),
          unselectedIconTheme: const IconThemeData(
            color: Colors.white,
            size: 25,
          ),
          currentIndex: currentTap,
          onTap: (newTap)
          {
            setState(() {
              currentTap = newTap;
            });
          },
          items:
          const [
            BottomNavigationBarItem(icon: Icon(Icons.home),label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.favorite),label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.person),label: ''),
          ],
        ),
      ),
      body: screens[currentTap],
    );
  }
}
