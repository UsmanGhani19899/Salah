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
      
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(
          horizontal: 12,
        ),
        decoration: BoxDecoration( 
            color: Colors.grey.shade800.withOpacity(0.5),
            borderRadius: BorderRadius.circular(20)),
        margin: EdgeInsets.symmetric(vertical: 8, horizontal: 15),
        width: Get.width * 0.4,
        height: Get.height * 0.2,
        child: Stack(
          alignment: Alignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(image: AssetImage('assets/images/shape.png'),color: Colors.grey.shade900,),
      
            Text(
              "${cardName}".toUpperCase(),
              style: GoogleFonts.montserrat(
                  fontSize: 22,
                  color: Colors.grey,
                  fontWeight: FontWeight.w400),
            ),
            // SizedBox(
            //   height: 10,
            // ),
            // Container(
            //   width: Get.width,
            //   child: ElevatedButton(
            //     onPressed: () {},
            //     // style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
            //     // backgroundColor: Colors.blue,
            //     // radius: 30,
            //     child: Text(
            //       'Open',
            //       style: GoogleFonts.montserrat(
            //           color: Colors.white, fontWeight: FontWeight.bold),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
