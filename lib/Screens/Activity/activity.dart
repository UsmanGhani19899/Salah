import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:salah/Screens/Activity/asma_ul_husna_screen.dart';
import 'package:salah/Screens/Activity/audio_player.dart';
import 'package:salah/Screens/Activity/Recitation/quran_reciters.dart';
import 'package:salah/Screens/Activity/tasbeeh.dart';
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
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomCard(
          cardName: "Tasbeeh",
          iconData: FeatherIcons.clock,
          onTap: () {
            Get.to(TasbeehScreen());
          },
        ),
        CustomCard(
          cardName: "Asma-Ul-Husna",
          iconData: FeatherIcons.activity,
          onTap: () {
            Get.to(AsmaUlHusnaScreen());
          },
        ),
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
        )
      ],
    ));
  }
}
