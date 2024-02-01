import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:salah/Screens/Activity/asma_ul_husna_screen.dart';
import 'package:salah/Screens/Activity/audio_player.dart';
import 'package:salah/Screens/Activity/Recitation/quran_reciters.dart';
import 'package:salah/Screens/Activity/tasbeeh.dart';
import 'package:salah/Screens/Activity/tasbeehs.dart';
import 'package:salah/Widget/custom_card.dart';

class ActivityScreen extends StatefulWidget {
  const ActivityScreen({super.key});

  @override
  State<ActivityScreen> createState() => _ActivityScreenState();
}

final screen = [AsmaUlHusnaScreen(), TasbeehScreen()];
final icon = [];

class _ActivityScreenState extends State<ActivityScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 80,
          elevation: 0,
          title: Text(
            'Ibadat',
            style: GoogleFonts.roboto(
                fontWeight: FontWeight.bold, color: Colors.white),
          ),
          // backgroundColor: Colors.black26,
        ),
        // backgroundColor: Colors.grey.shade900,
        body: SingleChildScrollView(
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
                    CustomCard(
                      onTap: () {
                        Get.to(QuranReciterScreen());
                      },
                      cardName: "Recitation",
                      iconData: FeatherIcons.book,
                    ),
                    CustomCard(
                      cardName: "Tasbeeh",
                      iconData: FeatherIcons.clock,
                      onTap: () {},
                    ),
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
