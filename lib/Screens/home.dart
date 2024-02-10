import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart' as map;
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:map_launcher/map_launcher.dart';
import 'package:salah/Core/get_api.dart';
import 'package:salah/Core/get_constants.dart';
import 'package:salah/Core/my_controller.dart';
import 'package:salah/Core/notification_service.dart';
import 'package:salah/Models/direction_model.dart';
import 'package:salah/Models/nearby_places_model.dart';
import 'package:salah/Screens/map.dart';
import 'package:salah/Widget/app_bar_widget.dart';
import 'package:salah/Widget/custom_mosque_shimmer.dart';
import 'package:salah/Widget/custom_shimmer.dart';

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
// myContr.nearbyPlaces? myContr.nearbyPlaces;
GooleMapDirectionModel? googleMapDirectionModel;
MyController myContr = Get.put(MyController());
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

  // Future<void> getPlaces() async {
  //   try {
  //     myContr.nearbyPlaces = await getApi.getmyContr.nearbyPlaces(
  //         _currentPosition?.latitude ?? 0, _currentPosition?.longitude ?? 0);
  //     print('${myContr.nearbyPlaces}nearbys');

  //     print('$address addd');
  //     log('hello');
  //     setState(() {});
  //   } catch (e) {}
  // }

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
 
  // List<map.Marker>? markers;
  // Future<void> getMarkers() async {
  //   // map.BitmapDescriptor? icon;
  //   map.BitmapDescriptor icon = await map.BitmapDescriptor.fromAssetImage(
  //     ImageConfiguration(
  //       devicePixelRatio: 1.1,
  //       size: Size(10, 30),
  //     ),
  //     "assets/images/marker.png",
  //   );
  //   // setState(() {
  //   //   this.icon = icon;
  //   // });
  //   setState(() {});
  //   markers = List.generate(
  //     myContr.nearbyPlaces!.results!.length,
  //     (index) => map.Marker(
  //       markerId: map.MarkerId('${myContr.nearbyPlaces.value?.results?[index].name}'),
  //       position: map.LatLng(
  //           myContr.nearbyPlaces.value?.results?[index].geometry?.location?.lat ?? 0,
  //           myContr.nearbyPlaces.value?.results?[index].geometry?.location?.lng ?? 0),
  //       infoWindow: map.InfoWindow(
  //         title: '${myContr.nearbyPlaces.value?.results?[index].name}',
  //       ),
  //     ),
  //   );
  // }

  // Set<map.Polyline> _polylines = Set<map.Polyline>();
  // Future<void> _addPolyline() async {
  //   map.Polyline polyline = map.Polyline(
  //     polylineId: map.PolylineId('polyline_id'),
  //     color: Colors.blue,
  //     points: List.generate(10, (index) {
  //       print('${googleMapDirectionModel!.routes!.length} lenghting');
  //       return LatLng(
  //           googleMapDirectionModel!
  //               .routes![index].legs![index].steps![index].endLocation!.lat!,
  //           googleMapDirectionModel!
  //               .routes![index].legs![index].steps![index].endLocation!.lng!);
  //     }),
  //     width: 3,
  //   );

  //   setState(() {
  //     _polylines.add(polyline);
  //   });
  // }

// Direction API
  Future<void> getDirection(double desLat, double desLong) async {
    googleMapDirectionModel = await getApi.getDirection(
        _currentPosition?.latitude ?? 0,
        _currentPosition?.longitude ?? 0,
        desLat,
        desLong);
    print('hehehe');
  }
