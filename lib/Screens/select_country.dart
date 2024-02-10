
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/svg.dart'; 
import 'package:google_fonts/google_fonts.dart';
import 'package:salah/Core/dio.dart';
import 'package:salah/Core/get_api.dart';
import 'package:salah/Core/get_constants.dart';
import 'package:salah/Models/city_model.dart';
import 'package:salah/Models/countries_model.dart';
import 'package:salah/Screens/Activity/tasbeeh.dart';
import 'package:salah/Screens/city_screen.dart';
import 'package:salah/Screens/home.dart';
import 'package:salah/Screens/select_location.dart';
import 'package:salah/Widget/custom_roundedBtn.dart';
import 'package:salah/Widget/custom_shimmer.dart';
import 'package:salah/Widget/salah_bottomBar.dart';

class SelectCountry extends StatefulWidget {
  final String? countryValue;
  final String? stateValue;
  final String? cityValue;
  SelectCountry(
      {super.key, this.cityValue, this.countryValue, this.stateValue});

  @override
  State<SelectCountry> createState() => _SelectCountryState();
}

int selectedIndex = 0;
String countryValue = "";
String stateValue = "";
String cityValue = "";
final getApi = GetApi(dio);

class _SelectCountryState extends State<SelectCountry> {
  Constant constant = Constant();
  TextEditingController controller = TextEditingController();
  String? selectedCountry = "No Country Selected";
  CountriesModel? countriesModel;
  CityModel? cityModel;
  List<Datum>? filteredList;
  Future<void> getCountry() async {
    try {
      countriesModel = await getApi.getCountries();
    if (countriesModel!.data.isNotEmpty) {
      filteredList = countriesModel?.data;
    }
    setState(() {});
    } catch (e) {
      print('${e.toString()}');
    }
  }

  Future<void> getCity() async {
    cityModel = await getApi.getCity(filteredList![selectedIndex].iso2);
    // if (countriesModel!.data.isNotEmpty) {
    //   filteredList = countriesModel?.data;
    // }
    setState(() {});
  }

  Future<void> apis() async {
    await getCountry();
    await getCity();
  }

  @override
  void initState() {
    apis();

    // TODO: implement initState
    super.initState();
  }
String showError= "";
  Constant cons = Constant();
  List<Datum> results = [];
  List<String> city = [];
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 40),
        padding: EdgeInsets.symmetric(horizontal: 20),
        height: Get.height,
        width: Get.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Icon(
                  //   FeatherIcons.mapPin,
                  //   size: 90,
                  //   color: Colors.black,
                  // ),
                  // SvgPicture.asset(
                  //   'assets/images/mappin.svg',
                  //   color: Colors.white,
                  //   semanticsLabel: 'Acme Logo',
                  //   width: 120,
                  //   height: 120,
                  // ),
                  // SizedBox(
                  //   height: 20,
                  // ),
                  Text(
                    "Select Location",
                    style: GoogleFonts.roboto(
                        fontSize: 25,
                        color: Colors.grey,
                        fontWeight: FontWeight.w700),
                  ),
                  Text(
                    "Please select your location to help us for give you a better experience",
                    style: GoogleFonts.roboto(
                        color: Colors.grey, fontWeight: FontWeight.w400),
                    textAlign: TextAlign.start,
                  ),

                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: Get.width * 0.8,
                    child: TextFormField(
                      style: GoogleFonts.roboto(
                          color: Colors.white, fontWeight: FontWeight.bold),
                      controller: controller,
                      onChanged: (val) {
                        val = controller.text;
                        if (val.isEmpty) {
                          results = countriesModel!.data;

                          setState(() {
                            // selectedIndex = 0;
                          });
                        }  
                        else   {
                          // selectedIndex = 0;
              
    results = countriesModel!.data
                              .where((element) => element.name
                                  .toLowerCase()
                                  .contains(val.toLowerCase()))
                              .toList();
                          setState(() {});
                      
                        }  

                        setState(() {
                          filteredList = results;
                        });
                        // if (val.isEmpty && countriesModel!.data.isNotEmpty) {
                        //   filteredList.addAll(countriesModel!.data);
                        //   setState(() {});
                        // } else if (val.isNotEmpty) {
                        //   countriesModel?.data.contains(controller.text);
                        //   filteredList.addAll(countriesModel!.data);
                        //   setState(() {});
                        // }
                      },
                      validator: (val) =>
                          val!.isEmpty ? "Please Enter Something" : null,
                      decoration: InputDecoration(
                          hintText: 'Serach',
                          hintStyle: GoogleFonts.roboto(
                              color: Colors.grey, fontWeight: FontWeight.bold),
                          prefixIcon: Icon(FeatherIcons.search),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey)),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey))),
                    ),
                  ),
                ],
              ),
            ),

            Expanded(
              // margin: EdgeInsets.symmetric(vertical: 10),
              // height: 400,
              child: 
              filteredList?.isNotEmpty ?? false
?              ListView.builder(
                      itemCount: filteredList?.length,
                      itemBuilder: (context, index) {
                         return GestureDetector(
                            onTap: () async{
                               cons.box.write('selectedCountry',
                                  filteredList?[index].name);
                              setState(() {
                                selectedIndex = index;
                                showModalBottomSheet(
                                    context: context,
                                    builder: (context) {
                                      return CitySelectScreen(
                                        countryName: filteredList![index]
                                            .iso2
                                            .toLowerCase(),
                                      );
                                    });
                              });
                              print('${cons.box.read('selectedCountry')}klklkl');
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
                                leading: Container(
                                  width: 50,
                                  height: 30,
                                  child: SvgPicture.network(
                                    '${filteredList?[index].flag}',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15)),
                                title: Text(
                                  '${filteredList?[index].name}',
                                  style: GoogleFonts.roboto(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          );
                           
                      })
             :Center(child: CustomShimmer()) 
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Container(
                height: Get.height * 0.07,
                width: Get.width,
                child: ElevatedButton(
                    onPressed: () {
                      // print('${cons.box.read('selectedCountry')}plplpl');
                     Get.offAll(()=>SalahBottomBar());
                    },
                    child: Text(
                      'Next',
                      style: GoogleFonts.roboto(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    )),
              ),
            ),
            // CustomRoundedBtn(
            //     icon: Icons.arrow_forward_ios_rounded,
            //     onTap: () {
            //       constant.box.write(
            //         'city',
            //         cityValue,
            //       );
            //       constant.box.write(
            //         'country',
            //         countryValue.substring(8),
            //       );
            //       Get.offAll(SalahBottomBar());
            //     })
          ],
        ),
      ),
    );
  }
}
