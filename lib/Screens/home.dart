import 'dart:async';
import 'dart:developer';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:csc_picker/csc_picker.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart' as map;
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:map_launcher/map_launcher.dart';
import 'package:salah/Core/get_api.dart';
import 'package:salah/Core/get_constants.dart';
import 'package:salah/Models/direction_model.dart';
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
GooleMapDirectionModel? googleMapDirectionModel;

class _HomeScreenState extends State<HomeScreen> {
  String address = 'Loading...';
  double? lng;
  double? lat;
  double? mosqueLat;
  double? mosqueLong;
  String? _currentAddress;
  Position? _currentPosition;
  Constant constant = Constant();
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
            _currentPosition?.latitude ?? 0, _currentPosition?.longitude ?? 0)
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
    try {
      nearbyPlaces = await getApi.getNearbyPlaces(
          _currentPosition?.latitude ?? 0, _currentPosition?.longitude ?? 0);
      print('${nearbyPlaces}nearbys');

      print('$address addd');
      log('hello');
      setState(() {});
    } catch (e) {}
  }

  // Future<void> getAddressFromLatLng(double latitude, double longitude) async {
  //   try {
  //     List<Placemark> placemarks =
  //         await placemarkFromCoordinates(latitude, longitude);
  //     print('${placemarks[0].street} street');
  //     if (placemarks.isNotEmpty) {
  //       Placemark placemark = placemarks[0];
  //       String fullAddress = placemark.street! +
  //           ', ' +
  //           placemark.locality! +
  //           ', ' +
  //           placemark.country!;
  //       setState(() {
  //         address = fullAddress;
  //       });
  //       print("$address loadAddress");
  //     } else {
  //       setState(() {
  //         address = 'No address found';
  //       });
  //     }
  //   } catch (e) {
  //     setState(() {
  //       address = 'Error: $e';
  //     });
  //   }
  // }

  // Future<void> getAddress(String lng, String lat) async {
  //   await placemarkFromCoordinates(
  //     double.parse(lng),
  //     double.parse(lat),
  //   );
  // }

  getIcons() async {}

  List<map.Marker>? markers;
  Future<void> getMarkers() async {
    // map.BitmapDescriptor? icon;
    map.BitmapDescriptor icon = await map.BitmapDescriptor.fromAssetImage(
      ImageConfiguration(
        devicePixelRatio: 1.1,
        size: Size(10, 30),
      ),
      "assets/images/marker.png",
    );
    // setState(() {
    //   this.icon = icon;
    // });
    setState(() {});
    markers = List.generate(
      nearbyPlaces!.results!.length,
      (index) => map.Marker(
        markerId: map.MarkerId('${nearbyPlaces?.results?[index].name}'),
        position: map.LatLng(
            nearbyPlaces?.results?[index].geometry?.location?.lat ?? 0,
            nearbyPlaces?.results?[index].geometry?.location?.lng ?? 0),
        infoWindow: map.InfoWindow(
          title: '${nearbyPlaces?.results?[index].name}',
        ),
      ),
    );
  }

  Set<map.Polyline> _polylines = Set<map.Polyline>();
  Future<void> _addPolyline() async {
    map.Polyline polyline = map.Polyline(
      polylineId: map.PolylineId('polyline_id'),
      color: Colors.blue,
      points: List.generate(10, (index) {
        print('${googleMapDirectionModel!.routes!.length} lenghting');
        return LatLng(
            googleMapDirectionModel!
                .routes![index].legs![index].steps![index].endLocation!.lat!,
            googleMapDirectionModel!
                .routes![index].legs![index].steps![index].endLocation!.lng!);
      }),
      width: 3,
    );

    setState(() {
      _polylines.add(polyline);
    });
  }

