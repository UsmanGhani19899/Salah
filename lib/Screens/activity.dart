import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:salah/Screens/asma_ul_husna_screen.dart';
import 'package:salah/Screens/tasbeeh.dart';
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
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomCard(
                onTap: () {
                  Get.to(TasbeehScreen());
                },
                cardName: "Tasbeeh",
                iconData: FeatherIcons.clock),
            CustomCard(
              onTap: () {
                Get.to(AsmaUlHusnaScreen());
              },
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [CustomCard(), CustomCard()],
        )
      ],
    ));
  }
}
