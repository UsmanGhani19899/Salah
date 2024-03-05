import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:salah/Core/my_controller.dart';
import 'package:salah/Screens/Activity/activity.dart';
import 'package:salah/Screens/Activity/asma_ul_husna_screen.dart';
import 'package:salah/Screens/qibla.dart';
import 'package:salah/Screens/home.dart';
import 'package:salah/Screens/prayer_time.dart';
import 'package:salah/Screens/Activity/tasbeeh.dart';
import 'package:salah/Widget/ad_helper.dart';

class SalahBottomBar extends StatefulWidget {
  const SalahBottomBar({super.key});

  @override
  State<SalahBottomBar> createState() => _SalahBottomBarState();
}
MyController myContr = Get.put(MyController());
final screen = [
  HomeScreen(),
  PrayerTimeScreen(),
  QiblahScreen(),
  ActivityScreen(),
];
int _currentIndex = 0;

class _SalahBottomBarState extends State<SalahBottomBar> {

@override
void initState() {
  super.initState();
 
}

@override
void dispose() {
  myContr.bannerAd!.dispose();
  super.dispose();
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // floatingActionButton: FloatingActionButton(
      //   backgroundColor: Colors.blue,
      //   shape: RoundedRectangleBorder(

      //     borderRadius: BorderRadius.circular(30)
      //   ),
      //   onPressed: (){}),
      
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar:Container(
        color: Color(0xff141414),
        // decoration: BoxDecoration(
        //     color: Colors.black, borderRadius: BorderRadius.circular(20)),
        height: 80,
        // margin: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
        child: BottomNavigationBar(
          
          selectedItemColor: Colors.white,
            elevation: 0,
            type: BottomNavigationBarType.fixed,
            // fixedColor: Colors.white,
            showSelectedLabels: true,
            // unselectedLabelStyle: TextStyle(color: Colors.white),
            unselectedItemColor: Colors.grey.shade200,
            showUnselectedLabels: true,
            backgroundColor: Colors.grey.shade900.withOpacity(0.3),
            currentIndex: _currentIndex,
            onTap: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(
                  FeatherIcons.mapPin,
                  // color: Colors.white,
                ),
                label: "Nearby",
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  FeatherIcons.clock,
                  // color: Colors.white,
                ),
                label: "Time",
              ),
              BottomNavigationBarItem(
                  icon: Icon(
                    FeatherIcons.compass,
                    // color: Colors.white,
                  ),
                  label: "Direction"),
              BottomNavigationBarItem(
                  icon: Icon(
                    FeatherIcons.book,
                    // color: Colors.white,
                  ),
                  label: "Activity"),
            ]),
      ),
      body: Stack(
        children: [

     IndexedStack(children:screen,
     
     index: _currentIndex,),
        // Container(height: Get.height*0.12,  child: AdWidget(ad: myContr.bannerAd),),
          
        ],

      ),
      backgroundColor: Colors.black,
    );
  }

}
