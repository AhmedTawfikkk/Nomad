import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:softwareengineering/bottom-nav-bar.dart';
import 'package:softwareengineering/eman/reservation_Flight.dart';
import 'package:softwareengineering/eman/CstonElevatedBottom.dart';


class  reservation_Hotel extends StatefulWidget {
  static const String routeName = "Hotel_reservation";
  const reservation_Hotel ({super.key});

  @override
  State<reservation_Hotel> createState() => _reservation_HotelState();
}

class _reservation_HotelState extends State<reservation_Hotel> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: Column(
            children: [
              Stack(
                children: [Container(
                  height: 80,
                  decoration:const BoxDecoration(color: Color(0xff253166),
                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(40),
                          bottomLeft: Radius.circular(40)
                      )
                  ) ,
                ),


                Positioned(
                    right: 10,top: 20,
                    child: IconButton(
                      onPressed: ()
                      {Navigator.pushNamed(context, BottomNavBar.routeName);},
                      icon: const Icon(Icons.arrow_back_ios,
                        size: 30,),
                      color: Colors.white,)
                ),


                const Positioned(
                    right: 50,top: 30,
                    child: Text("الحجوازات",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            fontFamily: "DG Trika")
                    )
                )
                ]
              ),

              const SizedBox(height: 50,),

              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(children: [
                  Expanded(child:
                    CustomElevatedButton(
                      text: 'الفنادق',
                      onPressed: (){},
                      backgroundColor: Color(0xffe46409),
                    )
                  ),


                  const SizedBox(width: 20,),

                  Expanded(child:
                    CustomElevatedButton(
                      text: 'الرحلات',
                      onPressed: (){
                        Navigator.pushNamed(context, reservation_Flight.routeName);
                      },
                      backgroundColor: Color(0xfffeb288),
                    )
                  )
                ],),
              ),
              Stack(children: [Image.asset('images/notravel.jpg'),]),


            ],
          ),
        )
    );
  }
}