import 'dart:async'; 
import 'package:flutter/material.dart'; 
import 'package:get/get.dart';
import 'package:salah/Screens/select_country.dart';
import 'package:salah/Widget/salah_bottomBar.dart';
import '../Core/get_constants.dart';

class SalahSplash extends StatefulWidget {
  const SalahSplash({super.key});

  @override
  State<SalahSplash> createState() => _SalahSplashState();
}

Constant constant = Constant();
String? yourCountry = constant.box.read('selectedCountry');
String? yourCity = constant.box.read('selectedCity');
class _SalahSplashState extends State<SalahSplash> {
 @override
  void initState() {
      Timer(Duration(seconds: 3), () {
      // String selectedCountry = constant.box.read('selectedCountry');
      if (yourCountry!=null&& yourCountry!.isNotEmpty )  {
       Get.offAll(  SalahBottomBar());
      } else {
         Get.offAll( SelectCountry());
      } 
     
    }); 
    // TODO: implement initState
    super.initState();
  }
@override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color(0xff172222),
      body: Center(child:Image(image: AssetImage('assets/images/splash.png'),)),
    );
  }
}
