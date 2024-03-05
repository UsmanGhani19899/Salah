import 'dart:ffi';

import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:salah/Core/get_api.dart';
import 'package:salah/Core/my_controller.dart';
import 'package:salah/Models/quran_detail_model.dart';
import 'package:salah/Screens/Activity/Recitation/text_recite.dart';
import 'package:salah/Screens/Activity/asma_ul_husna_screen.dart';
import 'package:salah/Screens/Activity/audio_player.dart';
import 'package:salah/Screens/Activity/Recitation/quran_reciters.dart';
import 'package:salah/Screens/Activity/bukhari.dart';
import 'package:salah/Screens/Activity/tasbeeh.dart';
import 'package:salah/Screens/Activity/tasbeehs.dart';
import 'package:salah/Widget/app_bar_widget.dart';
import 'package:salah/Widget/custom_card.dart';

import '../../Core/dio.dart';

class ActivityScreen extends StatefulWidget {
  const ActivityScreen({super.key});

  @override
  State<ActivityScreen> createState() => _ActivityScreenState();
}


final screen = [AsmaUlHusnaScreen(), TasbeehScreen()];
final icon = [];
// final _getApi = GetApi(dio);
// QuranDetailTextModel? quranDetailTextModel;
class _ActivityScreenState extends State<ActivityScreen> {
  MyController myContr = Get.put(MyController());

  //  Future<void> getDetailedSurah() async {
  //   quranDetailTextModel = await _getApi.getDetailSSurah();
  //   setState(() {});
  // }
@override
  void initState() {
    // TODO: implement initState
  myContr.createRewardedAd();
   myContr.showRewardedAd();
  //  myContr.bannerAd.load();
   myContr.createInterstitialAd();
    super.initState();
  
  }

 @override
void dispose() {
   
  myContr.rewardedAd.value?.dispose();
  super.dispose();
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:  AppBarWidget(pageName: 'Ibadat'),
        // backgroundColor: Colors.grey.shade900,
        body:  SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomCard(
                      cardName: "Tasbeeh",
                      iconData: FeatherIcons.clock,
                      onTap: () {
                        Get.to(TasbeehCardScreen());
                      },
                    ),
                    CustomCard(
                      cardName: "Asma-Ul-Husna",
                      iconData: FeatherIcons.activity,
                      onTap: () {
                        Get.to(AsmaUlHusnaScreen());
                      },
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // CustomCard(
                    //   onTap: () {
                    //     Get.to(QuranReciterScreen( ));
                    //   },
                    //   cardName: "Voice Recitation",
                    //   iconData: FeatherIcons.book,
                    // ),
                      CustomCard(
                      onTap: () {
                        Get.to(BukhariHadith( ));
                      },
                      cardName: "Hadiths",
                      iconData: FeatherIcons.book,
                    ),
                    CustomCard(
                      cardName: "Text Recitation",
                      iconData: FeatherIcons.clock,
                      onTap: () {
                        Get.to(TextRecitationScreen( ));
                      },
                    ),
                  ],
                )
                // , Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     CustomCard(
                //       onTap: () {
                //         Get.to(BukhariHadith( ));
                //       },
                //       cardName: "Hadiths",
                //       iconData: FeatherIcons.book,
                //     ),
                //     CustomCard(
                //       cardName: "Text Recitation",
                //       iconData: FeatherIcons.clock,
                //       onTap: () {
                //         Get.to(TextRecitationScreen( ));
                //       },
                //     ),
                //   ],
                // ),
          
            //  Container(
            //   height: 52,
            //   child: AdWidget(ad: myContr.bannerAd))
            //  ,ElevatedButton(onPressed:myContr.showRewardedAd, child: Text("Show"))
              
                  
              ],
            ),
          ),
        )
        );
  }
}
