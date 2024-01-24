import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:salah/Core/dio.dart';
import 'package:salah/Core/get_api.dart';
import 'package:salah/Core/get_constants.dart';
import 'package:salah/Models/islamic_calender_model.dart';
import 'package:salah/Models/prayer_Time_model.dart';
import 'package:date_picker_timeline_fixed/date_picker_timeline_fixed.dart';
import 'package:salah/Screens/Activity/Recitation/verse_recitation.dart';
import '../Widget/custom_namz_card.dart';

class PrayerTimeScreen extends StatefulWidget {
  const PrayerTimeScreen({super.key});

  @override
  State<PrayerTimeScreen> createState() => _PrayerTimeScreenState();
}

String? _selectedValue;
final getApi = GetApi(dio);
PrayerTimeModel? prayerTimeModel;
IslamicCalenderModel? islamicCalenderModel;
Constant constant = Constant();

// String fajr = "";
class _PrayerTimeScreenState extends State<PrayerTimeScreen> {
  String fajr = "";
  String dhuhr = "";
  String asr = "";
  String magrib = "";
  String isha = "";
  String date = "";
  String day = "";
  String month = "";
  String year = "";
  String fullDate = "";
  final box = GetStorage();
  String formattedDate() {
    // Get the current date and time
    DateTime now = DateTime.now();

    // Format the date as day-month-year with "-" in the middle
    String formattedDate = DateFormat('dd-MM-yyyy').format(now);

    return formattedDate;
  }

  String selectDate = '';
  Future<void> getCalender() async {
    try {
      islamicCalenderModel = await getApi.getCalender(date);
      print('$date dateislamic');
      day = islamicCalenderModel!.data.hijri.day;
      month = islamicCalenderModel!.data.hijri.month.en;
      year = islamicCalenderModel!.data.hijri.year;
      fullDate = islamicCalenderModel!.data.gregorian.date;
      setState(() {});
    } catch (e) {}
  }

  Future<void> getTime() async {
    try {
      prayerTimeModel = await getApi.getPrayerTime(
          constant.box.read('selectedCountry'),
          constant.box.read('selectedCity'),
          '${_selectedValue}');
      // print('$address addd');

      log('${prayerTimeModel?.data?.timings?.Asr} fajren');
      setState(() {});

      fajr = convertTo12HourFormat(prayerTimeModel!.data.timings.Fajr);
      dhuhr = convertTo12HourFormat(prayerTimeModel!.data.timings.Dhuhr);
      asr = convertTo12HourFormat(prayerTimeModel!.data.timings.Asr);
      magrib = convertTo12HourFormat(prayerTimeModel!.data.timings.Maghrib);
      isha = convertTo12HourFormat(prayerTimeModel!.data.timings.Isha);

      constant.box.write('magrib', convertTo12HourFormat('10:00'));
    } catch (e) {
      print("$e erer");
    }
  }

  String convertTo12HourFormat(String time24Hour) {
    final DateTime dateTime = DateFormat('HH:mm').parse(time24Hour);
    return DateFormat('h:mm a').format(dateTime);
  }

  String now12HourFormat() {
    DateTime date = DateTime.now();
    String time = "${date.hour}:${date.minute}:${date.second}";
    final DateTime dateTime = DateFormat('HH:mm').parse(time);
    return DateFormat('h:mm a').format(dateTime);
  }

  Duration? diff;
  Duration? hrs;
  Duration? mins;
  Duration? sec;
  String nextPrayerName = "";
  // Future<void> nextPrayer() async {
  //  for (int i = 1; i < 6; i++) {
  //     if('10:14 AM' == '10:14 AM'){
  //       nextPrayerName = 'FAJR';
  //     }else if ('10:14 AM' == '10:14 AM'){
  //       nextPrayerName = 'Dhur';
  //     }else if ('10:14 AM' == '10:14 AM'){
  //       nextPrayerName = 'Asr';
  //     }else if ('10:14 AM' == '10:14 AM'){
  //       nextPrayerName = 'Magrib';
  //     }else if (now == e){
  //       nextPrayerName = 'Isha';
  //     }

