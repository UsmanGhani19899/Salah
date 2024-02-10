import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:salah/Models/quran_detail_model.dart';

class QuranTextEdition extends StatefulWidget {
  final String fullSurah;
  final String surahName;
  final String bismillah;
  const QuranTextEdition({super.key, required this.fullSurah, required this.surahName, required this.bismillah});

  @override
  State<QuranTextEdition> createState() => _QuranTextEditionState();
}

class _QuranTextEditionState extends State<QuranTextEdition> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
          backgroundColor: Colors.transparent,
          toolbarHeight: 80,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () {
              Get.back();
            },
          ),
          // elevation: 9,
          title: Text(
            "${widget.surahName}",
            style: GoogleFonts.roboto(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),
          ),
        ),
       
      body: Container(
            padding: EdgeInsets.all(10),
   
      
        width: Get.width,
        height: Get.height,
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [ 
              Text('${widget.bismillah}',style: GoogleFonts.roboto(
              fontSize: 30,
              color: Colors.white),textDirection: TextDirection.rtl,),
              SizedBox(height: 80,),
              Text('${widget.fullSurah}',style: GoogleFonts.roboto(
              fontSize: 30,
              color: Colors.white),textDirection: TextDirection.rtl,)]
               
          ),
        ),
      ),
    );
  }
}
