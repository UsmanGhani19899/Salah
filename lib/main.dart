import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:salah/Screens/Activity/audio_player.dart';
import 'package:salah/Screens/detailed_surah.dart';
import 'package:salah/Screens/home.dart';
import 'package:salah/Screens/map.dart';
import 'package:salah/Screens/salah_splash.dart';
import 'package:salah/Widget/salah_bottomBar.dart';
import 'package:google_maps_flutter_android/google_maps_flutter_android.dart';
import 'package:google_maps_flutter_platform_interface/google_maps_flutter_platform_interface.dart';

void main() async {
  runApp(Salah());
  final GoogleMapsFlutterPlatform mapsImplementation =
      GoogleMapsFlutterPlatform.instance;
  if (mapsImplementation is GoogleMapsFlutterAndroid) {
    // Force Hybrid Composition mode.
    mapsImplementation.useAndroidViewSurface = true;
  }
  await GetStorage.init();
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
      theme: ThemeData(scaffoldBackgroundColor: Color(0xff172222)),
      debugShowCheckedModeBanner: false,
      home: SalahSplash(),
    );
  }
}
