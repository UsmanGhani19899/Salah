import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:salah/Core/dio.dart';
import 'package:salah/Models/bukhari_hadis_model.dart';
import 'package:salah/Models/bukhari_hadith_model.dart';
import 'package:salah/Widget/app_bar_widget.dart';
import 'package:salah/Widget/salah_bottomBar.dart';

import '../../Core/get_api.dart';


class BukhariHadith extends StatefulWidget {
  const BukhariHadith({super.key});

  @override
  State<BukhariHadith> createState() => _BukhariHadithState();
}
final getApi = GetApi(dio);

class _BukhariHadithState extends State<BukhariHadith> {
    BukhariHadithModel? bukhariHadithModel;

 Future<void> getBukharihadith() async {
    bukhariHadithModel = await getApi.bukhariHadith();
    print('${bukhariHadithModel?.chapters?.length} bbmodel');
    setState(() {});
  }
Bukhari? bukhariModel;
List<Bukhari> bukhariList = [];
  Future<void> apis() async {
    await getBukharihadith();
    // await makeRequest();
  }
Future<List<Bukhari>> loadJsonData() async {
    String jsonString = await rootBundle.loadString('assets/Json/bukhari.json');
    List<dynamic> jsonList = json.decode(jsonString);
    return jsonList.map((json) => Bukhari.fromJson(json)).toList();
  }

  @override
  void initState() {
      loadJsonData().then((loadedItems) {
      setState(() {
        bukhariList = loadedItems;
      });
    }).catchError((error) {
      // Handle error
      print('Error loading JSON: $error');
    });
    // // TODO: implement initState
    super.initState();
    // apis();
  }
  @override
  Widget build(BuildContext context) {

    return   Scaffold(
      appBar: AppBarWidget(pageName: 'HADITHS'),
      body:   ListView.builder(
        itemCount:bukhariList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ExpansionTile(
             backgroundColor: Colors.transparent,
             shape: RoundedRectangleBorder(side: BorderSide(color: Colors.transparent)),
              title: Text('Hadith No ${index+1}',style: GoogleFonts.montserrat(color: Colors.white),),
              children:[ Text("${bukhariList[index].arab}",style: GoogleFonts.montserrat(color: Colors.white,)),
              SizedBox(height: 9,),
              Text("${bukhariList[index].arab}",style: GoogleFonts.montserrat(color: Colors.white,))
              ]
          ));
        }
      )
        );
  }
}