import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:salah/Screens/Activity/tasbeeh.dart';

class TasbeehCardScreen extends StatelessWidget {
  const TasbeehCardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(vertical: 15),
        padding: EdgeInsets.symmetric(horizontal: 15),
        width: Get.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                  alignment: Alignment.center,
                  height: Get.height * 0.2,
                  width: Get.width * 0.4,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade800.withOpacity(0.55),
                      borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'الحمد لله',
                        style: GoogleFonts.notoSansArabic(
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                            fontSize: 32),
                      ),
                      ElevatedButton(
                          onPressed: () {
                            Get.to(() => TasbeehScreen(
                                  tasbeehName: 'الحمد لله',
                                ));
                          },
                          child: Text(
                            'Open',
                            style: GoogleFonts.roboto(color: Colors.white),
                          ))
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                  alignment: Alignment.center,
                  height: Get.height * 0.2,
                  width: Get.width * 0.4,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade800.withOpacity(0.55),
                      borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'الله أكبر',
                        style: GoogleFonts.notoSansArabic(
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                            fontSize: 32),
                      ),
                      ElevatedButton(
                          onPressed: () {
                            Get.to(() => TasbeehScreen(
                                  tasbeehName: 'الله أكبر',
                                ));
                          },
                          child: Text(
                            'Open',
                            style: GoogleFonts.roboto(color: Colors.white),
                          ))
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 15),
              alignment: Alignment.center,
              height: Get.height * 0.2,
              width: Get.width * 0.8,
              decoration: BoxDecoration(
                  color: Colors.grey.shade800.withOpacity(0.55),
                  borderRadius: BorderRadius.circular(20)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'سُبْحَانَ ٱللَّٰهِ',
                    style: GoogleFonts.notoSansArabic(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 32),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Get.to(() => TasbeehScreen(
                              tasbeehName: 'سُبْحَانَ ٱللَّٰهِ',
                            ));
                      },
                      child: Text(
                        'Open',
                        style: GoogleFonts.roboto(color: Colors.white),
                      ))
                ],
              ),
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
