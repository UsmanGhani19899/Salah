import 'dart:developer';

import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:salah/Core/dio.dart';
import 'package:salah/Core/get_api.dart';
import 'package:salah/Models/prayer_Time_model.dart';

class PrayerTimeScreen extends StatefulWidget {
  const PrayerTimeScreen({super.key});

  @override
  State<PrayerTimeScreen> createState() => _PrayerTimeScreenState();
}

final getApi = GetApi(dio);
PrayerTimeModel? prayerTimeModel;

// String fajr = "";
class _PrayerTimeScreenState extends State<PrayerTimeScreen> {
  String fajr = "";
  Future<void> getPlaces() async {
    try {
      prayerTimeModel = await getApi.getPrayerTime('Pakistan', 'Karachi');
      // print('$address addd');

      fajr = '${prayerTimeModel!.data!.timings!.asr}';
      log('${prayerTimeModel?.data?.timings?.asr} fajren');
      setState(() {});
    } catch (e) {
      print("$e erer");
    }
  }

  Future<void> apis() async {
    await getPlaces();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    apis();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            height: Get.height * 0.8,
            width: Get.width,
            decoration:
                BoxDecoration(color: Colors.grey.shade100.withOpacity(0.4)),
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 8),
              height: Get.height * 0.1,
              width: Get.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    // color: Colors.blue,
                    height: Get.height * 0.1,
                    width: Get.width * 0.2,
                    child: Icon(
                      FeatherIcons.sunrise,
                      color: Colors.black,
                    ),
                  ),
                  Container(
                    width: 1,
                    height: Get.height,
                    color: Colors.grey,
                  ),
                  Container(
                    // color: Colors.red,
                    height: Get.height * 0.1,
                    width: Get.width * 0.65,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${fajr}.',
                          style: GoogleFonts.roboto(color: Colors.black),
                        ),
                        Text(
                          '${fajr}',
                          style: GoogleFonts.roboto(color: Colors.black),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
