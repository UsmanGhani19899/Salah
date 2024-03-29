import 'package:dio/dio.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:salah/Core/dio.dart';
import 'package:salah/Core/get_api.dart';
import 'package:salah/Models/quran_detail_model.dart';
import 'package:salah/Models/quran_reciters_model.dart';
import 'package:salah/Models/surah_model.dart';
import 'package:salah/Screens/Activity/Recitation/listen_quran.dart';
import 'package:salah/Screens/Activity/audio_player.dart';
import 'package:salah/Screens/Activity/reciter_profile.dart';
import 'package:salah/Screens/detailed_surah.dart';
import 'package:salah/Screens/home.dart';
import 'package:salah/Widget/custom_roundedBtn.dart';
import 'package:salah/Widget/custom_shimmer.dart';
import 'package:shimmer/shimmer.dart';

class QuranReciterScreen extends StatefulWidget {
 
  const QuranReciterScreen({super.key,  });

  @override
  State<QuranReciterScreen> createState() => _QuranReciterScreenState();
}

final _getApi = GetApi(dio);

class _QuranReciterScreenState extends State<QuranReciterScreen> {
  // QuranDetailTextModel? quranDetailTextModel;
  // Future<void> getDetailedSurah() async {
  //   wiquranDetailTextModel = await _getApi.getDetailSSurah();
  //   setState(() {});
  // }

  // Future<void> apis() async {
  //   mergedList = [];
  //   fullSurah = "";
  //   await getDetailedSurah();
  // }

  String fullSurah = "";
  List<String> mergedList = [];
  String surahType = "";
  String? fileNO;

  Future<void> api()async{
    await myContr.getDetailedSurah();
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
api();
    fileNO = "";
    // apis();
  }

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
            "Surahs",
            style: GoogleFonts.montserrat(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),
          ),
        ),
        body: myContr.quranDetailTextModel.value?.data.surahs.isNotEmpty ?? false
            ? ListView.builder(
              addAutomaticKeepAlives: true,
                itemCount: myContr.quranDetailTextModel.value?.data.surahs.length,
                itemBuilder: (context, index) {
                  // if (quranDetailTextModel?.data.surahs[index].revelationType.name ==
                  //     "Meccan") {
                  //   surahType = "المکّي";
                  //   setState(() {});
                  // } else if (quranDetailTextModel
                  //         ?.data.surahs[index].revelationType.name ==
                  //     "Medinan") {
                  //   surahType = "المَدَني";
                  // }
                  // int page = quranDetailTextModel
                  //         ?.data.surahs[index].ayahs[index].text.length ??
                  //     0;
                  // int ruku =
                  //     quranDetailTextModel?.data.surahs[index].ayahs.length ??
                  //         0;

                  // int totalRuku = page * ruku;
                  return GestureDetector(
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      // height: Get.height * 0.07,
                      child: ExpansionTile(
                        expandedCrossAxisAlignment: CrossAxisAlignment.start,
                        expandedAlignment: Alignment.topLeft,
                        childrenPadding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                        shape: RoundedRectangleBorder(
                            side: BorderSide.none,
                            borderRadius: BorderRadius.circular(20)),
                        leading: Stack(
                          alignment: Alignment.center,
                          children: [
                            Text(
                              '${index + 1}',
                              style: GoogleFonts.montserrat(color: Colors.white),
                            ),
                            Image(
                              image: AssetImage('assets/images/shape.png'),
                              color: Colors.grey.shade800,
                            )
                          ],
                        ),
                        title: Text(
                          '${myContr.quranDetailTextModel.value?.data.surahs[index].name}',
                          style: GoogleFonts.montserrat(color: Colors.white),
                        ),
                        trailing: GestureDetector(
                          onTap: () {
                            Get.to(() => ListenQuranScreen(
                                  surahName: myContr.quranDetailTextModel
                                          .value?.data.surahs[index].name ??
                                      "",
                                  quranDetailTextModel: myContr.quranDetailTextModel.value
                                          ?.data.surahs[index].ayahs ??
                                      [],
                                ));
                          },
                          // onTap: () {
                          //   mergedList.clear();
                          //   fullSurah = "";
                          //   for (int i = 0;
                          //       i <
                          //           quranDetailTextModel!
                          //               .data.surahs[index].ayahs.length;
                          //       i++) {
                          //     mergedList.add(
                          //       '${quranDetailTextModel!.data.surahs[index].ayahs[i].text.replaceAll('بِسْمِ ٱللَّهِ ٱلرَّحْمَٰنِ ٱلرَّحِيمِ', "")}',
                          //     );
                          //   }
                          //   fullSurah = '${mergedList}';
                          //   fullSurah = fullSurah
                          //       .substring(1, fullSurah.length - 1)
                          //       .replaceFirst(',', '')
                          //       .replaceAll(',', ' O ');

                          //   Get.to(() => DetailedSurah(
                          //         surahName: quranDetailTextModel!
                          //             .data.surahs[index].name,
                          //         bismillah: quranDetailTextModel!
                          //             .data.surahs.first.ayahs.first.text,
                          //         fullSurah: fullSurah,
                          //       ));
                          // },
                          child: Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                          ),
                        ),
                        // subtitle: Text(
                        //   '${surahType}',
                        //   style: GoogleFonts.montserrat(color: Colors.white),
                        // ),
                        // trailing: GestureDetector(
                        //   onTap: () async {
                        //     // for (int i = 1; i < 115; i++) {
                        //     //   if (i < 10) {
                        //     //     fileNO = "00${index + 1}";
                        //     //     setState(() {});
                        //     //     print('$fileNO fileNo');
                        //     //   } else if (i >= 10 && i <= 99) {
                        //     //     fileNO = "0${index + 1}";
                        //     //     setState(() {});
                        //     //   } else if (i > 99) {
                        //     //     fileNO = "${index + 1}";
                        //     //     setState(() {});
                        //     //   }
                        //     // }
                        //     await Get.to(() => QuranPlayerScreen(
                        //         surahName:
                        //             quranDetailTextModel?.data.surahs[index].name ?? "",
                        //         selectedIndex: fileNO ?? ""));
                        //   },
                        //   child: Text(
                        //     'Profile',
                        //     style: GoogleFonts.montserrat(
                        //         color: Colors.blue, fontWeight: FontWeight.bold),
                        //   ),
                        // ),
                        children: [
                          // Text(
                          //   'Surah No: ${quranDetailTextModel?.data.surahs[index].number}   Ayah: ${quranDetailTextModel?.data.surahs[index].ayahs.length}',
                          //   style: GoogleFonts.montserrat(color: Colors.grey),
                          // ),
                          buildBulletPoint(
                              'Surah No: ${myContr.quranDetailTextModel.value?.data.surahs[index].number}'),
                          buildBulletPoint(
                              'Ayah: ${myContr.quranDetailTextModel.value?.data.surahs[index].ayahs.length}'),
                          // SizedBox(
                          //   height: 10,
                          // ),
                          // Text(
                          //   'Ruku: ${quranDetailTextModel?.data.surahs[index].ayahs.last.ruku}',
                          //   style: GoogleFonts.montserrat(color: Colors.grey),
                          // ),
                        ],
                      ),
                    ),
                  );
                })
            : CustomShimmer());
  }

  Widget buildBulletPoint(String text) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('•',
              style: TextStyle(
                  fontSize: 16, color: Colors.white)), // Bullet point character
          SizedBox(width: 8), // Space between bullet point and text
          Expanded(
              child: Text(
            text,
            style: GoogleFonts.montserrat(color: Colors.grey),
          )),
        ],
      ),
    );
  }
}
