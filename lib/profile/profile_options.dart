import 'package:flutter/material.dart';
import 'package:softwareengineering/constants.dart';
import 'package:softwareengineering/modules/myText.dart';

class ProfileOptions extends StatelessWidget {

  IconData icon;
  String optionName;

  ProfileOptions({super.key,
    required this.icon,
    required this.optionName,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon,color: Constants.blueAppColor,size: 30,),
        MyText(text: optionName,fontFamily: "DG Trika",color: Constants.blueAppColor,fontSize: 15,),
        const Spacer(),
        const Icon(Icons.arrow_forward_ios,size: 16,)
      ],
    );
  }
}