// Direction API
  Future<void> getDirection(double desLat, double desLong) async {
    googleMapDirectionModel = await getApi.getDirection(
        _currentPosition?.latitude ?? 0,
        _currentPosition?.longitude ?? 0,
        desLat,
        desLong);
    print('hehehe');
  }

  Future<void> apis() async {
    // await getAddressFromLatLng(
    //     _currentPosition?.latitude ?? 0, _currentPosition?.longitude ?? 0);
    await _getCurrentPosition();

    await getPlaces();
    await getMarkers();
    // await getDirection(-33.8690048, 151.175168);
    // await _addPolyline();
    // await getAddress(lng.toString(), lat.toString());
    markers;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer.periodic(Duration(milliseconds: 100), (timer) {
      setState(() {
        _getCurrentPosition();
      });
    });
    apis();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // floatingActionButton: FloatingActionButton(
      //     backgroundColor: Colors.blue,
      //     shape:
      //         RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
      //     onPressed: () {
      //       _getCurrentPosition();
      //       getPlaces();
      //       setState(() {});
      //     },
      // child: Icon(
      //   Icons.location_searching_sharp,
      //   color: Colors.white,
      // )),
      appBar: AppBar(
        toolbarHeight: 80,
        // centerTitle: true,
        elevation: 0,
        title: Text(
          "Nearby Mosque",
          style: GoogleFonts.roboto(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: GestureDetector(
              onTap: () {
                _getCurrentPosition();
                getPlaces();
                setState(() {});
              },
              child: Text(
                'Current Location',
                style: GoogleFonts.roboto(
                    color: Color(0xff35c55e), fontWeight: FontWeight.bold),
              ),
            ),
          )
        ],
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          SalahMap(
              polylines: _polylines,
              marker: markers,
              mosqueLong: mosqueLong ?? 0,
              mosqueLat: mosqueLat ?? 0,
              lat: _currentPosition?.latitude ?? 0,
              lnng: _currentPosition?.longitude ?? 0),
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Text(
                //   "Nearby Mosques",
                //   style: GoogleFonts.sen(
                //       color: Colors.grey,
                //       fontSize: 20,
                //       fontWeight: FontWeight.w400),
                // ),
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
                        mosqueLat = i.geometry?.location?.lat;
                        mosqueLong = i.geometry?.location?.lng;
                        if (nearbyPlaces?.results?.isNotEmpty ?? false) {
                          return Builder(
                            builder: (
                              BuildContext context,
                            ) {
                              if (nearbyPlaces?.results?.isNotEmpty ?? false) {
                                return Container(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 10),
                                    // alignment: Alignment.center,
                                    width: MediaQuery.of(context).size.width,
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 5.0),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: Colors.black.withOpacity(0.8)),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Container(
                                              width: Get.width * 0.6,
                                              child: Text(
                                                '${i.name ?? ""}'.toUpperCase(),
                                                style: GoogleFonts.roboto(
                                                    fontSize: 16.0,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.white),
                                              ),
                                            ),
                                            Container(
                                              width: Get.width * 0.65,
                                              child: Text(
                                                '${i.vicinity ?? ""}',
                                                style: GoogleFonts.roboto(
                                                    fontSize: 16.0,
                                                    color: Colors.grey),
                                              ),
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
                                        ),
                                        IconButton(
                                            onPressed: () async {
                                              await getDirection(
                                                  i.geometry?.location?.lat ??
                                                      0,
                                                  i.geometry?.location?.lng ??
                                                      0);

                                              await _addPolyline();
                                              print(
                                                  '${i.geometry?.location?.lat} llaatt');
                                              print(
                                                  '${i.geometry?.location?.lng} llnngg');

                                              setState(() {});
                                              // MapLauncher.showDirections(
                                              //     mapType: MapType.google,
                                              //     origin:
                                              //         Coords(
                                              //             _currentPosition
                                              //                     ?.latitude ??
                                              //                 0,
                                              //             _currentPosition
                                              //                     ?.longitude ??
                                              //                 0),
                                              //     originTitle: 'Your Locations',
                                              //     destinationTitle:
                                              //         'Destination Location',
                                              //     destination: Coords(
                                              //         i.geometry?.location
                                              //                 ?.lat ??
                                              //             0,
                                              //         i.geometry?.location
                                              //                 ?.lng ??
                                              //             0));
                                            },
                                            icon: Icon(
                                              Icons.directions_outlined,
                                              size: 40,
                                              color: Colors.blue,
                                            ))
                                      ],
                                    ));
                              } else {
                                return Center(
                                    child: Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10),
                                        // alignment: Alignment.center,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        margin: EdgeInsets.symmetric(
                                            horizontal: 5.0),
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
                          return CircularProgressIndicator();
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

                    )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
