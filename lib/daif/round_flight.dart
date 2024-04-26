import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:intl/intl.dart';
import 'package:softwareengineering/daif/one-way.dart';
import 'package:softwareengineering/Galal/core/widgets/custom_text_form_field.dart';
import 'dart:ui' as ui;
import 'package:softwareengineering/bottom-nav-bar.dart';
import 'package:softwareengineering/eman/CstonElevatedBottom.dart';
import 'package:softwareengineering/eman/customDropDownList.dart';
import 'package:softwareengineering/ashraf/flight_search_results.dart';

class  roundFlight extends StatefulWidget {
  static const String routeName = "roundFlight";
  const roundFlight ({super.key});

  @override
  State<roundFlight> createState() => _roundFlightState();
}

class _roundFlightState extends State<roundFlight> {

  var formKey = GlobalKey<FormState>();
  TextEditingController departureDateround = TextEditingController();
  TextEditingController arrivalDateround = TextEditingController();
  TextEditingController paymentWayround = TextEditingController();
  int? _numRoundFlightTravellers = 1;
  String? _travelDegreeround = 'الاقتصادية';
  String? departureCountryround = 'القاهرة';
  String? arrivalCountryround = 'جدة';
  String? _payment_wayround = 'Cash';


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
                            child: IconButton(onPressed: () {Navigator.pushNamed(context, BottomNavBar.routeName);},
                            icon: const Icon(Icons.arrow_back_ios,size: 30,),color: Colors.white,),)
                        ],),


                        const SizedBox(height: 50),


                        Padding(padding: const EdgeInsets.all(20.0),
                          child:
                          Column(
                            children: [
                              Row(children: [
                                Expanded(child:
                                CustomElevatedButton(
                                  text: 'ذهاب فقط',
                                  onPressed: (){Navigator.pushNamed(context, oneWayFlight.routeName);},
                                  backgroundColor: Color(0xfffeb288),
                                )
                                ),


                                const SizedBox(width: 20,),

                                Expanded(child:
                                CustomElevatedButton(
                                  text: 'ذهاب و عودة',
                                  onPressed: (){},
                                  backgroundColor: Color(0xffe46409) ,
                                )
                                )
                              ],),

                              const SizedBox(height: 20,),

                              CustomDropDownList<String>(
                                value: departureCountryround!,
                                labelText: 'بلد المغادرة',
                                prefixIcon: Icon(Icons.flight_class,size: 30),
                                items: <String>['عمان','الدوحة','جدة','القاهرة'],
                                onChanged: (String? newValue) {
                                  setState(() {
                                    departureCountryround = newValue;
                                  });
                                },
                              ),

                              const SizedBox(height: 20,),

                              CustomDropDownList<String>(
                                value: arrivalCountryround!,
                                labelText: 'بلد الوصول',
                                prefixIcon: Icon(Icons.flight_class,size: 30),
                                items: <String>['عمان','الدوحة','جدة','القاهرة'],
                                onChanged: (String? newValue) {
                                  setState(() {
                                    arrivalCountryround = newValue;
                                  });
                                },
                              ),

                              const SizedBox(height: 20,),

                              Row(
                                  children: [
                                    Expanded(
                                        child: CustomTextFormField(
                                          controller: arrivalDateround,
                                          prefixIcon: const Icon(Icons.calendar_month_outlined,
                                            size: 30,color:
                                            Color(0xffe46409),),
                                          labelText: "تاريخ المغادرة",
                                          readOnly: false,
                                        )
                                    ),


                                    const SizedBox(width: 20,),


                                    Expanded(
                                        child: CustomTextFormField(
                                          controller: arrivalDateround,
                                          prefixIcon: const Icon(Icons.calendar_month_outlined,
                                            size: 30,color:
                                            Color(0xffe46409),),
                                          labelText: "تاريخ العودة",
                                          readOnly: false,
                                        ))
                                  ]
                              ),

                              const SizedBox(height: 20,),

                              Row(
                                  children: [
                                    Expanded(child: CustomDropDownList<int>(
                                      value: _numRoundFlightTravellers!,
                                      labelText: 'عدد المسافرين',
                                      prefixIcon: const Icon(Icons.people,
                                          size: 30),
                                      items: <int>[1, 2, 3],
                                      onChanged: (int? newValue) {
                                        setState(() {
                                          _numRoundFlightTravellers = newValue;
                                        });
                                      },
                                    )),


                                    const SizedBox(width: 20,),


                                    Expanded(child: CustomDropDownList<String>(
                                      value: _travelDegreeround!,
                                      labelText: 'درجة السفر',
                                      prefixIcon: Icon(Icons.flight_class,size: 30),
                                      items: <String>['الاقتصادية','رجال االأعمال','الأولى'],
                                      onChanged: (String? newValue) {
                                        setState(() {
                                          _travelDegreeround = newValue;
                                        });
                                      },
                                    )),
                                  ]
                              ),

                              const SizedBox(height: 20,),

                              CustomDropDownList<String>(
                                value: _payment_wayround!,
                                labelText: 'طرق الدفع',
                                prefixIcon: const Icon(Icons.wallet,
                                  size: 30,),
                                items: <String>['Cash','Visa Credit','MasterCard Credit'],
                                onChanged: (String? newValue) {
                                  setState(() {
                                    _payment_wayround = newValue;
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
                                    onPressed:(){Navigator.pushNamed(context, flightReservation.routeName);}),
                              )
                            ],//column children
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