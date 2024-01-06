import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:salah/Screens/select_country.dart';
import 'package:salah/Widget/salah_bottomBar.dart';

class SalahSplash extends StatefulWidget {
  const SalahSplash({super.key});

  @override
  State<SalahSplash> createState() => _SalahSplashState();
}

class _SalahSplashState extends State<SalahSplash> {
  @override
  void initState() {
    Timer(Duration(seconds: 3), () {
      Get.offAll(SelectCountry());
    });
    // TODO: implement initState
    super.initState();
  }

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Image(
              image: AssetImage('assets/images/splash.jpg'),
              // color: Colors.black,
              height: Get.height,
              width: Get.width,
              fit: BoxFit.cover,
            ),
            Container(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: Container(color: Colors.transparent),
              ),
            ),
            Container(
                alignment: Alignment.center,
                // alignment: Alignment.center,
                height: Get.height,
                width: Get.width,
                // foregroundDecoration: BoxDecoration(color: Colors.grey.shade200),
                // decoration: BoxDecoration(
                //     image: DecorationImage(
                //         colorFilter: ColorFilter.mode(
                //             Colors.grey.shade900.withOpacity(0.9), BlendMode.darken),
                //         image: AssetImage('assets/images/splash.jpg'),
                //         fit: BoxFit.cover)),
                child: Text(
                  'صلاۃ',
                  style: GoogleFonts.notoSansArabic(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 90),
                )),
          ],
        ),
      ),
    );
  }
}
