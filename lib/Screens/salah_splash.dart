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
      final selectedCountry = constant.box.read('selectedCountry');
      if (selectedCountry != null) {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (builder) => SalahBottomBar()));
      } else {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (builder) => SelectCountry()));
      }
      // constant.box.read('selectedCountry') != '' ||
      //         constant.box.read('selectedCountry') != null
      //     ? Get.offAll(SalahBottomBar())
      //     : Get.offAll(SelectCountry());
    });
    // print('${constant.box.read('selectedCountry')}ffff');
    // TODO: implement initState
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color(0xff172222),
      body: Center(child: Image(image: AssetImage('assets/images/splash.png'))),
    );
  }
}
