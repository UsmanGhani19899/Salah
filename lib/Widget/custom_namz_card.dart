import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class CustomNamazCard extends StatelessWidget {
  final String? namazTime;
  final String? namazName;
  const CustomNamazCard({super.key, this.namazName, this.namazTime});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 8),

      height: Get.height * 0.1,
      width: Get.width,
      decoration: BoxDecoration(
          color: Colors.grey.shade100, borderRadius: BorderRadius.circular(20)),
      // color: Color(0xff232323),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '$namazName',
              style: GoogleFonts.roboto(
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                  fontSize: 25),
            ),
            Row(
              children: [
                namazTime != ""
                    ? Text(
                        namazTime!,
                        style: GoogleFonts.roboto(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 25),
                      )
                    : CircularProgressIndicator(
                        color: Colors.black,
                      ),
                SizedBox(
                  width: 10,
                ),
                Icon(
                  FeatherIcons.bell,
                  color: Colors.black,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