BannerAd? _bannerAd;
  Future<void> apis() async {
    // // await getAddressFromLatLng(
    // //     _currentPosition?.latitude ?? 0, _currentPosition?.longitude ?? 0);
    // await _getCurrentPosition();
    await myContr.getCurrentPosition();
await myContr.getPlaces();
await myContr.getMarkers();

    // await getPlaces();
    // await getMarkers();
    // await getDirection(-33.8690048, 151.175168);
    // await _addPolyline();
    // await getAddress(lng.toString(), lat.toString());
    // markers;
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
      // appBar: AppBar(
      //   toolbarHeight: 80,
      //   // centerTitle: true,
      //   elevation: 0,
      //   title: Text(
      //     "Nearby Mosque",
      //     style: GoogleFonts.roboto(
      //         color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),
      //   ),
      //   actions: [
      //     Padding(
      //       padding: const EdgeInsets.only(right: 10),
      //       child: GestureDetector(
      //         onTap: () {
      //           _getCurrentPosition();
      //           // getPlaces();
      //           setState(() {});
      //         },
      //         child: Text(
      //           'Current Location',
      //           style: GoogleFonts.roboto(
      //               color: Color(0xff35c55e), fontWeight: FontWeight.bold),
      //         ),
      //       ),
      //     )
      //   ],
      // ),
     appBar: AppBarWidget(pageName: 'Nearby Mosques'),
      body:   Stack(
        alignment: Alignment.center,
        children: [
          Column(
            // alignment: Alignment.bottomCenter,
            children: [
             Obx(() =>        Expanded(
              
               child: SalahMap(
                    // polylines: _polylines,
                    marker: myContr.markers?.value,
                    mosqueLong: mosqueLong ?? 0,
                    mosqueLat: mosqueLat ?? 0,
                    lat: myContr.currentPosition.value?.latitude ?? 0,
                    lnng: myContr.currentPosition.value?.longitude ?? 0),
             ),),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
           Obx(() => Container( 
            margin: EdgeInsets.symmetric(vertical: 10),
                      child: myContr.isAdLoaded.value
                          ? ConstrainedBox(
                            
                              constraints: const BoxConstraints(
                                maxHeight: 100,
                                minHeight: 100,
                                
                              ),
                              child: AdWidget(ad: myContr.nativeAd!))
                          :   Container(
                        
                          ),
                    )),
               Obx(() =>  Padding(
          
            padding: const EdgeInsets.only(left: 6,right: 6,bottom: 8),
            child: Container(
              height: Get.height*0.35,
              child: myContr.nearbyPlaces.value?.results?.isNotEmpty ?? false?  ListView.builder(
                shrinkWrap: true,
                itemCount: myContr.nearbyPlaces.value?.results?.length,
                itemBuilder: (context,index){
                return Container(
                  // height: Get.height*0.12,
                                              padding:
                                                  EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                                              // alignment: Alignment.center,
                                              width: MediaQuery.of(context).size.width,
                                              margin:
                                                  EdgeInsets.symmetric(horizontal: 10.0,vertical: 10),
                                              decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(20),
                                                  color: Colors.grey.shade900.withOpacity(0.8)),
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
                                                          '${myContr.nearbyPlaces.value?.results?[index].name ?? ""}'.toUpperCase(),
                                                          style: GoogleFonts.roboto(
                                                              fontSize: 16.0,
                                                              fontWeight: FontWeight.bold,
                                                              color: Colors.white),
                                                        ),
                                                      ),
                                                      Container(
                                                        width: Get.width * 0.65,
                                                        child: Text(
                                                          '${myContr.nearbyPlaces.value?.results?[index].vicinity ?? ""}',
                                                          style: GoogleFonts.roboto(
                                                              fontSize: 16.0,
                                                              color: Colors.grey),
                                                        ),
                                                      ),
                                                      RatingBar.builder(
                                                        initialRating:
                                                            myContr.nearbyPlaces.value?.results?[index].rating?.toDouble() ?? 0,
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
                                                  
                                                  // IconButton(
                                                  //     onPressed: () async {
                                                  //       await getDirection(
                                                  //           myContr.nearbyPlaces.value?.results?[index].geometry?.location?.lat ??
                                                  //               0,
                                                  //           myContr.nearbyPlaces.value?.results?[index].geometry?.location?.lng ??
                                                  //               0);
              
                                                  //       // await _addPolyline();
                                                  //       print(
                                                  //           '${myContr.nearbyPlaces.value?.results?[index].geometry?.location?.lat} llaatt');
                                                  //       print(
                                                  //           '${myContr.nearbyPlaces.value?.results?[index].geometry?.location?.lng} llnngg');
              
                                                  //       setState(() {});
                                                  //       // MapLauncher.showDirections(
                                                  //       //     mapType: MapType.google,
                                                  //       //     origin:
                                                  //       //         Coords(
                                                  //       //             _currentPosition
                                                  //       //                     ?.latitude ??
                                                  //       //                 0,
                                                  //       //             _currentPosition
                                                  //       //                     ?.longitude ??
                                                  //       //                 0),
                                                  //       //     originTitle: 'Your Locations',
                                                  //       //     destinationTitle:
                                                  //       //         'Destination Location',
                                                  //       //     destination: Coords(
                                                  //       //         i.geometry?.location
                                                  //       //                 ?.lat ??
                                                  //       //             0,
                                                  //       //         i.geometry?.location
                                                  //       //                 ?.lng ??
                                                  //       //             0));
                                                  //     },
                                                  //     icon: Icon(
                                                  //       Icons.directions_outlined,
                                                  //       size: 40,
                                                  //       color: Colors.blue,
                                                  //     ))
                                               
                                                ],
                                              ));
              }):CustomMosqueShimmer()
            ),
          ),
              )
               
              ],
            ),
          )
            ],
          ),
       Padding(
         padding: const EdgeInsets.only(right: 12),
         child: ElevatedButton.icon(
          style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
          onPressed: ()async{
            sendNotification();
        //  await  myContr.getCurrentPosition();
        //  await  myContr.getPlaces();
           setState(() {
             
           });
         }, icon:Icon( Icons.gps_fixed,color: Colors.white,), label: Text("Current Direction",style: GoogleFonts.roboto(color: Colors.white    ),)))
        ],
      ),
    );
  }
  /// Loads a banner ad.
void _loadAd() {
  final bannerAd = BannerAd(
    size: AdSize(width: 700, height: 500),
    adUnitId: 'ca-app-pub-8860966945623841/5448325650',
    request: const AdRequest(),
    listener: BannerAdListener(
      // Called when an ad is successfully received.
      onAdLoaded: (ad) {
        if (!mounted) {
          ad.dispose();
          return;
        }
        setState(() {
          _bannerAd = ad as BannerAd;
        });
      },
      // Called when an ad request failed.
      onAdFailedToLoad: (ad, error) {
        debugPrint('BannerAd failed to load: $error');
        ad.dispose();
      },
    ),
  );

  // Start loading.
  bannerAd.load();
}
 void sendNotification() {
    final LocalNotificationService _localNotificationService =
        LocalNotificationService();
    // _localNotificationService.checkNotificationPermission();
    _localNotificationService.initializeSettings(context);
    _localNotificationService.showSimpleNotification();
  }
}
