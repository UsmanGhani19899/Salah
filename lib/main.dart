import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
// import 'package:get_storage/get_storage.dart'; 
import 'package:google_maps_flutter_android/google_maps_flutter_android.dart';
import 'package:google_maps_flutter_platform_interface/google_maps_flutter_platform_interface.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:salah/Core/my_controller.dart';
import 'package:salah/Screens/ads_screen.dart';
import 'package:salah/Screens/home.dart';
import 'package:salah/Screens/prayer_time.dart';
import 'package:salah/Screens/salah_splash.dart';
import 'package:salah/Widget/salah_bottomBar.dart';
 MyController myContr = Get.put(MyController());

void main() async {
WidgetsFlutterBinding.ensureInitialized();

 
MobileAds.instance.initialize();
final GoogleMapsFlutterPlatform mapsImplementation =
      GoogleMapsFlutterPlatform.instance;
  if (mapsImplementation is GoogleMapsFlutterAndroid) {
    // Force Hybrid Composition mode.
    mapsImplementation.useAndroidViewSurface = true;
  }
  await GetStorage.init();
  // WidgetsFlutterBinding.ensureInitialized();
  // unawaited(MobileAds.instance.initialize());
// final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//       FlutterLocalNotificationsPlugin();
//   // Initialize settings
//   final AndroidInitializationSettings initializationSettingsAndroid =
//       AndroidInitializationSettings('@mipmap/ic_launcher');
//   final DarwinInitializationSettings initializationSettingsIOS =
//       DarwinInitializationSettings();
//   final InitializationSettings initializationSettings =
//       InitializationSettings(
//           android: initializationSettingsAndroid,
//           iOS: initializationSettingsIOS);
//   // Initialize the plugin
//   await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  myContr.loadAd();
  runApp(Salah());
}

class Salah extends StatefulWidget {
  const Salah({super.key});

  @override
  State<Salah> createState() => _SalahState();
}
 @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
  if (state == AppLifecycleState.resumed) {
     myContr.loadAd();
    myContr.showAd();
  }
  }
class _SalahState extends State<Salah> {
 
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
          scaffoldBackgroundColor: Color(0xff0B1215),
          appBarTheme: AppBarTheme(
            backgroundColor: Colors.transparent,
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  backgroundColor: Color(0xff35c55e)))
          // scaffoldBackgroundColor: Color(0xff172222),
          ),
      debugShowCheckedModeBanner: false,
      home: SalahSplash(),
    );
  }
  
}
