import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class CustomNamazCard extends StatelessWidget {
  final String? namazTime;
  final String? namazName;
  final IconData icon;
  const CustomNamazCard({super.key, this.namazName,  required this.icon,this.namazTime});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 0, vertical: 8),

      height: Get.height * 0.15,
      // width: Get.width*0.19,
      decoration: BoxDecoration(
          // border: Border.all(color: Colors.grey.shade600, width: 0.4),
          // color: Colors.grey.shade900.withOpacity(0.8),
          borderRadius: BorderRadius.circular(0)),
      // color: Color(0xff232323),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Icon(
              icon,
              color: Colors.white,
              size: 18,
            ),
            SizedBox(height: 5,),
            Text(
              '$namazName',
              style: GoogleFonts.roboto(
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                  fontSize: 18),
            ),

            SizedBox(height: 5,),
            namazTime != ""
                ? Text(
                    namazTime??"",
                    style: GoogleFonts.roboto(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 15),
                  )
                : CircularProgressIndicator(
                    color: Color(0xff35c55e),
                  ),
            
           
          ],
        ),
      ),
    );
  }
}
