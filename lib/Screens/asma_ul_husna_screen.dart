import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:salah/Core/get_api.dart';
import 'package:salah/Models/asma_ul_husna_model.dart';

import '../Core/dio.dart';

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
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Al-Asma-ul-Husna',
          style: GoogleFonts.roboto(fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView.builder(
          // gridDelegate:
          //     SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemCount: asmaUlHusnaModel?.data.length,
          itemBuilder: (context, index) {
            return Container(
              // height: 90,
              child: ExpansionTile(
                leading: Text(
                  '${asmaUlHusnaModel?.data[index].number}',
                  style: GoogleFonts.roboto(fontWeight: FontWeight.bold),
                ),
                expandedCrossAxisAlignment: CrossAxisAlignment.start,
                expandedAlignment: Alignment.topLeft,
                shape: RoundedRectangleBorder(side: BorderSide.none),
                collapsedBackgroundColor: Colors.grey.shade100.withOpacity(0.4),
                backgroundColor: Colors.grey.shade100.withOpacity(0.4),
                childrenPadding:
                    EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                children: [
                  Row(
                    children: [
                      Text(
                        'Translation: ',
                        style: GoogleFonts.roboto(
                            fontWeight: FontWeight.w400, color: Colors.grey),
                      ),
                      Text(
                        '${asmaUlHusnaModel?.data[index].transliteration}',
                        style: GoogleFonts.roboto(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        'Meaning: ',
                        style: GoogleFonts.roboto(
                            fontWeight: FontWeight.w400, color: Colors.grey),
                      ),
                      Text(
                        '${asmaUlHusnaModel?.data[index].en.meaning}',
                        style: GoogleFonts.roboto(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
                title: Text(
                  '${asmaUlHusnaModel?.data[index].name}',
                  style:
                      GoogleFonts.notoSansArabic(fontWeight: FontWeight.bold),
                ),
              ),
            );
          }),
    );
  }
}
