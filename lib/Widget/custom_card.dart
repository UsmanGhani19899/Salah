import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomCard extends StatelessWidget {
  final String? cardName;
  final onTap;
  final IconData? iconData;
  const CustomCard({super.key, this.onTap, this.iconData, this.cardName});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.all(8),
        width: Get.width * 0.45,
        height: Get.height * 0.2,
        color: Colors.grey.shade900,
        child: Column(
          children: [
            Icon(
              iconData,
              color: Colors.white,
            ),
            Text(
              '$cardName',
              style: GoogleFonts.roboto(color: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}
