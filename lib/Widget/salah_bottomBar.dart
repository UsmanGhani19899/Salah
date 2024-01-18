import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:salah/Screens/Activity/activity.dart';
import 'package:salah/Screens/Activity/asma_ul_husna_screen.dart';
import 'package:salah/Screens/get_current_location.dart';
import 'package:salah/Screens/home.dart';
import 'package:salah/Screens/prayer_time.dart';
import 'package:salah/Screens/Activity/tasbeeh.dart';

class SalahBottomBar extends StatefulWidget {
  const SalahBottomBar({super.key});

  @override
  State<SalahBottomBar> createState() => _SalahBottomBarState();
}

final screen = [
  HomeScreen(),
  PrayerTimeScreen(),
  QiblahScreen(),
  ActivityScreen(),
];
int _currentIndex = 0;

class _SalahBottomBarState extends State<SalahBottomBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          screen[_currentIndex],
          Container(
            decoration: BoxDecoration(
                color: Colors.black, borderRadius: BorderRadius.circular(20)),
            height: 80,
            margin: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
            child: BottomNavigationBar(
                elevation: 0,
                type: BottomNavigationBarType.fixed,
                fixedColor: Colors.white,
                showSelectedLabels: true,
                // unselectedLabelStyle: TextStyle(color: Colors.white),
                unselectedItemColor: Colors.white,
                showUnselectedLabels: true,
                backgroundColor: Colors.transparent,
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
        ],
      ),
      backgroundColor: Colors.white,
    );
  }
}
