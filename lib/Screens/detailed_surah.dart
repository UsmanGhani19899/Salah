import 'package:audioplayers/audioplayers.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/utils.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:salah/Models/quran_detail_model.dart';
import 'package:salah/Screens/Activity/Recitation/verse_recitation.dart';

import '../Core/dio.dart';
import '../Core/get_api.dart';

class DetailedSurah extends StatefulWidget {
  final String fullSurah;
  final String surahName;
  final String bismillah;
  const DetailedSurah(
      {super.key,
      required this.fullSurah,
      required this.surahName,
      required this.bismillah});

  @override
  State<DetailedSurah> createState() => _DetailedSurahState();
}

final _getApi = GetApi(dio);

class _DetailedSurahState extends State<DetailedSurah> {
  String url = "";
  final audioPlayer = AudioPlayer();
  bool isPLaying = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;
//; Future playAudio() async {
//    final audio =  player.setSourceUrl('https://server6.mp3quran.net/akdr/001.mp3');
//   player.play(audio);
// }
  String formateTime(Duration duration) {
    String twoDigit(int n) => n.toString().padLeft(2, '0');
    final hours = twoDigit(duration.inHours);
    final minutes = twoDigit(duration.inMinutes.remainder(60));
    final seconds = twoDigit(duration.inSeconds.remainder(60));

    return [if (duration.inHours > 0) hours, minutes, seconds].join(':');
  }

  QuranDetailTextModel? quranDetailTextModel;
  // Future<void> getDetailedSurah() async {
  //   quranDetailTextModel = await _getApi.getDetailSSurah();
  //   setState(() {});
  // }

  // Future<void> apis() async {
  //   await getDetailedSurah();
  // }

  List<String> mergedList = [];
  @override
  void initState() {
    //  url = 'https://server6.mp3quran.net/akdr/00${widget.selectedIndex}.mp3';
    print('$url urling');
    // TODO: implement initState
    super.initState();
    audioPlayer.onPlayerStateChanged.listen((state) {
      setState(() {
        isPLaying = state == PlayerState.playing;
      });
    });
    audioPlayer.onDurationChanged.listen((newDuration) {
      setState(() {
        duration = newDuration;
      });
    });
    audioPlayer.onPositionChanged.listen((newPosition) {
      setState(() {
        position = newPosition;
      });
    });

    // TODO: implement initState
    super.initState();
  }

  int tapIndexing = 0;
  double fontSize = 40;
  List<String> result = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            GestureDetector(
              onTap: () {
                showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return Container(
                        alignment: Alignment.center,
                        color: Colors.black,
                        height: Get.height * 0.2,
                        child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: 25,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    fontSize = int.tryParse('${index + 15}')
                                            ?.toDouble() ??
                                        0;
                                  });
                                  Navigator.pop(context);
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(13.0),
                                  child: Center(
                                    child: Text(
                                      '${index + 15}',
                                      style: GoogleFonts.montserrat(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              );
                            }),
                      );
                    });
              },
              child: Text(
                'Font Size',
                style: GoogleFonts.montserrat(color: Colors.blue),
              ),
            )
          ],
          toolbarHeight: 80,
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
          title: Text(
            '${widget.surahName}',
            style: GoogleFonts.notoSansArabic(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
            // textAlign: TextAlign.center,
            textDirection: TextDirection.rtl,
          ),
        ),
        body: Stack(
          alignment: Alignment.center,
          children: [
            Image(
              image: AssetImage('assets/images/frame.png'),
              height: Get.height,
              width: Get.width,
              fit: BoxFit.fitHeight,
            ),
            Container(
              height: Get.height * 0.6,
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
                  child: Column(
                    children: [
                      GestureDetector(
                        child: Text(
                          '${widget.bismillah}',
                          style: GoogleFonts.notoSansArabic(
                              color: Colors.white,
                              fontWeight: FontWeight.w100,
                              fontSize: 25),
                          textAlign: TextAlign.center,
                          textDirection: TextDirection.rtl,
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        child: GestureDetector(
                          onTap: () {
                            // showModalBottomSheet(
                            //     backgroundColor: Colors.transparent,
                            //     elevation: 0,
                            //     context: context,
                            //     builder: (context) {
                            //       return VerseRecitationScreen(
                            //           verse: quranDetailTextModel!
                            //               .data.surahs.first.ayahs[index].text,
                            //           verseAudio: quranDetailTextModel!
                            //               .data.surahs.first.ayahs[index].audio);
                            //     });
                          },
                          child: Text(
                            '${widget.fullSurah}',
                            style: GoogleFonts.kristi(
                                color: Colors.white,
                                fontWeight: FontWeight.w100,
                                fontSize: fontSize),
                            // textAlign: TextAlign.center,
                            textDirection: TextDirection.rtl,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
