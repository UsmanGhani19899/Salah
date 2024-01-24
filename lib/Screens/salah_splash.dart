import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:salah/Screens/select_country.dart';
import 'package:salah/Widget/salah_bottomBar.dart';

import '../Core/get_constants.dart';

class SalahSplash extends StatefulWidget {
  const SalahSplash({super.key});

  @override
  State<SalahSplash> createState() => _SalahSplashState();
}

Constant constant = Constant();

class _SalahSplashState extends State<SalahSplash> {
  @override
  void initState() {
    Timer(Duration(seconds: 3), () {
      if (constant.box.read('selectedCountry') != '' ||
          constant.box.read('selectedCountry') != null) {
        Get.offAll(SalahBottomBar());
      } else {
        Get.offAll(SelectCountry());
      }
      // constant.box.read('selectedCountry') != '' ||
      //         constant.box.read('selectedCountry') != null
      //     ? Get.offAll(SalahBottomBar())
      //     : Get.offAll(SelectCountry());
    });
    // TODO: implement initState
    super.initState();
  }

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff172222),
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(
                  image: AssetImage('assets/images/quran_image.png'),
                  // color: Colors.black,
                  height: Get.height * 0.2,
                  // width: Get.width,
                  fit: BoxFit.cover,
                ),
                // Container(
                //   child: BackdropFilter(
                //     filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                //     child: Container(color: Colors.transparent),
                //   ),
                // ),
                Text(
                  'صلاۃ',
                  style: GoogleFonts.notoSansArabic(
                      color: Colors.white,
                      fontWeight: FontWeight.w300,
                      fontSize: 90),
                ),
              ],
            ),
            Container(
              alignment: Alignment.bottomCenter,
              height: Get.height,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.center,
                      colors: [
                    Colors.black.withOpacity(0.9),
                    Colors.black.withOpacity(0.2),
                  ])),
            ),
          ],
        ),
      ),
    );
  }
}
