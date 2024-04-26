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

class  fff extends StatefulWidget {
  static const String routeName = "fff";
  const fff ({super.key});



  @override
  State<fff> createState() => _fffState();


}

class _fffState extends State<fff> {

  CollectionReference accomidation = FirebaseFirestore.instance.collection('accomidation');


  Future<void> addaccomidations() {
    // Call the user's CollectionReference to add a new user
    return accomidation
        .add({
      'room_no' : '7',
      'hotel_name' : 'four_season',
      'num_individuals' : '3',
      'arrival_date' : '2024-03-02',
      'leaving_date' : '2024-03-06',
      'room_state':'available'
    })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body:
            ElevatedButton(
              onPressed: (){addaccomidations();},
              child: Text('add'),
            )
        )
    );
  }
}