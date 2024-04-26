
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:softwareengineering/daif/one-way.dart';



class flightReservation extends StatefulWidget {
  static const String routeName = "flightReservation";

  const flightReservation({super.key});

  @override
  State<flightReservation> createState() => _flightReservationState();
}

class _flightReservationState extends State<flightReservation> {

  List <QueryDocumentSnapshot> flights = [];
  getData() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection('flights').get();
    flights.addAll(querySnapshot.docs);
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
                "images/flightBG.jpg",
                //media query is used to fit the size on any phone
                width: mediaQuery.width,
                height: mediaQuery.height,
                fit: BoxFit.cover,
              ),

              Positioned(
                top: 20,
                child: IconButton(onPressed: (){Navigator.pushNamed(context, oneWayFlight.routeName);},
                    icon: const Icon(Icons.arrow_back_ios,
                        size: 30,
                        color: Colors.white)),
              ),

               const Positioned(
                top: 30,
                right: 50,
                child: Text(
                  'القاهرة  --  جدة',
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
                    itemCount: flights.length,
                    physics: AlwaysScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context,i){
                      return Card(
                        color: Color(0xffffffff),
                          child: Padding(
                            padding: const EdgeInsets.only(top:20, left: 20, right: 20),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('${flights[i]['departure']}',
                                      style:const TextStyle(
                                          color: Color(0xff233166),
                                          fontFamily: "DG Trika",
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12
                                      ),
                                    ),
                                    Text('${flights[i]['arrival']}',
                                      style:const TextStyle(
                                          color: Color(0xff233166),
                                          fontFamily: "DG Trika",
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12
                                      ),
                                    ),
                                  ],
                                ),

                                const SizedBox(height: 10,),

                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('${flights[i]['departure_airport']}',
                                      style:const TextStyle(
                                          color: Color(0xff233166),
                                          fontFamily: "DG Trika",
                                          fontSize: 12
                                      ),
                                    ),
                                    Text('${flights[i]['arrival_airport']}',
                                      style:const TextStyle(
                                          color: Color(0xff233166),
                                          fontFamily: "DG Trika",
                                          fontSize: 12
                                      ),
                                    ),
                                  ],
                                ),

                                const SizedBox(height: 10,),

                                Image.asset('images/flight_plane.png',width: 400,),

                                const SizedBox(height: 10,),


                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('${flights[i]['departure_time']}',
                                      style:const TextStyle(
                                          color: Color(0xff233166),
                                          fontFamily: "DG Trika",
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12
                                      ),),
                                    const Text('02h 17m',
                                      style: TextStyle(
                                        color: Color(0xff233166),
                                        fontFamily: "DG Trika",
                                        fontSize: 12
                                    ),),
                                    Text('${flights[i]['arrival_time']}',
                                      style:const TextStyle(
                                          color: Color(0xff233166),
                                          fontFamily: "DG Trika",
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Image.asset('images/eyptait.png',height: 100,width: 100,),
                                    Text('${flights[i]['price']}' + 'EGP',
                                      style:const TextStyle(
                                          color: Colors.green,
                                          fontFamily: "DG Trika",
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15
                                      ),),
                                  ],
                                ),
                              ],
                            ),
                          )
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
