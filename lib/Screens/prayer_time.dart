import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:ffi';

import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
// import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:intl/intl.dart';
import 'package:salah/Core/dio.dart';
import 'package:salah/Core/get_api.dart';
import 'package:salah/Core/get_constants.dart';
import 'package:salah/Core/my_controller.dart';
import 'package:salah/Core/notification_service.dart';
import 'package:salah/Models/islamic_calender_model.dart';
import 'package:salah/Models/prayer_Time_model.dart';
import 'package:date_picker_timeline_fixed/date_picker_timeline_fixed.dart';
import 'package:salah/Screens/Activity/Recitation/verse_recitation.dart';
import 'package:salah/Screens/home.dart';
import 'package:salah/Widget/app_bar_widget.dart';
import 'package:salah/Widget/noti.dart';
import 'package:timezone/timezone.dart';
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
  MyController myContr = Get.put(MyController());
  // String fajr = "";
  // String dhuhr = "";
  // String asr = "";
  // String magrib = "";
  // String isha = "";
  // String date = "";
  // String day = "";
  // String month = "";
  // String year = "";
  // String fullDate = "";
  // final box = GetStorage();

  String selectDate = '';
  // Future<void> getCalender() async {
  //   try {
  //      DateTime now = DateTime.now();

  // // Format the date as "day-month-year"
  // String formattedDate = DateFormat('d-M-yyyy').format(now);
  //     islamicCalenderModel = await getApi.getCalender(formattedDate);
  //     print('$date dateislamic');
  //     day = islamicCalenderModel!.data.hijri.day;
  //     month = islamicCalenderModel!.data.hijri.month.en;
  //     year = islamicCalenderModel!.data.hijri.year;
  //     fullDate = islamicCalenderModel!.data.gregorian.date;
  //     setState(() {});
  //   } catch (e) {}
  // }

//  Working
  // Future<void> getTime() async {
  //   try {
  //     prayerTimeModel = await getApi.getPrayerTime(
  //         constant.box.read('selectedCountry'),
  //         constant.box.read('selectedCity'),
  //         // 'Australia',"Sydney",
  //         '${_selectedValue}');
  //     // print('$address addd');

  //     log('${prayerTimeModel?.data?.timings?.Asr} fajren');
  //     setState(() {});

  //     fajr = convertTo12HourFormat(prayerTimeModel!.data.timings.Fajr);
  //     dhuhr = convertTo12HourFormat(prayerTimeModel!.data.timings.Dhuhr);
  //     asr = convertTo12HourFormat(prayerTimeModel!.data.timings.Asr);
  //     magrib = convertTo12HourFormat(prayerTimeModel!.data.timings.Maghrib);
  //     isha = convertTo12HourFormat(prayerTimeModel!.data.timings.Isha);

  //     // constant.box.write('magrib', convertTo12HourFormat('10:00'));
  //   } catch (e) {
  //     print("$e erer");
  //   }
  // }

//  Working
  String convertTo12HourFormat(String time24Hour) {
    final DateTime dateTime = DateFormat('HH:mm').parse(time24Hour);
    return DateFormat('h:mm a').format(dateTime);
  }

