import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:salah/Widget/custom_roundedBtn.dart';

class TasbeehScreen extends StatefulWidget {
  const TasbeehScreen({super.key});

  @override
  State<TasbeehScreen> createState() => _TasbeehScreenState();
}

int _counter = 0;
String? tasbeehName = "الحمد لله";

class _TasbeehScreenState extends State<TasbeehScreen> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _counter++;
          if (_counter > 33) {
            tasbeehName = "أَسْتَغْفِرُ ٱللَّٰه";
            setState(() {});
          }
        });
      },
      child: Scaffold(
        body: Container(
          // padding: EdgeInsets.symmetric(vertical: 60),
          height: Get.height,
          width: Get.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "$tasbeehName",
                style: GoogleFonts.notoSansArabic(
                    color: Colors.black,
                    // fontWeight: FontWeight.bold,
                    fontSize: 35),
              ),
              CircleAvatar(
                backgroundColor: Colors.grey.shade100,
                radius: Get.height * 0.15,
                child: Text(
                  '$_counter',
                  style: GoogleFonts.roboto(
                      color: Colors.black,
                      fontWeight: FontWeight.w300,
                      fontSize: 80),
                ),
              ),
              CustomRoundedBtn(
                  icon: Icons.replay_outlined,
                  onTap: () {
                    setState(() {
                      _counter++;
                    });
                  })
            ],
          ),
        ),
      ),
    );
  }
}
