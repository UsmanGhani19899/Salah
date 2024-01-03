import 'dart:async';

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
    // Timer(Duration(seconds: 3), () {
    //   Get.offAll(SelectCountry());
    // });
    // TODO: implement initState
    super.initState();
  }

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff2A323f),
        body: Container(
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            // alignment: Alignment.bottomCenter,
            children: [
              SizedBox(),
              Text(
                'صلاح',
                style: GoogleFonts.roboto(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 90),
              ),
              // SvgPicture.asset(
              //   // alignment: Alignment.topCenter,

              //   'assets/images/masjid.svg',
              //   semanticsLabel: 'Acme Logo',
              //   width: Get.width,
              //   height: Get.height * 0.9,
              //   fit: BoxFit.cover,
              // ),
              Image(
                image: AssetImage('assets/images/prayer.png'),
                color: Colors.green.withOpacity(0.4),
                height: Get.height * 0.35,
                width: Get.width,
                fit: BoxFit.cover,
              )
            ],
          ),
        ),
      ),
    );
  }
}
