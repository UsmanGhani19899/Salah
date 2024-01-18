import 'dart:developer';

import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:salah/Core/dio.dart';
import 'package:salah/Core/get_api.dart';
import 'package:salah/Core/get_constants.dart';
import 'package:salah/Models/islamic_calender_model.dart';
import 'package:salah/Models/prayer_Time_model.dart';
import 'package:date_picker_timeline_fixed/date_picker_timeline_fixed.dart';
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
  String formattedDate() {
    // Get the current date and time
    DateTime now = DateTime.now();

    // Format the date as day-month-year with "-" in the middle
    String formattedDate = DateFormat('dd-MM-yyyy').format(now);

    return formattedDate;
  }

  String convertTo12HourFormat(String time24Hour) {
    final DateTime dateTime = DateFormat('HH:mm').parse(time24Hour);
    return DateFormat('h:mm a').format(dateTime);
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
      prayerTimeModel = await getApi.getPrayerTime(constant.box.read('country'),
          constant.box.read('city'), '${_selectedValue}');
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

  Future<void> apis() async {
    await getTime();
    await getCalender();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    date = formattedDate();
    apis();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.transparent,
            toolbarHeight: 60,
            // centerTitle: true,
            title: Text(
              'Prayer Time',
              style: GoogleFonts.roboto(
                  color: Colors.white, fontWeight: FontWeight.bold),
            )),
        backgroundColor: Color(0xff172222),
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Container(
                //   margin: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                //   decoration: BoxDecoration(
                //       color: Colors.white, borderRadius: BorderRadius.circular(10)),
                //   height: 100,
                //   width: Get.width,
                //   child: DatePicker(
                //     DateTime.now(),
                //     initialSelectedDate: DateTime.now(),
                //     selectionColor: Colors.black,
                //     selectedTextColor: Colors.white,
                //     onDateChange: (date) {
                //       // New date selected
                //       setState(() {
                //         _selectedValue = date.day.toString();
                //         print('$_selectedValue didi');
                //         getTime();
                //       });
                //     },
                //   ),
                // ),
                fullDate == ""
                    ? CircularProgressIndicator(
                        color: Colors.blue,
                      )
                    : Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                        height: Get.height * 0.15,
                        width: Get.width,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20)),
                        margin:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('${day} ${month}, ${year} AH',
                                style: GoogleFonts.roboto(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25,
                                    color: Colors.black)),
                            Text(
                              '$fullDate',
                              style: GoogleFonts.roboto(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 18),
                            ),
                          ],
                        ),
                      ),

                SizedBox(
                  height: 10,
                ),
                Container(
                  child: Column(
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
                ),
              ],
            ),
          ],
        ));
  }
}
