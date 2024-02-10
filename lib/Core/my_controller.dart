import 'dart:developer';
import 'package:get_storage/get_storage.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart' as map;
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:salah/Core/dio.dart';
import 'package:salah/Core/get_api.dart';
import 'package:salah/Models/nearby_places_model.dart';

class MyController extends GetxController {
  final getApi = GetApi(dio);
  NativeAd? nativeAd;
  RxBool isAdLoaded = false.obs;
  final String adUnitId = "ca-app-pub-8860966945623841/5448325650";
 BuildContext? context;

  // Handle Permission
 Future<bool> _handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      ScaffoldMessenger.of(context!).showSnackBar(const SnackBar(
          content: Text(
              'Location services are disabled. Please enable the services')));
      return false;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        ScaffoldMessenger.of(context!).showSnackBar(
            const SnackBar(content: Text('Location permissions are denied')));
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      ScaffoldMessenger.of(context!).showSnackBar(const SnackBar(
          content: Text(
              'Location permissions are permanently denied, we cannot request permissions.')));
      return false;
    }
    return true;
  }

  // Handle Permission


// Address Cordinates Api
 Rx<Position?> currentPosition = Rx<Position?>(null);
RxString _currentAddress = "No".obs;


  Future<void> getCurrentPosition() async {
    final hasPermission = await _handleLocationPermission();

    if (!hasPermission) return;
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) {
        currentPosition.value = position;
      getAddressFromLatLng(currentPosition.value!);
    }).catchError((e) {
      debugPrint(e);
    });
  }


  Future<void> getAddressFromLatLng(Position position) async {
    await placemarkFromCoordinates(
            currentPosition.value?.latitude ?? 0, currentPosition.value?.longitude ?? 0)
        .then((List<Placemark> placemarks) {
      Placemark place = placemarks[0];
      
        _currentAddress.value =
            '${place.street}, ${place.subLocality}, ${place.subAdministrativeArea}, ${place.postalCode}';
       
    }).catchError((e) {
      // debugPrint(e);
    });
  }
// Address Cordinates Api







// Nearby Places Api

 Rx<NearbyPlaces?> nearbyPlaces = Rx<NearbyPlaces?>(null);

RxList<Result> result = <Result>[].obs;
RxString placeName = "Loading".obs;
  Future<void> getPlaces() async {
    try {
      nearbyPlaces.value = await getApi.getNearbyPlaces(
          currentPosition.value?.latitude ?? 0, currentPosition.value?.longitude ?? 0);
// placeName.value =nearbyPlaces?.results?[index].name
      print('${nearbyPlaces}nearbys');

      // print('$address addd');
      log('hello');
      // setState(() {});
    } catch (e) {}
  }


 RxList<map.Marker>? markers = RxList<map.Marker>();
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
    // setState(() {});
    markers?.value = List.generate(
      nearbyPlaces.value!.results!.length,
      (index) => map.Marker(
        markerId: map.MarkerId('${ nearbyPlaces.value?.results?[index].name}'),
        position: map.LatLng(
            nearbyPlaces.value?.results?[index].geometry?.location?.lat ?? 0,
            nearbyPlaces.value?.results?[index].geometry?.location?.lng ?? 0),
        infoWindow: map.InfoWindow(
          title: '${nearbyPlaces.value?.results?[index].name}',
        ),
      ),
    );
  }
// Nearby Places Api



  loadAd() {
    nativeAd = NativeAd(
        adUnitId: adUnitId,
        listener: NativeAdListener(
          onAdLoaded: (ad) {
            isAdLoaded.value = true;
            log("Ad Loaded");
          },
          onAdFailedToLoad: (ad, error) {
            isAdLoaded.value = false;
          },
        ),
        request: const AdRequest(),
        nativeTemplateStyle: NativeTemplateStyle(templateType: TemplateType.small));
    nativeAd!.load();
  }

  @override
  void dispose() {
    nativeAd?.dispose();
    super.dispose();
  }
}