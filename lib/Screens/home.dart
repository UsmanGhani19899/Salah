import 'dart:developer';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:csc_picker/csc_picker.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:salah/Core/get_api.dart';
import 'package:salah/Models/nearby_places_model.dart';
import 'package:salah/Screens/map.dart';

import '../Core/dio.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

int? listIndex;
final getApi = GetApi(dio);
String countryValue = "";
String stateValue = "";
String cityValue = "";
NearbyPlaces? nearbyPlaces;

class _HomeScreenState extends State<HomeScreen> {
  String address = 'Loading...';
  double? lng;
  double? lat;
  String? _currentAddress;
  Position? _currentPosition;

  Future<bool> _handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location services are disabled. Please enable the services')));
      return false;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Location permissions are denied')));
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location permissions are permanently denied, we cannot request permissions.')));
      return false;
    }
    return true;
  }

  Future<void> _getCurrentPosition() async {
    final hasPermission = await _handleLocationPermission();

    if (!hasPermission) return;
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) {
      setState(() => _currentPosition = position);
      _getAddressFromLatLng(_currentPosition!);
    }).catchError((e) {
      debugPrint(e);
    });
  }

  Future<void> _getAddressFromLatLng(Position position) async {
    await placemarkFromCoordinates(
            _currentPosition!.latitude, _currentPosition!.longitude)
        .then((List<Placemark> placemarks) {
      Placemark place = placemarks[0];
      setState(() {
        _currentAddress =
            '${place.street}, ${place.subLocality}, ${place.subAdministrativeArea}, ${place.postalCode}';
      });
    }).catchError((e) {
      debugPrint(e);
    });
  }

  Future<void> getPlaces() async {
    nearbyPlaces = await getApi.getNearbyPlaces(
        _currentPosition?.latitude.toString() ?? "",
        _currentPosition?.longitude.toString() ?? "");
    print('${nearbyPlaces}nearbys');

    print('$address addd');
    log('hello');
    setState(() {});
  }

  Future<void> getAddressFromLatLng(double latitude, double longitude) async {
    try {
      List<Placemark> placemarks =
          await placemarkFromCoordinates(latitude, longitude);
      print('${placemarks[0].street} street');
      if (placemarks.isNotEmpty) {
        Placemark placemark = placemarks[0];
        String fullAddress = placemark.street! +
            ', ' +
            placemark.locality! +
            ', ' +
            placemark.country!;
        setState(() {
          address = fullAddress;
        });
        print("$address loadAddress");
      } else {
        setState(() {
          address = 'No address found';
        });
      }
    } catch (e) {
      setState(() {
        address = 'Error: $e';
      });
    }
  }

  // Future<void> getAddress(String lng, String lat) async {
  //   await placemarkFromCoordinates(
  //     double.parse(lng),
  //     double.parse(lat),
  //   );
  // }

  Future<void> apis() async {
    await _getCurrentPosition();
    await getPlaces();
    // await getAddress(lng.toString(), lat.toString());
    await getAddressFromLatLng(
        _currentPosition?.latitude ?? 0, _currentPosition?.longitude ?? 0);

    print(address);
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    apis();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.blue,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
          onPressed: () {
            _getCurrentPosition();
            getPlaces();
          },
          child: Icon(
            Icons.location_searching_sharp,
            color: Colors.white,
          )),
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "صلاة",
          style: GoogleFonts.roboto(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 30),
        ),
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          SalahMap(
              lat: _currentPosition!.latitude,
              lnng: _currentPosition!.longitude),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Nearby Mosques",
                style: GoogleFonts.sen(
                    color: Colors.grey,
                    fontSize: 20,
                    fontWeight: FontWeight.w400),
              ),
              Container(
                  margin: EdgeInsets.symmetric(vertical: 15),
                  height: Get.height * 0.18,
                  child: CarouselSlider(
                    options: CarouselOptions(
                      viewportFraction: 0.9,
                      // aspectRatio: 1 / 3,
                      height: Get.height * 0.18,
                    ),
                    items: nearbyPlaces?.results?.map((i) {
                      if (nearbyPlaces!.results!.isNotEmpty) {
                        return Builder(
                          builder: (
                            BuildContext context,
                          ) {
                            if (nearbyPlaces!.results!.isNotEmpty) {
                              return Container(
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  // alignment: Alignment.center,
                                  width: MediaQuery.of(context).size.width,
                                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.white),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        '${i.name ?? ""}'.toUpperCase(),
                                        style: GoogleFonts.roboto(
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        '${i.vicinity ?? ""}',
                                        style: TextStyle(fontSize: 16.0),
                                      ),
                                      RatingBar.builder(
                                        initialRating:
                                            i.rating?.toDouble() ?? 0,
                                        itemSize: 16,
                                        direction: Axis.horizontal,
                                        allowHalfRating: true,
                                        ignoreGestures: true,
                                        itemCount: 5,
                                        itemPadding: EdgeInsets.symmetric(
                                            horizontal: 4.0),
                                        itemBuilder: (context, _) => Icon(
                                          Icons.star,
                                          color: Colors.amber,
                                        ),
                                        onRatingUpdate: (rating) {
                                          print(rating);
                                        },
                                      )
                                    ],
                                  ));
                            } else {
                              return Center(
                                  child: Container(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 10),
                                      // alignment: Alignment.center,
                                      width: MediaQuery.of(context).size.width,
                                      margin:
                                          EdgeInsets.symmetric(horizontal: 5.0),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: Colors.white),
                                      child: Center(
                                          child: CircularProgressIndicator(
                                        color: Colors.blue,
                                      ))));
                            }
                          },
                        );
                      } else {
                        return Container(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          // alignment: Alignment.center,
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.symmetric(horizontal: 5.0),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white),
                          child: Text('No Data'),
                        );
                      }
                    }).toList(),
                  )

                  // ListView.builder(
                  //     scrollDirection: Axis.horizontal,
                  //     itemCount: nearbyPlaces?.results?.length,
                  //     shrinkWrap: true,
                  //     itemBuilder: (context, index) {
                  //       lat = nearbyPlaces!
                  //           .results![index].geometry!.location!.lat!;

                  //       lng = nearbyPlaces!
                  //           .results![index].geometry!.location!.lng!;

                  //       listIndex = index;
                  //       print("${nearbyPlaces!.results?.length}zzzz");
                  //       if (nearbyPlaces!.results!.isNotEmpty) {
                  //         // lat = nearbyPlaces!
                  //         //     .results![index].geometry!.location!.lat!;

                  //         // lng = nearbyPlaces!
                  //         //     .results![index].geometry!.location!.lng!;

                  //         return Container(
                  //           margin: EdgeInsets.symmetric(vertical: 8),
                  //           height: Get.height * 0.15,
                  //           width: Get.width,
                  //           color: Colors.grey.shade100,
                  //           child: Column(
                  //             children: [
                  //               Text('${nearbyPlaces?.results?[index].name}'),
                  //               Text('$address'),
                  //             ],
                  //           ),
                  //         );
                  //       } else {
                  //         return Text("data");
                  //       }
                  //     }),

                  ),
            ],
          ),
        ],
      ),
    );
  }
}