  //                   }
  // }

  String subtractTime() {
    String prayerName = "";
    DateTime endDate = DateFormat("h:mm a").parse("${now12HourFormat()}");

    DateTime startDate =
        DateFormat("h:mm a").parse("${convertTo12HourFormat(fajr)}");

// Get the Duration using the diferrence method

    diff = endDate.difference(startDate);

    Duration(hours: diff!.inHours);

// Print the result in any format you want
    print(diff.toString()); // 12:00:00.000000
    print(diff!.inHours); // 12
    return diff.toString();
  }

  String formatDuration() {
    DateTime endDate = DateFormat("h:mm a").parse("${now12HourFormat()}");
    DateTime startDate =
        DateFormat("h:mm a").parse("${convertTo12HourFormat(magrib)}");

// Get the Duration using the diferrence method

    Duration diff = endDate.difference(startDate);
    // Use the DurationFormat class from intl package for formatting
    Constant durationFormat = Constant();
    setState(() {});
    return durationFormat.format(diff);
  }

  Color? redColor;
  Future<void> changeTheme() async {
    if (diff!.inHours < 6) {
      setState(() {
        redColor = const Color(0xFFFF0000);
      });
    }
  }

  Future<void> apis() async {
    await getTime();
    await getCalender();
    await changeTheme();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // date = formattedDate();

    apis();
    Timer.periodic(Duration(seconds: 2), (timer) {
      // subtractTime();
      // formatDuration();
      setState(() {
//         DateTime endDate = DateFormat("h:mm a").parse("${now12HourFormat()}");

//         DateTime startDate =
//             DateFormat("h:mm a").parse("${convertTo12HourFormat(fajr)}");

// // Get the Duration using the diferrence method

//         diff = endDate.difference(startDate);
        now12HourFormat();
        formatDuration();
        changeTheme();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: redColor,
            toolbarHeight: 80,
            // centerTitle: true,
            title: Text(
              'Prayer Time',
              style: GoogleFonts.roboto(
                  color: Colors.white, fontWeight: FontWeight.bold),
            )),
        // backgroundColor: Color(0xff172222),
        // body: Stack(
        //   alignment: Alignment.bottomCenter,
        //   children: [
        //     Column(
        //       crossAxisAlignment: CrossAxisAlignment.start,
        //       // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //       children: [
        //         // Container(
        //         //   margin: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
        //         //   decoration: BoxDecoration(
        //         //       color: Colors.white, borderRadius: BorderRadius.circular(10)),
        //         //   height: 100,
        //         //   width: Get.width,
        //         //   child: DatePicker(
        //         //     DateTime.now(),
        //         //     initialSelectedDate: DateTime.now(),
        //         //     selectionColor: Colors.black,
        //         //     selectedTextColor: Colors.white,
        //         //     onDateChange: (date) {
        //         //       // New date selected
        //         //       setState(() {
        //         //         _selectedValue = date.day.toString();
        //         //         print('$_selectedValue didi');
        //         //         getTime();
        //         //       });
        //         //     },
        //         //   ),
        //         // ),
        //         fullDate == ""
        //             ? CircularProgressIndicator(
        //                 color: Colors.blue,
        //               )
        //             : Container(
        //                 padding:
        //                     EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        //                 height: Get.height * 0.15,
        //                 width: Get.width,
        //                 decoration: BoxDecoration(
        //                     color: Colors.white,
        //                     borderRadius: BorderRadius.circular(20)),
        //                 margin:
        //                     EdgeInsets.symmetric(horizontal: 15, vertical: 8),
        //                 child: Column(
        //                   crossAxisAlignment: CrossAxisAlignment.start,
        //                   children: [
        //                     Text('${day} ${month}, ${year} AH',
        //                         style: GoogleFonts.roboto(
        //                             fontWeight: FontWeight.bold,
        //                             fontSize: 25,
        //                             color: Colors.black)),
        //                     Text(
        //                       '$fullDate',
        //                       style: GoogleFonts.roboto(
        //                           color: Colors.black,
        //                           fontWeight: FontWeight.w400,
        //                           fontSize: 18),
        //                     ),
        //                     SizedBox(
        //                       height: 10,
        //                     ),
        //                     Text('lll',
        //                         style: GoogleFonts.roboto(
        //                             fontWeight: FontWeight.bold,
        //                             fontSize: 25,
        //                             color: Colors.black)),
        //                   ],
        //                 ),
        //               ),

        //         SizedBox(
        //           height: 10,
        //         ),
        //         Container(
        //           child: Column(
        //             children: [
        // CustomNamazCard(
        //   namazName: 'Fajr',
        //   namazTime: fajr,
        // ),
        // CustomNamazCard(
        //   namazName: 'Dhuhr',
        //   namazTime: dhuhr,
        // ),
        // CustomNamazCard(
        //   namazName: 'Asr',
        //   namazTime: asr,
        // ),
        // CustomNamazCard(
        //   namazName: 'Magrib',
        //   namazTime: magrib,
        // ),
        // CustomNamazCard(
        //   namazName: 'Isha',
        //   namazTime: isha,
        // ),
        //             ],
        //           ),
        //         ),
        //       ],
        //     ),
        //   ],
        // ));
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              alignment: Alignment.center,
              height: Get.height,
              width: Get.width,
              // color: Color(0xff191536),
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                    Color(0xff2f76de),
                    Color(0xff2d8fda),
                    Color(0xff2aaed4),
                  ])),
              child: Stack(
                alignment: Alignment.center,
                // alignment: Align,
                children: [
                  Opacity(
                    opacity: 0.5,
                    alwaysIncludeSemantics: true,
                    child: CircleAvatar(
                      radius: 120,
                      backgroundColor: Color(0xff2f76de),
                    ),
                  ),
                  Opacity(
                    opacity: 0.2,
                    alwaysIncludeSemantics: true,
                    child: CircleAvatar(
                      radius: 140,
                      backgroundColor: Color(0xff2f76de),
                    ),
                  ),
                  Opacity(
                    opacity: 1,
                    alwaysIncludeSemantics: true,
                    child: CircleAvatar(
                      radius: 100,
                      backgroundColor: Color(0xff2f76de),
                      child: Icon(
                        FeatherIcons.sun,
                        color: Colors.white,
                        size: 80,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              // margin: EdgeInsets.only(top: 50),
              // height: Get.height * 0.2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    '${box.read('country')} , ${box.read('city')}'
                        .toUpperCase(),
                    style: GoogleFonts.roboto(
                        color: Colors.white,
                        fontWeight: FontWeight.w300,
                        fontSize: 16),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Text(
                    'MAGRIB',
                    style: GoogleFonts.roboto(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                  Text(
                    '${formatDuration()}',
                    style: GoogleFonts.roboto(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 35),
                  ),
                  Text(
                    '(${now12HourFormat()})',
                    style: GoogleFonts.roboto(
                        color: Colors.white,
                        fontWeight: FontWeight.w300,
                        fontSize: 16),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(8),
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(15)),
              child: ExpansionTile(
                collapsedShape: RoundedRectangleBorder(
                    side: BorderSide.none,
                    borderRadius: BorderRadius.circular(10)),
                backgroundColor: Color(0xff26254f),
                shape: RoundedRectangleBorder(
                    side: BorderSide.none,
                    borderRadius: BorderRadius.circular(10)),
                collapsedBackgroundColor: Color(0xff26254f),
                title: Text(
                  'PRAYER TIME',
                  style: GoogleFonts.roboto(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 22),
                ),
                children: [
                  CustomNamazCard(
                    namazName: 'Fajr',
                    namazTime: fajr,
                  ),
                  CustomNamazCard(
                    namazName: 'Dhuhr',
                    namazTime: dhuhr,
                  ),
                  CustomNamazCard(
                    namazName: 'Asr',
                    namazTime: asr,
                  ),
                  CustomNamazCard(
                    namazName: 'Magrib',
                    namazTime: magrib,
                  ),
                  CustomNamazCard(
                    namazName: 'Isha',
                    namazTime: isha,
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
