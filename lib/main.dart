import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart'; 
import 'package:google_maps_flutter_android/google_maps_flutter_android.dart';
import 'package:google_maps_flutter_platform_interface/google_maps_flutter_platform_interface.dart';
import 'package:salah/Screens/salah_splash.dart';
import 'package:salah/Widget/salah_bottomBar.dart';
 

void main() async {
 
  
  final GoogleMapsFlutterPlatform mapsImplementation =
      GoogleMapsFlutterPlatform.instance;
  if (mapsImplementation is GoogleMapsFlutterAndroid) {
    // Force Hybrid Composition mode.
    mapsImplementation.useAndroidViewSurface = true;
  }
  await GetStorage.init();

  runApp(Salah());
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
      theme: ThemeData(
          scaffoldBackgroundColor: Color(0xff141414),
          appBarTheme: AppBarTheme(
            backgroundColor: Colors.grey.shade800.withOpacity(0.5),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  backgroundColor: Color(0xff35c55e)))
          // scaffoldBackgroundColor: Color(0xff172222),
          ),
      debugShowCheckedModeBanner: false,
      home: SalahBottomBar(),
    );
  }
}
