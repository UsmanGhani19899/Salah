import 'package:audioplayers/audioplayers.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class VerseRecitationScreen extends StatefulWidget {
  final String verse;
  final String verseAudio;
  const VerseRecitationScreen(
      {super.key, required this.verse, required this.verseAudio});

  @override
  State<VerseRecitationScreen> createState() => VersedRecitationScreenState();
}

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

class VersedRecitationScreenState extends State<VerseRecitationScreen> {
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

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    audioPlayer.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.5),
          borderRadius: BorderRadius.circular(20)),
      margin: EdgeInsets.all(10),
      width: Get.width,
      height: Get.height * 0.18,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            '${widget.verse}',
            style: GoogleFonts.notoSansArabic(
                color: Colors.white, fontWeight: FontWeight.bold),
            textDirection: TextDirection.rtl,
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () async {
                  if (isPLaying) {
                    await audioPlayer.pause();
                  } else {
                    // String urls =
                    //     'https://server6.mp3quran.net/akdr/${widget.selectedIndex}.mp3';
                    await audioPlayer.play(UrlSource('${widget.verseAudio}'));

                    setState() {}
                  }
                  // await player.play(
                  //     UrlSource('https://server6.mp3quran.net/akdr/001.mp3'));
                  // setState(() {});
                },
                child: Icon(
                  isPLaying ? FeatherIcons.pause : FeatherIcons.play,
                  color: Colors.white,
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    width: Get.width * 0.7,
                    child: Slider(
                        activeColor: Colors.white,
                        inactiveColor: Colors.grey.withOpacity(0.3),
                        min: 0,
                        max: duration.inSeconds.toDouble(),
                        value: position.inSeconds.toDouble(),
                        onChangeEnd: (value) {
                          audioPlayer.dispose();
                        },
                        onChanged: (value) async {
                          final position = Duration(seconds: value.toInt());
                          await audioPlayer.seek(position);
                          await audioPlayer.resume();
                        }),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        formateTime(
                          position,
                        ),
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(
                        width: 80,
                      ),
                      Text(
                        formateTime(
                          duration - position,
                        ),
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
