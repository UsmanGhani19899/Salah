import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:salah/Core/get_constants.dart';
import 'package:salah/Widget/custom_roundedBtn.dart';
import 'dart:math' as math;

class TasbeehScreen extends StatefulWidget {
  final String? tasbeehName;
  const TasbeehScreen({super.key, this.tasbeehName});

  @override
  State<TasbeehScreen> createState() => _TasbeehScreenState();
}

int _firstcounter = 0;

int index = 0;
Constant box = Constant();

class _TasbeehScreenState extends State<TasbeehScreen> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          // index++;
          // _firstcounter++;
          box.box.write('firstCounter', _firstcounter++);

          //   if (index <= 33) {
          //     tasbeehName = 'الحمد لله';
          //     setState(() {
          //       // _counter = 0;
          //     });
          //   } else if (index > 33 && index <= 66) {
          //     tasbeehName = "أَسْتَغْفِرُ ٱللَّٰه";
          //     setState(() {
          //       // _counter = 0;
          //     });
          //   } else if (index > 66 && index <= 99) {
          //     tasbeehName = "الله أكبر";
          //     setState(() {
          //       // _counter = 0;
          //     });
          //   } else if (index > 99) {
          //     tasbeehName = "الله أكبر";
          //     setState(() {
          //       // _counter = 0;
          //     });
          //   }
        });
      },
      child: Scaffold(
        // backgroundColor: const Color.fromARGB(255, 169, 165, 165),
        body: Container(
          // padding: EdgeInsets.symmetric(vertical: 60),
          height: Get.height,
          width: Get.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "${widget.tasbeehName}",
                style: GoogleFonts.notoSansArabic(
                    color: Colors.white,
                    // fontWeight: FontWeight.bold,
                    fontSize: 35),
              ),
              CircleAvatar(
                backgroundColor: Colors.grey.shade800,
                radius: Get.height * 0.15,
                child: Text(
                  '$_firstcounter',
                  style: GoogleFonts.roboto(
                      color: Colors.white,
                      fontWeight: FontWeight.w300,
                      fontSize: 80),
                ),
              ),
              CustomRoundedBtn(
                  icon: Icons.replay_outlined,
                  onTap: () {
                    setState(() {
                      _firstcounter = 0;
                      box.box.write('firstCounter', _firstcounter);
                    });
                  })
            ],
          ),
        ),
      ),
    );
  }
}