//  Working
  String nowTime = "";
  String now12HourFormat() {
    DateTime date = DateTime.now();
    String time = "${date.hour}:${date.minute}:${date.second}";
    final DateTime dateTime = DateFormat('HH:mm').parse(time);
    nowTime = DateFormat('h:mm a').format(dateTime);
    return DateFormat('h:mm a').format(dateTime);
  }

  Duration? diff;
  Duration? hrs;
  Duration? mins;
  Duration? sec;
  String nextPrayerName = "";
  // String compareTimer() {
  //   final cmp = nowTime;
  //   print('$cmp suiiiii');
  //   return cmp.toString();
  // }

  // Future<void> nextPray() async {
  //   if (nowTime == '8:10 PM') {
  //     nextPrayerName = 'Dhur';
  //   } else if (nowTime == dhuhr) {
  //     nextPrayerName = 'Asr';
  //   } else if (nowTime == asr) {
  //     nextPrayerName = 'Magrib';
  //   } else if (nowTime == magrib) {
  //     nextPrayerName = 'Isha';
  //   } else if (nowTime == isha) {
  //     nextPrayerName = 'Fajr';
  //   }
  //   setState(() {});
  // }

  String formatDuration() {
    DateTime endDate = DateFormat("h:mm a").parse("${nowTime}");
    DateTime startDate = DateFormat("h:mm a").parse("${myContr.magrib.value}");

// Get the Duration using the diferrence method

    Duration diff = startDate.difference(endDate);
    // Use the DurationFormat class from intl package for formatting
    Constant durationFormat = Constant();
    setState(() {});
    return durationFormat.format(diff);
  }

  int hours = 0;
  int minutes = 0;
  int seconds = 0;
  Future<void> timeDiff() async {
    final DateTime dateTime =
        DateFormat('HH:mm').parse(prayerTimeModel!.data.timings.Dhuhr);

    //  final  DateFormat('h:mm a').format(dateTime);
    DateTime date = DateTime.now();
    String time = "${date.hour}:${date.minute}:${date.second}";
    final DateTime now = DateFormat('HH:mm').parse(time);
    DateTime a = now;
    DateTime b = dateTime;
    // final namaz = DateFormat('h:mm a').format(namazTime) as DateTime;
    // DateTime a = a;
    // DateTime b = b;

    Duration difference = b.difference(a);
    // difference = difference -
    //     Duration(
    //         // milliseconds: difference.inMilliseconds % 1000000,
    //         microseconds: difference.inMilliseconds % 10000);

    print('$difference mnmnmn');

    // days = difference.inDays;
    hours = difference.inHours.remainder(24);
    minutes = difference.inMinutes.remainder(60);
    seconds = difference.inSeconds.remainder(60);

    print("day(s) $hours hour(s) $minutes minute(s) $seconds second(s).");
  }

  Duration? durationPrayer;
  String formatDu() {
    durationPrayer = Duration(hours: hours, minutes: minutes, seconds: seconds);
    String twoDigits(int n) {
      if (n >= 10) return "$n";
      return "0$n";
    }

    String twoDigitMinutes = twoDigits(durationPrayer!.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(durationPrayer!.inSeconds.remainder(60));

    return "${durationPrayer!.inHours}:$twoDigitMinutes:$twoDigitSeconds";
  }

  Color? redColor;
  Future<void> changeTheme() async {
    if (diff!.inHours < 6) {
      setState(() {
        redColor = const Color(0xFFFF0000);
      });
    }
  }

  bool shouldDisplayText(final startTime, final endTime) {
    DateTime date = DateTime.now();
    String time = "${date.hour}:${date.minute}:${date.second}";
    final DateTime dateTime = DateFormat('HH:mm').parse(time);
    DateFormat('h:mm a').format(dateTime);
    //  final currentTime = now12HourFormat();
    return dateTime.isAfter(startTime) && dateTime.isBefore(endTime);
  }

  Future<void> apis() async {
 
    await myContr.getTime();
    await myContr.getCalender();

    await timeDiff();
       getUpcomingPrayer();
    getNextPrayer();
    
    // await compareTimer();
    // await getCalender();
    await changeTheme();
  }

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  Future<void> _showNotificationCustomSound() async {
    const AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails(
      'your other channel id',
      'your other channel name',
      channelDescription: 'your other channel description',
      sound: RawResourceAndroidNotificationSound('assets/azan.mp3'),
    );
    const DarwinNotificationDetails darwinNotificationDetails =
        DarwinNotificationDetails(
      sound: 'slow_spring_board.aiff',
    );
    final LinuxNotificationDetails linuxPlatformChannelSpecifics =
        LinuxNotificationDetails(
      sound: AssetsLinuxSound('sound/slow_spring_board.mp3'),
    );
    final NotificationDetails notificationDetails = NotificationDetails(
      android: androidNotificationDetails,
      iOS: darwinNotificationDetails,
      macOS: darwinNotificationDetails,
      linux: linuxPlatformChannelSpecifics,
    );
    await flutterLocalNotificationsPlugin.show(
      0,
      'custom sound notification title',
      'custom sound notification body',
      notificationDetails,
    );
  }

  Future<void> scheduleNotification() async {
    final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
        FlutterLocalNotificationsPlugin();

    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      'your_channel_id',
      'your_channel_name',
      // 'your_channel_description',
      importance: Importance.max,
      priority: Priority.high,
    );

    const NotificationDetails platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);

    // Replace the following DateTime with the specific time you want to schedule the notification
    final DateTime scheduledTime =
        DateTime.now().add(const Duration(seconds: 10));

    await flutterLocalNotificationsPlugin.zonedSchedule(
      0,
      'Scheduled Notification Title',
      'Scheduled Notification Body',
      TZDateTime.from(scheduledTime, local),
      platformChannelSpecifics,
      androidAllowWhileIdle: true,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
    );
  }
 
 String nowprayerTime ="";
 String getNextPrayer() {
  List<String> prayerNames = ['Fajr', 'Dhuhr', 'Asr', 'Maghrib', 'Isha'];
  List<String> prayerTimings = [
    myContr.fajr.value,
    myContr.dhuhr.value,
    myContr.asr.value,
    myContr.magrib.value,
    myContr.isha.value,
  ];

  DateTime now = DateTime.now();
  DateTime now12 = DateFormat('h:mm a').parse(now12HourFormat());
  DateTime nextPrayerTime = DateTime(3000);
  String nextPrayer = '';
 
 

   
  for (int i = 0; i < prayerTimings.length; i++) {
    try {
      DateTime prayerTime = DateFormat('h:mm a').parse(prayerTimings[i]);
      if (prayerTime.isAtSameMomentAs(now12) || prayerTime.isAfter(now12) && prayerTime.isBefore(nextPrayerTime)) {
        nextPrayerTime = prayerTime;
        nextPrayer = prayerNames[i];
      String formattedTime = DateFormat('h:mm a').format(nextPrayerTime);
      nowprayerTime = formattedTime;
   break;
      }
    } catch (e) {
      print('Error parsing time: $e');
    }
   
  }

  return nextPrayer.isNotEmpty ? nextPrayer : "No prayer found";
}

 
String upcomingPrayerTimes="";

  String getUpcomingPrayer() {
  List<String> prayerNames = ['Fajr', 'Dhuhr', 'Asr', 'Maghrib', 'Isha'];
  List<String> prayerTimings = [
    myContr.fajr.value,
    myContr.dhuhr.value,
    myContr.asr.value,
    myContr.magrib.value,
    myContr.isha.value,
  ];

  DateTime now = DateTime.now();
  DateTime upcomingPrayerTime = DateTime(3000);
  String upcomingPrayer = '';

  for (int i = 0; i < prayerTimings.length; i++) {
    try {
      DateTime prayerTime = DateFormat('h:mm a').parse(prayerTimings[i]);
        DateTime now12 = DateFormat('h:mm a').parse(now12HourFormat());
      if (prayerTime.isBefore(now12) || prayerTime.isAfter(now12)) {
        upcomingPrayerTime = prayerTime;
        upcomingPrayer = prayerNames[i];
        String formattedTime = DateFormat('h:mm a').format(upcomingPrayerTime);
        upcomingPrayerTimes = formattedTime;
        break;
        // break;
    //  if(upcomingPrayer == "Fajr"){break;}
         // No need to continue looping once we find the upcoming prayer
      }
    } catch (e) {
      print('Error parsing time: $e');
    }
  }

  return upcomingPrayer.isNotEmpty ? upcomingPrayer : "No prayer found";
}
String? yourCountry = constant.box.read('selectedCountry');
String? yourCity = constant.box.read('selectedCity');

