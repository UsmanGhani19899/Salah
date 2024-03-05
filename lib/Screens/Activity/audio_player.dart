import 'package:audioplayers/audioplayers.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class QuranPlayerScreen extends StatefulWidget {
  final String surahName;
  final String selectedIndex;
  const QuranPlayerScreen(
      {super.key, required this.surahName, required this.selectedIndex});

  @override
  State<QuranPlayerScreen> createState() => _QuranPlayerScreenState();
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

class _QuranPlayerScreenState extends State<QuranPlayerScreen> {
  @override
  void initState() {
    url = 'https://server6.mp3quran.net/akdr/00${widget.selectedIndex}.mp3';
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
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    audioPlayer.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              height: Get.height * 0.45,
              width: Get.width,
              decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(25)),
              child: Text(
                '${widget.surahName}',
                style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.bold, fontSize: 30),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                children: [
                  Slider(
                      activeColor: Colors.white,
                      inactiveColor: Colors.grey.withOpacity(0.3),
                      min: 0,
                      max: duration.inSeconds.toDouble(),
                      value: position.inSeconds.toDouble(),
                      onChanged: (value) async {
                        final position = Duration(seconds: value.toInt());
                        await audioPlayer.seek(position);
                        await audioPlayer.resume();
                      }),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        formateTime(
                          position,
                        ),
                        style: TextStyle(color: Colors.white),
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
            ),
            GestureDetector(
              onTap: () async {
                if (isPLaying) {
                  await audioPlayer.pause();
                } else {
                  // String urls =
                  //     'https://server6.mp3quran.net/akdr/${widget.selectedIndex}.mp3';
                  await audioPlayer.play(UrlSource(
                      'https://server6.mp3quran.net/akdr/00${widget.selectedIndex}.mp3'));
                }
                // await player.play(
                //     UrlSource('https://server6.mp3quran.net/akdr/001.mp3'));
                // setState(() {});
              },
              child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 35,
                child: Icon(
                  FeatherIcons.play,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox()
          ],
        ),
      ),
    );
  }
}
