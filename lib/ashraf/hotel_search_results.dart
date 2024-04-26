
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:softwareengineering/daif/one-way.dart';
import 'package:softwareengineering/eman/rooms.dart';



class hotelReservation extends StatefulWidget {
  static const String routeName = "hotelReservation";

  const hotelReservation({super.key});

  @override
  State<hotelReservation> createState() => _hotelReservationState();
}

class _hotelReservationState extends State<hotelReservation> {

  List <QueryDocumentSnapshot> hotels = [];
  getData() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection('hotel').get();
    hotels.addAll(querySnapshot.docs);
    setState(() {

    });
  }

  @override
  void initState(){
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return Directionality(textDirection: TextDirection.rtl,
      child: Scaffold(
        body: SafeArea(
          child:Stack(
            children: [
              Image.asset(
                "images/hotelBG.jpg",
                //media query is used to fit the size on any phone
                width: mediaQuery.width,
                height: mediaQuery.height,
                fit: BoxFit.cover,
              ),

              Positioned(
                top: 20,
                child: IconButton(onPressed: (){Navigator.pushNamed(context, TT.routeName);},
                    icon: const Icon(Icons.arrow_back_ios,
                        size: 30,
                        color: Colors.white)),
              ),

              const Positioned(
                top: 30,
                right: 50,
                child: Text(
                  'جدة',
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: "DG Trika",
                      fontSize: 12
                  ),
                ),
              ),

              const Positioned(
                top: 60,
                right: 50,
                child: Text(
                  'الاثنين،27 مايو',
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: "DG Trika",
                      fontSize: 12
                  ),
                ),
              ),

              Padding(padding: EdgeInsets.only(top: 90,left: 10,right: 10),
                child: ListView.builder(
                    itemCount: hotels.length,
                    physics: AlwaysScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context,i){
                      return Card(
                          color: Color(0xffffffff),
                          child: Column(
                              children: [
                                ClipRRect(
                                  borderRadius: const BorderRadius.only(
                                      bottomLeft: Radius.circular(20) ,
                                      bottomRight: Radius.circular(20),
                                      topRight: Radius.circular(10) ,
                                      topLeft: Radius.circular(10)),
                                  child: Image.asset('images/home_listView.jpg',
                                    width: double.infinity,
                                    height: 150,
                                    fit: BoxFit.cover, ),
                                ),

                                const SizedBox(height: 10,),

                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 10),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text('${hotels[i]['hotel_name']}',
                                        style:const TextStyle(
                                            color: Color(0xff233166),
                                            fontFamily: "DG Trika",
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14
                                        )
                                      ),
                                    ],
                                  ),
                                ),

                                const SizedBox(height: 10,),

                                Padding(
                                  padding: const EdgeInsets.all(5),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text('${hotels[i]['price']}' + 'EGP',
                                        style:const TextStyle(
                                            color: Colors.green,
                                            fontFamily: "DG Trika",
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                              ],
                            ),

                      );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