String imgNamaz = "";
  // NotificationHelper _notificationHelper = NotificationHelper();
  final DateTime scehduleing = DateFormat('HH:mm').parse('11:41');
  @override
  void initState() {
    Timer.periodic(Duration(seconds: 1), (timer) { 
        now12HourFormat();
      getUpcomingPrayer();
      getNextPrayer();
  
      setState(() {
        
      });
    });
    // myContr.prayer();
//     Timer.periodic(Duration(seconds: 1), (Timer timer) {
//       if(now12HourFormat() == '11:59 AM'){
// sendNotification();
//       }else if(now12HourFormat() == dhuhr){
// sendNotification();
//       }
//       else if(now12HourFormat() == asr){
// sendNotification();
//       }
//       else if(now12HourFormat() == magrib){
// sendNotification();
//       }
//       else if(now12HourFormat() == isha){
// sendNotification();
//       }
//       setState(() {
//             DateTime date = DateTime.now();
//     String time = "${date.hour}:${date.minute}:${date.second}";
//     final DateTime dateTime = DateFormat('HH:mm').parse(time);
//     // final DateTime now= DateFormat('h:mm a').format(dateTime) as DateTime;
//     //  final DateTime namazTime = DateFormat('HH:mm').parse(fajr);
//     //  final DateTime nowNamaz= DateFormat('h:mm a').format(namazTime) as DateTime;
//         // Check if it's time to change the text
//         if (dateTime.isAfter(DateTime(2024, 2, 8, 10, 45))) {
//           imgNamaz = 'assets/images/night.jpg';
//           setState(() {
            
//           });
//           // Cancel the timer once the text is changed
//           timer.cancel();
//         }else{
//           imgNamaz = 'assets/images/night.jpg';
//           setState(() {
            
//           });
//         }
//       });
//  });
    
    // TODO: implement initState
    super.initState();
    apis();
 
   myContr.createRewardedAd();
   myContr.showRewardedAd();
//     Timer.periodic(Duration(seconds: 1), (timer) {
//       setState(() {
//         // durationPrayer =
//         //     Duration(hours: hours, minutes: minutes, seconds: seconds);
//         timeDiff();
//         formatDu();
// //         diff = endDate.difference(startDate);
//         now12HourFormat();
//         formatDuration();
//         changeTheme();
//       });
//     });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(pageName: 'Prayers Time'),
        // appBar: AppBar(
        //     actions: [
        //       IconButton(
        //           onPressed: () async {
        //             // for (int i = 0; i < 3; i++) {
        //             //   _notificationHelper.scheduledNotification(
        //             //     hour: int.parse('3'),
        //             //     minutes: int.parse('10'),
        //             //     id: 1,
        //             //     sound: 'sound0',
        //             //   );
        //             // }
        //           },
        //           icon: Icon(Icons.abc))
        //     ],
        //     backgroundColor: redColor,
        //     toolbarHeight: 80,
        //     // centerTitle: true,
        //     title: Text(
        //       'Prayer Time',
        //       style: GoogleFonts.montserrat(
        //           color: Colors.white, fontWeight: FontWeight.bold),
        //     )),
        // // backgroundColor: Color(0xff172222),
        body: 
        Obx(() => Column(
        
          // alignment: Alignment.bottomCenter,
          children: [
            Expanded(
              child: Container(
                margin: EdgeInsets.all(10),
                alignment: Alignment.centerLeft,
                
                decoration: BoxDecoration(
                  
                  //  image: DecorationImage(image: AssetImage('assets/images/night.jpg'),fit: BoxFit.cover,alignment: Alignment.topCenter,),
                   
                  color: Colors.transparent,borderRadius: BorderRadius.circular(15)),
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 12),
                // margin: EdgeInsets.symmetric(vertical: 10, horizontal: 2),
                height: Get.height  ,
                width: Get.width,
                //  decoration: BoxDecoration(
                //   image: DecorationImage(image: AssetImage('assets/images/night.jpg'),fit: BoxFit.cover,alignment: Alignment.topCenter,),
                //   borderRadius: BorderRadius.circular(
                //     0,
                //   ),
                //   // color: Colors.grey.shade900,
                  
                // ),
                child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("${yourCountry} , ${yourCity}",style: GoogleFonts.montserrat(
                              
                              color: Colors.white,fontWeight: FontWeight.w300,fontSize: 18,),),
                          
        ],),
                          Text("${now12HourFormat()}",style: GoogleFonts.montserrat(
                              
                              color: Colors.white,fontWeight: FontWeight.bold,fontSize: 60,),),
                           
                   
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                 crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                            Text("Next\nPrayer",style: GoogleFonts.montserrat(color: Colors.white,fontWeight: FontWeight.w300,fontSize: 20),),
                             
                              Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                             children: [
                               
                              Text("${ getNextPrayer()}",style: GoogleFonts.montserrat(
                                
                                color: Colors.white,fontWeight: FontWeight.bold,fontSize: 22,),),
                                 Text("${nowprayerTime}",style: GoogleFonts.montserrat(color: Colors.white,fontWeight: FontWeight.w300,fontSize: 16),),
                                        
                             ],
                           ),
                      // SizedBox(height: 15,),
                      //      Column(
                      //       crossAxisAlignment: CrossAxisAlignment.start,
                      //        children: [
                      //          Text("upcoming",style: GoogleFonts.montserrat(color: Colors.white,fontWeight: FontWeight.w300,fontSize: 16),),
                               
                      //          Text("${ getUpcomingPrayer()}",style: GoogleFonts.montserrat(
                      //           letterSpacing: 1,
                      //           color: Colors.white,fontWeight: FontWeight.bold,fontSize: 22),),
                      //             Text("${upcomingPrayerTimes}",style: GoogleFonts.montserrat(color: Colors.white,fontWeight: FontWeight.w300,fontSize: 16),),
                                        
                      //        ],
                      //      ),
                                   
                      // SizedBox()
                       ],
                      ),
                    ),
                          
                  ],
                ),
                             ),
            ),
                          
                          
                             Expanded(
                               child: Padding(
                                
                                 padding: const EdgeInsets.only(left: 10,right: 10,bottom: 8),
                                 child: Container(
                                                            //  height: Get.height*0.5,
                                  alignment: Alignment.bottomCenter,
                                            //  height: Get.height*0.9,
                                             decoration: BoxDecoration(
                                      //  color: Colors.black,
                                    
                                      )
                                      ,
                                      child:    Container(margin: EdgeInsets.all(8),
                                        // height: Get.height*0.35,
                                        decoration: BoxDecoration(
                                          
                                          // color: Colors.transparent,
                                          borderRadius: BorderRadius.circular(20)),
                                        
                                 child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                   children: [
        //  Obx(() => Container( 
        //     margin: EdgeInsets.symmetric(vertical: 10),
        //               child: myContr.isAdLoaded.value
        //                   ? ConstrainedBox(
                            
        //                       constraints: const BoxConstraints(
        //                         maxHeight: 100,
        //                         minHeight: 100,
                                
        //                       ),
        //                       child: AdWidget(ad: myContr.nativeAd!))
        //                   :   Container(
                        
        //                   ),
        //             )),
                               Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                       children: [
                                        
                                         CustomNamazCard(
                                          icon: FeatherIcons.sunrise,
                                           namazName: 'Fajr',
                                           namazTime: myContr.fajr.value,
                                         ),
                                         CustomNamazCard(
                                          icon: FeatherIcons.sun,
                                           namazName: 'Dhuhr',
                                           namazTime: myContr.dhuhr.value,
                                         ),
                                         CustomNamazCard(
                                          icon: FeatherIcons.sun,
                                           namazName: 'Asr',
                                           namazTime: myContr.asr.value,
                                         ),
                                         CustomNamazCard(
                                          icon: FeatherIcons.sunset,
                                           namazName: 'Magrib',
                                           namazTime: myContr.magrib.value,
                                         ),
                                         CustomNamazCard(
                                          icon: FeatherIcons.moon,
                                           namazName: 'Isha',
                                           namazTime: myContr.isha.value,
                                         ),
                                       ],
                                     ),
                                SizedBox(height: 20,),
                                 Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 12),
                                          child: Container(
                                              padding: EdgeInsets.all(12),
                                                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color:  Colors.white),
                                                             
                                            child: Row(
                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                             children: [
                                            
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                               Text('Islamic\nCalender',style: GoogleFonts.montserrat(color: Colors.black,fontSize: 30,fontWeight: FontWeight.w300),),
                                                             
                                            
                                            ],),
                                            
                                                               Container(
                                                               
                                                               
                                                                child: Row(
                                                            
                                                                  children: [
                                                                    Column(
                                                                      crossAxisAlignment: CrossAxisAlignment.end,
                                                                      children: [
                                                                      Text('${ DateFormat('MMMM').format(DateTime.now())}',style: GoogleFonts.montserrat(color: Colors.black),),
                                                                        Text('${DateTime.now().day.toString()}',style: GoogleFonts.montserrat(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 25),),
                                              
                                                                    Text('${myContr.day.value} ${myContr.month.value} ${myContr.year.value}',style: GoogleFonts.montserrat(color: Colors.black),),
                                               ],),
                                                                
                                                                // CircleAvatar(
                                                                //   backgroundColor: Colors.black,
                                                                //   radius: 20,
                                                                //   child: Icon(Icons.calendar_month_rounded,color: Colors.white,),)
                                                                 
                                                                  ],
                                                                ),
                                                               ),
                                                             ],
                                                           ),
                                          ),
                                        ),
                                           
                                  ],
                                 ),
                                             ),
                                            
                                      ),
                               ),
                             ),
             
                      
             
          ],
        ))
        
        )
        
        ;
   
   
    // body: Stack(
    //   alignment: Alignment.bottomCenter,
    //   children: [
    //     Container(
    //       alignment: Alignment.center,
    //       height: Get.height,
    //       width: Get.width,
    //       // color: Color(0xff191536),
    //       decoration: BoxDecoration(
    //           gradient: LinearGradient(
    //               begin: Alignment.topCenter,
    //               end: Alignment.bottomCenter,
    //               colors: [
    //             shouldDisplayText(DateTime.now(), isha)
    //                 ? Color(0xff2f76de)
    //                 : Colors.amber,
    //             Color(0xff2d8fda),
    //             Color(0xff2aaed4),
    //           ])),
    //       child: Stack(
    //         alignment: Alignment.center,
    //         // alignment: Align,
    //         children: [
    //           Opacity(
    //             opacity: 0.5,
    //             alwaysIncludeSemantics: true,
    //             child: CircleAvatar(
    //               radius: 120,
    //               backgroundColor: Color(0xff2f76de),
    //             ),
    //           ),
    //           Opacity(
    //             opacity: 0.2,
    //             alwaysIncludeSemantics: true,
    //             child: CircleAvatar(
    //               radius: 140,
    //               backgroundColor: Color(0xff2f76de),
    //             ),
    //           ),
    //           Opacity(
    //             opacity: 1,
    //             alwaysIncludeSemantics: true,
    //             child: CircleAvatar(
    //               radius: 100,
    //               backgroundColor: Color(0xff2f76de),
    //               child: Icon(
    //                 FeatherIcons.sun,
    //                 color: Colors.white,
    //                 size: 80,
    //               ),
    //             ),
    //           )
    //         ],
    //       ),
    //     ),
    //     Container(
    //       // margin: EdgeInsets.only(top: 50),
    //       // height: Get.height * 0.2,
    //       child: Column(
    //         mainAxisAlignment: MainAxisAlignment.start,
    //         children: [
    //           Text(
    //             '${box.read('country')} , ${box.read('city')}'
    //                 .toUpperCase(),
    //             style: GoogleFonts.montserrat(
    //                 color: Colors.white,
    //                 fontWeight: FontWeight.w300,
    //                 fontSize: 16),
    //           ),
    //           SizedBox(
    //             height: 40,
    //           ),
    //           Text(
    //             'MAGRIB',
    //             style: GoogleFonts.montserrat(
    //                 color: Colors.white,
    //                 fontWeight: FontWeight.bold,
    //                 fontSize: 16),
    //           ),
    //           Text(
    //             '${formatDuration()}',
    //             style: GoogleFonts.montserrat(
    //                 color: Colors.white,
    //                 fontWeight: FontWeight.bold,
    //                 fontSize: 35),
    //           ),
    //           Text(
    //             '(${now12HourFormat()})',
    //             style: GoogleFonts.montserrat(
    //                 color: Colors.white,
    //                 fontWeight: FontWeight.w300,
    //                 fontSize: 16),
    //           ),
    //         ],
    //       ),
    //     ),
    //     Container(
    //       margin: EdgeInsets.all(8),
    //       decoration:
    //           BoxDecoration(borderRadius: BorderRadius.circular(15)),
    //       child: ExpansionTile(
    //         collapsedShape: RoundedRectangleBorder(
    //             side: BorderSide.none,
    //             borderRadius: BorderRadius.circular(10)),
    //         backgroundColor: Color(0xff26254f),
    //         shape: RoundedRectangleBorder(
    //             side: BorderSide.none,
    //             borderRadius: BorderRadius.circular(10)),
    //         collapsedBackgroundColor: Color(0xff26254f),
    //         title: Text(
    //           'PRAYER TIME',
    //           style: GoogleFonts.montserrat(
    //               color: Colors.white,
    //               fontWeight: FontWeight.bold,
    //               fontSize: 22),
    //         ),
    //         children: [
    //           CustomNamazCard(
    //             namazName: 'Fajr',
    //             namazTime: fajr,
    //           ),
    //           CustomNamazCard(
    //             namazName: 'Dhuhr',
    //             namazTime: dhuhr,
    //           ),
    //           CustomNamazCard(
    //             namazName: 'Asr',
    //             namazTime: asr,
    //           ),
    //           CustomNamazCard(
    //             namazName: 'Magrib',
    //             namazTime: magrib,
    //           ),
    //           CustomNamazCard(
    //             namazName: 'Isha',
    //             namazTime: isha,
    //           ),
    //         ],
    //       ),
    //     )
    //   ],
    // ));
  }
   void sendNotification() {
    final LocalNotificationService _localNotificationService =
        LocalNotificationService();
    // _localNotificationService.checkNotificationPermission();
    _localNotificationService.initializeSettings(context);
    _localNotificationService.showSimpleNotification();
  }
}
