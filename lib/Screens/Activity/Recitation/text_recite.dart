import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:salah/Models/quran_detail_model.dart';
import 'package:salah/Screens/Activity/Recitation/listen_quran.dart';
import 'package:salah/Screens/Activity/Recitation/quran_text.dart';
import 'package:salah/Widget/custom_shimmer.dart';

class TextRecitationScreen extends StatefulWidget {
    final QuranDetailTextModel quranDetailTextModel;

  const TextRecitationScreen({super.key, required this.quranDetailTextModel});

  @override
  State<TextRecitationScreen> createState() => _TextRecitationScreenState();
}
 
class _TextRecitationScreenState extends State<TextRecitationScreen> {
   List<String> mergedList = [];
  String fullSurah = "";
  @override
  Widget build(BuildContext context) {
    return   Scaffold(
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
            "Text Surahs",
            style: GoogleFonts.roboto(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),
          ),
        ),
       
      body: widget.quranDetailTextModel.data.surahs.isNotEmpty ?? false
            ? 
  ListView.builder(
              addAutomaticKeepAlives: true,
                itemCount: widget.quranDetailTextModel?.data.surahs.length,
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
                              style: GoogleFonts.roboto(color: Colors.white),
                            ),
                            Image(
                              image: AssetImage('assets/images/shape.png'),
                              color: Colors.grey.shade800,
                            )
                          ],
                        ),
                        title: Text(
                          '${widget.quranDetailTextModel?.data.surahs[index].name}',
                          style: GoogleFonts.roboto(color: Colors.white),
                        ),
                        trailing: GestureDetector(
                          onTap: () {
                         
                                mergedList.clear();
                            fullSurah = "";
                            for (int i = 0;
                                i <
                                    widget.quranDetailTextModel!
                                        .data.surahs[index].ayahs.length;
                                i++) {
                              mergedList.add(
                                '${widget.quranDetailTextModel!.data.surahs[index].ayahs[i].text.replaceAll('بِسْمِ ٱللَّهِ ٱلرَّحْمَٰنِ ٱلرَّحِيمِ', "")}',
                              );
                            }
                            fullSurah = '${mergedList}';
                            fullSurah = fullSurah
                                .substring(1, fullSurah.length - 1)
                                .replaceFirst(',', '')
                                .replaceAll(',', ' \u{25CB}  ');
  
                            Get.to(() => QuranTextEdition(
                              bismillah: 'بِسْمِ ٱللَّهِ ٱلرَّحْمَٰنِ ٱلرَّحِيمِ',
                              fullSurah:    '$fullSurah',surahName: widget.quranDetailTextModel.data.surahs[index].name,));
                                
                           
                            
                        
                          },
                          // onTap: () {
                            // mergedList.clear();
                            // fullSurah = "";
                            // for (int i = 0;
                            //     i <
                            //         quranDetailTextModel!
                            //             .data.surahs[index].ayahs.length;
                            //     i++) {
                            //   mergedList.add(
                            //     '${quranDetailTextModel!.data.surahs[index].ayahs[i].text.replaceAll('بِسْمِ ٱللَّهِ ٱلرَّحْمَٰنِ ٱلرَّحِيمِ', "")}',
                            //   );
                            // }
                            // fullSurah = '${mergedList}';
                            // fullSurah = fullSurah
                            //     .substring(1, fullSurah.length - 1)
                            //     .replaceFirst(',', '')
                            //     .replaceAll(',', ' O ');
  
                            // Get.to(() => DetailedSurah(
                            //       surahName: quranDetailTextModel!
                            //           .data.surahs[index].name,
                            //       bismillah: quranDetailTextModel!
                            //           .data.surahs.first.ayahs.first.text,
                            //       fullSurah: fullSurah,
                            //     ));
                          // },
                          child: Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                          ),
                        ),
                        // subtitle: Text(
                        //   '${surahType}',
                        //   style: GoogleFonts.roboto(color: Colors.white),
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
                        //     style: GoogleFonts.roboto(
                        //         color: Colors.blue, fontWeight: FontWeight.bold),
                        //   ),
                        // ),
                        children: [
                          // Text(
                          //   'Surah No: ${quranDetailTextModel?.data.surahs[index].number}   Ayah: ${quranDetailTextModel?.data.surahs[index].ayahs.length}',
                          //   style: GoogleFonts.roboto(color: Colors.grey),
                          // ),
                          buildBulletPoint(
                              'Surah No: ${widget.quranDetailTextModel?.data.surahs[index].number}'),
                          buildBulletPoint(
                              'Ayah: ${widget.quranDetailTextModel?.data.surahs[index].ayahs.length}'),
                          // SizedBox(
                          //   height: 10,
                          // ),
                          // Text(
                          //   'Ruku: ${quranDetailTextModel?.data.surahs[index].ayahs.last.ruku}',
                          //   style: GoogleFonts.roboto(color: Colors.grey),
                          // ),
                        ],
                      ),
                    ),
                  );
                }): CustomShimmer()
  
    );
     
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
            style: GoogleFonts.roboto(color: Colors.grey),
          )),
        ],
      ),
    );
  }

}