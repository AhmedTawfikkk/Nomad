import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:softwareengineering/Galal/core/widgets/custom_text_form_field.dart';
import 'package:softwareengineering/ashraf/hotel_search_results.dart';
import 'package:softwareengineering/eman/customDropDownList.dart';
import 'package:softwareengineering/eman/CstonElevatedBottom.dart';
import 'dart:ui' as ui;
import 'package:softwareengineering/bottom-nav-bar.dart';

class  TT extends StatefulWidget {
  static const String routeName = "rooms";
  const TT ({super.key});

  @override
  State<TT> createState() => _TTState();
}

class _TTState extends State<TT> {
  var formKey = GlobalKey<FormState>();
  TextEditingController arrivalDate = TextEditingController();
  TextEditingController departureDate = TextEditingController();
  int? _numGuests = 1;
  int? _numRooms = 1;
  String? destination = 'جدة';



  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return SafeArea(
        child: Directionality(
          textDirection: ui.TextDirection.rtl,
          child: Scaffold(
              body: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                      children: [
                        Stack(children: [
                          Image.asset('images/room.png'),
                           Positioned(
                              bottom: mediaQuery.height * 0.1,
                              right: mediaQuery.width * 0.15,
                              child:
                              const Text("احجز غرفتك",
                                style: TextStyle(
                                  fontSize: 50,
                                    fontFamily:"DG Trika",
                                    color: Colors.white),)),
                          Positioned(
                            right: 10,top: 30,
                            child: IconButton(
                              onPressed: ()
                              {
                                Navigator.pushNamed(context, BottomNavBar.routeName);
                                },
                              icon: const Icon(Icons.arrow_back_ios,
                                size: 30,),
                                color: Colors.white,),
                            )
                        ],),

                        const SizedBox(height: 60),

                        Padding(padding: const EdgeInsets.all(20.0),
                          child: Column(
                            children: [
                              CustomDropDownList<String>(
                                value: destination!,
                                labelText: 'بلد الوصول',
                                prefixIcon: Icon(Icons.flight_class,size: 30),
                                items: <String>['عمان','الدوحة','جدة','القاهرة'],
                                onChanged: (String? newValue) {
                                  setState(() {
                                    destination = newValue;
                                  });
                                },
                              ),

                              const SizedBox(height:30),

                              Padding(
                                padding: const EdgeInsets.only(right: 7),
                                child: Row(
                                    children: [
                                      Expanded(
                                          child: CustomTextFormField(
                                            controller: arrivalDate,
                                            prefixIcon: const Icon(Icons.calendar_month_outlined,
                                              size: 30,),
                                            labelText: "تاريخ الوصول",
                                            readOnly: false,
                                          )
                                      ),

                                      const SizedBox(width: 20,),

                                      Expanded(
                                        child: CustomTextFormField(
                                          controller: departureDate,
                                          prefixIcon: const Icon(Icons.calendar_month_outlined,
                                            size: 30,),
                                          labelText: "تاريخ المغادرة",
                                          readOnly: false,
                                        ))
                                    ]
                                ),
                              ),


                              const SizedBox(height: 30,),


                              Padding(
                                padding: const EdgeInsets.only(right: 7),
                                child: Row(
                                    children: [
                                      Expanded(child:
                                        CustomDropDownList<int>(
                                          value: _numGuests!,
                                          labelText: 'عدد الضيوف',
                                          prefixIcon: const Icon(Icons.people,
                                              size: 30),
                                          items: <int>[1, 2, 3],
                                          onChanged: (int? newValue) {
                                            setState(() {
                                              _numGuests = newValue;
                                            });
                                          },
                                        )),


                                      const SizedBox(width: 20,),


                                      Expanded(child:
                                        CustomDropDownList<int>(
                                          value: _numRooms!,
                                          labelText: 'عدد الفرف',
                                          prefixIcon: const Icon(Icons.people,
                                              size: 30),
                                          items: <int>[1, 2, 3],
                                          onChanged: (int? newValue) {
                                            setState(() {
                                              _numRooms = newValue;
                                            });
                                          },
                                        )),
                                    ]
                                ),
                              ),


                              const SizedBox(height: 50,),


                              Container(
                                width: 360,
                                height: 50,
                                child: CustomElevatedButton(
                                    text: "بحث عن فندق",
                                    backgroundColor: Color(0xffe46409),
                                    onPressed:(){
                                      Navigator.pushNamed(context, hotelReservation.routeName);
                                    }),
                              )
                            ],
                          ),
                        )
                      ]
                  ),
                ),
              )
          ),
        )
    );
  }
}