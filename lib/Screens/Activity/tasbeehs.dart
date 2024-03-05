import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:salah/Screens/Activity/asma_ul_husna_screen.dart';
import 'package:salah/Screens/Activity/tasbeeh.dart';
import 'package:salah/Widget/app_bar_widget.dart';
import 'package:salah/Widget/custom_card.dart';

class TasbeehCardScreen extends StatelessWidget {
  const TasbeehCardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(pageName: 'Tasbeeh'),
      body: Container(
        margin: EdgeInsets.symmetric(vertical: 15),
        // padding: EdgeInsets.symmetric(horizontal: 15),
        width: Get.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomCard(
                      cardName: "سبحان الله",
                      iconData: FeatherIcons.clock,
                      onTap: () {
                        Get.to(     Get.to(() => TasbeehScreen(
                                  tasbeehName: "سبحان الله",
                                )));
                      },
                    ),
                    CustomCard(
                      cardName: "الله أكبر",

                      iconData: FeatherIcons.activity,
                      onTap: () {
                        Get.to(     Get.to(() => TasbeehScreen(
                                  tasbeehName: "الله أكبر",
                                )));
                      },
                    ),
                  ],
                ),
                         Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomCard(
                      cardName: "الحمد لله",
                      iconData: FeatherIcons.clock,
                      onTap: () {
                        Get.to(     Get.to(() => TasbeehScreen(
                                  tasbeehName: "الحمد لله",
                                )));
                      },
                    ),
                    CustomCard(
                      cardName: "لا إله إلا الله",
                      iconData: FeatherIcons.activity,
                      onTap: () {
                        Get.to(     Get.to(() => TasbeehScreen(
                                  tasbeehName: "لا إله إلا الله",
                                )));
                      },
                    ),
                  ],
                ),
           ],
        ),
      ),
    );
  }
//   MediaQuery getWidth(){
// if(){

// }
//   };
}
