import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:salah/Core/get_api.dart';
import 'package:salah/Models/asma_ul_husna_model.dart';
import 'package:salah/Widget/custom_shimmer.dart';

import '../../Core/dio.dart';

class AsmaUlHusnaScreen extends StatefulWidget {
  const AsmaUlHusnaScreen({super.key});

  @override
  State<AsmaUlHusnaScreen> createState() => _AsmaUlHusnaScreenState();
}

final getApi = GetApi(dio);
AsmaUlHusnaModel? asmaUlHusnaModel;

class _AsmaUlHusnaScreenState extends State<AsmaUlHusnaScreen> {
  Future<void> getName() async {
    asmaUlHusnaModel = await getApi.getName();
    setState(() {});
  }

  Future<void> apis() async {
    await getName();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    apis();
  }

  int listIndex = 0;
  bool expanded = false;
  double? containerHeight;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 80,
          // backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.white),
          title: Text(
            'Al-Asma-ul-Husna',
            style: GoogleFonts.roboto(
                fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
        body: asmaUlHusnaModel?.data != null
            ? ListView.builder(
                // gridDelegate:
                //     SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                itemCount: asmaUlHusnaModel?.data.length,
                itemBuilder: (context, index) {
                  if (asmaUlHusnaModel!.data.isNotEmpty &&
                      asmaUlHusnaModel?.data.length != null) {
                    return Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20)),
                      margin: EdgeInsets.all(8),
                      // height: 90,
                      child: ExpansionTile(
                        tilePadding:
                            EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                        collapsedShape: RoundedRectangleBorder(
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
                              color: Colors.purple,
                            )
                          ],
                        ),
                        expandedCrossAxisAlignment: CrossAxisAlignment.start,
                        expandedAlignment: Alignment.topLeft,
                        childrenPadding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                        shape: RoundedRectangleBorder(
                            side: BorderSide.none,
                            borderRadius: BorderRadius.circular(20)),
                        children: [
                          Row(
                            children: [
                              Text(
                                'Translation: ',
                                style: GoogleFonts.roboto(
                                    fontWeight: FontWeight.w400,
                                    color: Colors.grey),
                              ),
                              Text(
                                '${asmaUlHusnaModel?.data[index].transliteration}',
                                style: GoogleFonts.roboto(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                'Meaning: ',
                                style: GoogleFonts.roboto(
                                    fontWeight: FontWeight.w400,
                                    color: Colors.grey),
                              ),
                              Text(
                                '${asmaUlHusnaModel?.data[index].en.meaning}',
                                style: GoogleFonts.roboto(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ],
                          ),
                        ],
                        title: Text(
                          '${asmaUlHusnaModel?.data[index].name}',
                          style: GoogleFonts.notoSansArabic(
                              fontWeight: FontWeight.w400, color: Colors.white),
                        ),
                      ),
                    );
                  } else {
                    return CircularProgressIndicator(
                      color: Colors.black,
                    );
                  }
                })
            : CustomShimmer());
  }
}
