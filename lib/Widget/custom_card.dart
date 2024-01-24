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
        padding: EdgeInsets.symmetric(
          horizontal: 15,
        ),
        decoration: BoxDecoration(
            color: Colors.grey.shade800.withOpacity(0.9),
            borderRadius: BorderRadius.circular(20)),
        margin: EdgeInsets.symmetric(vertical: 8, horizontal: 15),
        width: Get.width,
        height: Get.height * 0.2,
        child: Padding(
          padding: const EdgeInsets.only(left: 15, bottom: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '$cardName',
                style: GoogleFonts.roboto(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.w400),
              ),
              // SizedBox(
              //   height: 10,
              // ),
              Container(
                width: Get.width,
                child: ElevatedButton(
                  onPressed: () {},
                  // style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                  // backgroundColor: Colors.blue,
                  // radius: 30,
                  child: Text(
                    'Open',
                    style: GoogleFonts.roboto(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
