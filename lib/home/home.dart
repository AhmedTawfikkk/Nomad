import 'package:flutter/material.dart';
import 'package:softwareengineering/constants.dart';
import 'package:softwareengineering/daif/one-way.dart';
import 'package:softwareengineering/eman/rooms.dart';
import 'package:softwareengineering/home/travel_model.dart';
import 'package:softwareengineering/modules/myText.dart';

class Home extends StatelessWidget {
  static const String routeName = "home";
  Home({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Stack(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height,
                  child: Align(
                    alignment: Alignment.topCenter,
                      child: Image.asset('images/home_try.jpg',)),
              ),
              Positioned(
                bottom: 600,
                right: 30,
                child: SizedBox(child: Image.asset('images/nomad.png'),width: 300,height: 300,),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height/4,
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.only(top: 125,right: 5,left: 5),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(35),
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            MyText(text: 'استكشف الرحلات',fontSize: 20,fontFamily: "DG Trika",fontWeight: FontWeight.w500,color: Constants.blueAppColor,),
                            const Spacer(),
                            IconButton(onPressed: () {}, icon: const Icon(Icons.arrow_forward_ios))
                          ],
                        ),
                        SizedBox(
                          height: 185,
                          child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) => const TravelModel(),
                              separatorBuilder: (context, index) => const SizedBox(width: 12,),
                              itemCount: 3
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20.0),
                          child: Row(
                            children: [
                              MyText(text: 'استكشف فنادق',fontSize: 20,fontFamily: "DG Trika",fontWeight: FontWeight.w500,color: Constants.blueAppColor,),
                              const Spacer(),
                              IconButton(onPressed: () {}, icon: const Icon(Icons.arrow_forward_ios))
                            ],
                          ),
                        ),

                        SizedBox(
                          height: 185,
                          child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) => const TravelModel(),
                              separatorBuilder: (context, index) => const SizedBox(width: 12,),
                              itemCount: 3
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 200,
                right: 95,
                child: Row(
                  children: [
                    InkWell(
                      onTap:(){Navigator.pushNamed(context, TT.routeName);},
                      child: SizedBox(
                        width: 100,
                        height: 120,
                        child: Stack(
                          alignment: Alignment.topCenter,
                          children: [
                            Image.asset('images/book_hotels.png'),
                            Image.asset('images/hotel.png')
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 20,),
                    InkWell(
                      onTap:(){Navigator.pushNamed(context, oneWayFlight.routeName);},
                      child: SizedBox(
                        width: 100,
                        height: 120,
                        child: Stack(
                          alignment: Alignment.topCenter,
                          children: [
                            Image.asset('images/book_airPlane.png'),
                            Image.asset('images/airplane.png')
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

    );
  }
}
