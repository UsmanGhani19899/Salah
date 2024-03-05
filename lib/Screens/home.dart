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
import '../Widget/ad_helper.dart';

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
  InterstitialAd? _interstitalAd;
 
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
 
    await myContr.getCurrentPosition();
await myContr.getPlaces();
await myContr.getMarkers();
 
  }
 
  @override
  void initState() { 
   if(myContr.now12HourFormat() == "7:40 PM"){
  myContr.sendNotification();
  myContr.createInterstitialAd();
  myContr.createInterstitialAd();
} 
 
    // TODO: implement initState
    super.initState();
  
  
      apis();
  myContr.createRewardedAd();
   myContr.showRewardedAd();
   myContr.bannerAd.load();
  }
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
     
      body: Obx(() =>  Stack(
        children: [
         
          Stack(
            alignment: Alignment.center,
            children: [
              Column(
                // alignment: Alignment.bottomCenter,
                children: [
                       Expanded(
                  
                   child: Container(
                    height: Get.height,
                     child:SalahMap(
                          // polylines: _polylines,
                          marker: myContr.markers?.value,
                          mosqueLong: mosqueLong ?? 0,
                          mosqueLat: mosqueLat ?? 0,
                          lat: myContr.currentPosition.value?.latitude ?? 0,
                          lnng: myContr.currentPosition.value?.longitude ?? 0),
                   ),
                 ), 
             
                        
                 Padding(
                        
              padding: const EdgeInsets.only(left: 6,right: 6,bottom: 8),
              child: Expanded(
                child: Container(
                  margin: EdgeInsets.only(top: 20),
                  
                  child: 
                  
                   Column(
                     children: [
                  // Container(height: 52,color: Colors.red,  child: AdWidget(ad: myContr.bannerAd)),
                    
                      Container(
                       
                        
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                          Text(
                          "Nearby Masjids",
                          style: GoogleFonts.montserrat(
                  color: Colors.white, fontWeight: FontWeight.w300, fontSize: 25,),
                        ), Padding(
                              padding: const EdgeInsets.only(right: 12),
                              child: Container(
                              
                                child: ElevatedButton.icon(
                                 style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
                                 onPressed: ()async{
                                  //  sendNotification();
                                   myContr.showInterstitialAd();
                                   myContr.showRewardedAd();
                         //  await  myContr.getCurrentPosition();
                         //  await  myContr.getPlaces();
                                  setState(() {
                     
                                  });
                                }, icon:Icon( Icons.gps_fixed,color: Colors.white,size: 15,), label: Text("Current Position",style: GoogleFonts.montserrat(color: Colors.white ,fontSize: 12   ),)),
                              ))
                        ],),
                      ),
                    Container(
                       height: Get.height*0.4,
                 child:  myContr.nearbyPlaces.value?.results?.isNotEmpty ?? false?   ListView.builder(
                          shrinkWrap: true,
                          itemCount: myContr.nearbyPlaces.value?.results?.length,
                          itemBuilder: (context,index){
                          return Container(
                            // height: Get.height*0.12,
                                                        padding:
                                                            EdgeInsets.symmetric(horizontal: 15,vertical: 15),
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
                                                                    style: GoogleFonts.montserrat(
                                                                        fontSize: 16.0,
                                                                        fontWeight: FontWeight.bold,
                                                                        color: Colors.white),
                                                                  ),
                                                                ),
                                                                Container(
                                                                  width: Get.width * 0.65,
                                                                  child: Text(
                                                                    '${myContr.nearbyPlaces.value?.results?[index].vicinity ?? ""}',
                                                                    style: GoogleFonts.montserrat(
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
                                                          
                                                          ],
                                                        ));
                                       }):CustomMosqueShimmer()
                           )
                    
                  ,  
                  // Container(color: Colors.red,
                  //   height: 50,
                  //   child: AdWidget(ad: myContr.bannerAd)) 
                     ],
                   )
                           
                ),
              ),
                        ),
                
              
                ],
              ),
               ],
          ), 
         
        ],
      ),
    ));
  }}
  /// Loads a banner ad.
// void _loadAd() {
//   final bannerAd = BannerAd(
//     size: AdSize(width: 700, height: 500),
//     adUnitId: 'ca-app-pub-8860966945623841/5448325650',
//     request: const AdRequest(),
//     listener: BannerAdListener(
//       // Called when an ad is successfully received.
//       onAdLoaded: (ad) {
//         if (!mounted) {
//           ad.dispose();
//           return;
//         }
//         setState(() {
//           _bannerAd = ad as BannerAd;
//         });
//       },
//       // Called when an ad request failed.
//       onAdFailedToLoad: (ad, error) {
//         debugPrint('BannerAd failed to load: $error');
//         ad.dispose();
//       },
//     ),
//   );

//   // Start loading.
//   bannerAd.load();
// }
 
//   void createBannerAd(){
//     _bannerAd = BannerAd(size: AdSize.fullBanner, adUnitId: AdMobService.bannerUnitId!, listener: AdMobService.bannerAdListener, request: AdRequest())..load();
//   }
//   void showRewardAd(){
//   if(_interstitalAd !=null){
// _interstitalAd!.fullScreenContentCallback = FullScreenContentCallback(
//   onAdDismissedFullScreenContent: (ad){
//     ad.dispose();
//     createBannerAd();
//   },
//   onAdFailedToShowFullScreenContent: (ad,error){
//     ad.dispose();
//     createBannerAd();
//   }
// );
// _interstitalAd!.show();
// _interstitalAd=null;
//   }
// }

// void createRewardedAd(){
//   RewardedAd.load(adUnitId: AdMobService.rewardedAdiId!, request: AdRequest(), rewardedAdLoadCallback: RewardedAdLoadCallback(onAdLoaded: (ad)=>setState(() =>_rewardedAd=ad), onAdFailedToLoad: (ad)=>setState(() =>_rewardedAd=null)));
// }


