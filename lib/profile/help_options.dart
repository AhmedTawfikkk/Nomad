import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:softwareengineering/constants.dart';
import 'package:softwareengineering/modules/myText.dart';

class HelpOptions extends StatelessWidget {

  String? optionName;
  IconData optionIcon;
  Color optionColor;
  String text;

  HelpOptions({super.key,
    required this.optionName,
    required this.optionIcon,
    required this.optionColor,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border(
          bottom: BorderSide(color: Constants.blueAppColor,width: 2),
          top: BorderSide(color: Constants.blueAppColor,width: 2),
          left: BorderSide(color: Constants.blueAppColor,width: 2),
          right: BorderSide(color: Constants.blueAppColor,width: 2),
        )
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if(optionName != null)
                  MyText(text: optionName!),
                Icon(optionIcon,color: Constants.blueAppColor,),
              ],
            ),
            MyText(text: text,fontSize: 14,color: optionColor,fontFamily: "DG Trika",)
          ],
        ),
      ),
    );
  }
}
