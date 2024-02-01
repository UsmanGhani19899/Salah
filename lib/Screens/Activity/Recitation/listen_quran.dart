// import 'dart:html';

import 'package:audioplayers/audioplayers.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:salah/Models/quran_detail_model.dart';
import 'package:salah/Screens/Activity/tasbeeh.dart';

class ListenQuranScreen extends StatefulWidget {
  final String surahName;
  final List<Ayah> quranDetailTextModel;
  const ListenQuranScreen(
      {super.key, required this.quranDetailTextModel, required this.surahName});

  @override
  State<ListenQuranScreen> createState() => _ListenQuranScreenState();
}

int customIndex = 0;
final audioPlayer = AudioPlayer();
bool isPLaying = false;
Duration duration = Duration.zero;
Duration position = Duration.zero;
String formateTime(Duration duration) {
  String twoDigit(int n) => n.toString().padLeft(2, '0');
  final hours = twoDigit(duration.inHours);
  final minutes = twoDigit(duration.inMinutes.remainder(60));
  final seconds = twoDigit(duration.inSeconds.remainder(60));

  return [if (duration.inHours > 0) hours, minutes, seconds].join(':');
}

class _ListenQuranScreenState extends State<ListenQuranScreen> {
  @override
  void initState() {
    // TODO: implement initState
    customIndex = 0;
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

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        toolbarHeight: 80,
        title: Text(
          '${widget.surahName} ',
          style: GoogleFonts.notoSansArabic(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: PageView.builder(
                scrollDirection: Axis.horizontal,
                physics: NeverScrollableScrollPhysics(),
                itemCount: widget.quranDetailTextModel.length,
                onPageChanged: (index) {
                  setState(() {
                    setState(() {
                      customIndex = index;
                    });
                  });
                },
                controller: PageController(
                  initialPage: customIndex,
                ),
                itemBuilder: (context, index) {
                  return Container(
                    // color: Colors.grey.shade900,
                    height: Get.height * 0.58,
                    child: SingleChildScrollView(
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 12),
                        alignment: Alignment.center,
                        child: Text(
                          '${widget.quranDetailTextModel[customIndex].text} ',
                          style: GoogleFonts.notoSansArabic(
                              height: 3,
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                              fontSize: 25),
                          textDirection: TextDirection.rtl,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  );
                }),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 20),
            width: Get.width * 0.9,
            padding: EdgeInsets.symmetric(vertical: 15),
            decoration: BoxDecoration(
                color: Colors.grey.shade800.withOpacity(0.5),
                borderRadius: BorderRadius.circular(20)),
            child: Row(
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
                      await audioPlayer.play(UrlSource(
                          '${widget.quranDetailTextModel[customIndex].audio}'));

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
                  // crossAxisAlignment: CrossAxisAlignment.start,
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
                    Container(
                      width: Get.width * 0.6,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            formateTime(
                              position,
                            ),
                            style: TextStyle(color: Colors.white),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            formateTime(
                              duration - position,
                            ),
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      if (customIndex > 0) {
                        customIndex--;
                        void dispose() {
                          // TODO: implement dispose
                          super.dispose();
                          audioPlayer.dispose();
                        }
                      }
                    });
                  },
                  child: CircleAvatar(
                    backgroundColor: Color(0xff35c55e),
                    radius: 30,
                    child: Center(
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                GestureDetector(
                  onTap: () {
                    // customIndex == index % widget.quranDetailTextModel.length;
                    if (customIndex < widget.quranDetailTextModel.length - 1) {
                      setState(() {
                        customIndex = (customIndex + 1) %
                            widget.quranDetailTextModel.length;
                      });
                    }

                    void dispose() {
                      // TODO: implement dispose
                      super.dispose();
                      audioPlayer.dispose();
                    }
                  },
                  child: CircleAvatar(
                    backgroundColor: Color(0xff35c55e),
                    radius: 30,
                    child: Center(
                      child: Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.white,
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
