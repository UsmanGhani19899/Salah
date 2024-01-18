import 'package:country_picker/country_picker.dart';
import 'package:csc_picker/csc_picker.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:salah/Core/get_constants.dart';
import 'package:salah/Screens/home.dart';
import 'package:salah/Screens/select_location.dart';
import 'package:salah/Widget/custom_roundedBtn.dart';
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

String countryValue = "";
String stateValue = "";
String cityValue = "";

class _SelectCountryState extends State<SelectCountry> {
  Constant constant = Constant();

  String? selectedCountry = "No Country Selected";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 50),
        height: Get.height,
        width: Get.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                // Icon(
                //   FeatherIcons.mapPin,
                //   size: 90,
                //   color: Colors.black,
                // ),
                SvgPicture.asset(
                  'assets/images/mappin.svg',
                  semanticsLabel: 'Acme Logo',
                  width: 120,
                  height: 120,
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Choose Your Location",
                  style: GoogleFonts.roboto(
                      fontSize: 25,
                      color: Colors.black,
                      fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Please select your location to help us for give you a better experience",
                  style: GoogleFonts.roboto(
                      color: Colors.grey, fontWeight: FontWeight.w400),
                  textAlign: TextAlign.center,
                )
              ],
            ),
            Column(
              children: [
                countryValue == ""
                    ? Text("Select Country")
                    : Text(
                        "${countryValue.substring(6)} , ${cityValue.toString()}",
                        style: GoogleFonts.roboto(fontWeight: FontWeight.bold),
                      ),
                // Text(
                //   "$selectedCountry",
                //   style: GoogleFonts.roboto(color: Colors.black),
                // ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shadowColor: Colors.transparent,
                        foregroundColor: Colors.transparent,
                        disabledForegroundColor: Colors.transparent,
                        surfaceTintColor: Colors.transparent,
                        disabledBackgroundColor: Colors.transparent,
                        side: BorderSide(color: Colors.grey.shade300),
                        elevation: 0,
                        backgroundColor: Colors.transparent),
                    onPressed: () {
                      // Get.to(SelectLocation());
                      showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  CSCPicker(
                                    dropdownDecoration: BoxDecoration(
                                        color: Colors.grey.shade100),
                                    onCountryChanged: (value) {
                                      setState(() {
                                        countryValue = value.toString();
                                      });
                                    },
                                    onStateChanged: (value) {
                                      setState(() {
                                        stateValue = value.toString();
                                      });
                                    },
                                    onCityChanged: (value) {
                                      setState(() {
                                        cityValue = value.toString();
                                      });
                                    },
                                  ),
                                  CustomRoundedBtn(
                                    onTap: () {
                                      Navigator.pop(context);
                                      // if (countryValue != "" && stateValue != "" && cityValue != "") {
                                      //   Get.offAll(SelectCountry(
                                      //     cityValue: cityValue,
                                      //     countryValue: countryValue,
                                      //   ));
                                      // } else if (countryValue == "" &&
                                      //     stateValue == "" &&
                                      //     cityValue == "") {
                                      //   return showCustomSnackbar(context, "Please Select Location");
                                      // } else if (countryValue == "" &&
                                      //     stateValue != "" &&
                                      //     cityValue != "") {
                                      //   return showCustomSnackbar(context, "Please Select Country");
                                      // } else if (countryValue != "" &&
                                      //     stateValue == "" &&
                                      //     cityValue != "") {
                                      //   return showCustomSnackbar(context, "Please Select State");
                                      // } else {
                                      //   return showCustomSnackbar(context, "Please Select City");
                                      // }
                                    },
                                    icon: Icons.arrow_forward_ios_rounded,
                                  )
                                ],
                              ),
                            );
                          });
                      // showCountryPicker(
                      //   context: context,
                      //   //Optional.  Can be used to exclude(remove) one ore more country from the countries list (optional).
                      //   exclude: <String>['KN', 'MF'],
                      //   favorite: <String>['SE'],
                      //   //Optional. Shows phone code before the country name.
                      //   showPhoneCode: true,
                      //   onSelect: (Country country) {
                      //     // print('Select country: ${country.displayName.}');
                      //     setState(() {
                      //       selectedCountry = country.name;
                      //     });
                      //   },
                      //   // Optional. Sets the theme for the country list picker.
                      //   countryListTheme: CountryListThemeData(
                      //     // Optional. Sets the border radius for the bottomsheet.
                      //     borderRadius: BorderRadius.only(
                      //       topLeft: Radius.circular(40.0),
                      //       topRight: Radius.circular(40.0),
                      //     ),
                      //     // Optional. Styles the search field.
                      //     inputDecoration: InputDecoration(
                      //       labelText: 'Search',
                      //       hintText: 'Start typing to search',
                      //       prefixIcon: const Icon(Icons.search),
                      //       border: OutlineInputBorder(
                      //         borderSide: BorderSide(
                      //           color: const Color(0xFF8C98A8).withOpacity(0.2),
                      //         ),
                      //       ),
                      //     ),
                      //     // Optional. Styles the text in the search field
                      //     searchTextStyle: TextStyle(
                      //       color: Colors.blue,
                      //       fontSize: 18,
                      //     ),
                      //   ),
                      // );
                    },
                    child: Text(
                      "Select Location",
                      style: GoogleFonts.roboto(
                          fontWeight: FontWeight.w400, color: Colors.black),
                    ))
              ],
            ),
            CustomRoundedBtn(
                icon: Icons.arrow_forward_ios_rounded,
                onTap: () {
                  constant.box.write(
                    'city',
                    cityValue,
                  );
                  constant.box.write(
                    'country',
                    countryValue.substring(8),
                  );
                  Get.offAll(SalahBottomBar());
                })
          ],
        ),
      ),
    );
  }
}
