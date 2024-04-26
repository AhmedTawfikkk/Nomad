import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:softwareengineering/bottom-nav-bar.dart';
import 'package:softwareengineering/Galal/core/widgets/custom_text_form_field.dart';
import 'package:softwareengineering/home/home.dart';

class  Feed_back extends StatefulWidget {
  static const String routeName = "Feed_back";
  const Feed_back ({super.key});

  @override
  State<Feed_back> createState() => _Feed_backState();
}

class _Feed_backState extends State<Feed_back> {
  TextEditingController _feedBack = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;
  String? userEmail;
  CollectionReference feedback = FirebaseFirestore.instance.collection('feedback');
  DocumentReference? customerRef;

  @override
  void initState() {
    super.initState();
    userEmail = auth.currentUser?.email;
    customerRef = FirebaseFirestore.instance.collection('Customers').doc(userEmail);
  }

  Future<void> send_feedback() {
    // Call the user's CollectionReference to add a new user
    return feedback
        .add({
      'Customer_email' : customerRef,
      'feedback' : _feedBack.text,
    })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                    children: [Container(
                      height: 80,
                      decoration:const BoxDecoration(
                          color: Color(0xff253166),
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(40),
                              bottomLeft: Radius.circular(40)
                          )
                      ) ,
                    ),


                      Positioned(
                        right: 10,top: 20,
                        child: IconButton(onPressed: ()
                        {Navigator.pushNamed(context, BottomNavBar.routeName);},
                          icon: const Icon(
                            Icons.arrow_back_ios,
                            size: 30,),
                          color: Colors.white,),),


                      const Positioned(
                          right: 50,top: 30,
                          child: Text("التقييم",
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

                Image.asset('images/feedback.jpg'),

                SizedBox(height: 230,),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: CustomTextFormField(
                      controller: _feedBack,
                      suffixIcon: InkWell(
                        onTap: () async {
                          Navigator.pushNamed(context, Home.routeName);
                          await send_feedback();
                        },
                        child: const Icon(Icons.send_rounded,
                          size: 30,),
                      ),
                      labelText: 'اكتب تقييمك',
                      readOnly: true,
                    ),
                  ),
                )
              ],
            ),
          ),
        )
    );
  }
}