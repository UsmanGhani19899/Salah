import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:salah/Screens/home.dart';
import 'package:salah/Screens/map.dart';
import 'package:salah/Screens/salah_splash.dart';
import 'package:salah/Widget/salah_bottomBar.dart';
import 'package:google_maps_flutter_android/google_maps_flutter_android.dart';
import 'package:google_maps_flutter_platform_interface/google_maps_flutter_platform_interface.dart';

void main() {
  runApp(Salah());
  final GoogleMapsFlutterPlatform mapsImplementation =
      GoogleMapsFlutterPlatform.instance;
  if (mapsImplementation is GoogleMapsFlutterAndroid) {
    // Force Hybrid Composition mode.
    mapsImplementation.useAndroidViewSurface = true;
  }
}

class Salah extends StatefulWidget {
  const Salah({super.key});

  @override
  State<Salah> createState() => _SalahState();
}

class _SalahState extends State<Salah> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(scaffoldBackgroundColor: Colors.white),
      debugShowCheckedModeBanner: false,
      home: SalahBottomBar(),
    );
  }
}
