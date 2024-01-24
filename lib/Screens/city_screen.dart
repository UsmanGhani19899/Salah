import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:salah/Core/get_api.dart';
import 'package:salah/Core/get_constants.dart';

import '../Core/dio.dart';
import '../Models/city_model.dart';

class CitySelectScreen extends StatefulWidget {
  final String countryName;
  const CitySelectScreen({super.key, required this.countryName});

  @override
  State<CitySelectScreen> createState() => _CitySelectScreenState();
}

int selectedIndex = 0;
CityModel? cityModel;
final getApi = GetApi(dio);

class _CitySelectScreenState extends State<CitySelectScreen> {
  Future<void> getCity() async {
    cityModel = await getApi.getCity(widget.countryName);
    // if (countriesModel!.data.isNotEmpty) {
    //   filteredList = countriesModel?.data;
    // }
    setState(() {});
  }

  Future<void> apis() async {
    await getCity();
  }

  @override
  void initState() {
    apis();
    // TODO: implement initState
    super.initState();
  }

  Constant cons = Constant();
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      color: Colors.grey.shade900,
      child: ListView.builder(
          itemCount: cityModel?.geonames?.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex = index;
                });
                cons.box
                    .write('selectedCity', cityModel?.geonames?[index].name);
              },
              child: Container(
                decoration: BoxDecoration(
                    color: selectedIndex != index
                        ? Colors.grey.shade800.withOpacity(0.5)
                        : Color(0xff35c55e),
                    borderRadius: BorderRadius.circular(15)),
                margin: EdgeInsets.symmetric(vertical: 10),
                height: Get.height * 0.07,
                width: Get.width,
                child: ListTile(
                  // leading: Container(
                  //   width: 50,
                  //   height: 30,
                  //   child: SvgPicture.network(
                  //     '${widget.cities.cities?[index].}',
                  //     fit: BoxFit.cover,
                  //   ),
                  // ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  title: Text(
                    '${cityModel?.geonames?[index].name}',
                    style: GoogleFonts.roboto(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
