import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:softwareengineering/constants.dart';
import 'package:softwareengineering/modules/myText.dart';
import 'package:softwareengineering/profile/profile_options.dart';
import 'package:softwareengineering/eman/CstonElevatedBottom.dart';
import 'package:softwareengineering/eman/reservation_hotel.dart';
import 'package:softwareengineering/eman/feedback.dart';
import '../Galal/pages/login_screen/login_view.dart';
import 'help_options.dart';

class Profile extends StatelessWidget {
  static const String routeName = 'Profile';
  Profile({super.key});

  final List<Widget> options1 =
  [
    ProfileOptions(icon: Icons.person, optionName: 'البيانات الشخصية'),
    Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: ProfileOptions(icon: Icons.money, optionName: 'محفظتي'),
    ),
    ProfileOptions(icon: Icons.money_sharp, optionName: 'طرق الدفع'),
    Container(
      height: 5,
      color: Colors.grey[100],
    )
  ];

  final List<Widget> options2 =
  [
    Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Column(
        children: [
          ProfileOptions(icon: Icons.hotel_sharp, optionName: 'حجوزات الفنادق والطيران'),
          Container(
            height: 5,
            color: Colors.grey[100],
          )
        ],
      ),
    ),
    Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        children: [
          ProfileOptions(icon: Icons.rate_review_outlined, optionName: 'التقييم'),
          SizedBox(height: 5,),
          Container(
            height: 5,
            color: Colors.grey[100],
          )
        ],
      ),
    ),
  ];

  List<HelpOptions> helpOptions =
  [
    HelpOptions(optionName: null, optionIcon: Icons.question_mark, optionColor: Constants.blueAppColor, text: 'الاسئلة المكررة'),
    HelpOptions(optionName: null, optionIcon: Icons.chat, optionColor: Constants.blueAppColor, text: 'دردشة مباشرة'),
    HelpOptions(optionName: 'واتساب', optionIcon: Icons.add, optionColor: Colors.orange, text: '010555558822'),
    HelpOptions(optionName: 'اتصل بنا', optionIcon: Icons.phone, optionColor: Colors.orange, text: '01225558999')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: ListView(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                            bottomRight: Radius.circular(20),
                            bottomLeft: Radius.circular(20)),
                      color: Constants.blueAppColor,
                    ),
                    child: Row(
                      children: [
                        const Spacer(flex: 4,),
                        Column(
                          children: [
                            Image.asset('images/user--profile_1_.png'),
                            MyText(text: 'مرحيا بك يا ZZZZZZZ',color: Colors.white,fontWeight: FontWeight.w500,fontSize: 16,),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: MyText(text: 'ZZZZZZZZZZZ@gmail.com',color: Colors.white,fontWeight: FontWeight.w500,fontSize: 16),
                            ),
                          ],
                        ),
                        const Spacer(),
                        Image.asset('images/Layer 1.png'),
                      ],
                    ),
                  ),
                  Container(
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.vertical(top: Radius.circular(20))
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 25,),
                            MyText(text: 'ملف شخصي',fontSize: 17,fontFamily: "DG Trika",fontWeight: FontWeight.w500,color: Constants.orangeAppColor,),
                            const SizedBox(height: 10,),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10.0),
                              child: Column(
                                children: List.generate(
                                  options1.length,
                                      (index) => InkWell(
                                      onTap: () {},
                                      child: options1[index]),
                                ),
                              ),
                            ),

                            const SizedBox(height: 20,),
                            MyText(text: 'رحلاتي',fontFamily: "DG Trika",fontSize: 17,fontWeight: FontWeight.w500,color: Constants.orangeAppColor,),
                            const SizedBox(height: 10,),
                            Column(
                              children: List.generate(
                                options2.length,
                                    (index) => InkWell(
                                  onTap: ()
                                  {
                                    switch(index)
                                    {
                                      case 0:
                                        Navigator.pushNamed(context, reservation_Hotel.routeName);
                                        break;
                                      case 1:
                                        Navigator.pushNamed(context, Feed_back.routeName);
                                        break;
                                    }
                                  },
                                  child: options2[index],
                                ),
                              ),
                            ),
                            const SizedBox(height: 20,),
                            MyText(text: 'الدعم والمساعدة',fontFamily: "DG Trika",fontSize: 17,fontWeight: FontWeight.w500,color: Constants.orangeAppColor,),
                            const SizedBox(height: 10,),
                            Padding(
                                padding: const EdgeInsets.symmetric(vertical: 8.0),
                                child: SizedBox(
                                  height: MediaQuery.of(context).size.height/4,
                                  child: GridView.builder(
                                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,childAspectRatio: 2.8,crossAxisSpacing: 10,mainAxisSpacing: 10),
                                    itemBuilder:(context, index) => InkWell(
                                      onTap: () {},
                                      child: helpOptions[index],
                                    ),
                                    itemCount: helpOptions.length,
                                  ),
                                )
                            ),

                            Align(
                              alignment: Alignment.center,
                              child: Container(
                                width: 360,
                                height: 50,
                                child: CustomElevatedButton(
                                  text: 'تسجيل الخروج',
                                  backgroundColor: Color(0xffe46409),
                                  onPressed: ()async {
                                    await FirebaseAuth.instance.signOut();
                                    Navigator.pushNamed(context, LoginScreen.routeName);
                                  },
                                ),
                              )
                            )
                          ]
                      ),
                    ),
                  ),
                ]
            ),

      );
  }
}
