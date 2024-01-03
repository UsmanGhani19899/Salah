import 'package:csc_picker/csc_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:salah/Screens/select_country.dart';
import 'package:salah/Widget/custom_roundedBtn.dart';

class SelectLocation extends StatefulWidget {
  const SelectLocation({super.key});

  @override
  State<SelectLocation> createState() => _SelectLocationState();
}

showCustomSnackbar(BuildContext context, String text) {
  return ScaffoldMessenger.of(context)
      .showSnackBar(SnackBar(content: Text(text)));
}

String countryValue = "";
String stateValue = "";
String cityValue = "";

class _SelectLocationState extends State<SelectLocation> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CSCPicker(
            dropdownDecoration: BoxDecoration(color: Colors.grey.shade100),
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
              icon: Icons.arrow_forward_ios_rounded,
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
              })
        ],
      ),
    );
  }
}
