import 'package:flutter/material.dart';
import 'package:softwareengineering/constants.dart';
import 'package:softwareengineering/modules/myText.dart';

class Favorites extends StatelessWidget {
  const Favorites({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.vertical(bottom: Radius.circular(30))
              ),
              child: AppBar(
                backgroundColor: Constants.blueAppColor,
                title: MyText(text: 'الخيارات المفضلة',color: Colors.white,fontSize: 17,
                    fontWeight: FontWeight.bold,
                    fontFamily: "DG Trika"),
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Column(
                children: [
                  MyText(
                    text: 'احفظ اماكن الاقامة المفضلة والاماكن التي تود زيارتها في وقت لاحق',
                    color: Constants.blueAppColor,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(backgroundColor: Constants.blueAppColor),
                      child: MyText(text: 'ابدأ بحثك',color: Colors.white,)),
                ],
              ),
            ),

            const Spacer()
          ],
        ),

    );
  }
}
