import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:intl/intl.dart';
import 'package:softwareengineering/daif/round_flight.dart';
import 'package:softwareengineering/Galal/core/widgets/custom_text_form_field.dart';
import 'dart:ui' as ui;
import 'package:softwareengineering/bottom-nav-bar.dart';
import 'package:softwareengineering/eman/CstonElevatedBottom.dart';
import 'package:softwareengineering/eman/customDropDownList.dart';
import 'package:softwareengineering/ashraf/flight_search_results.dart';

class  oneWayFlight extends StatefulWidget {
  static const String routeName = "oneWayFlight";
  const oneWayFlight ({super.key});

  @override
  State<oneWayFlight> createState() => _oneWayFlightState();
}

class _oneWayFlightState extends State<oneWayFlight> {

  var formKey = GlobalKey<FormState>();
  TextEditingController departureDate = TextEditingController();
  TextEditingController arrivalDate = TextEditingController();
  int? _numOneWayTravellers = 1;
  String? _travelDegree = 'الاقتصادية';
  String? _payment_way = 'Cash';
  String? departureCountry = 'القاهرة';
  String? arrivalCountry = 'جدة';





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
                          Image.asset('images/flightReservation.png'),
                           Positioned(
                              bottom: mediaQuery.height * 0.07,
                               right: mediaQuery.width * 0.15,
                              child: const Text("احجز رحلتك",
                                style: TextStyle(
                                  fontSize: 55,
                                    fontFamily:"DG Trika",
                                    color: Colors.white),)),

                          Positioned(
                            right: 10,top: 30,
                            child:
                            IconButton(onPressed: () {Navigator.pushNamed(context, BottomNavBar.routeName);},
                              icon: const Icon(Icons.arrow_back_ios,size: 30,),color: Colors.white,),)
                        ],),


                        const SizedBox(height: 50),


                        Padding(padding: const EdgeInsets.all(20.0),
                          child:Column(
                            children: [
                              Row(children: [
                                Expanded(child:
                                  CustomElevatedButton(
                                    text: 'ذهاب فقط',
                                    onPressed: (){},
                                    backgroundColor: Color(0xffe46409),
                                  )
                                ),


                                const SizedBox(width: 20,),

                                Expanded(child:
                                    CustomElevatedButton(
                                      text: 'ذهاب و عودة',
                                      onPressed: (){Navigator.pushNamed(context, roundFlight.routeName);},
                                      backgroundColor: Color(0xfffeb288),
                                    )
                                )                              ],),

                              const SizedBox(height: 20,),

                              CustomDropDownList<String>(
                                value: departureCountry!,
                                labelText: 'بلد المغادرة',
                                prefixIcon: Icon(Icons.flight_class,size: 30),
                                items: <String>['عمان','الدوحة','جدة','القاهرة'],
                                onChanged: (String? newValue) {
                                  setState(() {
                                    departureCountry = newValue;
                                  });
                                },
                              ),

                              const SizedBox(height: 20,),

                              CustomDropDownList<String>(
                                value: arrivalCountry!,
                                labelText: 'بلد الوصول',
                                prefixIcon: Icon(Icons.flight_class,size: 30),
                                items: <String>['عمان','الدوحة','جدة','القاهرة'],
                                onChanged: (String? newValue) {
                                  setState(() {
                                    arrivalCountry = newValue;
                                  });
                                },
                              ),

                              const SizedBox(height: 20,),

                              Center(
                                child: SizedBox(
                                  width: 200,
                                  child: CustomTextFormField(
                                    controller: arrivalDate,
                                    prefixIcon: const Icon(Icons.calendar_month_outlined,
                                      size: 30,),
                                    labelText: "تاريخ المغادرة",
                                    readOnly: false,
                                  )
                                ),
                              ),

                              const SizedBox(height: 20,),

                              Row(
                                  children: [
                                    Expanded(child: CustomDropDownList<int>(
                                      value: _numOneWayTravellers!,
                                      labelText: 'عدد المسافرين',
                                      prefixIcon: const Icon(Icons.people,
                                          size: 30),
                                      items: <int>[1, 2, 3],
                                      onChanged: (int? newValue) {
                                        setState(() {
                                          _numOneWayTravellers = newValue;
                                        });
                                      },
                                    )),


                                    const SizedBox(width: 20,),


                                    Expanded(child: CustomDropDownList<String>(
                                      value: _travelDegree!,
                                      labelText: 'درجة السفر',
                                      prefixIcon: Icon(Icons.flight_class,size: 30),
                                      items: <String>['الاقتصادية','رجال االأعمال','الأولى'],
                                      onChanged: (String? newValue) {
                                        setState(() {
                                          _travelDegree = newValue;
                                        });
                                      },
                                    )),
                                  ]
                              ),

                              const SizedBox(height: 20,),

                              CustomDropDownList<String>(
                                value: _payment_way!,
                                labelText: 'طرق الدفع',
                                prefixIcon: const Icon(Icons.wallet,
                                  size: 30,),
                                items: <String>['Cash','Visa Credit','MasterCard Credit'],
                                onChanged: (String? newValue) {
                                  setState(() {
                                    _payment_way = newValue;
                                  });
                                },
                              ),

                              const SizedBox(height: 40,),

                              Container(
                                width: 360,
                                height: 50,
                                child: CustomElevatedButton(
                                    text: "بحث عن الرحلات",
                                    backgroundColor: Color(0xffe46409),
                                    onPressed:(){
                                      Navigator.pushNamed(context, flightReservation.routeName);
                                    }),
                              )
                            ],
                          ),)

                      ]
                  ),
                ),
              )
          ),
        )
    );
  }
}